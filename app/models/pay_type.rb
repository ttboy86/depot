class PayType < ActiveRecord::Base
  belongs_to :order
  
  def self.names
  all.collect { |payment_type| payment_type.name }
  end
  
end
