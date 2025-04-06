# == Schema Information
#
# Table name: page_templates
#
#  id         :uuid             not null, primary key
#  content    :json
#  is_default :boolean          default(FALSE), not null
#  name       :string
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  planner_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_page_templates_on_planner_id  (planner_id)
#  index_page_templates_on_user_id     (user_id)
#
# Foreign Keys
#
#  planner_id  (planner_id => planners.id)
#  user_id     (user_id => users.id)
#
class PageTemplate < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :planner, optional: true
  has_many :pages, dependent: :nullify

  validates :type, inclusion: { in: %w[daily weekly monthly custom] }
end
