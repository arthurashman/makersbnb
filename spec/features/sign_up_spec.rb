feature 'Sign up to Makersbnb' do
  scenario 'user fills a form with their details' do
    visit '/'
    fill_in('fullname', with: 'Riya Dattani')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')

    click_button 'Submit'
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Book a Space'
  end
end
