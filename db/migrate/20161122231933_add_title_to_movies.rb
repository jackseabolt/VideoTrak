class AddTitleToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :title, :string
    add_column :movies, :year, :string
  end
end
