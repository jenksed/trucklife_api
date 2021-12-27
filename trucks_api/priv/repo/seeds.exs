# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TrucksApi.Repo.insert!(%TrucksApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TrucksApi.Repo
alias TrucksApi.Directory.Event

Repo.insert! %Event{name: "Bobs Tacos", description: "Short Description", start_date: ~D[2021-12-30], end_date: ~D[2021-12-31], start_time: ~T[23:00:07], end_time: ~T[23:00:07], tags: ["Tacos", "Barria"]}

Repo.insert! %Event{name: "Pizza Galore", description: "Short Description", start_date: ~D[2021-12-30], end_date: ~D[2021-12-31], start_time: ~T[23:00:07], end_time: ~T[23:00:07], tags: ["Pizza", "Italian"]}

Repo.insert! %Event{name: "Bobs Burgers", description: "Short Description", start_date: ~D[2021-12-30], end_date: ~D[2021-12-31], start_time: ~T[23:00:07], end_time: ~T[23:00:07], tags: ["Burgers", "Fries"]}