class QueuerJob < ApplicationJob
  queue_as :b_queue

  def perform(user)
    name = user.name
    login = user.login
    values = { name: name, login: login }
    FirstOtherJob.perform_later(user, values)
    SecondOtherJob.perform_later(user, values)
  end
end
