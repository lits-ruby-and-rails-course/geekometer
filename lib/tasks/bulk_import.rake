namespace :gm do
  desc "Import multiple questions from csv"
  task import_csv: :environment do
    require 'csv'
    user_id = (ENV['IMPORT_USER_ID'] || 3).to_i
    topics = Hash.new do |h, topic_name|
      topic = Topic.where(name: topic_name).first

      unless topic
        topic = Topic.create(name: topic_name, description: topic_name)
      end

      h[topic_name] = topic
    end

    CSV.open((ENV['IMPORT_CSV_PATH'] || 'import.csv'), :row_sep => "\r\n", :col_sep => ",") do |csv|
      question = nil
      csv.each do |row|
        if row.first
          topic_name, question_text, difficulty = row
          difficulty ||= 1

          topic = topics[topic_name]
          question = Question.create(topic: topic, condition: question_text, difficulty: difficulty, user_id: user_id, approved: true)
          print '.'
        else
          _, answer_text, valid = row
          question.answers.create(solution: answer_text, answer_valid: valid)
        end
      end
    end
  end

  desc "Download google spreadsheet"
  task :download_spreadsheet do
    # require 'net/http'
    require "open-uri"
    resp = URI.parse("https://docs.google.com/feeds/download/spreadsheets/Export?key=#{ENV['SPREADSHEET_ID']}&exportFormat=csv&gid=0").read
    # http = Net::HTTP.new("docs.google.com")
    # http.use_ssl = true
    # http.ssl_version = :TLSv1
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # resp = http.get("/feeds/download/spreadsheets/Export?key=#{ENV['SPREADSHEET_ID']}&exportFormat=csv&gid=0")
    open("import.csv", "wb") do |file|
      file.write(resp)
    end
  end

  desc "Import questions from google spreadsheet"
  task :import_spreadsheet do
    Rake::Task["gm:download_spreadsheet"].invoke
    Rake::Task["gm:import_csv"].invoke
  end

end
