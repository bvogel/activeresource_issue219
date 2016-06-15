class TestObjectsController < ApplicationController
  before_action :set_test_object, only: [:show, :edit, :update, :destroy]

  # GET /test_objects
  # GET /test_objects.json
  def index
    @test_objects = TestObject.all
  end

  # GET /test_objects/1
  # GET /test_objects/1.json
  def show
  end

  # GET /test_objects/new
  def new
    @test_object = TestObject.new
  end

  # GET /test_objects/1/edit
  def edit
  end

  # POST /test_objects
  # POST /test_objects.json
  def create
    @test_object = TestObject.new(test_object_params)

    respond_to do |format|
      if @test_object.save
        format.html { redirect_to @test_object, notice: 'Test object was successfully created.' }
        format.json { render :show, status: :created, location: @test_object }
      else
        format.html { render :new }
        format.json { render json: @test_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_objects/1
  # PATCH/PUT /test_objects/1.json
  def update
    respond_to do |format|
      if @test_object.update(test_object_params)
        format.html { redirect_to @test_object, notice: 'Test object was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_object }
      else
        format.html { render :edit }
        format.json { render json: @test_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_objects/1
  # DELETE /test_objects/1.json
  def destroy
    @test_object.destroy
    respond_to do |format|
      format.html { redirect_to test_objects_url, notice: 'Test object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_object
      @test_object = TestObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_object_params
      params.require(:test_object).permit(:value)
    end
end
