# features/support/devise.rb

module DeviseHelpers
  def create_user(email, password)
    User.create!(email: email, password: password)
  end

  def sign_in(email, password)
    visit new_user_session_path
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end
end

World(DeviseHelpers)
