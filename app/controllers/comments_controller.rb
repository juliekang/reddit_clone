class CommentsController < ApplicationController
  def index
    #USELESS.
  end

  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      redirect_to link_url(@comment.link)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to link_url(@comment.link)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @link = @comment.link
    @comment.destroy
    redirect_to link_url(@link)
  end
end
