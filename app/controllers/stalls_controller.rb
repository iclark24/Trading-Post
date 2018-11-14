class StallsController < ApplicationController
  before_action :set_stall, only: [:show, :update, :edit, :destroy]
    
  def index
    @stalls = Stall.all
  end

  def show
  end

  def new
    @stall = Stall.new
    render partial: "form"
  end

  def create
    @stall = Stall.new(stall_params)
    if @stall.save
      redirect_to stalls_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @stall.update(stall_params)
      redirect_to @stall
    else
      render :edit
    end
  end

  def destroy
    @stall.destroy
    redirect_to stalls_path
  end

  private
    def set_stall
      @stall = Stall.find(params[:id])
    end
    def stall_params
      params.require(:stall).permit(:name, :description)
    end
end
