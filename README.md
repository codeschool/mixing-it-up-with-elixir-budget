# Budget

This is the app built in the [Mixing It Up With Elixir](https://www.codeschool.com/courses/mixing-it-up-with-elixir) course.

This app makes a call to an external API hosted on Heroku.
If at first the program fails, make sure the API is up by running:

```
curl -i cs-currency-rates.herokuapp.com/currency-rates
```

## Installing

Once you clone the project, run `mix deps.get` to install
the dependencies.

## Running

Here's one way to run this project:

```
mix run -e "Budget.Conversion.from_euro_to_dollar(15) |> IO.puts"
```
