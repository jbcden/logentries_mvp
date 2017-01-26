class ApplicationJob < ActiveJob::Base
  extend Resque::Plugins::JobStats
end
