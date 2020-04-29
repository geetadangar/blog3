class HomeController < ApplicationController
  # before_action :authenticate_login_user!
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  def index
    @home = Home.all
  end
  
  def show

  end

  def new
    @home = Home.new
  end
  
  def edit
    @home = Home.find(params[:id])
  end

  def create
  	# raise params.inspect
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to home_url, notice: 'home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
     def set_home
      @home = Home.find(params[:id])
    end
    def home_params
      params.permit(:name, :Description)

    end
end