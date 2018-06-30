class ListsController < ApplicationController
  before_action :signed_in?

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def signed_in?
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
