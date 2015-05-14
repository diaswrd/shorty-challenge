class CreateShortens < ActiveRecord::Migration
  def change
    create_table :shortens do |t|
      t.string :url
      t.string :shortcode, limit: 6
      t.date :last_seen_date
      t.integer :redirect_count

      t.timestamps
    end
    add_index :shortens, :shortcode, unique: true
  end
end
