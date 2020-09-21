class UsersController < ApplicationController
  def join
    @events_join = User.find_by(params[:id]).join_events
  end

  def recruit
    @events_recruit = User.find_by(params[:id]).events
  end

end
