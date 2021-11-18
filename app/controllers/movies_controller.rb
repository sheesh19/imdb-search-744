class MoviesController < ApplicationController

  def index
    if params[:query]
      # @movies = Movie.where(title: params[:query])
      # @movies = Movie.where("title ILIKE ? OR synopsis ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")

      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.synopsis @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      # PG_SEARCH

      # @movies = Movie.global_search(params[:query])

      @movies = PgSearch.multisearch(params[:query])

    else
      @movies = Movie.all
    end
  end
end
