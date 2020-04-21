require 'rails_helper'

RSpec.describe 'Merchant Discounts Index Page' do
  describe 'As an employee of a merchant' do
    describe "when I vist a merchant's discounts page by clicking on their discounts link in their dashboard" do
      before :each do
        @merchant = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
        @m_user = @merchant.users.create!(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan@example.com', password: 'securepassword')

        @ogre = @merchant.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
        @nessie = @merchant.items.create!(name: 'Nessie', description: "I'm a Loch Monster!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
        @giant = @merchant.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: false, inventory: 3 )

        @order_1 = @m_user.orders.create!(status: "pending")
        @order_2 = @m_user.orders.create!(status: "pending")

        @order_item_1 = @order_1.order_items.create!(item: @ogre, price: @ogre.price, quantity: 2, fulfilled: false)
        @order_item_2 = @order_2.order_items.create!(item: @giant, price: @giant.price, quantity: 4, fulfilled: false)

        @discount_item_1 = @merchant.discounts.create!(discount_percentage: 5, quantity_required: 20)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@m_user)
      end

      it "I see a list of all the merchant's discounts" do
        visit '/merchant'
        click_link("Manage Discounts")

        expect(page).to have_content("#{@discount_item_1.discount_percentage}% - for #{@discount_item_1.quantity_required} or more bulk items")
      end
    end
  end
end
