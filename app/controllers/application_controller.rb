class ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
  protected
  def record_not_found(expection)
    render json: { messages: [expection.message], errors: ['not found'] },
                   status: :not_found
  end

  def render_unprocessable_entity_response(exception)
    render json: { messages: ['error'], errors: exception.record.errors },
                  status: :unprocessable_entity
  end

end
