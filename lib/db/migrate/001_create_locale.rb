class CreateLocale < ActiveRecord::Migration
  def self.up
    create_table :locales do |t|
      t.string :name, :unique => true
      
      t.timestamps
    end
    add_index :locales, :name
  end
  
  def self.down
    drop_table :locales
  end
  
end
  