class Stat < ActiveRecord::Base

end

# == Schema Information
#
# Table name: stats
#
#  id         :integer          not null, primary key
#  totals     :hstore           default({}), not null
#  created_at :datetime
#  updated_at :datetime
#

