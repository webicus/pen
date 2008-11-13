class AjaxController < ApplicationController
  layout 'regular'
  def index
end
  #used by ajax call.
  def replace
    @previous = :id
    logger.info "in replace"
    logger.info @action
    logger.info @id
    render :layout => false # no impact.
  end

  def simple_blind_ror
    
  end
  def blinder
  end

end
