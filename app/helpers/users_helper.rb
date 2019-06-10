module UsersHelper

	def balance_price
		income_price = Income.find_by(
			user_id: current_user.id,
			payday: Time.now.all_month
			)
		total_price = current_user.variable_costs.where(
			payment_day: Time.now.all_month).sum(:price)

		return income_price.income - total_price
	end

end
