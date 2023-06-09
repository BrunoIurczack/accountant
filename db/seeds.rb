# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  customer = Customer.find_or_create_by!(
      name: "MATHEUS VISONT SOLUCOES DIGITAIS LTDA ### - #{i}",
      plan: "Simples Nacional",
      value: 150,
      contact: "(41) 9878-0737",
      tasks: "Empresa de tecnologia optante pelo Simples Naciona."
  )

  5.times do |i|
      Payment.find_or_create_by!(
          month: Date.today,
          paid: true,
          customer: customer
      )
  end
end
