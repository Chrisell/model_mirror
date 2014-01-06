require 'yaml'
require 'action_view'
require 'rails/engine'
require 'model_mirror/settings'
require 'model_mirror/validation_form_helper'
require 'model_mirror/validation_form_builder'
require 'model_mirror/tag'

module ModelMirror
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
