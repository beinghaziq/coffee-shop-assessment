class ApplicationController < ActionController::API
    # TODO: get user from jwt 
    def current_user
        User.first
    end
end
