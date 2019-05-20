class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :detail
      t.text :image
      t.timestamps
    end
  end
end
