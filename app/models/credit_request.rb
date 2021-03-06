class CreditRequest < ApplicationRecord
  has_many :payments
  belongs_to :company

  validates :amount, presence: true
  validates :periods, presence: true
  validates :status, presence: true
  validates_with ::Validators::NonZeroValidator

  enum status: [ :awaiting_approval, :approved, :denied ]
end
