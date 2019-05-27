class ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render json: { messages: ['you dont have the permission'], errors: ['auth'] },
                  status: :not_found
  end
end
