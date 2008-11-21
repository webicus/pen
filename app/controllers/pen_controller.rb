class PenController < ApplicationController
  layout 'catalog'
  before_filter :check_authorization, :except => [ :logo,:stacy, :unstacy]
  
  LARGE_DIR="/images/pens/large"
  SMALL_DIR="/images/pens/small"
  
  
  def index
  end
  
  def collector
    @margin_top ="-187px"
    
    @collection = Collection.find_by_title("collector")
  end
  
  def corporate
    @margin_top ="-187px"
    @collection = Collection.find_by_title("corporate")
    
  end
  
  def elite
    @margin_top ="-187px"
    @collection = Collection.find_by_title("elite")   
  end
  
  def color
    @margin_top ="-187px"
    @colors = Color.find(:all, :order => :sequence)
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
    @pen = Pen.find_by_id(:id)
    @style = Style.find_by_id(@pen.id)
    @str = "Display image #{@style.title}"
    @image_name = LARGE_DIR + pen.image_filename
    @pen_name = style.title
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
  
  
  
  # Authorization routines. 
  #==============================================================================
  def logo
    render :layout => 'simple'
  end
  
  def stacy
    authorize
    redirect_to :controller => :pen
  end
  def unstacy
    logoff
    redirect_to :action => 'logo'
  end
  
  def check_authorization
    if !authorized?
      redirect_to(:action => 'logo') and return false
    end
  end
end
