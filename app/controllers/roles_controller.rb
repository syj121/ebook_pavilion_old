class RolesController < HighlandController

  # GET /roles
  def index
    @q = policy_scope(Role).ransack(params[:q])
    @roles = @q.result.page(params[:page]).per(@per_page)
  end

  # GET /roles/1
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to @role, notice: 'Role 创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      redirect_to @role, notice: 'Role 更新成功！'
    else
      render :edit
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to roles_url, notice: 'Role 删除成功！'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:name, :usable, :parent_id, :description)
    end
end
