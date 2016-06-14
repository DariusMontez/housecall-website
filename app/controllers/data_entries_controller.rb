class DataEntriesController < ApplicationController
  before_action :set_data_entry, only: [:show, :edit, :update, :destroy]
  layout 'hcncentral'

  # GET /data_entries
  # GET /data_entries.json
  def index
    @data_entries = DataEntry.all
  end

  # GET /data_entries/1
  # GET /data_entries/1.json
  def show
  end

  # GET /data_entries/new
  def new
    @data_entry = DataEntry.new
  end

  # GET /data_entries/1/edit
  def edit
  end

  # POST /data_entries
  # POST /data_entries.json
  def create
    @data_entry = DataEntry.new(data_entry_params)

    respond_to do |format|
      if @data_entry.save
      
      	@h_patient = HPatient.find(@data_entry.appointment.patient.uuid)
      	@h_patient.update({'data:heartrate' => '73 bpm'})
      	
        format.html { redirect_to @data_entry, notice: 'Data entry was successfully created.' }
        format.json { render :show, status: :created, location: @data_entry }
      else
        format.html { render :new }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_entries/1
  # PATCH/PUT /data_entries/1.json
  def update
    respond_to do |format|
      if @data_entry.update(data_entry_params)
        format.html { redirect_to @data_entry, notice: 'Data entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_entry }
      else
        format.html { render :edit }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_entries/1
  # DELETE /data_entries/1.json
  def destroy
    @data_entry.destroy
    respond_to do |format|
      format.html { redirect_to data_entries_url, notice: 'Data entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_entry
      @data_entry = DataEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_entry_params
      params.require(:data_entry).permit(:classification, :value, :unit)
    end
end
