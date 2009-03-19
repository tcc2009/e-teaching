require 'yaml'
require 'screen'

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  before_filter :configure_network
  before_filter :configure_screen

  def configure_network
    @multicast = YAML::load(File.open("#{RAILS_ROOT}/config/network.yml","r"))
  end
  def configure_screen
    @teachers_screen = Screen.new
    DRb.start_service('druby://192.168.1.72:4000',@teachers_screen)
  end

end
