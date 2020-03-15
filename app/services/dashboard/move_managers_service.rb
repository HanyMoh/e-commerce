require 'amoeba'

class Dashboard::MoveManagersService
  def initialize
    Manager.all.each do |manager|
      copy_manager = manager.amoeba_dup
      copy_manager = JSON.parse(copy_manager.to_json)
      org = OrganizationManager.new(copy_manager)
      org.password = '987654321'
      org.save!
    end
  end
end
