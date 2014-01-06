module ValidationFormHelper
  class Tag < ActionView::Helpers::FormBuilder

    attr_accessor :model_attribute, :validators, :options

    TYPE_MAPPING = {
      string: 'text',
      boolean: 'checkbox'
    }

    def initialize(model_attribute, validators, options = {})
      @model_attribute, @validators, @options = model_attribute, validators, options
      additions
    end

    def additions
      validations = {}
      @validators.each do |validation|
        case validation[:type]
          when ActiveModel::Validations::PresenceValidator
            validations.merge! validate_presence(validation)
          when ActiveModel::Validations::NumericalityValidator
            validations.merge! validate_numericality(validation)
          when ActiveModel::Validations::LengthValidator
            validations.merge! validate_length(validation)
          when ActiveModel::Validations::FormatValidator
            validations.merge! validate_format(validation)
          else
            ''
          end
      end
      @options.merge!(validations)
    end

  private
    def validate_length(validation)
      addition = case validation[:options].length
      when 1
        if validation[:options][:minimum]
          { 'parsley-minlength' => validation[:options][:minimum] }
        elsif validation[:options][:maximum]
          { 'parsley-maxlength' => validation[:options][:maximum] }
        end
      when 2
        { 'parsley-rangelength' => "[#{validation[:options][:minimum]},#{validation[:options][:maximum]}]" }
      else
        ''
      end
      add_message_for_validation(addition, validation)
    end

    def validate_numericality(validation)
      addition = if validation[:options][:only_integer]
                  { 'parsley-type' => 'digits' }
                else
                  { 'parsley-type' => 'number' }
                end
      add_message_for_validation(addition, validation)
    end

    def validate_presence(validation)
      addition = { 'parsley-required' => "true" }
      add_message_for_validation(addition, validation)
    end

    def validate_format(validation)
      addtion = { 'parsley-regexp' => validation[:options][:with] } if validation[:options][:with].present?
      add_message_for_validation(addition, validation)
    end

    def add_message_for_validation(addition, validation)
        addition.merge!({ 'parsley-error-message' => validation[:options][:message] }) if validation[:options][:message].present?
        addition
    end

  end
end
