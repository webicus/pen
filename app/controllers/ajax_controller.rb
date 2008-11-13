class AjaxController < ApplicationController
  layout 'regular'
  
  # uses scriptaculous demos in JS, no RoR.
  def index
    @urls = ['index', 'fade_replace', 'simple_blind_ror', 'javascript']
  end
  
  #used by ajax call.
  def replace
    
    logger.info "in replace"
    logger.info params[:action]
    logger.info params[:id]
    
    @previous = params[:id]
    render :layout => false # no impact.
  end
  
  # main view using RoR not Javascript directly.
  def simple_blind_ror
    
  end
  
  #used to superimpose and replace images uses
  # RJS
  def fade_replace
    @last = nil
    @cnt = 0
  end
  
  
  # Ajax call for fade_replace
  def fade_replace_aj
    
    @cnt = session[:fade_replace_cnt] || 0
    
    @str = "Display image #{params[:id]}"
    @image_name = "pen#{params[:id]}"
    @pen_name = "pen#{params[:id]}"
    if @cnt.to_i % 2 == 0
      @from = "_even"
      @to = "_odd"
    else
      @from = "_odd"
      @to = "_even"
    end
    @cnt = @cnt + 1
    session[:fade_replace_cnt] = @cnt
    @last = params[:id]
  end
end
