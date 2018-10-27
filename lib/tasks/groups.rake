namespace :groups do    
  desc 'Task description'
  task :task_name => :environment do
    s=User.new
    s.email="sample34@gmail.com"
    s.username="sample34"
    s.password="password"
    s.password_confirmation="password"
    s.save

    u=User.new
    u.email="komemoto1998@gmail.com"
    u.username="masaki8"
    u.password="password"
    u.password_confirmation="password"
    u.save
  end
end
