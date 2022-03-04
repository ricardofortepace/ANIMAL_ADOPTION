class AdoptionsController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new
    @adoption.animal = @animal
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new(adoption_params)
    @adoption.animal = @animal

    if @adoption.save
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  def show
    @adoption = Adoption.find(params[:id])
  end
end
