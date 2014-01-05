module ValidationFormHelper
  class Tag

    attr_accessor :model_attribute, :validators

    TYPE_MAPPING = {
      string: 'text',
      boolean: 'checkbox'
    }

    def initialize(model_attribute, validators, options = {})
      @model_attribute, @validators = model_attribute, validators
    end

    def render
        "<input type='#{TYPE_MAPPING[:string]}' parsley-trigger='change' #{additions} />".html_safe
    end

    def additions
      validations = []
      @validators.each do |validation|
        validations << case validation[:type]
          when ActiveModel::Validations::PresenceValidator
            validate_presence(validation)
          when ActiveModel::Validations::NumericalityValidator
            validate_numericality(validation)
          when ActiveModel::Validations::LengthValidator
            validate_length(validation)
          when ActiveModel::Validations::FormatValidator
            validate_format(validation)
          else
            ''
          end
      end
      validations.join(' ')
    end

  private
    def validate_length(validation)
      addition = case validation[:options].length
      when 1
        if validation[:options][:minimum]
          "parsley-minlength='#{validation[:options][:minimum]}'"
        elsif validation[:options][:maximum]
          "parsley-maxlength='#{validation[:options][:maximum]}'"
        end
      when 2
          "parsley-rangelength='[#{validation[:options][:minimum]},#{validation[:options][:maximum]}]'"
      else
        ''
      end
      addition += add_message_for_validation(validation)
    end

    def validate_numericality(validation)
     addition = if validation[:options][:only_integer]
        'parsley-type="digits"'
      else
        'parsley-type="number"'
      end
      addition += add_message_for_validation(validation)
    end

    def validate_presence(validation)
      addition = 'required'
      addition += add_message_for_validation(validation)
    end

    def validate_format(validation)
      addtion = "parsley-regexp='#{validation[:options][:with]}'" if validation[:options][:with].present?
      addition += add_message_for_validation(validation)
    end

    def add_message_for_validation(validation)
       validation[:options][:message].present? ? " parsley-error-message='#{validation[:options][:message]}'" : ''
    end

  end
end
