class Admin::SocialLinksController < Admin::BaseAdminController
  load_and_authorize_resource
  skip_load_resource only: :index

  def new; end

  def create
    if @social_link.save
      flash[:notice] = 'Social links has been created'
      redirect_to admin_social_links_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @social_link.update(social_link_params)
      flash[:notice] = 'Social links has been updated'
      redirect_to admin_social_links_path
    else
      render 'edit'
    end
  end

  def index
    @social_links = current_manager.organization.social_link
  end

  def destroy
    return unless @social_link.destroy
    flash[:notice] = 'Social links was deleted'
    redirect_to admin_social_links_path
  end

  private

  def social_link_params
    params.require(:social_link).permit(:facebook, :twitter, :instagram)
  end
end
