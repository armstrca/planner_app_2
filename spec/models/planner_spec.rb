# == Schema Information
#
# Table name: planners
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  monthly_id          :integer
#  weekly_id           :integer
#  daily_id            :integer
#  page_order          :string
#  monthlies_count     :integer
#  weeklies_count      :integer
#  dailies_count       :integer
#  extras_count        :integer
#  tldraw_inputs_count :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe Planner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
