feature 'List a space' do

  scenario 'User navigates to listing page' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    visit('/log_in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button 'Log in'
    click_button('List your own space')
    expect(page).to have_content('Form to add space')
  end

  scenario 'User lists the space' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    visit('/log_in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button 'Log in'
    click_button('List your own space')
    fill_in(:title, with: 'Yoda House')
    fill_in(:description, with: 'Lovely cottage in Cornwall')
    fill_in(:price_per_night, with: 60)
    fill_in(:date_from, with: '2019-06-01')
    fill_in(:date_to, with: '2019-06-20')
    click_button('List')

    expect(page).to have_text('Yoda House')
    
  end

end