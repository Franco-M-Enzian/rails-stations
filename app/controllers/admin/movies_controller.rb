class Admin::MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to admin_movies_path
        else
            render :new
        end
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        movie = Movie.find(params[:id])
        if movie.update(movie_params)
            redirect_to admin_movie_path(movie)
        else
            render :edit
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to admin_movies_path
        flash[:notice] = "削除に成功しました！"
        
    end

    private

    def movie_params
        params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
end
