require 'rails_helper'


describe 'a user can visit snack page' do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
    @turing  = @owner.machines.create(location: "Turing Basement")
    @kitkat_1= @dons.snacks.create(name: "KitKat", price: 1.50)
    @kitkat_2= @turing.snacks.create(name: "KitKat", price: 1.25)

    visit snack_path(@snack_1)
  end
  scenario 'user sees name of snack' do
    expect(page).to have_content("KitKat")
  end
  scenario 'price for that snack' do
    expect(page).to have_content(1.50)
  end

  scenario 'list of locations with vending machines that carry that snack' do
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Donnys's Mixed Drinks")
  end

  scenario 'sees average price for snacks in vending machines' do
    expect(page).to have_content("Average Price: $1.38")
  end

  scenario 'sees count of different kinds of items in machine' do
    expect(page).to have_content("Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)")
    expect(page).to have_content("Turing Basement (2 kinds of snacks, average price of $3.00)")
  end
end
