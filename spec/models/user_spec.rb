# == Schema Information
#
# Table name: users
#
#  id            :uuid             not null, primary key
#  email_address :string
#  name          :string
#  status        :string
#  superuser     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid
#  updated_by_id :uuid
#
# Indexes
#
#  index_users_on_created_by_id  (created_by_id)
#  index_users_on_id             (id)
#  index_users_on_updated_by_id  (updated_by_id)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
