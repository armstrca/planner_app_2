# frozen_string_literal: true

# == Schema Information
#
# Table name: planner_entries
#
#  id              :integer          not null, primary key
#  datetime_end    :string
#  datetime_start  :datetime
#  entry_content   :string
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  daily_id        :integer
#  extra_id        :integer
#  monthly_id      :integer
#  planner_id      :integer
#  tldraw_input_id :integer
#  user_id         :integer
#  weekly_id       :integer
#
class PlannerEntry < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :planner, counter_cache: true
  belongs_to :weekly
  belongs_to :monthly
  belongs_to :daily
  belongs_to :extra
end
