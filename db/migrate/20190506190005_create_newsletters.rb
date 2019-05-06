# frozen_string_literal: true
class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string 	 :email
      t.string 	 :token
      t.boolean  :active
      t.date 		 :signup_date
      t.timestamps
    end
  end
end
