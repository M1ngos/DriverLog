class Driver < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  belongs_to :client, optional: true
  validates :username, presence: true, uniqueness: true

  # Ensure username is used for authentication
  def self.find_for_database_authentication(conditions)
    conditions[:username] ? where(username: conditions[:username]).first : nil
  end

  # Methods for clocking in and out
  def clock_in
    ensure_shift_exists
    current_shift.update!(clock_in: Time.current) if current_shift
  end

  def clock_out
    current_shift.update!(clock_out: Time.current) if current_shift
  end

  # Ensure a shift exists before clocking in
  def ensure_shift_exists
    Shift.create!(driver: self) if current_shift.nil?
  end

  def current_shift
    Shift.where(driver: self, clock_out: nil).first
  end

  # Mark task as complete
  def complete_task(task)
    task.update!(completed: true)
  end
end
