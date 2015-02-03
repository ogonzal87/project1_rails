require_relative './recipe'

# This class outlines all of the recipes we have on file

class Recipes

  def self.all
    [
      Recipe.new(id: 1, 
        name: 'Gin Gimlet', 
        description: 'Vice DIY biodiesel fingerstache, marfa before they sold out cardigan tumblr kale chips pork belly raw denim mlkshk. Etsy butcher swag, echo park ethnic small batch gentrify. Bicycle rights mustache artisan, keytar lo-fi sustainable fap stumptown vegan salvia freegan four loko terry richardson. Photo booth wes anderson raw denim williamsburg retro. Keffiyeh street art brunch ethical. Swag master cleanse ethical aesthetic. You probably havent heard of them umami hoodie fixie tofu pickled.', 
        ingredients: '2 1/2 ounces cucumber-infused gin, 1/2 ounce lime-flavored simple syrup, Lime wedge', 
        time: 'Less than 5 minutes!', 
        directions: 'Combine the gin and lime syrup in an ice-filled cocktail shaker and shake until cold. Strain over ice into an old fashioned glass and garnish with a lime wedge and cucumber slice.',
        image_file: 'gimlet.jpg'
        ),
      Recipe.new(id: 2, 
        name: 'Side Car', 
        description: 'Vice DIY biodiesel fingerstache, marfa before they sold out cardigan tumblr kale chips pork belly raw denim mlkshk. Etsy butcher swag, echo park ethnic small batch gentrify. Bicycle rights mustache artisan, keytar lo-fi sustainable fap stumptown vegan salvia freegan four loko terry richardson. Photo booth wes anderson raw denim williamsburg retro. Keffiyeh street art brunch ethical. Swag master cleanse ethical aesthetic. You probably havent heard of them umami hoodie fixie tofu pickled.', 
        ingredients: 'test', 
        time: 'Less than 5 minutes!', 
        directions: 'Shake ingredients with ice and strain into a chilled cocktail glass. Garnish with a twist of lemon peel.',
        image_file: 'sidecar.jpg'
        ),
      Recipe.new(id: 3, 
        name: 'Old Fashioned', 
        description: 'Vice DIY biodiesel fingerstache, marfa before they sold out cardigan tumblr kale chips pork belly raw denim mlkshk. Etsy butcher swag, echo park ethnic small batch gentrify. Bicycle rights mustache artisan, keytar lo-fi sustainable fap stumptown vegan salvia freegan four loko terry richardson. Photo booth wes anderson raw denim williamsburg retro. Keffiyeh street art brunch ethical. Swag master cleanse ethical aesthetic. You probably havent heard of them umami hoodie fixie tofu pickled.', 
        ingredients: 'heloe', 
        time: 'Less than 5 minutes!', 
        directions: 'Mix sugar, water and angostura bitters in an old-fashioned glass. Drop in a cherry and an orange wedge. Muddle into a paste using a muddler or the back end of a spoon. Pour in bourbon, fill with ice cubes, and stir.',
        image_file: 'oldfashioned.jpg'), 
      Recipe.new(id: 4, 
        name: 'Astoria', 
        description: 'Vice DIY biodiesel fingerstache, marfa before they sold out cardigan tumblr kale chips pork belly raw denim mlkshk. Etsy butcher swag, echo park ethnic small batch gentrify. Bicycle rights mustache artisan, keytar lo-fi sustainable fap stumptown vegan salvia freegan four loko terry richardson. Photo booth wes anderson raw denim williamsburg retro. Keffiyeh street art brunch ethical. Swag master cleanse ethical aesthetic. You probably havent heard of them umami hoodie fixie tofu pickled.', 
        ingredients: '1 1/2 ounces gin, 3/4 ounces dry vermouth, 2 dashes orange bitters, Lemon twist for garnish', 
        time: 'Less than 5 minutes!', 
        directions: 'Combine the gin, vermouth, and bitters in an ice-filled cocktail shaker and stir gently for 20 to 30 seconds, until cold. Strain into a chilled cocktail glass. Garnish with the lemon twist.',
        image_file: 'astoria.jpg'), 
      Recipe.new(id: 5, 
        name: 'Americano', 
        description: 'Vice DIY biodiesel fingerstache, marfa before they sold out cardigan tumblr kale chips pork belly raw denim mlkshk. Etsy butcher swag, echo park ethnic small batch gentrify. Bicycle rights mustache artisan, keytar lo-fi sustainable fap stumptown vegan salvia freegan four loko terry richardson. Photo booth wes anderson raw denim williamsburg retro. Keffiyeh street art brunch ethical. Swag master cleanse ethical aesthetic. You probably havent heard of them umami hoodie fixie tofu pickled.', 
        ingredients: '1 1/2 ounces Campari, 1 1/2 ounces sweet vermouth, Club soda', 
        time: 'Less than 5 minutes!', 
        directions: 'Pour the Campari and vermouth into an ice-filled highball glass and fill with club soda. Sip and enjoy.',
        image_file: 'americano.jpg'), 
      Recipe.new(id: 6, 
        name: 'Negroni', 
        description: 'Vice DIY biodiesel fingerstache, marfa before they sold out cardigan tumblr kale chips pork belly raw denim mlkshk. Etsy butcher swag, echo park ethnic small batch gentrify. Bicycle rights mustache artisan, keytar lo-fi sustainable fap stumptown vegan salvia freegan four loko terry richardson. Photo booth wes anderson raw denim williamsburg retro. Keffiyeh street art brunch ethical. Swag master cleanse ethical aesthetic. You probably havent heard of them umami hoodie fixie tofu pickled.', 
        ingredients: '1 ounce London dry gin, 1 ounce Campari, 1 ounce sweet vermouth, Orange zest for garnish', 
        time: 'Less than 5 minutes!', 
        directions: 'Combine the liquid ingredients in an ice-filled cocktail shaker. Stir for 20 to 30 seconds, until cold, and then strain into a chilled cocktail glass, or over ice into an old fashioned glass. Flame the orange zest over the drink and then float it on top.',
        image_file: 'negroni.jpg'
        ), 
    ]
  end

  def self.find(id)
    all.find do |item|
      item.id == id
    end
  end

 def self.search(pattern)
    all.select do |item|
      item.name.downcase.include?(pattern.downcase) ||
      item.description.downcase.include?(pattern.downcase)
    end
  end

end
