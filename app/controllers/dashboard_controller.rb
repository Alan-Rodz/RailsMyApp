class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # serves the dashboard page
  end
end
