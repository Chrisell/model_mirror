module ModelMirror
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates ModelMirror initializer for your application"

      def copy_initializer
        template "model_mirror_initializer.rb", "config/initializers/model_mirror.rb"

        puts "Install complete!"
        puts "Configure the validation prefixes in your config/initializers/model_mirror.rb file."
      end
    end
  end
end
