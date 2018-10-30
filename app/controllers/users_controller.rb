class UsersController < HighlandController

  # GET /users
  def index
    @q = policy_scope(User).ransack(params[:q])
    @users = @q.result.page(params[:page]).per(@per_page)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Role 创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Role 更新成功！'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Role 删除成功！'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :login_name, :real_name, :password, :password_confirmation)
    end
end
