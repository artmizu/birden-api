class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user 

  private

	def is_admin
		return head(:bad_request) if !current_user.is_admin
	end

end
