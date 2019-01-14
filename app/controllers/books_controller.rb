class BooksController < HighlandController

  # GET /books
  def index
    @q = policy_scope(Book).ransack(params[:q])
    @books = @q.result.page(params[:page]).per(@per_page)
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book.build_info
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book 创建成功！'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book 更新成功！'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book 删除成功！'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name, :book_category_id)
    end
end
