class ApiBaseController < ApplicationController

  before_action :restrict_access

  def restrict_access
    unless request.xhr?
      authenticate_or_request_with_http_token do |token, options|
        User.exists?(api_key: token)
      end
    end
  end
end
