class HourlySlotsController < ApplicationController
  def new
    @cafe = Cafe.find(params[:cafe_id])
    @user = User.find(params[:user_id])
    @seats = get_hourly_seats(@cafe, Date.today)
  end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @user = User.find(params[:user_id])
    @time_slots_seats = params.values[3..-5]
    @cafe.hourly_slots.where(date: Date.today).destroy_all
    @time_slots = params.keys[3..-5]
    @time_slots.each_with_index do |time, index|
      slot = HourlySlot.new(cafe: @cafe, start_time: time.to_i, total_seats: @time_slots_seats[index].to_i, price_per_hour: params["price"].to_i, date: Date.today)
      slot.save
    end
    redirect_to dashboard_path(@user)
  end

  def get_hourly_seats(cafe, date)
    new_hash = {}
    cafe.hourly_slots.where(date: date).each do |slot|
      new_hash["#{slot.start_time}"] = slot.total_seats
    end
    new_hash
  end

end
