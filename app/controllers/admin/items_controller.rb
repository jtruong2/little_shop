class Admin::ItemsController < Admin::BaseController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "#{@item.title} Added!"
      redirect_to admin_items_path
    else
      flash[:error] = "Error, #{@item.errors.keys}, #{@item.errors.values}"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
   if  @item.update(item_params)
   flash[:success] = "#{@item.title} Updated!"
   redirect_to admin_items_path
   else
     flash[:error] = "Error"
     render :new
   end
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :image, :price, :category_id)
  end
end
