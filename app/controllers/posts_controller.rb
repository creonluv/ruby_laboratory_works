class PostsController < ApplicationController
  before_action :set_post, :set_user_to_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    category_name = params[:post].delete(:category_name)
    category = Category.find_or_create_by(name: category_name)
    @post = current_user.posts.build(post_params.merge(category_id: category.id))

    # @post = current_user.posts.build(post_params)
    # @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    category_name = params[:post].delete(:category_name) # Видаляємо category_name з params[:post]
    category = Category.find_or_create_by(name: category_name)
    params[:post][:category_id] = category.id
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_user_to_post
    @user = User.find(@post.user_id)
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:content, :user_id, :category_name, :category_id)
  end
end
