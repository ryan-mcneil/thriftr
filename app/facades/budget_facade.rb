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

  def location_budgets
    requested_budgets = request_budgets
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

  def request_budgets



    conn = Faraday.new(url: 'https://api.youneedabudget.com')

    # udpate environmental variable with current_user.ynab_budget_id
    response = conn.get "/v1/budgets/#{ENV['YNAB_BUDGET_ID']}" do |f|
      # f.headers['Authorization'] = "Bearer #{ENV['YNAB_API_KEY']}"
    end

    budget_data = JSON.parse(response.body, symbolize_names: true)[:data][:budget][:categories]
    budgets = budget_data.map do |budget|
      Budget.new(budget[:name],
                budget[:balance])
    end
    budgets
  end
end
