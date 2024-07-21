-- Criando e Verificando a existência da tabela livros:

CREATE TABLE IF NOT EXISTS livros (
    isbn VARCHAR PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    categoria VARCHAR,
    quantidade INT NOT NULL
);

-- Inserindo os dados na tabela livros:

INSERT INTO livros (isbn, titulo, categoria, quantidade)
VALUES
    ('978-3-16-148410-0', 'Harry Potter e a Pedra Filosofal', 'Fantasia', 5),
    ('978-1-23-456789-7', 'Harry Potter e a Câmara Secreta', 'Fantasia', 1),
    ('978-0-12-345678-9', 'Harry Potter e o Prisioneiro de Azkaban', 'Fantasia', 10),
    ('978-3-16-148410-1', 'Harry Potter e o Cálice de Fogo', 'Fantasia', 8),
    ('978-1-23-456789-8', 'Harry Potter e a Ordem da Fênix', 'Fantasia', 4),
    ('978-0-12-345678-0', 'Harry Potter e o Enigma do Príncipe', 'Fantasia', 2),
    ('978-3-16-148410-2', 'Harry Potter e as Relíquias da Morte', 'Fantasia', 3)
ON CONFLICT (isbn) DO NOTHING;

-- Criando e Verificando a existência da tabela usuarios:

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE
);

-- Inserindo os dados na tabela usuarios:

INSERT INTO usuarios (nome, email, senha, is_admin)
VALUES
    ('Keicia Nolasco', 'keicia@gmail.com', '123456', TRUE),
    ('Dianini Souza', 'dianini2@example.com', '123456', TRUE),
    ('Lucas Schlestein', 'lucas3@example.com', '123456', TRUE),
    ('Fabricio Londero', 'fabricio@example.com', '123456', TRUE)
ON CONFLICT (email) DO NOTHING;