# == Schema Information
#
# Table name: roles
#
#  id                            :uuid             not null, primary key
#  destination_create            :boolean
#  destination_destroy           :boolean
#  destination_read              :boolean
#  destination_update            :boolean
#  name                          :string
#  request_approve               :boolean
#  request_create                :boolean
#  request_destroy               :boolean
#  request_manage                :boolean
#  request_notification_create   :boolean
#  request_notification_destroy  :boolean
#  request_notification_read     :boolean
#  request_notification_update   :boolean
#  request_page_create           :boolean
#  request_page_destroy          :boolean
#  request_page_read             :boolean
#  request_page_update           :boolean
#  request_question_create       :boolean
#  request_question_destroy      :boolean
#  request_question_read         :boolean
#  request_question_update       :boolean
#  request_read                  :boolean
#  request_route_create          :boolean
#  request_route_destroy         :boolean
#  request_route_read            :boolean
#  request_route_update          :boolean
#  request_rule_create           :boolean
#  request_rule_destroy          :boolean
#  request_rule_read             :boolean
#  request_rule_update           :boolean
#  request_update                :boolean
#  response_create               :boolean
#  response_destroy              :boolean
#  response_notification_create  :boolean
#  response_notification_destroy :boolean
#  response_notification_read    :boolean
#  response_notification_update  :boolean
#  response_read                 :boolean
#  response_update               :boolean
#  role_create                   :boolean
#  role_destroy                  :boolean
#  role_read                     :boolean
#  role_update                   :boolean
#  status                        :string
#  system                        :boolean
#  template_create               :boolean
#  template_manage               :boolean
#  template_use                  :boolean
#  user_create                   :boolean
#  user_destroy                  :boolean
#  user_read                     :boolean
#  user_role_create              :boolean
#  user_role_destroy             :boolean
#  user_role_read                :boolean
#  user_role_update              :boolean
#  user_update                   :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  created_by_id                 :uuid
#  updated_by_id                 :uuid
#
# Indexes
#
#  index_roles_on_created_by_id  (created_by_id)
#  index_roles_on_id             (id)
#  index_roles_on_updated_by_id  (updated_by_id)
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
