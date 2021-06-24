class AlwaysAnErrorValidator < ActiveModel::EachValidator

  def validate_each(object, attribute, value)
    err_msg = options[:message] || "^yeah this is invalid"
    object.errors.add(attribute, err_msg)
  end
end