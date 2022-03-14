class DocumentationsController < ApplicationController
  before_action :set_documentation, only: %i[ show update destroy ]

  # GET /documentations
  def index
    @documentations = Documentation.all

    render json: @documentations
  end

  # GET /documentations/1
  def show
    render json: @documentation
  end

  # POST /documentations
  def create
    @documentation = Documentation.new(documentation_params)

    if @documentation.save
      render json: @documentation, status: :created, location: @documentation
    else
      render json: @documentation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documentations/1
  def update
    if @documentation.update(documentation_params)
      render json: @documentation
    else
      render json: @documentation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documentations/1
  def destroy
    @documentation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentation
      @documentation = Documentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documentation_params
      params.require(:documentation).permit(:name, :doc_type, :user_id)
    end
end
