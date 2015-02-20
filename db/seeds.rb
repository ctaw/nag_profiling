User.delete_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
User.create(:email=> "admin@profiling.com", :password=>"password")
