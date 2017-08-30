class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio, only: [:show, :update, :destroy]

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = Portfolio.where(user_id: current_user.id)
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @user = User.find(current_user.id)
    @portfolio = @user.portfolios.new(portfolio_params)

    @portfolio.save
    redirect_to portfolios_path
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    @portfolio.update(portfolio_params)
    redirect_to @portfolio
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    redirect_to portfolios_url
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def portfolio_params
    params.require(:portfolio).permit(:title)
  end

end
