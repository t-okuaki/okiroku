class ItemsController < ApplicationController
  def index
    # TODO: スコープ
    space = Space.find_by(id: params[:space_id])

    @items = space.items
  end
end
