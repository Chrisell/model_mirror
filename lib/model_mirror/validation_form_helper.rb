module ModelMirror::ValidationFormHelper


  # Helper tag for form. Adds custom builder and
  # additional html attributes then uses FormBuilder#form_for
  #
  # @param [Class] Model being passed in to form
  # @param [Hash] Options for the form
  # @param [Block] The form block
  # @return The validation form
  #
  def validation_form_for(object, options = {}, &block)
    options[:builder] = ValidationFormBuilder
    options[:html] ||= {}
    options[:html].merge!({ 'parsley-validate' => 'parsley-validate' })
    form_for(object, options, &block)
  end

end

ActionView::Base.class_eval do
  include ModelMirror::ValidationFormHelper
end
