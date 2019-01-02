class BudgetFacade

  def initialize(data)
    @name = data[:name]
    @types = data[:types]
    @budget_categories = {"bar" => ["Bars", "Dining Out", "Drinks"],
                          "restaurant" => ["Restaurants", "Eating Out", "Dining", "Dining Out"],
                          "store" => ["Clothing", "Gifts"],
                          "bowling_alley" => ["Entertainment", "Bowling", "For Fun"]}
  end

  def location_name
    @name
  end

  def location_budgets(data)
    requested_budgets = request_budgets(data)
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

  def request_budgets(data)
    service = YnabService.new(data)
    budgets = service.budget_categories

    # conn = Faraday.new(url: 'https://api.youneedabudget.com')

    # response = conn.get "/v1/budgets/#{budget_id}" do |f|
    #   f.headers['Authorization'] = "Bearer #{token}"
    # end
    # budget_data = JSON.parse(response.body, symbolize_names: true)[:data][:budget][:categories]
    budgets.map do |budget|
      Budget.new(budget[:name],
                budget[:balance])
    end
  end


end
