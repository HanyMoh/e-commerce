class Admin::AdminsController < Admin::BaseAdminController
  load_and_authorize_resource except: %i[dashboard guides intro_page change_password]
  skip_authorization_check only: %i[dashboard guides intro_page change_password]
  layout 'dashboard', except: %i[intro_page]

  def dashboard
    render 'admin/dashboard'
  end

  def guides
    render 'admin/guides'
  end

  def intro_page
    render 'admin/intro_page'
  end

  def edit; end

  def update; end

  def change_password
    if current_active_user.valid_password?(params[:old_password])
      if params[:new_password] == params[:confirm_new_password]
        current_active_user.update(password: params[:new_password])
        flash[:notice] = 'You password has been updated'
      else
        flash[:error] = 'Password confirmation doesn\'t match your new password'
      end
    else
      flash[:error] = 'Your current password is incorrect'
    end
    redirect_to admin_dashboard_path
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :avatar, :email, :job_title, :phone_number,
                                  :password, :password_confirmation, :current_password)
  end
end
