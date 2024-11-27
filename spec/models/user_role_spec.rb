# == Schema Information
#
# Table name: user_roles
#
#  id            :uuid             not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid
#  request_id    :uuid
#  role_id       :uuid
#  updated_by_id :uuid
#  user_id       :uuid
#
# Indexes
#
#  index_user_roles_on_created_by_id  (created_by_id)
#  index_user_roles_on_id             (id)
#  index_user_roles_on_role_id        (role_id)
#  index_user_roles_on_updated_by_id  (updated_by_id)
#  index_user_roles_on_user_id        (user_id)
#
require 'rails_helper'

RSpec.describe UserRole, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
