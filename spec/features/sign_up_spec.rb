feature 'Sign up to Makersbnb' do
  scenario 'user fills a form with their details' do
    visit '/'
    fill_in('fullname', with: 'Riya Dattani')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')

    click_button 'Sign up'
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Book a Space'
  end

  scenario 'if user exists, redirect to log in page' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    visit '/'
    fill_in('fullname', with: 'Riya Dattani')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')

    click_button 'Sign up'
    expect(page).to have_content 'You have an account, please log in.'
  end
end
