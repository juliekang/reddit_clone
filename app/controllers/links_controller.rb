class LinksController < ApplicationController
  def index
    @links = Link.all
    render :index
  end

  def new
    render :new
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to link_url(@link)
    else
      flash.now[:errors] = ["Cannot find this link."]
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_url
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments_by_parent_id

    render :show
  end

  def print_comment(key)
    @comment_hash[key].each do |comment|
      spaces = @indents.times { print "    "}
      puts "#{spaces}#{comment.user.username} says: #{comment.body}"
      @indents += 1
      print_comment(comment.id)
      @indents = 0
    end
  end

end
