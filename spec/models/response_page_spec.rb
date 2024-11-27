# == Schema Information
#
# Table name: response_pages
#
#  id              :uuid             not null, primary key
#  answers         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  request_page_id :uuid
#  response_id     :uuid
#
# Indexes
#
#  index_response_pages_on_request_page_id  (request_page_id)
#  index_response_pages_on_response_id      (response_id)
#
require 'rails_helper'

RSpec.describe ResponsePage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
