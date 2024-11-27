# == Schema Information
#
# Table name: destinations
#
#  id                               :uuid             not null, primary key
#  destination_type                 :string
#  sharepoint_folder_path           :string
#  sharepoint_library_display_name  :string
#  sharepoint_library_internal_name :string
#  sharepoint_site_url              :string
#  status                           :string
#  title                            :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  created_by_id                    :uuid
#  updated_by_id                    :uuid
#
require 'rails_helper'

RSpec.describe Destination, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
