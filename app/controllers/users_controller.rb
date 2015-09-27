class UsersController < ApplicationController

  before_action :require_login

  def index
      # if params[:id]
      #   @users = User.gender(current_user).not_me(current_user).where('id < ?', params[:id]).limit(10) - current_user.matches(current_user)
      # else
      #   @users = User.gender(current_user).not_me(current_user).limit(10) - current_user.matches(current_user)
      # end

      if params[:id]
        @users = User.where('id < ?', params[:id]).limit(2)
      else
        @users = User.all.limit(2)
      end

        respond_to do |format|
        format.html
        format.js
      end
  end


  def edit
  end

  def profile
  end

  def matches
    @matches = current_user.friendships.where(state: "ACTIVE").map(&:friend) + current_user.inverse_friendships.where(state:"ACTIVE").map(&:user)
  end
end
































