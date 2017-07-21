# Digital Marketplace Framework Application Guidance

This is a template based on https://github.com/alphagov/tech-docs-template
for publishing the Digital Marketplace framework application guidance.

## Getting started

To preview or build the website, we need to use the terminal.

Install Ruby with Rubygems, perferably with a [Ruby version manager][rvm],
and the [Bundler gem][bundler].

In the application folder type the following to install the required gems:

```
make requirements
```

[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/

## Build

Type the following to build the HTML:

```
make build
```

This will create a `build` subfolder in the application folder which contains
the HTML and asset files ready to be published. If `make setup` has been
run the `build/` folder will be a worktree for the `gh-pages` branch.

## Preview

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser.

Type the following to start the server:

```
make server
```

Note: in order to preview the changes made to the markdown files you need to rerun
`make build`.

## Making changes

To make changes edit the source files in the `source` folder.

Although a single page of HTML is generated the markdown is spread across
multiple files to make it easier to manage. They can be found in
`source/documentation`.

A new markdown file isn't automatically included in the generated output. If we
add a new markdown file at the location `source/documentation/agile/scrum.md`,
the following snippet in `source/index.html.md.erb`, includes it in the
generated output.

```
<%= partial 'documentation/agile/scrum' %>
```

Including files manually like this lets us specify the position they appear in
the page.

## Publish

To rebuild and push the new version of documentation to Github Pages run

```
make publish
```
