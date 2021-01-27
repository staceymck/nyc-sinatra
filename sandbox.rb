moses = Figure.create(name: "Moses")
smith = Figure.create(name: "Smith")

bqe = Landmark.create(name: "BQE", year_completed: 1947)
tunnel = Landmark.create(name: "Tunnel", year_completed: 1927)

mayor = Title.create(name: "Mayor")
pres = Title.create(name: "Pres")

moses.titles << mayor
moses.title = pres

# How to iterate over attributes like figure.titles?
<% if !figure.titles.empty? %>
    <% figure.titles.each do |title| %>
      <%= title.name %>
    <% end %>
  <% end %>