require 'rails/generators/active_record'

module LogManager  
  module Generators
    class ExecuteGenerator < Rails::Generators::Base

      class_option :environment,  default: 'development',       desc: "Environment's variables for the logrotate file"

      def self.source_root
        @source_root ||= LogManager.path
      end

      def generate_log_rotate_file
        LogManager.setup(options[:environment])
        LogManager.log_rotate
      end

    end
  end
end 