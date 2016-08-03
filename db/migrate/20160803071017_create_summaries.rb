class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.integer :movie

      t.timestamps
    end

    add_index :summaries, [:user_id, :created_at]

  end
end
