class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.references :locale
      t.string :keyname
      t.string :value
      t.boolean :missing, :default => 0
      t.timestamps
    end
    add_index :translations, [:locale_id, :keyname]
  end
  
  def self.down
    drop_table :translations
  end
end