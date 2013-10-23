class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  def index
    @statuses = Status.all
  end

  def show
  end

  def new
    @status = Status.new
  end

  def edit
  end

  def create
    @status = Status.new(status_params)
      if @status.save
        redirect_to @status, notice: 'Status was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @status.update(status_params)
        redirect_to @status, notice: 'Status was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @status.destroy
      redirect_to statuses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    def correct_user
      @status = current_user.statuses.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this status" if @status.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:user_id, :name, :content)
    end
end
