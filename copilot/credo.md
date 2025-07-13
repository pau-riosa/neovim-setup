Run `mix credo` and fix all issues.

If an issue involves single pipe and Ecto, extract the query into a variable and then pass in that variable.
If an issue involves ABC size or cyclomatic complexity, extrat any variable assignment into private functions on the module.
