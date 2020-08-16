class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @events = Event.includes(:owner).where.not('owner_id = ?', current_user).where('start_time > ?', Time.zone.now).order(:start_time)
    else
      @events = Event.includes(:owner).where('start_time > ?', Time.zone.now).order(:start_time)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end 

  def create
    @event = current_user.events.build(event_params)
    binding.pry
    if @event.save
      redirect_to root_path, notice: 'イベントを作成しました'
    else
      render :new
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'イベントを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to root_path, notice: '削除しました'
  end

  def search

    @events = Event.search(params[:keyword])
  end

  private

    def event_params
      params.require(:event).permit(:name, :place, :content, :start_time, :end_time, :level)
    end

end
