class TodoItemsController < ApplicationController

  def create
    list = TodoList.find(params[:id])
    list.todo_items.create(title:params[:title])
    @items = list.todo_items.order('created_at desc')
    respond_to do |format|
        format.js
    end
  end

  def destroy
    item = TodoItem.find_by_id(params[:id])
    item.delete if item
    list = TodoList.find(params[:list_id])
    @items = list.todo_items
    respond_to do |format|
        format.js
    end
  end

  def mark_completed
    item = TodoItem.find_by_id(params[:id])
    if item
      item.update_attributes(completed: params[:completed])
    end
    render json: {data: "Success"}
  end
  
end
