class ThumbController < ApplicationController
  def index
    if $thumb_view == true
      @state = "Visão em Miniaturas"
    else
      @state = "Visão em Lista"
    end
  end
  
  def thumbnails
    @socket.send('thumb', 0, @@multicast_addr, @@port) 
    @socket.close
    $thumb_view = true
    redirect_to :action => "index" 
  end
  
  def list
    @socket.send('list', 0, @@multicast_addr, @@port) 
    @socket.close
    $thumb_view = false
    redirect_to :action => "index" 
  end
end
