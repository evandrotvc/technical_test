class Book < ApplicationRecord
  validates :title, presence: true

  enum status: { avaliable: 'avaliable' , reserved: 'reserved', checked_out: 'checked out' }

  def is_avaliable?
    self.reserved? || self.checked_out? 
  end
end