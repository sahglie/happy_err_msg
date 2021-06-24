class Rando
  include ::ActiveAttr::Model
  include ::ActiveModel::Validations::Callbacks

  attribute(:field1)
  attribute(:field2)

  validates(:field1, always_an_error: true)
  validates(:field2, always_an_error: { message: "yeah this is invalid"})
end