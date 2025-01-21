-- criando tabelas

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    DataCadastro DATE NOT NULL
);


-- inserindo dados

INSERT INTO Clientes (Nome, Telefone, Email, DataCadastro)
VALUES
('João Silva', '41999999999', 'joao@email.com', '2025-01-20'),
('Maria Oliveira', '41988888888', 'maria@email.com', '2025-01-20'),
('Carlos Souza', '41977777777', 'carlos@email.com', '2025-01-21'),
('Ana Lima', '41966666666', 'ana@email.com', '2025-01-21');


-- função

DELIMITER //

CREATE FUNCTION ContarClientesPorDia(data DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalClientes INT;

    SELECT 
        COUNT(*) 
    INTO 
        totalClientes
    FROM 
        Clientes
    WHERE 
        DataCadastro = data;

    RETURN totalClientes;
END;
//

DELIMITER ;
,

SELECT ContarClientesPorDia('2025-01-20') AS TotalClientes;

SELECT ContarClientesPorDia('2025-01-21') AS TotalClientes;

