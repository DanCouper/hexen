defmodule Hexen.Package do
  @moduledoc """
  The core struct used to describe package information.
  Flattens the Hex API response and adds additional information
  cribbed from a variety of possible external sources.

  ## Low-hanging fruit

  - [ ] Total number of packages; this can be used to easily calculate
        the number of paged HTTP responses (there are 100 per page).
  - [ ] Tags: currently just part of the dependencies string,
        and have to be parsed out. Going forward, PR against Hex to make
        a seperate list. Making the tags useful can be an initial goal.
  - [ ] Maintainers: locating/tagging unmaintained projects would be useful?
  - [ ] Dependencies: this would be useful to have in Hex, much easier
        to generate a list of dependencies initially, rather than parsing
        out once the package has already been created.

  ## Core information

  The basic package information

    * `name` - the unique hex package name
    * `description` - NOTE currently this includes the tags.
    * `tags` - a list of tags.
    * `url` - link to Hex entry for the package.
    * `licences` - list of licences used.
    * `maintainers` - list of project maintainers, or nil if none.
    * `latest_version` - the versions uploaded to Hex get added to a list
      of releases. The first entry on the list is always the newest, so
      the version number can be pulled from there
    * `updated_at` - the latest update.
    * `inserted_at` - the initial hex.pm creation date.
    * `dependencies` - list of dependencies, nil if none.

  ## Repo information

    * `repo_source` - GitHub, GitLab, BitBucket, etc. (NOTE only GH supported at first)
    * `repo_url` - URL for repo.
    * `repo_stars` -
    * `repo_issues` -
    * `repo_oldest_issue` -
    * `repo_newest_issue` -
    * `repo_has_readme` -
    * `repo_has_changelog` -
  """

  @type t :: %__MODULE__{
    ## Core information
    name: String.t(),
    description: String.t(),
    tags: [String.t()],
    url: String.t(),
    licences: [String.t()],
    maintainers: [String.t()] | nil,
    current_version: String.t(),
    updated_at: DateTime.t(),
    inserted_at: DateTime.t(),
    # versions: integer(),
    # releases: [%{url: String.t(), version: String.t()}],
    # dependencies: [String.t()] | nil,

    repo_source: String.t() | nil,
    repo_url: String.t() | nil,
    repo_stars: integer() | nil,
    repo_issues: integer() | nil,
    repo_oldest_issue: DateTime.t() | nil,
    repo_newest_issue: DateTime.t() | nil,
    repo_has_readme: boolean(),
    repo_has_changelog: boolean(),
  }

  defstruct name: "ExampleHexPackage",
            description: "ExampleHexPackage description.",
            tags: ~w(example hex package tags),
            url: "example.com/example_hex_package",
            licences: nil,
            maintainers: nil,
            current_version: "1000.1.1",
            updated_at: %DateTime{},
            inserted_at: %DateTime{},
end
