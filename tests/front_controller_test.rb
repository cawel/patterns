require File.expand_path('test_helper', File.dirname(__FILE__))
require "front_controller"

class FrontControllerTest < Test::Unit::TestCase
  def setup
    @front = FrontController.new
  end
  
  def test_routing
    assert_equal ["home", "index"], @front.route("/home/index")
    assert_equal ["home", "index"], @front.route("/")
    assert_equal ["hello", "index"], @front.route("/hello")
    assert_equal ["hello", "there"], @front.route("/hello/there")
  end
  
  def test_load_controller_class
    klass = @front.load_controller_class("home")
    assert_equal HomeController, klass
  end
end
