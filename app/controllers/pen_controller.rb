class PenController < ApplicationController
  layout 'catalog'
  
  LARGE_DIR="/images/pens/small"
  SMALL_DIR="/images/pens/small"
  
  def index
  end
  
  def collector
    @margin_top="-213px"
    @collection = Collection.find_by_title("collector")
  end
  
  def corporate
    @minus="-169px"
    @margin_top="-183px"
    @collection = Collection.find_by_title("corporate")
    
  end
  
  def elite
    @margin_top="-149px"
    @collection = Collection.find_by_title("elite")   
  end
  
  def color
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
  
end
