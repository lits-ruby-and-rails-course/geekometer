class AddLogoToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :logo, :string
  end
end
