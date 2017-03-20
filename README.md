# Hexen

## Reference

**[Curated Hex Packages thread on the Elixir forum](https://elixirforum.com/t/curated-hex-packages/1713)**

* [GenStage](https://hexdocs.pm/gen_stage/GenStage.html)
* [GenStage Examples](https://github.com/elixir-lang/gen_stage/tree/master/examples)
* [The Hex API docs](docs.hexpm.apiary.io/)
* [HTTPoison](https://github.com/edgurgel/httpoison)
* [HTTPoison options](http://elixirdistilled.com/post/httpoison_options/index.html)
* [Elixir Flow-based Programming](http://www.elixirfbp.org/)
* [Introducing `with`](https://gist.github.com/josevalim/8130b19eb62706e1ab37)
* [Plug's `Conn` module](https://github.com/elixir-lang/plug/blob/master/lib/plug/conn.ex)
* [DateTime module](https://hexdocs.pm/elixir/DateTime.html)
* [Typespecs](https://hexdocs.pm/elixir/typespecs.html)


* [Fetching Reddit posts using Elixir.](http://learningelixir.joekain.com/fetching-reddit-posts-from-elixir/)
* [Building product recommendations using GenStage and Flow.](https://10consulting.com/2017/01/20/building-product-recommendations-using-elixir-gen-stage-flow/)
* [Tuning Elixir GenStage/Flow Pipeline Processing.](http://teamon.eu/2016/tuning-elixir-genstage-flow-pipeline-processing/)
* [Mocking APIs in Elixir.](https://hashrocket.com/blog/posts/mocking-api-s-with-elixir)
* [How to get GH project badges](http://stackoverflow.com/questions/28804771/how-to-get-project-badge-via-github-api)


Hex limits requests to 100/min, so need to rate limit (same for GH etc) -
[ExRated](https://github.com/grempe/ex_rated) would fit the bill.

Record responses for testing so that tests are snappy - [ExVCR](https://github.com/parroty/exvcr).
[Plus here's an investigation into using it.](https://10consulting.com/2016/11/07/http-unit-tests-in-elixir-using-exvcr/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hexen` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:hexen, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/hexen](https://hexdocs.pm/hexen).
