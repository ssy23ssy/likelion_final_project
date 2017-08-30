class SlidesController < ApplicationController
  before_action :set_portfolio
  before_action :builder_confirm, except: :show
  before_action :set_slide, except: [:new, :create]

  def show
  end

  def new
    @slide = @portfolio.slides.new
  end

  def create
    @slide = @portfolio.slides.new(slide_params)
    @slide.order = @portfolio.slides.count + 1
    @slide.save

    redirect_to @portfolio
  end

  def edit
  end

  def update
    @slide.update(slide_params)

    redirect_to portfolio_show_slide_path(@portfolio.id, @slide.order)
  end

  def destroy
    @slide.destroy

    redirect_to @portfolio
  end

  def next_order
    @next_slide = @portfolio.slides.find_by(order: params[:order].to_i + 1)

    @slide.order = @slide.order + 1
    @next_slide.order = @next_slide.order - 1
    @slide.save
    @next_slide.save

    redirect_to portfolio_show_slide_path(@portfolio.id, @slide.order)
  end

  def prev_order
    @prev_slide = @portfolio.slides.find_by(order: params[:order].to_i - 1)

    @slide.order = @slide.order - 1
    @prev_slide.order = @prev_slide.order + 1
    @slide.save
    @prev_slide.save

    redirect_to portfolio_show_slide_path(@portfolio.id, @slide.order)
  end


  private

  def slide_params
    params.require(:slide).permit(:content)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def set_slide
    @slide = @portfolio.slides.find_by(order: params[:order])
  end

  def builder_confirm
    redirect_to '/' if current_user.id != @portfolio.user_id
  end
end
