require 'sqlite3'

# Estabelece conexão com o banco de dados SQLite
def create_database
 begin
    db = SQLite3::Database.new 'vitrine.db'
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        price REAL
      );
    SQL
    db.close
 rescue SQLite3::Exception => e
    puts "Exception occurred: #{e}"
 end
end

# Cria um novo produto no banco de dados
def create_product(name, description, price)
 begin
    db = SQLite3::Database.new 'vitrine.db'
    db.execute "INSERT INTO products (name, description, price) VALUES (?, ?, ?)", [name, description, price]
    db.close
 rescue SQLite3::Exception => e
    puts "Exception occurred: #{e}"
 end
end

# Lista todos os produtos disponíveis
def list_products
 begin
    db = SQLite3::Database.new 'vitrine.db'
    result = db.execute "SELECT * FROM products"
    result.each do |row|
      puts "ID: #{row[0]}, Nome: #{row[1]}, Descrição: #{row[2]}, Preço: #{row[3]}"
    end
    db.close
 rescue SQLite3::Exception => e
    puts "Exception occurred: #{e}"
 end
end

# Adiciona um produto ao carrinho
def add_to_cart(product_id)
 # Aqui você pode implementar a lógica de adicionar um produto ao carrinho de compras, por exemplo, adicionando-o a um array.
end

# Exemplo de uso
create_database

puts "Digite o nome do produto:"
name = gets.chomp
puts "Digite a descrição do produto:"
description = gets.chomp
puts "Digite o preço do produto:"
price = gets.chomp.to_f

create_product(name, description, price)

list_products