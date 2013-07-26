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

class HappinessEntry < ActiveRecord::Base
  attr_accessible :description, :score, :user_id
  belongs_to :user
end
