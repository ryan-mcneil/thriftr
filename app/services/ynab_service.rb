class YnabService

  def initialize(token)
    @token = token
  end

  def budget_id
    budget_data = JSON.parse(response.body, symbolize_names: true)
    budget_data[:data][:budgets][0][:id]
  end

private

  def token
    @token
  end

  def conn
    Faraday.new(url: 'https://api.youneedabudget.com')
  end

  def response
    conn.get "/v1/budgets" do |f|
      f.headers['Authorization'] = "Bearer #{token}"
    end
  end

end
