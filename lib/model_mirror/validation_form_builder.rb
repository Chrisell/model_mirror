module ModelMirror::ValidationFormHelper
  class ValidationFormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template
    attr_accessor :model, :options

    # Generates methods for the different field types for form_for
    # If the field includes the skip_validations flag it will just
    # pass through the normal arguments and act as a normal form_for.
    #
    # @return Full HTML set of a label, break tag, and input field
    #
    %w[text_field text_area password_field collection_select].each do |method_name|
      define_method(method_name) do |name, *args|
        content_tag :div, class: "field" do
          if args[0].present? && args[0].include?(:skip_validations)
            field_label(name, *args) + tag(:br) + super(name, *args)
          else
            t = Tag.new(name, validators_on(name),args.extract_options!)
            field_label(name, *args) + tag(:br) + super(name, t.options)
          end
        end
      end
    end

    # Maps the validator type and options for a attribute
    #
    # @param [Symbol] Symbol for the objects attribute
    # @return [Hash] Hash of ActiveModel::Validations and their options
    #
    def validators_on(attribute)
      object.class.validators_on(attribute).map { |e| { type: e, options: e.options } }
    end

    private

    # Generates a label for the attribute
    #
    # @param [Symbol] Attribute name as a symbol
    # @param [Array] Array for args
    # @return HTML label tag
    #
      def field_label(name, *args)
        options = args.extract_options!
        required = object.class.validators_on(name).any? { |v| v.kind_of? ActiveModel::Validations::PresenceValidator }
        label(name, options[:label], class: ("required" if required))
      end

      def objectify_options(options)
        super.except(:label)
      end

  end
end
