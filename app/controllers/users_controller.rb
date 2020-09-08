class UsersController < ApplicationController
  def join
    @events_join = User.find_by(params[:id]).join_events
  end
end
