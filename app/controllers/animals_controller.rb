class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]
  # GET /animals
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    if @animal.save
      redirect_to @animal, notice: 'The animal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /animals/1
  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: 'The animal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
    redirect_to animals_url, notice: 'The animal was successfully destroyed.'
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:specie, :photo, :genre, :age, :breed, :castrate, :description)
  end
end
