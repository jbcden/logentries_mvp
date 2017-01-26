class SecondOtherJob < ApplicationJob
  queue_as :b_queue

  def perform(user, values)
    process(user)
    log_properties(user.login, values)
  end

  private

  def process(user)
    if user.name == 'Jacob Chae'
      log_properties(user.name, { processed: true })
    else
      log_properties(user.name, { processed: false })
    end
  end

  def log_properties(login, properties)
    TaggedLogger.log(tag: 'second_job', values: properties.merge(login: login))
  end
end
