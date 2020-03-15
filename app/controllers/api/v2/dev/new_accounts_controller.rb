class Api::V2::Dev::NewAccountsController < Api::V2::Dev::ApiBaseController
  skip_before_action :authenticate_admin
  def create_accounts
    OrganizationManager.create!(name: 'El sallab', email: 'sallab@nasnav.com', phone_number: '01227430009', organization_id: 13, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'Fortune Manager', email: 'fortune@nasnav.com', phone_number: '546542312315', organization_id: 11, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: "Al'Image Manager", email: 'alimage@nasnav.com', phone_number: '414141479', organization_id: 8, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'Le Collezioni', email: 'lecollezioni@nasnav.com', phone_number: '0223146301', organization_id: 17, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'Test', email: 'testmoa@nasnav.com', phone_number: '555', organization_id: 15, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'Fortunemm', email: 'for@nasnav.com', phone_number: '000', organization_id: 11, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'Test Manager', email: 'test_manager_2@nasnav.com', phone_number: '23234324', organization_id: 1, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'meetvibe', email: 'meetvibe@nasnav.com', phone_number: '01227981415', organization_id: 12, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'MOmaneRamadi', email: 'managerqp@gmail.com', phone_number: '6', organization_id: 11, password: '987654321', job_title: 'Manager')
    OrganizationManager.create!(name: 'Manager', email: 'manager@nasnav.com', phone_number: '48844884488', organization_id: 1, password: '987654321', job_title: 'Manager')
  end

  def index
    @managers = OrganizationManager.all
  end
end
