class Admin::ToolsController < Admin::BaseController
  before_action :set_tool, only: [:show, :edit, :update, :destory]


  def index
    session[:most_recent_tool_id] = Tool.all.last.id
    @tools = Tool.all
  end

  def show
  end

  def new
    @tool = Tool.new
    @users = User.all.each { |u| u.name }
  end

  def create
    user = User.find(params[:tool][:user_id])
    @tool = user.tools.new(tool_params)
    if @tool.save
      redirect_to user_path(user)
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
    redirect_to user_path(current_user)
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :use, :user_id)
  end


end
