class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    redirect_to new_user_session_path if user_signed_in? == false
    @users = User.all
  end
end
