class BookingHistroysController < ApplicationController
  before_action :set_booking_histroy, only: [:show, :edit, :update, :destroy]

  # GET /booking_histroys
  # GET /booking_histroys.json
  def index
    @booking_histroys = BookingHistroy.all
  end

  # GET /booking_histroys/1
  # GET /booking_histroys/1.json
  def show
  end

  # GET /booking_histroys/new
  def new
    @booking_histroy = BookingHistroy.new
  end

  def releaseBooking
    @booking_histroys = Array.new
    whereClause = "rooms_id = #{params[:id]}"
    ids = BookingHistroy.where(whereClause).ids
    ids.each do |bh|
      bookingHistroyRoom = BookingHistroy.find(bh)
      @booking_histroys << bookingHistroyRoom
    end
  end

  def validBooking
    Time.zone = 'UTC'
    if Date.valid_date?(params[:room]["date(1i)"].to_s.to_i,params[:room]["date(2i)"].to_s.to_i,params[:room]["date(3i)"].to_s.to_i)
      myDate = Date.new(params[:room]["date(1i)"].to_s.to_i,params[:room]["date(2i)"].to_s.to_i,params[:room]["date(3i)"].to_s.to_i);

      myTime =  Time.new(params[:room]["date(1i)"].to_s.to_i,params[:room]["date(2i)"].to_s.to_i,params[:room]["date(3i)"].to_s.to_i,params[:room]["time(4i)"].to_s.to_i,params[:room]["time(5i)"].to_s.to_i).in_time_zone("UTC");

      @room = Room.find(params[:id])
      if(myDate < Date.today)
        flash[:warning] = "Select either today's date or a later one."
        redirect_to book_room_url
      else
        if (myDate > (Date.today + 7.days))
          flash[:warning] = "You can book only upto one week in advance."
          redirect_to book_room_url
        else
          if(myTime < Time.now)
            flash[:warning] = "You cannot book for the past!. #{myTime}. Time now #{Time.now}"
            redirect_to book_room_url
          else
            booked = false
            idRoom = @room.id.to_i
            whereClause = "rooms_id = #{idRoom}"
            roomsBookingHistroy = BookingHistroy.where(whereClause).ids
            if(!roomsBookingHistroy.empty?)
              roomsBookingHistroy.each do |bh|
                row = BookingHistroy.find(bh)
                myDateToDate = myDate.to_date
                rowdate = row.date
                if(myDateToDate == rowdate)
                  rowfrom = row.from.strftime('%H:%M')
                  rowto = row.to.strftime('%H:%M')
                  starttime = myTime.strftime('%H:%M')
                  endtime = (myTime + 2.hours).strftime('%H:%M')

                  if((starttime >= rowfrom) && (starttime <= rowto))
                    flash[:warning] = "This slot is already booked!"
                    booked = true
                    break
                  else
                    if((endtime >= rowfrom) && (endtime <= rowto))
                      flash[:warning] = "This slot is already booked!"
                      booked = true
                      break
                    end
                  end
                end

              end
            end
            if(!booked)
              toTime = myTime + 2.hours
              hashArg = {:from => myTime, :to => toTime, :date => myDate, :rooms_id => idRoom}
              @booking_histroy = BookingHistroy.new(hashArg)
              @booking_histroy.save

              #Adding it to the reservation histroy
              hashArgReservation = {:from => myTime, :to => toTime, :date => myDate, :rooms_id => idRoom, :users_id => User.currentUserId}
              @reservation_histroy = ReservationHistroy.new(hashArgReservation)
              @reservation_histroy.save

              redirect_to rooms_url
            else
              redirect_to book_room_url
            end

          end

        end

      end
    else
      flash[:warning] = "Select a Valid Date."
      redirect_to book_room_url
    end
  end




  # GET /booking_histroys/1/edit
  def edit
  end

  # POST /booking_histroys
  # POST /booking_histroys.json
  def create
    @booking_histroy = BookingHistroy.new(booking_histroy_params)

    respond_to do |format|
      if @booking_histroy.save
        format.html { redirect_to @booking_histroy, notice: 'Booking histroy was successfully created.' }
        format.json { render :show, status: :created, location: @booking_histroy }
      else
        format.html { render :new }
        format.json { render json: @booking_histroy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_histroys/1
  # PATCH/PUT /booking_histroys/1.json
  def update
    respond_to do |format|
      if @booking_histroy.update(booking_histroy_params)
        format.html { redirect_to @booking_histroy, notice: 'Booking histroy was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_histroy }
      else
        format.html { render :edit }
        format.json { render json: @booking_histroy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_histroys/1
  # DELETE /booking_histroys/1.json
  def destroy
    @booking_histroy.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Booking histroy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking_histroy
    @booking_histroy = BookingHistroy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_histroy_params
    params.require(:booking_histroy).permit(:from, :to, :date)
  end
end
