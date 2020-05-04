class BlogsController < ApplicationController
  # before_action :role_name, :set_user, only: [:new, :create, :show, :edit, :update, :destroy, :update_user_password, :confirm]
  before_action :authenticate_user!, except: [:index]
   # before_action :set_blogs, only: [:show, :edit, :update, :destroy]

  def index 
    @blogs = Blog.all
  end
  
  def show
    @blog = Blog.find_by_id(params[:id])
  end

  def new
    @blog = Blog.new
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  # def create
  # 	# raise params.inspect
  #   @blog = Blog.new(blog_params)

  #   respond_to do |format|
  #     if @blog.save
  #       format.html { redirect_to @blogs, notice: 'blog was successfully created.' }
  #       format.json { render :show, status: :created, location: @blog }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @blog.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def create
    # raise params.inspect
    @blog= Blog.new(blog_params)
    # raise params.inspect
    if @blog.save
      flash[:notice] ="blog created successfully......"
      redirect_to(blogs_path)
    else
      render('new')
    end

  end


 
  # def update
  #   respond_to do |format|
  #     if @blog.update(blog_params)
  #       format.html { redirect_to @blogs, notice: 'blog was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @blog }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @blog.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end




def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(blog_params)
      flash[:notice] ="blog updated successfully......"
      redirect_to(blog_path(@blog))
    else
      render('edit')
    end
  end
 
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blog_url, notice: 'blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #  def destroy
  #   @blog = Blog.find(params[:id])
  #   @blog.destroy
  #   flash[:notice] ="Blog '#{@blog.name}' delete successfully......"
  #   redirect_to(blog_path(@blog))
  # end
 

  private
     def set_blogs
      @blog = Blog.find(params[:id])
    end
    def blog_params
       params.required(:blog).permit(:name,:description)
      # params.permit(:name, :discription)

    end

  #   def blog_params
  #   params.required(:blogs).permit(:name,:description)
  # end
end