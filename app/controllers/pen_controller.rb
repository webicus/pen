class PenController < ApplicationController
  layout 'catalog'
  #before_filter :check_authorization, :except => [ :friendly, :logo,:stacy, :unstacy]
  
  LARGE_DIR="/images/pens/large"
  SMALL_DIR="/images/pens/small"
  LARGE_COLORS_DIR="/images/colors/large"
  SMALL_COLORS_DIR="/images/colors/small"
  TITLE = "Penz by Design - "
  
  def index
    @meta_keywords = "penz by design;  handmade pens; unique pens; handcrafted writing instruments; custom made pens; engraved pens; penz; quill"
    @title = "Penz by Design - Handcrafted writing instruments for you"
  end
  
  def collector
    @meta_keywords = "custom made fountain pens; fountain pens; diamond pens; limited edition pens; personalized pens; highend pens"
    @margin_top ="-187px"
    @title = TITLE + "Collector Series"
    @collection = Collection.find_by_title("collector series")
    @engravings = Engraving.find(:all, :order => :sequence)
  end
  
  def corporate
    @meta_keywords = "corporate pens; executive pens; business pen; power pens; custom pens;"
    @title = TITLE + "Corporate Series"
    @margin_top ="-187px"
    @collection = Collection.find_by_title("corporate series")
    @engravings = Engraving.find(:all, :order => :sequence)
  end
  
  def elite
    @meta_keywords = "rollerball; pens; unique pen; signature pens; executive pens; personalized pens"
    @title = TITLE + "Elite Series"
    @last = nil
    @cnt = 0
    
    @margin_top ="-187px"
    @collection = Collection.find_by_title("elite series")  
    @engravings = Engraving.find(:all, :order => :sequence)
  end
  
  def color
    @meta_keywords = "unique pen colors; pen designs; pink and green;"
    @title = TITLE + "Colors"
    @margin_top ="-187px"
    @list_style = "width:100%;height: 300px; overflow-y: auto;" # removed float:left; 
    @colors = Color.find(:all, :order => :sequence)
  end
  def contact_us
    @meta_keywords = "Atlanta Pen Company; 4355 Cobb Parkway; penz by design pens"
    @title = TITLE + "Contact Us"
    if flash[:comment]
      @comment = flash[:comment]
    else
      @comment = Comment.new
    end
    @captcha = (rand()*10000).to_i
    session[:captcha] = @captcha #pass to create
  end
  
  
  
  def about_us
    @meta_keywords = "Corporate gift ideas; Atlanta pens; Penz by Design Inc; stacy robinson; gifts for executives; employee appreciation gifts"
    @title = TITLE + "About Us"
  end
  def our_products
    @meta_keywords = "corporate gifts; quality custom pens; gold nib pens; fine pens; exclusive warranty; quality standards"
    @title = TITLE + "Our Products"
  end
  def accessories
    @title = TITLE + "Engraving and Accessories"
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
    ext="jpg"
    if params[:color] == 'true'
      dir = LARGE_COLORS_DIR
      item = Color.find_by_id(params[:id])
      @pen_name = item.title
      # 
      size = 'width:357px;height:101px;padding: 58px 216px;'
    elsif params[:engraving] == 'true'
      dir = "/images/engravings/large"
      item = Engraving.find_by_id(params[:id])   
      @pen_name = nil
      size = 'width:793px;height:216px;'
    else
      
      dir = LARGE_DIR
      item = Pen.find_by_id(params[:id])   
      @pen_name = Style.find_by_id(item.style_id).title # displayed under the image
      size = 'width:793px;height:216px;'
    end
    image = item.image_filename
    @cnt = session[:fade_replace_cnt] || 0 #used for odd/even count.
    @image_name = dir + "/" + image + "_lrg." + ext # used to lookup the image's filename
    @style = "background-image: url(#{@image_name});background-position:center center;background-repeat:no-repeat;margins:auto; #{size}"
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
    #authorize
    redirect_to :controller => :pen
  end
  def friendly
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
