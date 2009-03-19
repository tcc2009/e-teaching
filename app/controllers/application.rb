require 'yaml'
require 'socket'

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
	attr_accessor :teachers_screen
  
  before_filter :configure_network


  def configure_network
    @multicast = YAML::load(File.open("#{RAILS_ROOT}/config/network.yml","r"))
    @@multicast_addr = "225.4.5.6" 
    @@port= 5000
    @socket = UDPSocket.open 
    @socket.setsockopt(Socket::IPPROTO_IP, Socket::IP_TTL, [1].pack('i')) 
  end

end
