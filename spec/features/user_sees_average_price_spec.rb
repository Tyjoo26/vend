require 'rails_helper'


feature 'When a user visits a vending machine show page' do
  scenario 'and they also average price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1= dons.snacks.create(name: "KitKat", price: 1.50)
    snack_2= dons.snacks.create(name: "Snickers", price: 2.50)
    snack_3= dons.snacks.create(name: "HotPockets", price: 3.50)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("KitKat")
    expect(page).to have_content("Snickers")
    expect(page).to have_content("HotPockets")
    expect(page).to have_content(1.50)
    expect(page).to have_content(2.50)
    expect(page).to have_content(3.50)

    expect(page).to have_content("Average Price: $2.50")

end
end
