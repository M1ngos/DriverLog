class Task < ApplicationRecord
  belongs_to :driver
  belongs_to :client, optional: true

  validates :title, :description, presence: true

   # Scope or method to mark a task as completed
   def mark_as_completed
    update(completed: true)
   end
end
