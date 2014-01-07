ModelMirror::Settings.configure({
  length_min:    'parsley-minlength',
  length_max:    'parsley-maxlength',
  length_range:  'parsley-rangelength',
  numericality:  'parsley-type',
  presence:      'parsley-required',
  format:        'parsley-regex',
  error_message: 'parsley-error-message'
})
