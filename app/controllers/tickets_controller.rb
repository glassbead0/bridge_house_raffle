include ActionView::Helpers::TextHelper

class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :edit, :update, :destroy, :new]
  # GET /tickets
  # GET /tickets.json
  def index
    @q = Ticket.search(params[:q])
    @tickets = @q.result(distinct: true).paginate(page: params[:page], per_page: 100)
    @all_tickets = Ticket.all
    @uniq_tickets = Ticket.select(:email).uniq

    respond_to do |format|
      format.html
      format.csv { send_data @all_tickets.to_csv }
      format.xls { send_data @all_tickets.to_csv(col_sep: "\t") }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  def new_wepay
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @tickets = []
    number_of_tickets = params[:number_of_tickets].to_i

    number_of_tickets.times do |num|
      @tickets[num] = Ticket.new(ticket_params)
      @tickets[num].number_of_tickets = n = params[:number_of_tickets]
      @tickets[num].amount_paid = (n.to_i)*10 - 20*((n.to_i)/12)
      unless @tickets[num].payment_type
        @tickets[num].payment_type = params[:payment_type]
      end
    end

    @ticket = @tickets.first
    if @ticket.save
      @tickets.each do |ticket|
        ticket.location = current_admin.event.name if current_admin && current_admin.event
        ticket.save
      end
      redirect_to ticket_path(@ticket), notice: "Thank you for buying #{pluralize(number_of_tickets, 'raffle ticket')} #{@tickets[0].first_name}"
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:location, :first_name, :middle_initial, :last_name, :email, :subscribe, :address_line_one, :address_line_two, :city, :state, :zip_code, :phone_number, :number_of_tickets, :payment_type, :amount_paid, :last_four_digits_of_card)
    end
end
