# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RadioSystemProject.Repo.insert!(%RadioSystemProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RadioSystemProject.Repo
alias RadioSystemProject.Radiosystem.Radio
Repo.insert! %Radio{alias: "Radio1", location: "CPH-1", allowed_locations: ["1", "2"]}
Repo.insert! %Radio{alias: "Radio2", location: "CPH-2", allowed_locations: ["1", "2"]}