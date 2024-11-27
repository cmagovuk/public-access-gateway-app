# == Schema Information
#
# Table name: settings
#
#  id            :uuid             not null, primary key
#  key           :string
#  value         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :uuid
#  updated_by_id :uuid
#
require 'rails_helper'

RSpec.describe Setting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
