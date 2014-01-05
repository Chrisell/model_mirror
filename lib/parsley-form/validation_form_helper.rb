module ValidationFormHelper
  def validation_form_for(object, options = {}, &block)
    options[:builder] = ValidationFormBuilder
    options[:html] ||= {}
    options[:html].merge!({ 'parsley-validate' => 'parsley-validate' })
    form_for(object, options, &block)
  end
end

ActionView::Base.class_eval do
  include ValidationFormHelper
end
