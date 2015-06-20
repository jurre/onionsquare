class DailyStatisticsJob < ActiveJob::Base
  queue_as :default

  def perform
    stat = Stat.where("created_at >= ?", Time.zone.now.beginning_of_day).first
    stat ||= Stat.new
    stat.totals["users"] = User.count
    stat.totals["orders"] = Orders.count
    stat.totals["products"] = Products.count
    stat.totals["active_users"] = User.where(
      "current_sign_in_at >= ?
      AND confirmed_at IS NOT NULL
      AND active = true",
      Time.zone.now.beginning_of_day
    ).count
    stat.save!
  end
end
