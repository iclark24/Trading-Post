class CommentsController < ApplicationController
  before_action :set_item

  def new
    @comment = @item.comments.new
  end
  
  def create
    @comment = @item.comments.new(comment_params)
    if @comment.save
      redirect_to stall_item_path(@item.stall_id, @item)
    else
      render :new
    end
  end

  private

    def set_item
      @item = Item.find(params[:item_id])
    end



    def comment_params
      params.require(:comment).permit(:author, :body)
    end

end
