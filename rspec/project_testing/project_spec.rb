require_relative 'project' # include our Project class in our spec file
RSpec.describe Project do  
  before(:each) do 
    @project1 = Project.new('Project 1', 'description 1', "Owner 1") # create a new project and make sure we can set the name attribute
    @project2 = Project.new('Project 2', 'description 2', 'Owner 2', tasks=['Get engineers'])
  end
  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end
  it 'has a getter and setter for owner attribute' do
    @project1.owner = "Real Owner"
    expect(@project1.owner).to eq("Real Owner")
  end
  it 'has a method elevator_pitch to explain name and description' do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1")
    expect(@project2.elevator_pitch).to eq("Project 2, description 2")
  end
  it 'has a method get_tasks which returns a list of tasks' do
    expect(@project1.get_tasks).to eq([])
    expect(@project2.get_tasks).to eq(["Get engineers"])
  end
  it 'has a method add_task which adds a single task to the task attribute' do
    @project1.add_task("test task") 
    expect(@project1.get_tasks).to eq(["test task"])
  end
  # Does not Work
#   it 'has a method that prints out each element in the tasks list' do
#     expect{ @project2.print_tasks }.to output('Get engineers\n').to_stdout
#   end
end