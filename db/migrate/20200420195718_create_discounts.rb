class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.integer :discount_percentage
      t.integer :quantity_required

      t.timestamps
    end
  end
end
