ModelMirror::Settings.configure do |config|
  config.length_min =    'parsley-minlength'
  config.length_max =    'parsley-maxlength'
  config.length_range =  'parsley-rangelength'
  config.numericality =  'parsley-type'
  config.presence =      'parsley-required'
  config.format =        'parsley-regex'
  config.error_message = 'parsley-error-message'
end
