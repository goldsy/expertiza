require 'rspec/rails'

module Features
  module SessionHelpers
    # Navigates to the root url and logs in as the specified user
    def log_in_as_user(user)
      visit root_path

      fill_in 'login_name', with: user.name
      fill_in 'login_password', with: user.password
      click_on 'Login'
    end

    # Logs the current user out
    def log_out
      visit root_path

      click_on 'Logout'
    end

  end
end
