class SpacesController < ApplicationController
  def index
    # TODO: スコープ
    circle = Circle.find_by(id: params[:circle_id])
    raise NotFound unless circle

    @spaces = circle.spaces
  end

  def show
    @space = Space.find_by(id: params[:id])
    raise NotFound unless @space

    # TODO: 認可
  end

  private

  def space_params
    params.require(:space).permit(:name, :description, :price, :location, :user_id)
  end
end
