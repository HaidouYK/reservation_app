class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # ログイン済ユーザーのみにアクセスを許可する
    #before_action :authenticate_user!, except: [:index, :show]

    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?

    # サインアウト時トップページに戻る
    def after_sign_out_path_for(resource)
        root_path
    end

    protected
    def configure_permitted_parameters
        # サインアップ時にuser_nameのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_profile, :avatar])

        # アカウント編集の時にuser_nameとuser_profile,avatarのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :user_profile, :avatar])

    end
end