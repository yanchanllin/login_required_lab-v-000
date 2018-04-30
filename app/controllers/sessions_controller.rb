class SessionsController < ApplicationController
  helper_method :current_user
  def new
  end

  def create
    if !params[:name] || params[:name].empty?
      redirect_to controller: 'sessions', action: 'new'
    else
      session[:name] = params[:name]
      redirect_to :welcome
    end
  end

  def welcome
    return head(:forbidden) unless session.include? :name
    @user = current_user
  end

  def destroy
    if current_user
      session.delete(:name)
    end
    redirect_to controller: 'sessions', action: 'new'
  end

end