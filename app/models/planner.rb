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
class Planner < ApplicationRecord
  belongs_to :owner, required: true, class_name: 'User', foreign_key: 'user_id',
                     counter_cache: true

  has_many :monthlies, class_name: 'Monthly', foreign_key: 'planner_id', dependent: :destroy

  has_many :weeklies, class_name: 'Weekly', foreign_key: 'planner_id', dependent: :destroy

  has_many :dailies, class_name: 'Daily', foreign_key: 'planner_id', dependent: :destroy

  has_many :extras, class_name: 'Extra', foreign_key: 'planner_id', dependent: :destroy

  has_many :tldraw_inputs, class_name: 'TldrawInput', foreign_key: 'planner_id',
                           dependent: :destroy
end
