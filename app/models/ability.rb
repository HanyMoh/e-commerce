# frozen_string_literal: true

# This class manages user abilities, You need to add
# every new manageable class here in order to be accessed
class Ability
  include CanCan::Ability

  MANAGERS_MODELS = [OrganizationManager]

  # Model which needed to be managed by Managers
  # should be added here, otherwise you will get
  # you're not authorized to view this page
  AUTHORIZED_MODELS = [
    Product, Brand, Shop, MetaTag, SubProduct,
    FacebookPixel, SeoPageTitle, GoogleAnalytic, Order, SubscribedUser,
    ShopFloor, ShopSection, Scene, OrganizationTheme, SocialLink,
    Stock, Shop360
  ]

  def initialize(user)
    case user
    when Admin
      # Admin can manage everything
      can :manage, :all
    when OrganizationManager
      # Manager can manage everything related to his organization.
      MANAGERS_MODELS.concat(AUTHORIZED_MODELS).each do |model|
        can :manage, model, organization_id: user.organization_id
      end
    when EmployeeUser
      # EmployeeUser can manage anything he has access on.
      user.roles.each do |role|
        role.permissions.each do |permission|
          model = permission.target_model_name.constantize
          can permission.action.to_sym, model, organization_id: user.organization_id
        end
      end
    end
  end
end
