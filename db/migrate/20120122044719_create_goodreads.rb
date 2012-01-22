class CreateGoodreads < ActiveRecord::Migration
  def change
    create_table :goodreads do |t|
      t.string :user_id
      t.text :access_token
      t.timestamps
    end
  end
end
