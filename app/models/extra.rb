# == Schema Information
#
# Table name: extras
#
#  id         :integer          not null, primary key
#  planner_id :integer
#  html       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Extra < ApplicationRecord
  belongs_to :planner, required: true, class_name: "Planner", foreign_key: "planner_id", counter_cache: true

  has_one :tldraw_input, through: :planner, source: :tldraw_inputs
end
