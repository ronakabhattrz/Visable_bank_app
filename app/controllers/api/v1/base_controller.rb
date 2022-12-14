class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  private

  def handle_error(e)
    render json: { error: e.to_s }, status: :bad_request
  end
end