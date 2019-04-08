feature 'test' do
  scenario "test" do
    visit '/'
    expect(page).to have_content("Hello World")
  end
end
