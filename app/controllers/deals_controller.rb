class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]

  # GET /deals or /deals.json
  def index
    @deals = Deal.where(category_id: params[:category_id]).order(created_at: :desc)
    @category = Category.find(params[:category_id])
  end

  # GET /deals/1 or /deals/1.json
  def show; end

  # GET /deals/new
  def new
    @deal = Deal.new
    @category = Category.find(params[:category_id])
    p @category
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals or /deals.json
  def create
    @user = current_user
    @category = Category.find(params[:category_id])
    @deal = Deal.create(user: current_user, category_id: @category.id, name: deal_params['name'],
                        amount: deal_params['amount'])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to category_deals_path(@category) }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1 or /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to deal_url(@deal), notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1 or /deals/1.json
  def destroy
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to category_deals_path, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
