class Animal < ActiveRecord::Base
  scope :lion, -> { where(race: "Lion") }
  scope :meerkat, -> { where(race: "Meerkat") }
  scope :wildboar, -> { where(race: "Wildboar") }

  belongs_to :tribe
  self.inheritance_column = :race

  #If you want to disable Single Table Inheritance or use the type column for something else,
  #you can use self.inheritance_column = :fake_column.

  #below are the animals subclassing the animals the Animal model
  def self.races
    %w(Lion WildBoar Meerkat)
  end

  def talk
    raise "abstract method"
  end

end
