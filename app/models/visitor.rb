class Visitor < ActiveRecord::Base

  def self.return_visitors
    where('page_visits > 1')
  end

  def self.unique_visitors
    where(page_visits: 1)
  end
  

  def self.mobile_users
    where(mobile: true)
  end
 

  def self.non_mobile_users
    where(mobile: false)
  end

  def self.total_visitors
    sum(:page_visits)
  end
  
end
