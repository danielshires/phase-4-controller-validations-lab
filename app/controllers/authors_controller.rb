class AuthorsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :response_not_found

  def show
    author = Author.find(params[:id])
    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def render_unprocessable_entity_response(invalid)
    puts invalid.record.errors.full_messages
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

  def response_not_found
    render json: {error: "Author not found"}, status: :not_found
  end
  
end
