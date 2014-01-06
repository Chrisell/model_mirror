module ModelMirror::ValidationFormHelper
  class ValidationFormBuilder < ActionView::Helpers::FormBuilder
    delegate :content_tag, :tag, to: :@template
    attr_accessor :model, :options

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

    def validators_on(attribute)
      object.class.validators_on(attribute).map { |e| { type: e, options: e.options } }
    end

    private

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
