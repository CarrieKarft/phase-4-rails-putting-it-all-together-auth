class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid

private

  def find_user
    User.find(session[:user_id])
  end

  def handle_invalid(exception)
    return render json: {errors: exception.record.errors.full_messages}, status: 422
  end

end
