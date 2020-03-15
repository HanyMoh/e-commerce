class Api::V2::Dashboard::MoveManagersController < Api::V2::Dashboard::ApiBaseController
  def create_managers
    MoveOldManagersJob.perform_now
  end
end
