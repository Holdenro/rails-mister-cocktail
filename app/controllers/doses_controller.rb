class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id]) #[] here just to select
    # raise
    @dose = Dose.new
  end

def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params) # see below def dose_params
    # raise
    @dose.cocktail = @cocktail # .cocktail is empty so we add =@cocktail to add the id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

private


  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
