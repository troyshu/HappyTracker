desc "This task is called by the Heroku scheduler add-on"

task :send_happiness_emails => :environment do
  UsersController.send_happiness_emails()
end
