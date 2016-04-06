# Seller would store user info
#
# Product would store:
#   - price
#   - seller_id
#
# Transaction (instead of Purchase) would store:
#   - seller_id (indexed)
#   - product_id
#   - amount_exchanged
#   - refund ( default false )
#   - created_at
#
# To determine the balance the query method would look like:
#
# profit = Transaction.where(seller_id: seller_id, refund: false).where("created_at >= ? and created_at <= ?", start_date, end_data).sum(:amount_exchanged)
# refund = Transaction.where(seller_id: seller_id, refund: true).where("created_at >= ? and created_at <= ?", start_date, end_data).sum(:amount_exchanged)
# return profit - refund
#
# ActiveRecord sum would allow Postgresql or MySql to do the heavy lifting and add up the amounts
# instead of loading all of the objects in ruby memory and then doing a reduce on the results.
#
# When someone buys a product we record the price the product is sold because the product price can change.
# Transactions should be stateful, i.e. we need to record the amount of money exchanged, so we can acurately refund a customer.
# This also allows us to run analytics and show sellers performance of their product base on their prices.


