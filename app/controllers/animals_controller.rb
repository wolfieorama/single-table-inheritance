class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_race
  def index
    @animals = race_class.all
  end

  def show
  end

  def new
    @animal = race_class.new
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal, notice: "#{race} was successfuly saved."
    else
      render action: "new"
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "{race} was successfuly created."
    else
      render action: 'edit'
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_url
  end

  private

  def animal_params
    params.require(race.underscore.to_sym).permit(:name, :race, :age)
  end

  def set_animal
    @animal = race_class.find(params[:id])
  end

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
