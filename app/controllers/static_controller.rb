class StaticController < ApplicationController

  def top_fifty
    @things = Thing.top_fifty
  end

  def random
    #go through Thing.all and find things that dont have votes from user
    unvoted = Thing.all.reject {|thing| thing.users.include?(current_user)}
    if unvoted.empty?
      redirect_to '/complete'
    else
      @thing = unvoted.sample
    end
  end

  def complete
  end

end
