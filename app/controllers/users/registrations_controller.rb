class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
