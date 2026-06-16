class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  include Pagy::Method
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def layout_by_resource
    if devise_controller?
      "auth"
    else
      "application"
    end
  end
end
