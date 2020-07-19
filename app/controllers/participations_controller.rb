class ParticipationsController < ApplicationController
  def create
    participation = current_user.participations.build(event_id: params[:event_id])
    participation.save
    
    # respond_to do |format|
    #   format.html { redirect_to root_path }
    #   format.js
    # end
    redirect_to root_path
  end
  def destroy
    participation = Participation.find_by(event_id: params[:event_id], user_id: current_user.id)
    participation.destroy
    # respond_to do |format|
    #   format.html { redirect_to root_path }
    #   format.js
    # end
    redirect_to root_path
  end
end
