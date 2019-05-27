class TodosController < ApplicationController
  before_action :authenticate_user! 
  before_action :authrize_user, except: [:create, :index, :show]
  # GET /todos
  def index
    @todos = Todo.user_todos current_user
    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      render json: { messages: ['created'], todo: @todo },
                     status: :created
    else
      render json: { messages: ['error'], errors: @todo.errors },
                     status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def todo
    @todo || Todo.find(params[:id])
  end

  def todo_policy
    @todo_policy || TodosPolicy.new(current_user: current_user, resource: todo)
  end
  # Only allow a trusted parameter "white list" through.

  def authrize_user
    unless todo_policy.can_mange?
      render json: { messages: ['you dont have the permission'] ,errors: ['auth'] },
             status: :unauthorized
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :priority, :due_date, :todo_type)
  end
end
