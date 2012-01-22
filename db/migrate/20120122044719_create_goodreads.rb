class CreateGoodreads < ActiveRecord::Migration
  def change
    create_table :goodreads do |t|
      t.timestamps
    end
  end
end
