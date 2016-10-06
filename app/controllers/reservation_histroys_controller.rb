class ReservationHistroysController < ApplicationController
  before_action :set_reservation_histroy, only: [:show, :edit, :update, :destroy]

  # GET /reservation_histroys
  # GET /reservation_histroys.json
  def index
    @reservation_histroys = ReservationHistroy.all
  end

  # GET /reservation_histroys/1
  # GET /reservation_histroys/1.json
  def show
  end

  # GET /reservation_histroys/new
  def new
    @reservation_histroy = ReservationHistroy.new
  end

  # GET /reservation_histroys/1/edit
  def edit
  end

  def viewHistroy
    @reservation_histroy = Array.new
    whereClause = "users_id = #{session[:user_id]}"
    ids = ReservationHistroy.where(whereClause).ids
    ids.each do |id|
      rh = ReservationHistroy.find(id)
      if(rh != nil)
        @reservation_histroy << rh
      end
    end
  end

  # POST /reservation_histroys
  # POST /reservation_histroys.json
  def create
    @reservation_histroy = ReservationHistroy.new(reservation_histroy_params)

    respond_to do |format|
      if @reservation_histroy.save
        format.html { redirect_to @reservation_histroy, notice: 'Reservation histroy was successfully created.' }
        format.json { render :show, status: :created, location: @reservation_histroy }
      else
        format.html { render :new }
        format.json { render json: @reservation_histroy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation_histroys/1
  # PATCH/PUT /reservation_histroys/1.json
  def update
    respond_to do |format|
      if @reservation_histroy.update(reservation_histroy_params)
        format.html { redirect_to @reservation_histroy, notice: 'Reservation histroy was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation_histroy }
      else
        format.html { render :edit }
        format.json { render json: @reservation_histroy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_histroys/1
  # DELETE /reservation_histroys/1.json
  def destroy
    @reservation_histroy.destroy
    respond_to do |format|
      format.html { redirect_to reservation_histroys_url, notice: 'Reservation histroy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_histroy
      @reservation_histroy = ReservationHistroy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_histroy_params
      params.require(:reservation_histroy).permit(:from, :to, :date, :rooms_id, :users_id)
    end
end
