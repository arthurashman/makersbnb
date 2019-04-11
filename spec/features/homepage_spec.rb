feature 'Login Button on Homepage' do

  scenario 'user goes to homepage and sees login button if they have an account already' do
    visit '/'
    expect(page).to have_content 'Log in'
  end

  scenario 'user clicks login button on homepage and they are redirected to log in' do
    visit '/'
    click_link 'Log in'
    expect(page).to have_current_path("/log_in")
  end

  scenario 'user clicks browse spaces button on homepage and they are redirected to view spaces' do 
    visit '/'
    click_link 'Browse spaces'
    expect(page).to have_current_path("/spaces")
  end

end