class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end
  
  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end
  
  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end
  
  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end
  
  # POST /comments
  # POST /comments.xml
  def create
    
    @comment = Comment.new(params[:comment])
    if @comment.captcha.to_i != session[:captcha]
      flash[:notice] = "Please reenter the secret number " + @comment.captcha.to_s + session[:captcha].to_s
      respond_to do |format|
        format.html { redirect_to(:controller => :pen, :action => :contact_us) and return false}
      end
    else
      
      if @comment.save
        
        Notifier.deliver_inquiry(@comment)
        
        
        
        flash[:notice] = 'Thank you for your email.'
        respond_to do |format|
          format.html { redirect_to(:controller => :pen, :action => :contact_us) }          
        end
      end
    end
  end
  
  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
