class CustomersController < ResourceController
  before_action :authenticate_user!
  
  def new
    @customer = Customer.new 
    @customers = @user.customers.search(params[:search]).order(lname: :asc).paginate(:page => params[:page], :per_page => 15) 
  end

  def show 
    @customer = Customer.find(params[:id])
  end 

  def create
    @customer = Customer.new(customer_params)
    @customer.user = @user 
    if @customer.save 
      redirect_to new_customer_path
    end 
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save 
      redirect_to new_customer_path
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    if @customer.destroy
      redirect_to new_customer_path 
    end 
  end

  private 

  def customer_params
    params.require(:customer).permit(:fname, :lname, :telephone, :email)
  end
end
