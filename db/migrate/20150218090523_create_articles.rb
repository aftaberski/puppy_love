class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :photo
      t.text :content, null: false
      t.references :user, null: false
    end
  end
end
