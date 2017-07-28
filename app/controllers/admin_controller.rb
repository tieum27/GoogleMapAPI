class AdminController < ApplicationController
  before_action :authorize
  before_action :authenticate_user!

  #get "admin"
  def index
    #Creating the list of users on the admin index page
    @users = User.all
  end

  # put/patch "admin/:id"
  def update
    user = User.find(params[:id])

    # User only has one role
    user.remove_role(:client)

    # user.add_role(:realtor)
    redirect_to '/admin'
  end

  private

  # Check the roles of the user, and if they are not an admin we want to stop them
  def authorize
    if !current_user.has_role? :admin
      render plain:"No access for you!"
    end
  end
end
