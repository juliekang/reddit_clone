class SubsController < ApplicationController
  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    5.times { @sub.links.build }
    render :new
  end

  def create
    @sub = Sub.new(params[:sub])
    # @sub.links.new(params[:sub][:links].values)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(params[:sub])
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end
end
