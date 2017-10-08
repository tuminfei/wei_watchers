require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    system "rails runner '#{job}'"
  end

  every(1.minute, 'SubscriptionCheck.schedule_checks')
  every(1.minute, 'BalanceCheck.schedule_checks')
  every(1.minute, 'TransactionSubscriptionCheck.schedule_checks')
  every(1.minute, 'TransactionReceiptSubscriptionCheck.schedule_checks')
end
