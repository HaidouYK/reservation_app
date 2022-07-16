class RoomsController < ApplicationController
  def index
  end

  def new
  end

  def search_area
    @rooms = Room.search_area(params[:search])
  end

  def search_keyword
    @rooms = Room.search_keyword(params[:search])
  end

  def posts
  end
end
