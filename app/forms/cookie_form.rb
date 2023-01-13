class CookieForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment
  include ActiveModel::Serializers::JSON
  attribute :analytics, :boolean, default: false
  attribute :essential, :boolean, default: true
  attribute :confirmed, :boolean, default: false
end
