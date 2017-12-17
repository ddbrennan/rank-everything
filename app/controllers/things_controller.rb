class ThingsController < ApplicationController

  def index
    @things = Thing.all
  end

  def top_ten
    @things = Thing.top_ten
  end

  def show
    @thing = Thing.find(params[:id])
  end

  def random
    @thing = Thing.all.sample
  end

  def new
  end

  def create

  end

  def delete

  end

  def vote
    binding.pry
  end

end
