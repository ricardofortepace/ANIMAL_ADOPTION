class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show]
  # GET /animals
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  def show
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
