class JunksController < ApplicationController
  # GET /junks
  # GET /junks.xml
  def index
    @junks = Junk.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @junks }
    end
  end

  # GET /junks/1
  # GET /junks/1.xml
  def show
    @junk = Junk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @junk }
    end
  end

  # GET /junks/new
  # GET /junks/new.xml
  def new
    @junk = Junk.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @junk }
    end
  end

  # GET /junks/1/edit
  def edit
    @junk = Junk.find(params[:id])
  end

  # POST /junks
  # POST /junks.xml
  def create
    @junk = Junk.new(params[:junk])

    respond_to do |format|
      if @junk.save
        flash[:notice] = 'Junk was successfully created.'
        format.html { redirect_to(@junk) }
        format.xml  { render :xml => @junk, :status => :created, :location => @junk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @junk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /junks/1
  # PUT /junks/1.xml
  def update
    @junk = Junk.find(params[:id])

    respond_to do |format|
      if @junk.update_attributes(params[:junk])
        flash[:notice] = 'Junk was successfully updated.'
        format.html { redirect_to(@junk) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @junk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /junks/1
  # DELETE /junks/1.xml
  def destroy
    @junk = Junk.find(params[:id])
    @junk.destroy

    respond_to do |format|
      format.html { redirect_to(junks_url) }
      format.xml  { head :ok }
    end
  end
end
