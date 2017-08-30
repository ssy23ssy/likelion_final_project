class Slide < ApplicationRecord
  belongs_to :portfolio

  after_destroy do
    portfolio = self.portfolio
    portfolio.slides.reverse_each do |s|
      if s.order > self.order
        s.order = s.order - 1
        s.save
      end
    end
  end
end
