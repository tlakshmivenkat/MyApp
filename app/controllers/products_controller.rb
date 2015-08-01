class ProductsController < ApplicationController
  def new
  	@product=Product.new
        @product.build_image
  end
   def create
  	params.permit!
    #byebug
   @product=Product.new(params[:product])
   if @product.save
      redirect_to :action=>"index"
    else
      render "new"    
   end
  end


  def edit
  	@product=Product.find(params[:id])
  end
  def update
  	params.permit!
   @product=Product.find(params[:id])
   if @product.update_attributes(params[:product])
      redirect_to :action=>"index"
    else
      render "new"    
   end
  end
#it used to display the all records.
  def index
  	@product=Product.all
  end
#it used to display the individual records. 
  def show
  
  end
  def destroy
  	@product=Product.find(params[:id])
  	@product.delete
  	redirect_to :action=>"index"
  end
  private
  def product_params
    params.require(:product).permit(:photo)
  end
end
