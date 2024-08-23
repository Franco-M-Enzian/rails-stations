class MoviesController < ApplicationController
    def index
        if params[:keyword].present?
            @movies = Movie.where("name LIKE ?", "%#{params[:keyword]}%").or(Movie.where('description LIKE ?', "%#{params[:keyword]}%"))
            else
                @movies = Movie.all
            end
            if params[:is_showing].present? && params[:is_showing] != "all"
                @movies = @movies.where(is_showing: ActiveModel::Type::Boolean.new.cast(params[:is_showing]))
        end
    end
end
# ファイル名ミスでRoutingError uninitialized constant
# MoviesController とエラーがでた。nが抜けていた。