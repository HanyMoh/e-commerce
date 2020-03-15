# frozen_string_literal : true
MAJOR = 1
MINOR = 2
TINY = 3
PRE = nil

# APP_VERSION = [MAJOR, MINOR, TINY,PRE].compact.join(".")
version_file = if File.exist?(File.expand_path('../REVISION', __dir__))
                 File.expand_path('../REVISION', __dir__)
               else
                 File.expand_path('../VERSION', __dir__)
               end
APP_VERSION = File.read(version_file).strip
