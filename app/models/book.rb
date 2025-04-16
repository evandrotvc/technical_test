class Book < ApplicationRecord
  validates :title, presence: true

  enum status: { avaliable: 'avaliable' , reserved: 'reserved', checked_out: 'checked out' }

  def is_unavaliable?
    self.reserved? || self.checked_out? 
  end

  def update_email_and_reserved(email:)
    self.update!(email: email, status: 'reserved')
  end
end