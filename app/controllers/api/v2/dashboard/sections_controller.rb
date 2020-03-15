class Api::V2::Dashboard::SectionsController < ApplicationController
  before_action :set_api_v2_dashboard_section, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/sections
  # GET /api/v2/dashboard/sections.json
  def index
    @api_v2_dashboard_sections = Api::V2::Dashboard::Section.all
  end

  # GET /api/v2/dashboard/sections/1
  # GET /api/v2/dashboard/sections/1.json
  def show; end

  # GET /api/v2/dashboard/sections/new
  def new
    @api_v2_dashboard_section = Api::V2::Dashboard::Section.new
  end

  # GET /api/v2/dashboard/sections/1/edit
  def edit; end

  # POST /api/v2/dashboard/sections
  # POST /api/v2/dashboard/sections.json
  def create
    @api_v2_dashboard_section = Api::V2::Dashboard::Section.new(api_v2_dashboard_section_params)

    respond_to do |format|
      if @api_v2_dashboard_section.save
        format.html { redirect_to @api_v2_dashboard_section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @api_v2_dashboard_section }
      else
        format.html { render :new }
        format.json { render json: @api_v2_dashboard_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v2/dashboard/sections/1
  # PATCH/PUT /api/v2/dashboard/sections/1.json
  def update
    respond_to do |format|
      if @api_v2_dashboard_section.update(api_v2_dashboard_section_params)
        format.html { redirect_to @api_v2_dashboard_section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v2_dashboard_section }
      else
        format.html { render :edit }
        format.json { render json: @api_v2_dashboard_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v2/dashboard/sections/1
  # DELETE /api/v2/dashboard/sections/1.json
  def destroy
    @api_v2_dashboard_section.destroy
    respond_to do |format|
      format.html { redirect_to api_v2_dashboard_sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v2_dashboard_section
    @api_v2_dashboard_section = Api::V2::Dashboard::Section.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def api_v2_dashboard_section_params
    params.fetch(:api_v2_dashboard_section, {})
  end
end
