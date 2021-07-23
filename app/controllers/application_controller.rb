class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  # デバイスコントローラーを使うときは、ストロングパラメーターの部分の受け渡しを行う許可を出す
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログイン後の遷移先の指定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      customers_my_page_path
    end
  end

  # ログアウト後の遷移先の指定
  def after_sign_out_path_for(resource)
    if resource == :admin_admin
      new_admin_admin_session_path
    else
      root_path
    end
    # ログアウトの際はwhenが使えない。おそらくrailsがそういう仕様とのこと
    # case resource
    # when Admin
    #   new_admin_admin_session_path
    # when Customer
    #   root_path
    # end
  end

  
  



  protected
  
  # サインインの際に登録する必要なデータの受け渡しを記述する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end
  
  
end
