# == Schema Information
#
# Table name: request_notifications
#
#  id                :uuid             not null, primary key
#  body              :text
#  description       :text
#  group             :string
#  name              :string
#  notification_type :string
#  status            :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  created_by_id     :uuid
#  request_id        :uuid
#  updated_by_id     :uuid
#
# Indexes
#
#  index_request_notifications_on_created_by_id  (created_by_id)
#  index_request_notifications_on_request_id     (request_id)
#  index_request_notifications_on_updated_by_id  (updated_by_id)
#
require 'rails_helper'

RSpec.describe RequestNotification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
