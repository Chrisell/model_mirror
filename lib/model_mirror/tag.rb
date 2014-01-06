module ModelMirror::ValidationFormHelper
  class Tag < ActionView::Helpers::FormBuilder

    attr_accessor :options

    def initialize(model_attribute, validators, options = {})
      @model_attribute, @validators, @options = model_attribute, validators, options
      add_markup_validation
    end

    #
    # Loops through validations passed to the Tag, collects them into a hash, then
    # merges into the @options variable.
    #
    def add_markup_validation
      validations = {}
      @validators.each do |validation|
        validations.merge! case validation[:type]
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
      @options.merge!('parsley-trigger' => "focusout")
      @options.merge!(validations)
    end

  private

  #
  # Validates length of an attribute
  #
  # @param [ActiveModel::Validations::LengthValidator]
  # @return [Hash] HTML option for tag with validation
  #
    def validate_length(validation)
      addition = case validation[:options].length
      when 1
        if validation[:options][:minimum]
          { ModelMirror::Settings.config[:length_min] => validation[:options][:minimum] }
        elsif validation[:options][:maximum]
          { ModelMirror::Settings.config[:length_max] => validation[:options][:maximum] }
        end
      when 2
        { ModelMirror::Settings.config[:length_range] => "[#{validation[:options][:minimum]},#{validation[:options][:maximum]}]" }
      else
        ''
      end
      add_message_for_validation(addition, validation)
    end

  #
  # Validates numericality of an attribute
  #
  # @param [ActiveModel::Validations::NumericalityValidator]
  # @return [Hash] HTML option for tag with validation
  #
    def validate_numericality(validation)
      addition = { ModelMirror::Settings.config[:numericality] => validation[:options][:only_integer] ? 'digits' : 'number' }
      add_message_for_validation(addition, validation)
    end

  #
  # Validates presence of an attribute
  #
  # @param [ActiveModel::Validations::PresenceValidator]
  # @return [Hash] HTML option for tag with validation
  #
    def validate_presence(validation)
      addition = { ModelMirror::Settings.config[:presence] => "true" }
      add_message_for_validation(addition, validation)
    end

  #
  # Validates format of an attribute
  #
  # @param [ActiveModel::Validations::FormatValidator]
  # @return [Hash] HTML option for tag with validation
  #
    def validate_format(validation)
      addition = { ModelMirror::Settings.config[:format] => validation[:options][:with] } if validation[:options][:with].present?
      add_message_for_validation(addition, validation)
    end

  #
  # Adds an optional validation message if it exists in the options of the model's validation.
  #
  # @param [Hash] HTML option for tag with validation
  # @param [ActiveModel::Validations] Some subclass of the Validations class.
  # @return [Hash] HTML option for tag with validation with message
  #
    def add_message_for_validation(addition, validation)
        addition.merge!({ ModelMirror::Settings.config[:error_message] => validation[:options][:message] }) if validation[:options][:message].present?
        addition
    end

  end
end
