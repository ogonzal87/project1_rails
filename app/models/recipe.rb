# This class describes a single recipe and its characteristics. 
class Recipe < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :ingredients, presence: true, length: { minimum: 3 }
  validates :time, presence: true 
  validates :directions, presence: true, length: { minimum: 3 } 
  validates :image_file, presence: true

  def self.search(term)
     all.select do |item|
       item.name.downcase.include?(term.downcase) ||
       item.description.downcase.include?(term.downcase)
     end
   end
end