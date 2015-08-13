class AddLogoToTopicsUsers < ActiveRecord::Migration
  def change
    add_column :topics_users, :logo, :string
  end
end
