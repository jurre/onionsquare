desc "generate statistics"
task generate_daily_statistics: :environment do
  DailyStatisticsJob.perform_later
end
