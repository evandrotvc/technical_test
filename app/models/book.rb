class Book < ApplicationRecord
  validates :title, presence: true
  belongs_to :author

  enum status: { avaliable: 'avaliable', reserved: 'reserved',
                 checked_out: 'checked_out' }

  def unavaliable?
    reserved? || checked_out?
  end

  def update_email_and_reserved(email:)
    update!(email:, status: 'reserved')
  end
end
