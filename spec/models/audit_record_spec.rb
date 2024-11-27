# == Schema Information
#
# Table name: audit_records
#
#  id                       :uuid             not null, primary key
#  narrative                :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  created_by_id            :uuid
#  request_id               :uuid
#  request_notification_id  :uuid
#  request_page_id          :uuid
#  request_question_id      :uuid
#  request_route_clause_id  :uuid
#  request_route_id         :uuid
#  request_rule_id          :uuid
#  response_id              :uuid
#  response_notification_id :uuid
#  role_id                  :uuid
#  updated_by_id            :uuid
#  user_id                  :uuid
#  user_role_id             :uuid
#
require 'rails_helper'

RSpec.describe AuditRecord, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
