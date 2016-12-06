class RentalsController < ResourceController

  before_action :authenticate_user!
  
  def new
  	@movie = Movie.find(params[:movie_id])
  	@rental = @movie.rentals.build
    @customers = @user.customers
    @rentals = @movie.rentals.all
  end

  def create
  	@movie = Movie.find(params[:movie_id])
  	@rental = @movie.rentals.build(rental_params)
  	if @rental.save
  		redirect_to new_movie_rental_path
  	end 
  end

  def edit
    @movie = Movie.find(params[:movie_id]) 
    @rental = @movie.rentals.find(params[:id])
  end 

  def update
    @movie = Movie.find(params[:movie_id]) 
    @rental = Rental.find(params[:id])
    if @rental.update(rental_params)
      redirect_to new_movie_rental_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy 
    @movie = Movie.find(params[:movie_id]) 
    @rental = Rental.find(params[:id])
    @rental.destroy
    if @rental.destroy 
     redirect_to new_movie_rental_path(@movie)
    end
  end
 

  private 

  	def rental_params
  		params.require(:rental).permit(:borrowed_on, :returned_on, :movie_id, :customer_id)
  	end
end
