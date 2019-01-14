class BookCategoriesController < HighlandController

  # GET /book_categories
  def index
    @q = policy_scope(BookCategory).ransack(params[:q])
    @book_categories = @q.result.page(params[:page]).per(@per_page)
  end

  # GET /book_categories/1
  def show
  end

  # GET /book_categories/new
  def new
    @book_category.build_info
  end

  # GET /book_categories/1/edit
  def edit
  end

  # POST /book_categories
  def create
    @book_category = BookCategory.new(book_category_params)
    if @book_category.save
      redirect_to @book_category, notice: 'Book category 创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /book_categories/1
  def update
    if @book_category.update(book_category_params)
      redirect_to @book_category, notice: 'Book category 更新成功！'
    else
      render :edit
    end
  end

  # DELETE /book_categories/1
  def destroy
    @book_category.destroy
    redirect_to book_categories_url, notice: 'Book category 删除成功！'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def book_category_params
      params.require(:book_category).permit!
    end
end
