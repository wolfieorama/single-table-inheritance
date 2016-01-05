class AnimalsController < ApplicationController
  before_action :set_race
  def index
    @animals = race_class.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_race
    @race = race
  end

  def race
    Animal.races.include?(params[:race]) ? params[:race] : "Animal"
  end

 #this is more secure than passing the data blindly from the user
  def race_classes
    ["Animal", "Lion", "Meerkat", "Wildboar"]
  end

  def race_class
    race.constantize if race.in? race_classes
  end
end
