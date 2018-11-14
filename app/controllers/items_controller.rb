class ItemsController < ApplicationController
  before_action :set_stall
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = @stall.items
  end

  def show
  end

  def new
    @item = @stall.items.new
    render partial: "form"
  end

  def create
    @item = @stall.items.new(item_params)
    if @item.save
      redirect_to [@stall, @item]
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to [@stall, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to stall_items_path
  end

  private

    def set_stall
      @stall = Stall.find(params[:stall_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :value)
    end

end
