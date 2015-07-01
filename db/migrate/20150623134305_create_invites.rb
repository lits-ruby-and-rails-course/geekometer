class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.text :name

      t.timestamps null: false
    end
  end
end
