class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email])
  # end

# def after_sign_in_path_for(resource)
#   case resource
#   when Admin
#     admin_root_path
#   when Customer
#   root_path
#   end
# end


# def after_sign_out_path_for(resource)
#   case resource
#   when Admin
#     new_admin_session_path
#   when Customer
#   public_items_index_path
#   end

# end
end

