class Project < ApplicationRecord
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations

  belongs_to :user
  dragonfly_accessor :picture
end
