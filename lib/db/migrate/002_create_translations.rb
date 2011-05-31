class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.references :locale
      t.string :keyname
      t.string :value
      t.integer :missing, :boolean, :default => false
      t.timestamps
    end
    add_index :translations, [:locale_id, :keyname]
  end
  
  def self.down
    drop_table :translations
  end
end