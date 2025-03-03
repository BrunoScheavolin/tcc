class Users::RegistrationsController < Devise::RegistrationsController
  layout :determine_layout

  private

  def determine_layout
    user_signed_in? ? "application" : "login"
  end
end
