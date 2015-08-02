class CreateTopicsUsers < ActiveRecord::Migration
  def change
  	create_table :topics_users do |t|
  		t.references :topic, index: true, foreign_key: true
  		t.references :user, index: true, foreign_key: true
  	end
  end
end
