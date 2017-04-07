class BoardpostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :delete, :update]
  before_action :find_cat
  def index
    @posts = @category.boardposts
  end

  def show
  end

  def new
  end

  def create
    @post = Boardpost.new(post_params)
    @post.user_id = current_user.id
    @post.boardcategory_id = @category.id
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)
  end

  def delete
    @post.destroy
    redirect_to '/'
    # make it go to a success page?
  end

  private
    def post_params
      params.require(:boardpost).permit(:title, :content)
    end

    def find_post
      @post = Boardpost.find(params[:boardpost_id])
    end

    def find_cat
      @category = Boardcategory.find(params[:boardcategory_id])
    end
end