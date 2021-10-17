class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path # 今はルートパスに仮設定していますが、今後の実装で遷移先を変えます
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  # #def move_to_index
  #   #unless user_signed_in?
  #     #redirect_to action: :index
  #   end
  # end
end
