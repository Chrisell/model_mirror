# This is the default settings for the gem. If you would prefer to configure through a YAML file, comment out this set and uncomment the configuration below.

ModelMirror::Settings.configure({
  # ActiveModel::Validations::LengthValidator { minimum: x }
  length_min:    'parsley-minlength',
  # ActiveModel::Validations::LengthValidator { maximum: x }
  length_max:    'parsley-maxlength',
  # ActiveModel::Validations::LengthValidator { minimum: x, maximum: y }
  length_range:  'parsley-rangelength',
  # ActiveModel::Validations::NumericalityValidator
  numericality:  'parsley-type',
  # ActiveModel::Validations::PresenceValidator
  presence:      'parsley-required',
  # ActiveModel::Validations::FormatValidator
  format:        'parsley-regex',
  # Works with any { message: 'foo' } option on validators
  error_message: 'parsley-error-message'
})

# Uncomment this to allow for local YAML configuration instead of hash configuration.
# Replace path_to_yaml_file with the location of your config
#
# ModelMirror::Settings.configure_with(path_to_yaml_file)
