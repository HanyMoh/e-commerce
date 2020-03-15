module SubscribedUsersHelper
  def format_name(email)
    email&.split('@')[0]
  end
end
