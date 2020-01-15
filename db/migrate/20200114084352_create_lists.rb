class CreateLists < ActiveRecord::Migration[6.0]
  def change
    # テーブル名がlists
    create_table :lists do |t|
      # 型がstring :descriptionカラム
      t.string :description
      # 型がboolean :completedカラム
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
