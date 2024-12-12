class ApplicationController < ActionController::API
  class HttpError < StandardError
    def initialize(message = self.class.name.split('::').last) = super
  end

  class BadRequest          < HttpError; end
  class Unauthorized        < HttpError; end
  class Forbidden           < HttpError; end
  class NotFound            < HttpError; end
  class UnprocessableEntity < HttpError; end

  HTTP_STATUS = {
    'bad_request': 400,
    'unauthorized': 401,
    'forbidden': 403,
    'not_found': 404,
    'unprocessable_entity': 422
  }
  rescue_from(HttpError) do |exception|
    logger.error exception.backtrace.join("\n")
    render json: { message: exception.message },
           status: HTTP_STATUS[exception.class.name.split('::').last.underscore.to_sym]
  end


  def hello
    render json: { message: "hello!" }
  end

  private

  # TODO: 認証機能追加後に実装し直してください。
  def current_user
    @current_user ||= User.first
  end
end
