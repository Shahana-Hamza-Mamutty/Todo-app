class TodoListsController < ApplicationController

  def index
    @lists = TodoList.all
  end

  def new
    @list = TodoList.new
  end

  def create
    @list = TodoList.create(todo_list_params)
    if @list.errors.messages.present?
      flash[:alert] = "Enter valid title"
      redirect_to new_todo_list_path
    else
      redirect_to todo_lists_path
    end
  end

  def edit
    @list = TodoList.find_by_id(params[:id])
  end

  def update
    @list = TodoList.find_by_id(params[:id])
    if @list 
      list = @list.update_attributes(todo_list_params)
      if @list.errors.messages.present?
        flash[:alert] = "Enter valid title"
        redirect_to edit_todo_list_path(params[:id])
      else
        redirect_to todo_lists_path
      end
    else
      redirect_to todo_lists_path
    end
  end

  def show
    @list = TodoList.find_by_id(params[:id])
    @items = @list.todo_items if @list
  end

  def destroy
    @list = TodoList.find_by_id(params[:id])
    @list.destroy if @list
    redirect_to todo_lists_path
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

end
