class AddMovieIdToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :movie_id, :integer
  end
end
