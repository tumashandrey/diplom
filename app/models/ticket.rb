class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :route


  # after_create :send_notification

  scope :user_tickets, ->(params) { joins(:user).where("tickets.user_id =  :user_id", user_id: params[:user].id) }
  scope :tickets_by_route, ->(route) { joins(:route).where("routes.id =  :route_id", route_id: route.id) }
  scope :tickets_by_route_and_type, ->(route, seats_type) { joins(:route).where("routes.id =  :route_id and seats_type = :seats_type", route_id: route.id, seats_type: seats_type) }

  validates :user, presence: true
  validates :route, presence: true
  validate :available_seats_number

  private

  def available_seats_number
    if route.available_seats < 1
      errors.add(:base, "Нет столько мест")
    end
  end
end
