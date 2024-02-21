Found no changes, using resolution from the lockfile
# == Schema Information
#
# Table name: tldraw_inputs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  planner_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TldrawInput < ApplicationRecord
  belongs_to :planner, required: true, class_name: "Planner", foreign_key: "planner_id", counter_cache: true

  has_one :weekly, through: :planner, source: :weeklies

  has_one :daily, through: :planner, source: :dailies

  has_one :extra, through: :planner, source: :extras

  has_one :monthly, through: :planner, source: :monthlies
end
