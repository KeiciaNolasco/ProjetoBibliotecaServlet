-- Criando e Verificando a existência da tabela livros:

CREATE TABLE IF NOT EXISTS books (
    isbn VARCHAR PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    category VARCHAR,
    quantity INT NOT NULL,
    image VARCHAR
);

-- Inserindo os dados na tabela livros:

INSERT INTO books (isbn, title, category, quantity, image)
VALUES
    ('978-3-16-148410-0', 'Harry Potter and the Philosopher is Stone', 'Fantasy', 5, 'images/Livro1.png'),
    ('978-1-23-456789-7', 'Harry Potter and the Chamber of Secrets', 'Fantasy', 1, 'images/Livro2.png'),
    ('978-0-12-345678-9', 'Harry Potter and the Prisoner of Azkaban', 'Fantasy', 10, 'images/Livro3.png'),
    ('978-3-16-148410-1', 'Harry Potter and the Goblet of Fire', 'Fantasy', 8, 'images/Livro4.png'),
    ('978-1-23-456789-8', 'Harry Potter and the Order of the Phoenix', 'Fantasy', 4, 'images/Livro5.png'),
    ('978-0-12-345678-0', 'Harry Potter and the Half-Blood Prince', 'Fantasy', 2, 'images/Livro6.png'),
    ('978-3-16-148410-2', 'Harry Potter and the Deathly Hallows', 'Fantasy', 3, 'images/Livro7.png')
ON CONFLICT (isbn) DO NOTHING;

-- Criando e Verificando a existência da tabela usuarios:

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR NOT NULL
);

-- Inserindo os dados na tabela usuarios:

INSERT INTO users (name, email, password)
VALUES
    ('Keicia Nolasco', 'keicia@gmail.com', '123456'),
    ('Dianini Souza', 'dianini2@example.com', '123456'),
    ('Lucas Schlestein', 'lucas3@example.com', '123456'),
    ('Fabricio Londero', 'fabricio@example.com', '123456')
ON CONFLICT (email) DO NOTHING;