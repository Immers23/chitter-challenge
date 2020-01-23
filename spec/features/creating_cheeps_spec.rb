feature 'Adding a new cheep' do
  scenario 'A user can add a cheep to Chitter App' do
    visit('/cheeps/new')
    fill_in('cheep', with: 'a complain about food i have eaten')
    click_button('Submit')

    expect(page).to have_content 'a complain about food i have eaten'
  end
end
