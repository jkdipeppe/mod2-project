class Guest < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :shows, through: :tickets
  has_secure_password

  def money_spent
    self.tickets.map {|ticket| ticket.price }.reduce(:+)
  end

  def num_vip_tickets
    self.tickets.select {|ticket| ticket.ticket_type == "VIP"}.count
  end
  
  def num_ga_tickets
    self.tickets.select {|ticket| ticket.ticket_type == "General Admission"}.count
  end


end
