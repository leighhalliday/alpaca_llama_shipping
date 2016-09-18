class ApplicationController < ActionController::Base
  # skip_before_filter :verify_authenticity_token
  before_action :authenticate!

  def authenticate!
    # look in headers for valid token
  end
end
