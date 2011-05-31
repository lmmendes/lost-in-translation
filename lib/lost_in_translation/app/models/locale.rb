class LostInTranslation::Locale < ActiveRecord::Base
  has_many :translations
  
  def self.locales_with_missing_translations
    self.joins(:translations).where('translations.missing = ?', true).group('locales.name').order('locales.name ASC')
  end
  
end