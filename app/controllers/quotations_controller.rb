class QuotationsController < ApplicationController
  # skip_before_action :verify_authenticity_token, raise: false
  # skip_after_action :verify_authorized
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  # GET /quotations
  # GET /quotations.json
  def index
    # @c = cookies[:quotations]
    if params[:cookies] == 'GET_COOKIES'
      session[:destroy] = false
      cookies.delete :quotations
      @quotations = Quotation.all
    end
    if cookies[:quotations]
      cook = cookies[:quotations].split(',').map(&:to_i)
      # puts cook
      @quotations = Quotation.where.not(id: cook)
    else
      @quotations = Quotation.all
    end
    @exp = Quotation.all
    respond_to do |format|
      format.html
      format.json { render json: @exp }
      format.xml { render xml: @exp.map(&:as_json).to_xml }
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)
    respond_to do |format|
       if params[:newcategory][:id]
        @quotation.category = params[:newcategory][:id]
       end
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    # @quotation.destroy
    @quotations = cookies[:quotations]
    if @quotations.blank?
      @quotations = cookies[:quotations] = params[:id]
    else
      cookies[:quotations] = @quotations + ',' + params[:id]
    end
    session[:destroy] = true
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def search
    search = params[:search]
    if cookies[:quotations]
      cook = cookies[:quotations].split(',').map(&:to_i)
      @quotations = Quotation.where.not(id: cook).where("author_name LIKE ?", "%#{search}%").to_a
    else
       @quotations = Quotation.where("author_name LIKE ?", "%#{search}%").to_a
    end
    render 'index'
  end

  def sort
    sort = params[:sort_name]
    if params[:sort_name] === 'date' && !cookies[:quotations]
      # puts 'date inside'
      @quotations = Quotation.order(created_at: :desc)
      @sort_by = "category"
    elsif params[:sort_name] === 'date' && cookies[:quotations]
      # puts 'cook date inside'
      cook = cookies[:quotations].split(',').map(&:to_i)
      @quotations = Quotation.where.not(id: cook).order(created_at: :desc)
      @sort_by = "category"
    elsif params[:sort_name] === "category" && !cookies[:quotations]
      # puts 'cat inside'
      @quotations = Quotation.order(category: :asc)
      @sort_by = "date"
    elsif params[:sort_name] === 'category' && cookies[:quotations]
      # puts 'cook cat inside'
      cook = cookies[:quotations].split(',').map(&:to_i)
      @quotations = Quotation.where.not(id: cook).order(category: :asc)
      @sort_by = "date"
    else
      @quotations = Quotation.order(created_at: :asc)
    end
    # @quotations = Quotation.all()
    render 'sort'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quotation_params
      params.require(:quotation).permit(:author_name, :category, :quotation)
    end
end