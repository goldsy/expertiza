describe 'Student logs in', :type => :feature do
  # Student test users used in following scenarios.
  student1 = FactoryGirl.create :student
  student2 = FactoryGirl.create :alt_student


  scenario 'with valid username and password' do
    visit root_path

    # Log in as student1
    fill_in 'login_name', with: student1.name
    fill_in 'login_password', with: student1.password
    click_on 'Login'

    expect(page).to have_content(student1.name)

    # Leave system in state that doesn't mess up other tests.
    click_on 'Logout'
  end


  scenario 'Student logs in with invalid user name' do
    visit root_path

    # Attempt to log in as an invalid student.
    fill_in 'login_name', with: 'bogus'
    fill_in 'login_password', with: student1.password
    click_on 'Login'

    expect(page).to have_content('Incorrect Name/Password')
  end


  scenario 'Student logs in with valid user name and invalid password' do
    visit root_path

    fill_in 'login_name', with: student1.name
    fill_in 'login_password', with: 'bogus'
    click_on 'Login'

    expect(page).to have_content('Incorrect Name/Password')
  end


  scenario "Student logs in with valid user name and another user's password" do
    visit root_path

    fill_in 'login_name', with: student1.name
    fill_in 'login_password', with: student2.password
    click_on 'Login'

    expect(page).to have_content('Incorrect Name/Password')
  end


  scenario 'Student logs in with a blank password' do
    visit root_path

    fill_in 'login_name', with: student1.name
    fill_in 'login_password', with: ''
    click_on 'Login'

    expect(page).to have_content('Incorrect Name/Password')
  end
end


# Stuff pulled in from design document that needs to be reworked.

#    scenario ‘with valid username and password’ do
#        log_in_with ‘student1’, ‘password’
#
#        expect(page).to have_content(‘User: ’ + username)
#    end
#
#    scenario ‘with invalid password’ do
#        log_in_with ‘student1’, ‘badpassword’
#
#        expect(page).to have_content(‘Incorrect Name/Password’)
#    end
#
#    scenario ‘with invalid username’ do
#        log_in_with ‘bogus’, ‘password’
#
#        expect(page).to have_content(‘Incorrect Name/Password’)
#    end
#
#    scenario ‘with blank password’ do
#        log_in_with ‘student1’, ‘’
#
#        expect(page).to have_content(‘Incorrect Name/Password’)
#    end
#
#def log_in_with(username, password)
#  visit root_path
#  fill_in ‘login_name’, with: username
#  fill_in ‘login_password’, with: password
#  click_button ‘Login’
#end
#end
#
#feature ‘Student retrieves password’ do
#    scenario ‘with valid email’ do
#        request_password_for(email)
#
#        expect(page).to have_content(‘No account is associated with the address, "’ + username + ‘". Please try again.’)
#    end
#
#    scenario ‘with valid username’ do
#        request_password_for(username)
#
#        expect(page).to have_content(‘A new password has been sent to your email address.’)
#    end
#
#    def request_password_for(email)
#        visit forgotten_path
#        fill_in ‘user_email’, with: email
#        click_button ‘Request password’
#    end
#end
#