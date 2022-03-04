class AdoptionsController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new
    @adoption.animal = @animal
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new
    @adoption.animal = @animal
    @adoption.user = current_user

    if @adoption.save
      redirect_to adoption_path(@animal)
    else
      render 'new'
    end
  end
end
