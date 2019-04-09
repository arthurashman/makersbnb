feature 'List a space' do

  scenario 'User navigates to listing page' do
    visit('/spaces')
    click_button('List a Space')
    expect(page).to have_content('Form to add space')
  end

  scenario 'User lists the page' do
    visit('/spaces')
    click_button('List a Space')
    fill_in(:title, with: 'Yoda House')
    fill_in(:description, with: 'Lovely cottage in Cornwall')
    fill_in(:price_per_night, with: 60)
    fill_in(:date_from, with: '2019-06-01')
    fill_in(:date_to, with: '2019-06-20')
    click_button('List')

    expect(page).to have_content('Yoda House')
    
  end

end