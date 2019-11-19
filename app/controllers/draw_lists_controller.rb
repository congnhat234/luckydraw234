# frozen_string_literal: true

class DrawListsController < ApplicationController
  before_action :find_draw_list, only: %i[show edit update destroy]

  def index
    @draw_lists = DrawList.all
  end

  def show
    @draw_items = @draw_list.draw_items
  end

  def new
    @draw_list = DrawList.new
  end

  def create
    @draw_list = DrawList.new draw_list_params
    if @draw_list.save
      redirect_to draw_lists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @draw_list.update_attributes! draw_list_params
      redirect_to draw_lists_path
    else
      render :edit
    end
  end

  def destroy
    @draw_list.destroy
    redirect_to draw_lists_path
  end

  private

  def find_draw_list
    @draw_list = DrawList.find_by(id: params[:id])
    return if @draw_list

    redirect_to new_draw_list_path
  end

  def draw_list_params
    params.require(:draw_list).permit :title
  end
end
