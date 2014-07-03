# Codekit needs relative paths
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require "sassinox/generator"

unless defined?(Sass)
  require 'sass'
end

module Sassinox
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require 'sassinox/engine'
    end

    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load 'tasks/install.rake'
        end
      end
    end
  else
    sassinox_path = File.expand_path("../../vendor/assets/stylesheets", __FILE__)
    ENV["SASS_PATH"] = [ENV["SASS_PATH"], sassinox_path].compact.join(File::PATH_SEPARATOR)
  end
end
