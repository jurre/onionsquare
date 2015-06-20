class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.hstore :totals, default: {}, null: false

      t.timestamps
    end

    add_index :stats, :created_at
  end
end
