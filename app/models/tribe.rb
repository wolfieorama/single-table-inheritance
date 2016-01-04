class Tribe < ActiveRecord::Base
  #These are not mandatory but make the navigation between models easier.
  delegate :lions, :meerkats, :wild_boars, to: :animals
  has_many :animals
end
