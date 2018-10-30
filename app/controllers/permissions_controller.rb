class PermissionsController < HighlandController
  before_action :get_menu

  # GET /permissions
  def index
    @q = policy_scope(Permission).ransack(params[:q])
    @permissions = @q.result.page(params[:page]).per(@per_page)
  end

  # GET /permissions/1
  def show
  end

  # GET /permissions/new
  def new
    @permission = @menu.permissions.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  def create
    @permission = Permission.new(permission_params)

    if @permission.save
      redirect_to [@menu, @permission], notice: 'Permission 创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /permissions/1
  def update
    if @permission.update(permission_params)
      redirect_to [@menu, @permission], notice: 'Permission 更新成功！'
    else
      render :edit
    end
  end

  # DELETE /permissions/1
  def destroy
    @permission.destroy
    redirect_to action: :index, notice: 'Permission 删除成功！'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def permission_params
      params.require(:permission).permit(:name, :menu_id, :usable)
    end

    def get_menu
      @menu = Menu.find(params[:menu_id])
    end
end
