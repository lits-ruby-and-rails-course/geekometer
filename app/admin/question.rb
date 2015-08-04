ActiveAdmin.register Question do
#  create_table "answers", force: :cascade do |t|
#    t.integer  "question_id"
#    t.text     "solution"
#    t.boolean  "answer_valid"
#    t.datetime "created_at",   null: false
#    t.datetime "updated_at",   null: false
#  end
#
#  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree#
#
#  create_table "questions", force: :cascade do |t|
#    t.text     "condition"
#    t.integer  "difficulty"
#    t.datetime "created_at",    null: false
#    t.datetime "updated_at",    null: false
#    t.integer  "topic_id"
#    t.integer  "created_by_id"
#    t.boolean  "approved"
#  end

  permit_params :approved, :topic_id, :difficulty

  #index do
  #  column :condition
  #  column :difficulty
  #  column :topic_id
  #  column :created_by_id
  #  column :created_by_id
  #  column :approved
  #  actions
  #end

  form do |f|
    f.inputs "Question Details" do
      f.input :condition
      f.input :approved
      f.input :difficulty
      f.input :topic_id, :as => :select, :collection => Topic.all, :selected => question.topic_id
      f.inputs do
        f.has_many :answers, heading: 'Answers', allow_destroy: false, new_record: false do |a|
          a.input :solution, :as => :text
        end
      end
    end
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
