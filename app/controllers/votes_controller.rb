class VotesController < ApplicationController

  def create
    user = current_user
    if user
      thing = Thing.find(params[:user][:thing])
      vote = params[:user][:vote]
      Vote.create(user: user, thing: thing, good: vote)
      redirect_to '/'
    else
      @thing = Thing.all.sample
      flash.now[:danger] = 'Log in to Vote!'
      render 'static/random'
    end
  end

end
