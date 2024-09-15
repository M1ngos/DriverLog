# app/models/shift.rb
class Shift < ApplicationRecord
  belongs_to :driver

  validates :clock_in, presence: true
  validates :clock_out, presence: true, if: -> { clock_in.present? }
end
