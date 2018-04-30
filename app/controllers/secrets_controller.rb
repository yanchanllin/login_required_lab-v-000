class SecretsController < ApplicationController
  helper_method :current_user
  before_action :require_login

  def show
  end

  private
  def require_login
    unless session.include? :name
      redirect_to controller: 'sessions', action: 'new'
    end
  end

end