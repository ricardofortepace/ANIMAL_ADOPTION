class AdoptionsController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new
    @adoption.animal = @animal
    authorize @adoption
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @adoption = Adoption.new
    @adoption.animal = @animal
    @adoption.user = current_user
    authorize @adoption

    if @adoption.save
      redirect_to adoption_path(@adoption)
    else
      render 'new'
    end
  end

  def show
    @adoption = Adoption.find(params[:id])
    authorize @adoption
  end
end
