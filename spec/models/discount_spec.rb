require 'rails_helper'

describe Discount do
  describe "validations" do
    it {should validate_presence_of :discount_percentage}
    it {should validate_presence_of :quantity_required}
  end

  describe "relationships" do
    it {should belong_to :merchant}
  end
end
