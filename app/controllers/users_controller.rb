class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @user = current_user
  end
end
