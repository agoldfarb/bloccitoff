class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build( item_params )

    if @item.save
      redirect_to user_path(@user), notice: 'Your item has been saved'
    else
      flash[:error] = 'There was an error saving your item'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
