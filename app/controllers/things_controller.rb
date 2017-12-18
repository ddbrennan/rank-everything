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

  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy
    redirect_to '/things'
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    @thing = Thing.find(params[:id])
    @thing.update(name: params[:thing][:name], image_url: params[:thing][:image_url])
    redirect_to thing_path(@thing)
  end

  private

    def thing_params
      params.require(:thing).permit(:name, :image_url)
    end

end
