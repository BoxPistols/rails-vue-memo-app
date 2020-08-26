class ApplicationController < ActionController::Base
  # for security
  protect_from_forgery with: :null_session
end
