class MoviesController < ResourceController
  before_action :authenticate_user!
  

  def new
  	@movie = Movie.new
  	@movies = @user.movies.search(params[:search]).order(title: :asc).paginate(:page => params[:page], :per_page => 15) 
  end

  def create
  	@movie = Movie.new(movie_params)
    @movie.user = @user 
  	if @movie.save
      #@user.movies << @movie 
  		redirect_to new_movie_path 
  	end 
  end

  def edit
    @movie = Movie.find(params[:id])
  end 

  def update 
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    if @movie.save
      redirect_to root_path
    else 
      render edit_movie_path(@movie)
    end
  end 

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    if @movie.destroy 
      redirect_to root_path 
    end 
  end 

  private 

  def movie_params
  	params.require(:movie).permit(:title, :year)
  end

 
end
