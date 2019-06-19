module UsersHelper

	def variable_sum_price
		current_user.variable_costs.where(
			payment_day: Time.now.all_month).sum(:price)
	end

	def fixed_sum_price
		current_user.fixed_costs.where(
			fixed_cost_time: Time.now.all_month).sum(:fixed_cost_price)
	end

	def total_price
		variable_sum_price + fixed_sum_price
	end

	def balance_price
		income_price = Income.find_by(
			user_id: current_user.id,
			payday: Time.now.all_month
			)

		return income_price.income - total_price
	end

end
