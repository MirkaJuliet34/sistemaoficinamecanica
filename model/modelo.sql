CREATE DATABASE sistema_mecanica;
USE sistema_mecanica;

-- Criando a tabela Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(15)
);

-- Criando a tabela Veículo
CREATE TABLE Veiculo (
    veiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    ano YEAR,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Criando a tabela Equipe
CREATE TABLE Equipe (
    equipe_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela Mecânico
CREATE TABLE Mecanico (
    mecanico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    especialidade VARCHAR(50),
    equipe_id INT,
    FOREIGN KEY (equipe_id) REFERENCES Equipe(equipe_id)
);

-- Criando a tabela Ordem de Serviço (OS)
CREATE TABLE OS (
    os_id INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    status ENUM('Aguardando', 'Em Execução', 'Concluído') DEFAULT 'Aguardando',
    data_conclusao DATE,
    veiculo_id INT,
    equipe_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
    FOREIGN KEY (equipe_id) REFERENCES Equipe(equipe_id)
);

-- Criando a tabela Serviço
CREATE TABLE Servico (
    servico_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Criando a tabela Peça
CREATE TABLE Peca (
    peca_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Criando tabela associativa para OS e Serviço
CREATE TABLE OS_Servico (
    os_id INT,
    servico_id INT,
    PRIMARY KEY (os_id, servico_id),
    FOREIGN KEY (os_id) REFERENCES OS(os_id),
    FOREIGN KEY (servico_id) REFERENCES Servico(servico_id)
);

-- Criando tabela associativa para OS e Peça
CREATE TABLE OS_Peca (
    os_id INT,
    peca_id INT,
    PRIMARY KEY (os_id, peca_id),
    FOREIGN KEY (os_id) REFERENCES OS(os_id),
    FOREIGN KEY (peca_id) REFERENCES Peca(peca_id)
);
