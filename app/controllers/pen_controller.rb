class PenController < ApplicationController
  layout 'catalog'
  before_filter :check_authorization, :except => [ :logo,:stacy, :unstacy]
  
  LARGE_DIR="/images/pens/large"
  SMALL_DIR="/images/pens/small"
  LARGE_COLORS_DIR="/images/colors/large"
  SMALL_COLORS_DIR="/images/colors/small"
  
  
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
    @last = nil
    @cnt = 0
    
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
  
  
  # Action called by AJAX link to remote. (called in fade_replace)
  def fade_replace_aj
    item = nil

    @style=""
    if params[:color] == 'true'
      dir = LARGE_COLORS_DIR
      item = Color.find_by_id(params[:id])
      @pen_name = item.title
      @style = "style='margin-right: 45px; margin-left: 45px;'"
    else
      dir = LARGE_DIR
      item = Pen.find_by_id(params[:id])   
      @pen_name = Style.find_by_id(item.style_id).title # displayed under the image
    end
    image = item.image_filename
    @cnt = session[:fade_replace_cnt] || 0 #used for odd/even count.
    @image_name = dir + "/" + image + "_lrg.jpg" # used to lookup the image's filename
    
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
