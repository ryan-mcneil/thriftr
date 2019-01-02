class YnabService

  def initialize(filter)
    @token = filter[:token]
    @budget_id = filter[:budget_id]
  end

  def return_budget_id
    budget_data = JSON.parse(response_budget_id.body, symbolize_names: true)
    budget_data[:data][:budgets][0][:id]
  end

  def budget_categories
    budget_data = JSON.parse(response_categories.body, symbolize_names: true)
    budget_data[:data][:budget][:categories]
  end

private

  def token
    @token
  end

  def budget_id
    @budget_id
  end

  def conn
    Faraday.new(url: 'https://api.youneedabudget.com')
  end

  def response_budget_id
    conn.get "/v1/budgets" do |f|
      f.headers['Authorization'] = "Bearer #{token}"
    end
  end

  def response_categories
    conn.get "/v1/budgets/#{budget_id}" do |f|
      f.headers['Authorization'] = "Bearer #{token}"
    end
  end

end
