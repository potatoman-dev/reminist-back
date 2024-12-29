class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :configure_permitted_parameters

  protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

  private

    def sign_up_params
      params.permit(:email, :password, :password_confirmation, :name)
    end

    def account_update_params
      params.permit(:name)
    end
end
