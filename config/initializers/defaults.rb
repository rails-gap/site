begin
  defaults = YAML.load_file("#{Rails.root}/config/defaults.yml")
  DEFAULT_POSITIONS = defaults['positions']
  DEFAULT_USERS = defaults['users']
  DEFAULT_PRACTICES = defaults['practices']
rescue Errno::ENOENT, Psych::SyntaxError
  Rails.logger.error 'An error occured while loading defaults.yml'
end
DEFAULT_POSITIONS ||= []
DEFAULT_USERS ||= []
DEFAULT_PRACTICES ||= []
