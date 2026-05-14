User.find_or_create_by(username: "vivek") do |u|
  u.password = "vivek"
  u.password_confirmation = "vivek"
end

puts "User 'vivek' created."

tables_data = [
  { table_number: 1, capacity: 2 },
  { table_number: 2, capacity: 4 },
  { table_number: 3, capacity: 4 },
  { table_number: 4, capacity: 6 },
  { table_number: 5, capacity: 8 }
]

tables_data.each do |data|
  Table.find_or_create_by(table_number: data[:table_number]) do |t|
    t.capacity = data[:capacity]
  end
end

puts "5 tables created."
