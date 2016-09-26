class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    a = user.ornot
    if (user && user.password_digest == params[:password] && user.ornot == 1)

      session[:user_id] = user.id
      flash[:success] = "Welcome to Library App Admin  #{params[:name]}"

      redirect_to adminpages_path

    elsif (user && user.password_digest == params[:password])

      session[:user_id] = user.id
      flash[:success] = "Welcome to Library App User:  #{params[:name]}"

      redirect_to rooms_path 

    else
      flash.now[:danger] = "Wrong Email or Password to Library App"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "GoodBye"
    redirect_to root_path

  end

end
