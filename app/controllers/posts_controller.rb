class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml

  respond_to :html, :xml, :json

  before_filter :load_categories, :except => [:show, :destroy]

  def index
    @posts = Post.all

    respond_with @posts

#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @posts }
#    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_with @post
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @post }
#    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    logger.debug 'teste'
    logger.warn 'teste warn'

#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @post }
#    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    flash[:notice] = 'Post was successfully created!' if @post.save
    respond_with @post, :location => posts_path

#    respond_to do |format|
#      if @post.save
#        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
#        format.xml  { render :xml => @post, :status => :created, :location => @post }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    flash[:notice] = 'Post was successfully saved!' \
      if @post.update_attributes(params[:post])

    respond_with @post, :location => posts_path

#    respond_to do |format|
#      if @post.update_attributes(params[:post])
#        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with @post

#    respond_to do |format|
#      format.html { redirect_to(posts_url) }
#      format.xml  { head :ok }
#    end
  end

  private

  def load_categories
    @categories = Category.order(:name).all
  end

end
