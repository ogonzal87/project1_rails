# This class describes a single recipe and its characteristics. 

class Recipe

  attr_reader :id, :name, :description, :ingredients, :time, :directions, :image_file

  def initialize(args)
    @id           = args[:id]
    @name         = args[:name]
    @description  = args[:description]
    @ingredients  = args[:ingredients]
    @time         = args[:time]
    @directions   = args[:directions]
    @image_file   = args[:image_file]
  end

  def to_s
    "ID: #{@id}, Name: #{@name}, Description: #{@description}, Ingredients: #{@ingredients}, Time: #{@time}, Directions: #{@directions}."
  end
end