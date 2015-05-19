class Like < ActiveRecord::Base

  belongs_to :chef
  belongs_to :recipe

  scope :liked, -> (recipe) { where(recipe: recipe, like: true) }
  scope :disliked, -> (recipe) { where(recipe: recipe, like: false) }

end
