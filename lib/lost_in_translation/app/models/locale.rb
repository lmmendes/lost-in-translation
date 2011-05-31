class LostInTranslation::Locale < ActiveRecord::Base
  has_many :translations
end