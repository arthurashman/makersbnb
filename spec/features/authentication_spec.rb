feature 'user log in' do
  scenario 'user can log in if already a user' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    visit('/log_in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    expect(page).to have_current_path("/spaces")
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')

    visit '/log_in'
    fill_in('email', with: 'nottherightemail@me.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')

    visit '/log_in'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')

    expect(page).not_to have_content 'Welcome Riya Dattani'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')

    visit '/log_in'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')
    click_button('Log out')

    expect(page).to have_current_path("/")
  end
end
