require("sinatra")
require("sinatra/contrib/all")
require_relative("models/student")
require_relative("models/house")
also_reload("./models/*")

# index
get "/students" do # index
  @students = Student.all()
  erb(:index)
end

# new
get "/students/new" do
  @houses = House.all()
  erb( :new )
end

# show
get "/students/:id" do # show
  @student = Student.find(params[:id])
  erb(:show)
end

# create
post "/students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# edit
get "/students/:id/edit" do
  id = params[:id].to_i
  @student = Student.find(id)
  erb(:edit)
end

# update
post "/students/:id" do
  Student.new(params).update
  redirect to '/students'
end

# destroy
post '/students/:id/delete' do # delete
    order = Student.find( params[:id] )
    order.delete()
    redirect to '/students'
end