class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: [:nickname, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana])
    devise_parameter_sanitizer
      .permit(:account_update, keys: [:nickname, :first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana])
  end

end
