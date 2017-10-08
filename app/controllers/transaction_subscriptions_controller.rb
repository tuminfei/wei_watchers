class TransactionSubscriptionsController < ApiController

  def create
    subscription = build_transaction_subscription
    if subscription.save
      success_response({
        id: subscription.xid,
        xid: subscription.xid,
      })
    else
      errors = subscription.errors.full_messages +
      filter_errors = subscription.filter ? subscription.filter.errors.full_messages : []
      failure_response (errors + filter_errors)
    end
  end


  private

  def build_transaction_subscription
    subscriber.transaction_subscriptions.build({
      account_id: find_account.id,
      end_at: Time.at(params[:endAt].to_i),
      from_block: params[:fromBlock],
      to_block: params[:toBlock],
      trans_type: params[:trans_type]
    })
  end

  def filter_params
    {
      account: find_account,
      from_block: params[:fromBlock],
      to_block: params[:toBlock],
    }
  end

  def find_account
    if address = params[:account] || params[:address]
      Account.find_or_create_by address: address
    else
      nil
    end
  end

end
