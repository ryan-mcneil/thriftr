class BudgetFacade

  def initialize(name, types)
    @name = name
    @types = types
    @budget_categories = {"bar" => ["Bars", "Dining Out", "Drinks"],
                          "restaurant" => ["Restaurants", "Eating Out", "Dining", "Dining Out"],
                          "store" => ["Clothing", "Gifts"],
                          "bowling_alley" => ["Entertainment", "Bowling", "For Fun"]}
  end

  def location_name
    @name
  end

  def location_budgets(budget_id, token)
    requested_budgets = request_budgets(budget_id, token)
    budgets = []
    @types.each do |type|
      @budget_categories[type].each do |name|
        requested_budgets.each do |budget|
          budgets << budget if budget.name == name
        end
      end
    end
    budgets.uniq
  end

  def request_budgets(budget_id, token)
    conn = Faraday.new(url: 'https://api.youneedabudget.com')

    response = conn.get "/v1/budgets/#{budget_id}" do |f|
      f.headers['Authorization'] = "Bearer #{token}"
    end

    budget_data = JSON.parse(response.body, symbolize_names: true)[:data][:budget][:categories]
    budgets = budget_data.map do |budget|
      Budget.new(budget[:name],
                budget[:balance])
    end
    budgets
  end


end
