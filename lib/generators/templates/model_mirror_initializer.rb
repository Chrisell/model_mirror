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
