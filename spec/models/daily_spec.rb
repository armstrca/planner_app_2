# frozen_string_literal: true

# == Schema Information
#
# Table name: dailies
#
#  id         :integer          not null, primary key
#  planner_id :integer
#  html       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Daily, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
