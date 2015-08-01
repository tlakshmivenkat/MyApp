class UsersController < ApplicationController
skip_before_action :require_login, :only=> [:new, :create, :login_form, :validate_login_form]
def new
  	@user=User.new
        @user.build_image
  end
   def create
  	params.permit!
    #byebug
   @user=User.new(params[:user])
   if @user.save
      redirect_to :action=>"index"
    else
      render "new"    
   end
  end


  def edit
  	@user=User.find(params[:id])
  end
  def update
  	params.permit!
   @user=User.find(params[:id])
   if @user.update_attributes(params[:user])
      redirect_to :action=>"index"
    else
      render "new"    
   end
  end
#it used to display the all records.
  def index
  	@user=User.all
  end
#it used to display the individual records. 
  def show
  
  end
  def destroy
  	@user=User.find(params[:id])
  	@user.delete
  	redirect_to :action=>"index"
  end
  def login_form
    @user=User.new
  end
  def validate_login_form
  @user=User.authenticate(params[:user])
  if !@user.blank?
      session[:user_id]=@user.id
      redirect_to :action=>"index"
    else
      render "login_form", params => @user
  end 
  end
  def destroy_session
    session[:user_id] = nil
  end
  private
  def user_params
    params.require(:user).permit(:photo)
  end
end
