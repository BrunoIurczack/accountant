class Payment < ApplicationRecord
  belongs_to :customer
  delegate :name, :value, to: :customer
end
