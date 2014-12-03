describe 'student can review' , :type => :feature do
 it 'create a team' do
    student1 = FactoryGirl.create :student
    student2 = FactoryGirl.create :student
    student3 = FactoryGirl.create :student
    assignment = FactoryGirl.create :assignment
    #assignment.add_participant student1.name
    #assignment.add_participant student2.name
    #assignment.add_participant student3.name
   # user = FactoryGirl.create :user 
    sign_up_topic = FactoryGirl.create :sign_up_topic, assignment: assignment
    participant1 = FactoryGirl.create :assignment_participant , user: student1 , assignment: assignment , topic_id: sign_up_topic.id # , sign_up_topic: sign_up_topic
    participant2 = FactoryGirl.create :assignment_participant , user: student2 , assignment: assignment , topic_id: sign_up_topic.id
    participant3 = FactoryGirl.create :assignment_participant , user: student3 , assignment: assignment , topic_id: sign_up_topic.id
 
   # team1 = FactoryGirl.create :team , parent_id: assignment.id
   # team1.add_member(student1,assignment.id)
   # team1.add_member(student2,assignment.id) 
       
    participant1.submit_hyperlink 'https://github.com/expertiza/expertiza'
    participant2.submit_hyperlink 'https://github.com/expertiza/expertiza2'
    participant3.submit_hyperlink 'https://github.com/expertiza'
    log_in_as_user(student3)
    
     click_link assignment.name
     #expect(page).to have_content('test')
     expect(page).to have_content("Others' work")
     click_link "Others' work"
    page.choose('topic_id_'+sign_up_topic.id.to_s)     
  #expect(page).to have_content('test')
  #find(:css,"#i_dont_care[name='i_dont_care']").set(true)
  # click_on 'submitStudentReviewButton'
  click_on 'req'
   expect(page).to have_content('test')
  page.choose('submission_id_'+participant1.id.to_s)
  click_on 'ReviewSelectedSubmission'
  #expect(page).to have_content('topic_id_'+topic.id.to_s)
  #find(:xpath,".//input[@id='topic_id_" + topic.id.to_s + "']").click
  #click_on 'submitStudentReviewButton'
  #expect(page).to have_content('Begin')   
 end
end 
