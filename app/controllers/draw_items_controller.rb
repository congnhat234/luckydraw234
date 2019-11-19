# frozen_string_literal: true

class DrawItemsController < ApplicationController
  before_action :find_draw_item, only: %i[destroy]
  before_action :find_draw_list, only: %i[new edit index]

  def index
    @draw_lists = DrawList.all
    @draw_items = @draw_list.draw_items if @draw_list
  end

  def new
    @draw_item = @draw_list.draw_items.build
  end

  def create
    @draw_item = DrawItem.new draw_item_params
    if @draw_item.save
      redirect_to draw_lists_path
    else
      render :new
    end
  end

  def destroy
    @draw_item.destroy
    redirect_to draw_lists_path
  end

  private

  def find_draw_item
    @draw_item = DrawItem.find_by(id: params[:id])
    return if @draw_item

    redirect_to new_draw_item_path
  end

  def find_draw_list
    @draw_list = DrawList.find_by(id: params[:draw_list_id])
    return @draw_list
  end

  def draw_item_params
    params.require(:draw_item).permit :fullname, :shortname, :draw_list_id
  end
end
