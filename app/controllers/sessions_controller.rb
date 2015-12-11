class SessionsController < ApplicationController

  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   if user && user.authenticate(params[:password])
  #     if user.email_confirmed
  #       session[:user_id] = user.id
  #       redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
  #     else
  #       flash.now[:error] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
  #       render :new
  #     end
  #     else
  #       flash.now[:error] = 'Invalid email/password combination'
  #       render :new
  #   end
  # end

  def create
    # binding.pry
    # Store_location using request.referer except if the request.referer was a login page
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      if user.email_confirmed
        sign_in user
        redirect_back_or root_url
      else
        flash.now[:error] = 'Please activate your account by following the instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
      sign_out
      redirect_to root_url, notice: "Adios!"
  end

end