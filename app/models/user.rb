class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :likes

  def likes?(project)
    self.likes.where(project: project).count > 0
  end

  def owns?(project)
    self.projects.where(id: project.id).count > 0
  end

  def like!(project)
    Like.where(user: self, project: project).first_or_create
  end
end
