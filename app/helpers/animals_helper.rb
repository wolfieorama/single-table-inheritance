module AnimalsHelper
  # Returns a dynamic path based on the provided parameters
  def sti_animal_path(race = "animal", animal = nil, action = nil)
    send "#{format_sti(action, race, animal)}", animal
  end

  def format_sti(action, race, animal)
    action || animal? "#{format_action(action)}#{race.underscore}" : "#{underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
