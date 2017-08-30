class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :slides, dependent: :destroy

  after_create do
    self.slides.create(content: self.title, order: 1)
  end

  after_update do
    self.slides.find_by(order: 1).update(content: self.title)
  end

end
