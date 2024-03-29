class DeliverablesController < ApplicationController
  before_action :authorize_request, except: :upload
  before_action :set_deliverable, only: %i[ show update destroy ]

  # GET /deliverables
  def index
    type = params[:deliverable_type]
    id = params[:user_id]
    if type && id
      @deliverables = Deliverable.where(deliverable_type: type, user_id: id)
    elsif type
      @deliverables = Deliverable.where(deliverable_type: type)
    elsif id
      @deliverables = Deliverable.where(user_id: id)
    else
      @deliverables = Deliverable.all
    end
    serializedDeliverables = [];
    @deliverables.each do |deliverable|
      deliverable_serializer = DeliverableSerializer.new(deliverable: deliverable)
      serializedDeliverables << deliverable_serializer.serialize_deliverable(deliverable)
    end

    render json: serializedDeliverables
  end

  # GET /deliverables/1
  def show
    deliverable_serializer = DeliverableSerializer.new(deliverable: @deliverable)
    render json: deliverable_serializer.serialize_deliverable(@deliverable)
  end

  # POST /deliverables
  def create
    @deliverable = Deliverable.create(deliverable_params())
    if @deliverable.valid?()
      deliverable_serializer = DeliverableSerializer.new(deliverable: @deliverable)
      render json: deliverable_serializer.serialize_new_deliverable()
    else
      render json: @deliverable.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliverables/1
  def update
    if @deliverable.update(deliverable_params)
      deliverable_serializer = DeliverableSerializer.new(deliverable: @deliverable)
      render json: deliverable_serializer.serialize_deliverable(@deliverable)
    else
      render json: @deliverable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deliverables/1
  def destroy
    @deliverable.destroy
  end

  def upload
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliverable
      @deliverable = Deliverable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deliverable_params
      params.permit(:user_id, :name, :approved, :comment, :deliverable_type, :grade, :file)
    end
end
