# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Merchant.destroy_all
Item.destroy_all
Discount.destroy_all

merchant_1 = Merchant.create!(name: 'Megans Marmalades', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218)
merchant_2 = Merchant.create!(name: 'Brians Bagels', address: '125 Main St', city: 'Denver', state: 'CO', zip: 80218)

m_user = merchant_1.users.create!(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'megan@example.com', password: 'securepassword')
b_user = merchant_2.users.create!(name: 'Brian', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'brian@example.com', password: 'otherpassword')

ogre = merchant_1.items.create!(name: 'Ogre', description: "I'm an Ogre!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
nessie = merchant_1.items.create!(name: 'Nessie', description: "I'm a Loch Monster!", price: 20.25, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 5 )
giant = merchant_1.items.create!(name: 'Giant', description: "I'm a Giant!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: false, inventory: 3 )
hippo = merchant_2.items.create!(name: 'Hippo', description: "I'm a Hippo!", price: 50, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaLM_vbg2Rh-mZ-B4t-RSU9AmSfEEq_SN9xPP_qrA2I6Ftq_D9Qw', active: true, inventory: 1 )

order_1 = m_user.orders.create!(status: "pending")
order_2 = m_user.orders.create!(status: "pending")
order_3 = m_user.orders.create!(status: "pending")
order_4 = b_user.orders.create!(status: "pending")

order_item_1 = order_1.order_items.create!(item: ogre, price: ogre.price, quantity: 2, fulfilled: false)
order_item_2 = order_2.order_items.create!(item: giant, price: giant.price, quantity: 2, fulfilled: false)
order_item_3 = order_3.order_items.create!(item: nessie, price: nessie.price, quantity: 2, fulfilled: false)
order_item_3 = order_4.order_items.create!(item: hippo, price: hippo.price, quantity: 2, fulfilled: false)

merchant_1.discounts.create!(discount_percentage: 5, quantity_required: 20)
merchant_1.discounts.create!(discount_percentage: 10, quantity_required: 30)
merchant_1.discounts.create!(discount_percentage: 15, quantity_required: 100)
merchant_2.discounts.create!(discount_percentage: 5, quantity_required: 20)

admin = User.create!(name: 'Megan', address: '123 Main St', city: 'Denver', state: 'CO', zip: 80218, email: 'admin@example.com', password: 'securepassword', role: :admin)
