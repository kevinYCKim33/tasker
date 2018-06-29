class ListsController < ApplicationController
  def index
  end

  def new
    @list = List.new
  end

  def create
    binding.pry
    @list = List.create(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    binding.pry
    params.require(:list).permit(:name)
  end

  def signed_in?
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
