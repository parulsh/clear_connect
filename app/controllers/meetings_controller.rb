class MeetingsController < ApplicationController
  before_action :authenticate_user!
  def index 
    if params[:type] == "completed"
      @meetings = Meeting.completed(current_user)
      @meetings = @meetings.where(start_time: params[:start_date]..params[:end_date]) if request.xhr?
    else  
      @meetings = Meeting.upcoming(current_user)
      @meetings = @meetings.where(start_time: params[:start_date]..params[:end_date]) if request.xhr?
    end
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params.merge(user_id: current_user.id))
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to meetings_path
    else
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end

  private
    def meeting_params
      params.require(:meeting).permit(:topic, :password, :start_time, :duration, :time_zone, :device_pack_id, :alternate_host, experience_pack_ids: [], attendees: [])
    end
end
