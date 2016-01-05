class SessionsController < ActionController::Base
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:notice] = "Welcome Back"
    else
      redirect_to login_path
      flash[:failure] = "Failed Login Attempt"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to tools_path
    flash[:notice] = "Successfully Logged Out"
  end

end
