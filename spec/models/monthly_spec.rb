# frozen_string_literal: true

# == Schema Information
#
# Table name: monthlies
#
#  id         :integer          not null, primary key
#  planner_id :integer
#  html       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Monthly, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
