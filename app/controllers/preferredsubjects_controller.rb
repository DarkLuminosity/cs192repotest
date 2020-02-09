class PreferredsubjectsController < ApplicationController
  before_action :set_preferredsubject, only: [:show, :edit, :update, :destroy]

  # GET /preferredsubjects
  # GET /preferredsubjects.json
  def index
    @preferredsubjects = Preferredsubject.all
  end

  # GET /preferredsubjects/1
  # GET /preferredsubjects/1.json
  def show
  end

  # GET /preferredsubjects/new
  def new
    @preferredsubject = Preferredsubject.new
    @courses = Course.all
  end

  # GET /preferredsubjects/1/edit
  def edit
    @courses = Course.all
  end

  # POST /preferredsubjects
  # POST /preferredsubjects.json
  def create
    @preferredsubject = Preferredsubject.new(preferredsubject_params)

    respond_to do |format|
      if @preferredsubject.save
        format.html { redirect_to @preferredsubject, notice: 'Preferredsubject was successfully created.' }
        format.json { render :show, status: :created, location: @preferredsubject }
      else
        format.html { render :new }
        format.json { render json: @preferredsubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferredsubjects/1
  # PATCH/PUT /preferredsubjects/1.json
  def update
    respond_to do |format|
      if @preferredsubject.update(preferredsubject_params)
        format.html { redirect_to @preferredsubject, notice: 'Preferredsubject was successfully updated.' }
        format.json { render :show, status: :ok, location: @preferredsubject }
      else
        format.html { render :edit }
        format.json { render json: @preferredsubject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferredsubjects/1
  # DELETE /preferredsubjects/1.json
  def destroy
    @preferredsubject.destroy
    respond_to do |format|
      format.html { redirect_to preferredsubjects_url, notice: 'Preferredsubject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preferredsubject
      @preferredsubject = Preferredsubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preferredsubject_params
      params.require(:preferredsubject).permit(:user_id, :course_id)
    end
end
