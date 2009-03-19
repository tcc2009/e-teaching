class NetworkController < ApplicationController
  def index
    if @multicast == nil || @multicast == false
      redirect_to :action => "edit"
    end
  end
  
  def edit
  end
  
  def create
    File.open("#{RAILS_ROOT}/config/network.yml","w") do |file|
      file << @multicast.to_yaml
    end
  end  
end
