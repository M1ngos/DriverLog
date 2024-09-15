class Driver < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  belongs_to :client, optional: true  # Optional if not all drivers are assigned to clients
  validates :username, presence: true, uniqueness: true

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if email = conditions.delete(:email)
  #     where(conditions.to_h).where([ "email = :value OR username = :value", { value: email } ]).first
  #   else
  #     where(conditions.to_h).first
  #   end
  # end
  # Ensure username is used for authentication
  def self.find_for_database_authentication(conditions)
    conditions[:username] ? where(username: conditions[:username]).first : nil
  end
end
