class Discount < ApplicationRecord
  validates_presence_of :discount_percentage, :quantity_required

  belongs_to :merchant
end
