# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in.'

      redirect_to root_path
    else
      flash[:danger] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out.'

    redirect_to root_path
  end
end
