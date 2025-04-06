# == Schema Information
#
# Table name: tldraw_snapshots
#
#  id            :uuid             not null, primary key
#  document_data :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  page_id       :uuid             not null
#  planner_id    :uuid             not null
#  user_id       :uuid             not null
#
# Indexes
#
#  index_tldraw_snapshots_on_page_id     (page_id)
#  index_tldraw_snapshots_on_planner_id  (planner_id)
#  index_tldraw_snapshots_on_user_id     (user_id)
#
# Foreign Keys
#
#  page_id     (page_id => pages.id)
#  planner_id  (planner_id => planners.id)
#  user_id     (user_id => users.id)
#
class TldrawSnapshot < ApplicationRecord
  belongs_to :page, class_name: "Page"
  belongs_to :user, class_name: "User"
  belongs_to :planner, class_name: "Planner"
end
