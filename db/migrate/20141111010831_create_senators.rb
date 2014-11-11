class CreateSenators < ActiveRecord::Migration
  def change
    create_table :senators do |t|
      t.string :name
      t.string :state
      t.string :image_url
      t.string :wiki_url

      t.timestamps
    end
  end
end
