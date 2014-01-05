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
        ' '
      end
    end

    def validate_numericality(validation)
      if validation[:options][:only_integer]
        'parsley-type="digits"'
      else
        'parsley-type="number"'
      end
    end

    def validate_presence(validation)
      'required'
    end

    def validate_format(validation)
      "parsley-regexp='#{validation[:options][:with]}'" if validation[:options][:with].present?
    end

  end
end
