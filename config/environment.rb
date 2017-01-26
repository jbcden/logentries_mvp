# Load the Rails application.
require File.expand_path('../application', __FILE__)

LOGENTRY_TOKEN = YAML.load_file(File.join(Rails.root, 'config', 'logentries.yml'))[Rails.env]

Rails.logger = Le.new(LOGENTRY_TOKEN['token'], local: true,
                      debug: false,
                      log_level: Logger::INFO,
                      tag: true)

# Initialize the Rails application.
Rails.application.initialize!
