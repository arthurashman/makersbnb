feature 'Login Button on Homepage' do

  scenario 'user goes to homepage and sees login button of they have an account already' do
    visit '/'
    expect(page).to have_content 'Log in'
  end

  scenario 'user clicks login button on homepage and they are redirected to log in' do
    visit '/'
    click_button 'Log in'
    expect(page).to have_current_path("/log_in")
  end

end