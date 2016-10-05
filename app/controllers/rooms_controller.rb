class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index

    @rooms = Room.all
    @rooms = Room.search(params[:search])
    if(session[:user_id] == nil)
      flash[:warning] = "Login to book a room"
      redirect_to login_url
    else
      loggedUser = User.find(session[:user_id])
      if(loggedUser.ornot == 1)
        @superuser = true
      else
        @superuser = false
      end
    end
  end

  def schedule
    @room = Room.find(params[:id])
      whereClause = "rooms_id = #{params[:id]}"
      ids = BookingHistroy.where(whereClause).ids
      bookingHistroyRoom = []
      if(!ids.empty?)
        ids.each do |x|
          bh = BookingHistroy.find(x)
          if(bh != nil)
            bookingHistroyRoom << bh
          end
        end
      end

      @bookedSlots = bookingHistroyRoom
    puts "End"
    end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  def book
    @room = Room.find(params[:id])
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:roomnumber, :size, :status, :building, :date, :time)
  end
end
