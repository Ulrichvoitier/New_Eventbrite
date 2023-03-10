class TestingsController < ApplicationController
  before_action :set_testing, only: %i[ show edit update destroy ]

  # GET /testings or /testings.json
  def index
    @testings = Testing.all
  end

  # GET /testings/1 or /testings/1.json
  def show
  end

  # GET /testings/new
  def new
    @testing = Testing.new
  end

  # GET /testings/1/edit
  def edit
  end

  # POST /testings or /testings.json
  def create
    @testing = Testing.new(testing_params)

    respond_to do |format|
      if @testing.save
        format.html { redirect_to testing_url(@testing), notice: "Testing was successfully created." }
        format.json { render :show, status: :created, location: @testing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @testing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testings/1 or /testings/1.json
  def update
    respond_to do |format|
      if @testing.update(testing_params)
        format.html { redirect_to testing_url(@testing), notice: "Testing was successfully updated." }
        format.json { render :show, status: :ok, location: @testing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @testing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testings/1 or /testings/1.json
  def destroy
    @testing.destroy

    respond_to do |format|
      format.html { redirect_to testings_url, notice: "Testing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testing
      @testing = Testing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def testing_params
      params.require(:testing).permit(:username, :bio)
    end
end
