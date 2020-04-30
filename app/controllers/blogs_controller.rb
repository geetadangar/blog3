class BlogsController < ApplicationController
	before_action :set_blog, only: [:show]

  def index
     @homes = Home.all
  end
  # def show

  # end

  # def new
  #   @blog = Blog.new
  # end
  
  # def edit
  #   @blog = Blog.find(params[:id])
  # end

  # def create
  #   @blog = Blog.new(blog_params)

  #   respond_to do |format|
  #     if @blog.save
  #       format.html { redirect_to @blog, notice: 'blog was successfully created.' }
  #       format.json { render :show, status: :created, location: @blog }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @blog.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

 
  # def update
  #   respond_to do |format|
  #     if @blog.update(blog_params)
  #       format.html { redirect_to @blog, notice: 'blog was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @blog }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @blog.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

 
  def destroy
    @bloge.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
  #    def set_blog
  #     @blog = Blog.find(params[:id])
  #   end
  #   def blog_params
  #     params.permit(:name, :discription)

  #   end
end