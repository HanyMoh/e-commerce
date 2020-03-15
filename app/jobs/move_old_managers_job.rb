class MoveOldManagersJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Dashboard::MoveManagersService.new
  end
end
