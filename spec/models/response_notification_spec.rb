# == Schema Information
#
# Table name: response_notifications
#
#  id                      :uuid             not null, primary key
#  body                    :text
#  name                    :string
#  status                  :string
#  title                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  created_by_id           :uuid
#  govuk_notify_id         :string
#  request_notification_id :uuid
#  response_id             :uuid
#  updated_by_id           :uuid
#
# Indexes
#
#  index_response_notifications_on_created_by_id            (created_by_id)
#  index_response_notifications_on_request_notification_id  (request_notification_id)
#  index_response_notifications_on_response_id              (response_id)
#  index_response_notifications_on_updated_by_id            (updated_by_id)
#
require 'rails_helper'

RSpec.describe ResponseNotification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
