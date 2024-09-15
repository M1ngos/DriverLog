class Task < ApplicationRecord
  belongs_to :driver
  belongs_to :client, optional: true

  validates :title, :description, presence: true
end
