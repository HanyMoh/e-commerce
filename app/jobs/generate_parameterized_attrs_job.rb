class GenerateParameterizedAttrsJob < ApplicationJob
  queue_as :default

  def perform
    Dev::GenerateParameterizedAttrsService.new.call
  end
end
