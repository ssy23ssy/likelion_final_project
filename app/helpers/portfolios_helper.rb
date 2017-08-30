module PortfoliosHelper
  def no_portfolio(portfolios)
    if portfolios.blank?
      content_tag(:div, class: 'empty d-flex justify-content-center align-items-center') do
        content_tag(:p, '아무 것도 없군요! 지금 바로 간편하게 만들어보세요.')
      end
    end
  end
end
