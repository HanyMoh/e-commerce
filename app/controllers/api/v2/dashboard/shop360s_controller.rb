class Api::V2::Dashboard::Shop360sController < ApplicationController
  before_action :set_api_v2_dashboard_shop360, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/shop360s
  # GET /api/v2/dashboard/shop360s.json
  def index
    @api_v2_dashboard_shop360s = Api::V2::Dashboard::Shop360.all
  end

  # GET /api/v2/dashboard/shop360s/1
  # GET /api/v2/dashboard/shop360s/1.json
  def show; end

  # GET /api/v2/dashboard/shop360s/new
  def new
    @api_v2_dashboard_shop360 = Api::V2::Dashboard::Shop360.new
  end

  # GET /api/v2/dashboard/shop360s/1/edit
  def edit; end

  # POST /api/v2/dashboard/shop360s
  # POST /api/v2/dashboard/shop360s.json
  def create
    @api_v2_dashboard_shop360 = Api::V2::Dashboard::Shop360.new(api_v2_dashboard_shop360_params)

    respond_to do |format|
      if @api_v2_dashboard_shop360.save
        format.html { redirect_to @api_v2_dashboard_shop360, notice: 'Shop360 was successfully created.' }
        format.json { render :show, status: :created, location: @api_v2_dashboard_shop360 }
      else
        format.html { render :new }
        format.json { render json: @api_v2_dashboard_shop360.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v2/dashboard/shop360s/1
  # PATCH/PUT /api/v2/dashboard/shop360s/1.json
  def update
    respond_to do |format|
      if @api_v2_dashboard_shop360.update(api_v2_dashboard_shop360_params)
        format.html { redirect_to @api_v2_dashboard_shop360, notice: 'Shop360 was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v2_dashboard_shop360 }
      else
        format.html { render :edit }
        format.json { render json: @api_v2_dashboard_shop360.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v2/dashboard/shop360s/1
  # DELETE /api/v2/dashboard/shop360s/1.json
  def destroy
    @api_v2_dashboard_shop360.destroy
    respond_to do |format|
      format.html { redirect_to api_v2_dashboard_shop360s_url, notice: 'Shop360 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v2_dashboard_shop360
    @api_v2_dashboard_shop360 = Api::V2::Dashboard::Shop360.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def api_v2_dashboard_shop360_params
    params.fetch(:api_v2_dashboard_shop360, {})
  end
end
