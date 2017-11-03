require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the name of all snacks in vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = Snack.create(name: "KitKat", price: 1.95, machine: dons)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("KitKat")

  end

  scenario 'and they also the price associated with each snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1= dons.snacks.create(name: "KitKat", price: 1.00)
    snack_2= dons.snacks.create(name: "Snickers", price: 2.00)
    snack_3= dons.snacks.create(name: "HotPockets", price: 3.00)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("KitKat")
    expect(page).to have_content("Snickers")
    expect(page).to have_content("HotPockets")
    expect(page).to have_content(1.00)
    expect(page).to have_content(2.00)
    expect(page).to have_content(3.00)

  end

end
