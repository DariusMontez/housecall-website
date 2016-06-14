class PatientsController < ApplicationController
	layout 'hcncentral'
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :update_hpatient]

  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  	if HPatient.all.any?
  		@h_patient = HPatient.find(@patient.uuid)
  	end
  	
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.uuid = SecureRandom.uuid

    respond_to do |format|
      if @patient.save and HPatient.create({'row_key' => @patient.uuid, 'data:name' => @patient.name})
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # connection from node to central
  
  # POST /patients/1/records
  def update_hpatient
  	@hpatient = HPatient.find(@patient.uuid)
  	if @hpatient.update(params.permit!)
			render json: {message: 'success'}
		else
			render json: {message: 'error'}
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :priority, :node_id)
    end
end
