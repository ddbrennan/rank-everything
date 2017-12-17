class ThingsController < ApplicationController

  def index
    @things = Thing.all
  end

  def show
    @thing = Thing.find(params[:id])
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)
    if @thing.save
      flash[:success] = "Added #{params[:thing][:name]} to the Database!"
      redirect_to '/'
    else
      render 'new'
    end
  end

  def delete

  end

  private

    def thing_params
      params.require(:thing).permit(:name, :image_url)
    end

end
