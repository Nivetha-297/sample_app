class UserController < ApplicationController

  def show
    @user = user.find(params[:id])
  end

  def new
  end
end
