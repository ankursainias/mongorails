# frozen_string_literal: true

# Uplader Controller
class UploadsController < ApplicationController
  before_action :set_upload, only: %i[destroy]

  # GET /uploads or /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # POST /uploads or /uploads.json
  def create
    begin
      Utilites::FileGenerator.new(upload_params).execute
      flash[:notice] = 'Upload was successfully created.'
    rescue StandardError => e
      flash[:error] = e.message
    end
    respond_to do |format|
      format.html { redirect_to uploads_path }
    end
  end

  # DELETE /uploads/1 or /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_upload
    @upload = Upload.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def upload_params
    params.require(:upload).permit(:image, mp4_files: [], mix_files: [])
  end
end
