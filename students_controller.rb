require("sinatra")
require("sinatra/contrib/all")
require_relative("models/student")
require_relative("models/house")
also_reload("./models/*")

# index
get "/students" do # index
  @students = Student.all()
  puts @students
  erb(:index)
end

# show

# new

# create

# edit

# update

# destroy
