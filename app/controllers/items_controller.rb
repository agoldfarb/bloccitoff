class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build( item_params )

    if @item.save
      redirect_to user_path(@user), notice: 'Your item has been saved.'
    else
      flash[:error] = 'There was an error saving your item'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Please try again."
    end
    
    respond_to do |format|
      format.html { redirect_to user_items_path(@user) }
      format.js   
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
