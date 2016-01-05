class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destory]


  def index
    session[:most_recent_tool_id] = Tool.all.last.id
    @tools = Tool.all
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
      flash[:notice] = "Tool created successfully!"
    else
      redirect_to new_tool_path
      flash[:error] = @tool.errors.full_messages.join(", ")
    end
  end

  def edit
  end

  def update
    @tool.update_attributes(tool_params)
    redirect_to tools_path
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :use)
  end

end
