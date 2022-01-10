# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_seller!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_card
    if current_user.card
      current_user.card
    else
      card = current_user.build_card
      card.save
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address number])
  end
end
