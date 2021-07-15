class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # デバイスコントローラーを使うときは、ストロングパラメーターの部分の受け渡しを行う許可を出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  # サインインの際に登録する必要なデータの受け渡しを記述する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
end
