class Like < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :project, uniqueness: { scope: :user, message: 'has already been liked' }
end
