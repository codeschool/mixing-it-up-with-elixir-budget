defmodule Budget do
  def current_balance(initial, spending) do
    initial - spending
  end
end
