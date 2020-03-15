class AddEmployerIdToNewSection < ActiveRecord::Migration[5.1]
  def change
    add_reference :new_sections,:employee_user,index: true
  end
end
