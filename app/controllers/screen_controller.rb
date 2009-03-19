class ScreenController < ApplicationController
  def index
    if @teachers_screen == true
      @state = "Tela Compartilhada"
    else
      @state = "Tela não Compartilhada"
    end  
  end
  
  def share
    @teachers_screen.share = true
    redirect_to :action => "index"
  end
  
  def dont_share
    @teachers_screen.share = false
    redirect_to :action => "index"
  end
  
end
