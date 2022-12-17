require "active_model/error"

module ActiveModel
  class Error
    def self.full_message(attribute, message, base)
      # :nodoc:
      return message if attribute == :base

      base_class = base.class
      attribute = attribute.to_s

      if i18n_customize_full_message && base_class.respond_to?(:i18n_scope)
        attribute = attribute.remove(/\[\d+\]/)
        parts = attribute.split(".")
        attribute_name = parts.pop
        namespace = parts.join("/") unless parts.empty?
        attributes_scope = "#{base_class.i18n_scope}.errors.models"

        if namespace
          defaults = base_class.lookup_ancestors.map do |klass|
            [
              :"#{attributes_scope}.#{klass.model_name.i18n_key}/#{namespace}.attributes.#{attribute_name}.format",
              :"#{attributes_scope}.#{klass.model_name.i18n_key}/#{namespace}.format",
            ]
          end
        else
          defaults = base_class.lookup_ancestors.map do |klass|
            [
              :"#{attributes_scope}.#{klass.model_name.i18n_key}.attributes.#{attribute_name}.format",
              :"#{attributes_scope}.#{klass.model_name.i18n_key}.format",
            ]
          end
        end

        defaults.flatten!
      else
        defaults = []
      end

      defaults << :"errors.format"
      defaults << "%{attribute} %{message}"

      attr_name = attribute.tr(".", "_").humanize
      attr_name = base_class.human_attribute_name(attribute, {
        default: attr_name,
        base: base,
      })

      if message.start_with?('^')
        I18n.t(:"errors.^format", default: message[1..-1])
      else
        I18n.t(:"errors.format", 
          default:  defaults,
          attribute: attr_name,
          message:   message
        )
      end
    end
  end
end
