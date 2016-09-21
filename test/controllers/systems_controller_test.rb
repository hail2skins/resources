require 'test_helper'

class SystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @system = systems(:one)
  end

  test "should get index" do
    get systems_url
    assert_response :success
  end

  test "should get new" do
    get new_system_url
    assert_response :success
  end

  test "should create system" do
    assert_difference('System.count') do
      post systems_url, params: { system: { availability_set: @system.availability_set, ip: @system.ip, name: @system.name, nsg: @system.nsg, nsg_resource_group: @system.nsg_resource_group, operating_system: @system.operating_system, operating_system_version: @system.operating_system_version, resource_group: @system.resource_group, storage: @system.storage, subnet: @system.subnet, vm_size: @system.vm_size } }
    end

    assert_redirected_to system_url(System.last)
  end

  test "should show system" do
    get system_url(@system)
    assert_response :success
  end

  test "should get edit" do
    get edit_system_url(@system)
    assert_response :success
  end

  test "should update system" do
    patch system_url(@system), params: { system: { availability_set: @system.availability_set, ip: @system.ip, name: @system.name, nsg: @system.nsg, nsg_resource_group: @system.nsg_resource_group, operating_system: @system.operating_system, operating_system_version: @system.operating_system_version, resource_group: @system.resource_group, storage: @system.storage, subnet: @system.subnet, vm_size: @system.vm_size } }
    assert_redirected_to system_url(@system)
  end

  test "should destroy system" do
    assert_difference('System.count', -1) do
      delete system_url(@system)
    end

    assert_redirected_to systems_url
  end
end
