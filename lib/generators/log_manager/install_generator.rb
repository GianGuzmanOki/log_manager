module LogManager  
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def generate_configuration_file
        copy_file "log_manager.yml", "config/log_manager.yml"
      end

    end
  end
end 