class ScreenController < ApplicationController

  def index
    if $teachers_screen == true
      @state = "Tela Compartilhada"
    else
      @state = "Tela não Compartilhada"
    end  
  end
  
  def share
    @socket.send('yes', 0, @@multicast_addr, @@port) 
    @socket.close
    $teachers_screen = true
    redirect_to :action => "index" 
  end
  
  def dont_share
    @socket.send('no', 0, @@multicast_addr, @@port) 
    @socket.close
    $teachers_screen = false
    redirect_to :action => "index"
  end
  
end
