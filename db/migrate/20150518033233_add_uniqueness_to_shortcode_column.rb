class AddUniquenessToShortcodeColumn < ActiveRecord::Migration
    def change
        remove_index :shortens, name: 'index_shortens_on_shortcode'
        add_index :shortens, :shortcode, unique: true
    end
end
