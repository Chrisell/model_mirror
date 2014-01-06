require 'yaml'
require 'action_view'
require 'rails/engine'
require 'parsley-form/settings'
require 'parsley-form/validation_form_helper'
require 'parsley-form/validation_form_builder'
require 'parsley-form/tag'

module ParsleyForm
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
