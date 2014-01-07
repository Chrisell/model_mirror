$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bundler'
Bundler.setup
require 'rspec'
require 'model_mirror'
require './lib/generators/templates/model_mirror_initializer'
require 'active_model'
require 'active_model/validations'
require 'active_model/validations/validates'


module ModelMirrorSpecHelper
  class User
    include ActiveModel::Validations
    attr_accessor :name
    validates :name, presence: true,
              length: { minimum:6, maximum: 60},
              numericality: { digits: true, message: 'Must be a digit' }
  end
end

include ModelMirrorSpecHelper
include ModelMirror
include ModelMirror::Settings
include ModelMirror::ValidationFormHelper
