**README.md - Explicação do Código Ruby**

Este código Ruby é um programa simples que interage com um banco de dados SQLite para gerenciar produtos em uma vitrine virtual. Vamos explicar cada parte do código:

### Função `create_database`

```ruby
def create_database
  # Cria ou conecta ao banco de dados SQLite chamado 'vitrine.db'
  db = SQLite3::Database.new 'vitrine.db'
  
  # Cria a tabela 'products' se ela ainda não existir
  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS products (
      id INTEGER PRIMARY KEY,
      name TEXT,
      description TEXT,
      price REAL
    );
  SQL
  
  # Fecha a conexão com o banco de dados
  db.close
rescue SQLite3::Exception => e
  # Captura e imprime exceções se ocorrerem durante a criação do banco de dados
  puts "Exception occurred: #{e}"
end
```

### Função `create_product`

```ruby
def create_product(name, description, price)
  # Conecta ao banco de dados SQLite
  db = SQLite3::Database.new 'vitrine.db'
  
  # Insere um novo produto na tabela 'products'
  db.execute "INSERT INTO products (name, description, price) VALUES (?, ?, ?)", [name, description, price]
  
  # Fecha a conexão com o banco de dados
  db.close
rescue SQLite3::Exception => e
  # Captura e imprime exceções se ocorrerem durante a inserção do produto
  puts "Exception occurred: #{e}"
end
```

### Função `list_products`

```ruby
def list_products
  # Conecta ao banco de dados SQLite
  db = SQLite3::Database.new 'vitrine.db'
  
  # Seleciona todos os produtos da tabela 'products'
  result = db.execute "SELECT * FROM products"
  
  # Imprime informações de cada produto
  result.each do |row|
    puts "ID: #{row[0]}, Nome: #{row[1]}, Descrição: #{row[2]}, Preço: #{row[3]}"
  end
  
  # Fecha a conexão com o banco de dados
  db.close
rescue SQLite3::Exception => e
  # Captura e imprime exceções se ocorrerem durante a listagem de produtos
  puts "Exception occurred: #{e}"
end
```

### Função `add_to_cart`

```ruby
def add_to_cart(product_id)
  # Aqui você deve implementar a lógica para adicionar um produto ao carrinho de compras,
  # por exemplo, adicionando-o a um array ou atualizando outra estrutura de dados.
  # Esta função está atualmente vazia e precisa ser implementada conforme necessário.
end
```

### Exemplo de Uso

```ruby
# Cria o banco de dados (se não existir) e tabela 'products'
create_database

# Solicita informações sobre um novo produto ao usuário
puts "Digite o nome do produto:"
name = gets.chomp
puts "Digite a descrição do produto:"
description = gets.chomp
puts "Digite o preço do produto:"
price = gets.chomp.to_f

# Adiciona o novo produto ao banco de dados
create_product(name, description, price)

# Lista todos os produtos disponíveis
list_products
```

Este código realiza as seguintes operações:
1. Cria ou conecta a um banco de dados SQLite chamado 'vitrine.db'.
2. Cria uma tabela chamada 'products' no banco de dados, se ela ainda não existir.
3. Solicita ao usuário informações sobre um novo produto (nome, descrição, preço).
4. Adiciona o novo produto à tabela 'products' no banco de dados.
5. Lista todos os produtos disponíveis na tabela 'products'.