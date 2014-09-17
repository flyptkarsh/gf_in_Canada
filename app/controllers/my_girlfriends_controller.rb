class MyGirlfriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_girlfriend, only: [:show, :edit, :update, :destroy]

  # GET /my_girlfriends
  # GET /my_girlfriends.json
  def index
    @my_girlfriends = MyGirlfriend.where(user_id:current_user.id)
  end

  # GET /my_girlfriends/1
  # GET /my_girlfriends/1.json
  def show
  end

  # GET /my_girlfriends/new
  def new
    @my_girlfriend = MyGirlfriend.new
  end

  # GET /my_girlfriends/1/edit
  def edit
  end

  # POST /my_girlfriends
  # POST /my_girlfriends.json
  def create
    @my_girlfriend = MyGirlfriend.new(my_girlfriend_params)
    @my_girlfriend.user_id = current_user.id
    respond_to do |format|
      if @my_girlfriend.save
        format.html { redirect_to @my_girlfriend, notice: 'My girlfriend was successfully created.' }
        format.json { render :show, status: :created, location: @my_girlfriend }
      else
        format.html { render :new }
        format.json { render json: @my_girlfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_girlfriends/1
  # PATCH/PUT /my_girlfriends/1.json
  def update
    respond_to do |format|
      if @my_girlfriend.update(my_girlfriend_params)
        format.html { redirect_to @my_girlfriend, notice: 'My girlfriend was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_girlfriend }
      else
        format.html { render :edit }
        format.json { render json: @my_girlfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_girlfriends/1
  # DELETE /my_girlfriends/1.json
  def destroy
    @my_girlfriend.destroy
    respond_to do |format|
      format.html { redirect_to my_girlfriends_url, notice: 'My girlfriend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_girlfriend
      @my_girlfriend = MyGirlfriend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_girlfriend_params
      params.require(:my_girlfriend).permit(:name, :hometown, :favorite_food, :where_we_met, :what_turns_me_on, :number_she_texts, :is_current_girlfriend)
    end
end
