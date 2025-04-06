# == Schema Information
#
# Table name: pages
#
#  id               :uuid             not null, primary key
#  page_date        :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  page_template_id :uuid             not null
#  planner_id       :uuid             not null
#  user_id          :uuid             not null
#
# Indexes
#
#  index_pages_on_page_template_id  (page_template_id)
#  index_pages_on_planner_id        (planner_id)
#  index_pages_on_user_id           (user_id)
#  index_recent_pages               (page_date) WHERE page_date >= '2024-04-06'
#
# Foreign Keys
#
#  page_template_id  (page_template_id => page_templates.id)
#  planner_id        (planner_id => planners.id)
#  user_id           (user_id => users.id)
#
class Page < ApplicationRecord
  belongs_to :user
  belongs_to :planner, class_name: "Planner"
  belongs_to :page_template, class_name: "PageTemplate"
  has_many :tldraw_snapshots, class_name: "TldrawSnapshot", dependent: :destroy
  has_many :planner_entries, class_name: "PlannerEntry", dependent: :destroy
  delegate :type, to: :page_template, prefix: true
  # Usage: @page.template_type
end
