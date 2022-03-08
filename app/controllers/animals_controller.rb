class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]
  # GET /animals
  def index
    @animals = policy_scope(Animal)
    # parametro para pesquisar animais proximos do endereco
    params[:address] = current_user.address if params[:user_address] == "1"


    # parametro para pesquisar na descricao
    if params[:specie_dog] == "1" && params[:query].present?
      @animals = Animal.where("specie = ? and description @@ ?", "dog", params[:query])
    elsif params[:specie_cat] == "1" && params[:query].present?
      @animals = Animal.where("specie = ? and description @@ ?", "cat", params[:query])
    elsif params[:specie_dog] == "1" && params[:specie_cat] == "0"
      @animals = Animal.where("specie = ?", "dog")
    elsif params[:specie_cat] == "1" && params[:specie_dog] == "0"
      @animals = Animal.where("specie = ?", "cat")
    elsif params[:query].present?
      @animals = Animal.search_by_description(params[:query])
    elsif params[:uploaded] == "1"
      @animals = Animal.where(user_id: current_user.id)
    elsif params[:address].present?
      @animals = Animal.near(params[:address], params[:range])
    else
      @animals = Animal.all
    end

    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude
      }
    end
    # raise
  end

  # GET /animals/1
  def show
    @adoption = Adoption.new
    authorize @animal
  end

  # GET /animals/new
  def new
    @animal = Animal.new
    authorize @animal
  end

  # GET /animals/1/edit
  def edit
    authorize @animal
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal

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
    authorize @animal
  end

  # DELETE /animals/1
  def destroy
    authorize @animal
    @animal.destroy
    redirect_to animals_url, notice: 'The animal was successfully removed.'
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:specie, :photo, :genre, :age, :breed, :castrate, :description, :address, photos:[])
  end
end
