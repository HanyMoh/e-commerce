class Api::V2::Dashboard::AnalyticsController < ApplicationController
  before_action :set_api_v2_dashboard_analytic, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/analytics
  # GET /api/v2/dashboard/analytics.json
  def index
    @api_v2_dashboard_analytics = Api::V2::Dashboard::Analytic.all
  end

  # GET /api/v2/dashboard/analytics/1
  # GET /api/v2/dashboard/analytics/1.json
  def show; end

  # GET /api/v2/dashboard/analytics/new
  def new
    @api_v2_dashboard_analytic = Api::V2::Dashboard::Analytic.new
  end

  # GET /api/v2/dashboard/analytics/1/edit
  def edit; end

  # POST /api/v2/dashboard/analytics
  # POST /api/v2/dashboard/analytics.json
  def create
    @api_v2_dashboard_analytic = Api::V2::Dashboard::Analytic.new(api_v2_dashboard_analytic_params)

    respond_to do |format|
      if @api_v2_dashboard_analytic.save
        format.html { redirect_to @api_v2_dashboard_analytic, notice: 'Analytic was successfully created.' }
        format.json { render :show, status: :created, location: @api_v2_dashboard_analytic }
      else
        format.html { render :new }
        format.json { render json: @api_v2_dashboard_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v2/dashboard/analytics/1
  # PATCH/PUT /api/v2/dashboard/analytics/1.json
  def update
    respond_to do |format|
      if @api_v2_dashboard_analytic.update(api_v2_dashboard_analytic_params)
        format.html { redirect_to @api_v2_dashboard_analytic, notice: 'Analytic was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v2_dashboard_analytic }
      else
        format.html { render :edit }
        format.json { render json: @api_v2_dashboard_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v2/dashboard/analytics/1
  # DELETE /api/v2/dashboard/analytics/1.json
  def destroy
    @api_v2_dashboard_analytic.destroy
    respond_to do |format|
      format.html { redirect_to api_v2_dashboard_analytics_url, notice: 'Analytic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v2_dashboard_analytic
    @api_v2_dashboard_analytic = Api::V2::Dashboard::Analytic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def api_v2_dashboard_analytic_params
    params.fetch(:api_v2_dashboard_analytic, {})
  end
end
