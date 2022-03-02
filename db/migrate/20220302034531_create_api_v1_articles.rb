class CreateApiV1Articles < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_articles do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
