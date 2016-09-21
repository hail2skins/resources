require 'test_helper'

class CreatingSystemsTest < ActionDispatch::IntegrationTest
  setup { @system = System.create!(name: "Compare_Test", resource_group: "Compare Group") }
  
  test 'creates systems when no other system exists with same name' do
    post '/api/systems', 
      params: { name:            'Test_System',
                resource_group:  'Test Group' 
              }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s }
      
      assert_equal 201, response.status
      assert_equal Mime[:json], response.content_type
      
      system = json(response.body)
      assert_equal "Test_System", system[:name]
      assert_equal "Test Group", system[:resource_group]
      assert_equal system_url(system[:id]), response.location
   end
   
   test 'responds with existing system when a duplicate named system created' do
    post '/api/systems', 
      params: { name:            'Compare_Test',
                resource_group:  'Compare Group' 
              }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s }   
      
      assert_equal 200, response.status
      assert_equal Mime[:json], response.content_type
      
      system = json(response.body)
      assert_equal @system.name, system[:name]
      assert_equal @system.resource_group, system[:resource_group]
      assert_equal system_url(@system[:id]), response.location
   end
   
   test 'updates existing system when params change' do
    post '/api/systems', 
      params: { name:            'Compare_Test',
                resource_group:  'Different Group' 
              }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s } 
      
      assert_equal 200, response.status
      assert_equal Mime[:json], response.content_type
      
      system = json(response.body)
      assert_equal @system.name, system[:name]
      assert_equal "Different Group", system[:resource_group]
      
      @new_system = System.find(@system.id)
      assert_equal @new_system.resource_group, "Different Group"
   end
     
end
