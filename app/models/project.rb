class Project < ApplicationRecord
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
  has_many :likes

  belongs_to :user
  dragonfly_accessor :picture

  before_save :generate_name_if_not_set

  def creator
    user.try(:nickname) or "Anonymous"
  end

  def remix
    Project.new(
        source_code: self.source_code,
        picture: self.picture,
        name: "#{Faker::Color.color_name} #{Faker::Hipster.word} (copy of #{self.name})"
    )
  end

  private
  def generate_name_if_not_set
    self.name = Faker::Book.title if self.name.blank?
  end

end
