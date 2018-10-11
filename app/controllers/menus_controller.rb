class MenusController < HighlandController

  # GET /menus
  def index
    @q = policy_scope(Menu).ransack(params[:q])
    @menus = @q.result.page(params[:page]).per(@per_page)
  end

  # GET /menus/1
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to @menu, notice: 'Menu 创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /menus/1
  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'Menu 更新成功！'
    else
      render :edit
    end
  end

  # DELETE /menus/1
  def destroy
    @menu.destroy
    redirect_to menus_url, notice: 'Menu 删除成功！'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:menu).permit(:name, :url, :usable, :parent_id, :description)
    end
end
