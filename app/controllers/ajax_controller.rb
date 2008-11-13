class AjaxController < ApplicationController
  layout 'regular'
  
  # uses scriptaculous demos in JS, no RoR.
  def index
    @urls = ['simple_blind_ror', 'index']
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
  
end
