# == Schema Information
#
# Table name: happiness_entries
#
#  id          :integer          not null, primary key
#  score       :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class HappinessEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
