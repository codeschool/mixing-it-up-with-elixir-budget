defmodule Budget.Conversion do
  def from_euro_to_dollar(amount) do
    url = "cs-currency-rates.herokuapp.com/currency-rates"
    case HTTPoison.get(url) do
      {:ok, response} -> parse(response) |> convert(amount)
      {:error, _} -> "Error fetching rates"
    end
  end

  defp parse(%{status_code: 200, body: json_response}) do
    Poison.Parser.parse(json_response)
  end

  defp convert({:ok, rates}, amount) do
    rate = find_euro(rates)
    amount / rate
  end

  defp find_euro([%{"currency" => "euro", "rate" => rate} | _]) do
    rate
  end

  defp find_euro([_|tail]) do
    find_euro(tail)
  end

  defp find_euro([]) do
    raise "No rate found for euro"
  end

end
