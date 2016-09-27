class AdminpagesController < ApplicationController
  before_action :set_adminpage, only: [:show, :edit, :update, :destroy]

  # GET /adminpages
  # GET /adminpages.json
  def index
    @adminpages = User.all
  end

  # GET /adminpages/1
  # GET /adminpages/1.json
  def show
  end

  # GET /adminpages/new
  def new
    @adminpage = Adminpage.new
  end

  # GET /adminpages/1/edit
  def edit
  end

  # POST /adminpages
  # POST /adminpages.json
  def create
    paramters = adminpage_params
    paramters[:ornot] = 1
    @adminpage = User.new(paramters)

    respond_to do |format|
      if @adminpage.save
        format.html { redirect_to @adminpage, notice: 'Admin was added successfully created.' }
        format.json { render :show, status: :created, location: @adminpage }
      else
        format.html { render :new }
        format.json { render json: @adminpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminpages/1
  # PATCH/PUT /adminpages/1.json
  def update
    respond_to do |format|
      if @adminpage.update(adminpage_params)
        format.html { redirect_to @adminpage, notice: 'Admin Updated successfully updated.' }
        format.json { render :show, status: :ok, location: @adminpage }
      else
        format.html { render :edit }
        format.json { render json: @adminpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminpages/1
  # DELETE /adminpages/1.json
  def destroy
    @adminpage.destroy
    respond_to do |format|
      format.html { redirect_to adminpages_url, notice: 'Adminpage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminpage
      @adminpage = Adminpage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adminpage_params
      params.require(:adminpage).permit(:name, :email, :password_digest)
    end
end
