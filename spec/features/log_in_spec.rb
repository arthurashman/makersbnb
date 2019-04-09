feature 'user log in' do
  scenario 'user can log in if already a user' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    visit('/log_in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    expect(page).to have_current_path("/spaces")
  end
end
