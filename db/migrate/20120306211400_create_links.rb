class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :in_url
      t.string :out_url
      t.integer :http_status, :default => 301

      t.timestamps
    end
    
    add_index :links, :in_url
  end
end
