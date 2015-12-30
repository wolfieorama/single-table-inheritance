class Animal < ActiveRecord::Base
  belongs_to :tribe
  self.inheritance_column = :race

  #below are the animals subclassing the animals the Animal model
  def self.races
    %w(Lion WildBoar Meerkat)
  end

  class Lion < Animal; end
  class Meerkat < Animal; end
  class Wildboar <Animal; end
end
