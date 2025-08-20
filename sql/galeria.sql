DROP DATABASE IF EXISTS galeria;
CREATE DATABASE galeria;
USE galeria;


CREATE TABLE Funcionario (
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(100) NOT NULL,
    ddd VARCHAR(3) DEFAULT '46',
    numero VARCHAR(9),
    cpf VARCHAR(11) UNIQUE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Artista (
	id_artista INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(100) NOT NULL,
    ddd VARCHAR(3) DEFAULT '46',
    numero VARCHAR(9),
    email VARCHAR(200),
    cpf VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE Visitante (
	id_visitante INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(100) NOT NULL,
    ddd VARCHAR(3) DEFAULT '46',
    numero VARCHAR(9),
    email VARCHAR(200),
    cpf VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE Obra (
	id_obra INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ano SMALLINT UNSIGNED,
    tecnica VARCHAR(200),
    disponibilidade ENUM ('D', 'V', 'N') NOT NULL DEFAULT'D',
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES Artista(id_artista)
);

CREATE TABLE Venda_Obra (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_aquisicao DATE NOT NULL,
    valor_aquisicao DECIMAL (10, 2) NOT NULL,
    id_obra INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_visitante INT NOT NULL,
    FOREIGN KEY (id_obra) REFERENCES Obra(id_obra),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
    FOREIGN KEY (id_visitante) REFERENCES Visitante(id_visitante)
);

CREATE TABLE Exposicao (
	id_exposicao INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CHECK (data_fim >= data_inicio),
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Obra_exposicao (
	id_obra INT NOT NULL,
    id_exposicao INT NOT NULL,
    PRIMARY KEY (id_obra, id_exposicao),
    FOREIGN KEY (id_obra) REFERENCES Obra(id_obra),
    FOREIGN KEY (id_exposicao) REFERENCES Exposicao(id_exposicao)
);

CREATE TABLE Ingresso (
	id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    data_compra DATE NOT NULL,
    data_visita DATE,
    id_visitante INT NOT NULL,
    id_exposicao INT NOT NULL,
    FOREIGN KEY (id_visitante) REFERENCES Visitante(id_visitante),
    FOREIGN KEY (id_exposicao) REFERENCES Exposicao(id_exposicao)
);

INSERT INTO Funcionario (primeiro_nome, ultimo_nome, ddd, numero, cpf, ativo) VALUES 
	('Julia', 'Silva', DEFAULT,  '99804214', '07516352974', DEFAULT),
    ('Leonardo', 'Poloni',  DEFAULT, '99089518', '02416458940', DEFAULT),
    ('Victor', 'Souza', DEFAULT, '99884317', '95602718934', DEFAULT),
    ('João Pedro', 'Martins', '47', '99754080', '1837594821', DEFAULT),
    ('Hugo', 'Rodrigues', DEFAULT, '911110000', '18465709323', DEFAULT),
	('Isabela', 'Almeida', DEFAULT, '900009999', '84593038588', DEFAULT),
	('Julio', 'Ferreira', DEFAULT, '999998888', '98573839209', 0);
    
INSERT INTO Artista (primeiro_nome, ultimo_nome, ddd, numero, email, cpf) VALUES
	('Candido', 'Portinari', DEFAULT, '987654301', 'candido.portinari@arte.com', '12345678901'),
	('Tarsila', 'do Amaral', DEFAULT, '987654302', 'tarsila.amaral@arte.com', '23456789012'),
	('Alfredo', 'Volpi', DEFAULT, '987654303', 'alfredo.volpi@arte.com', '34567890123'),
	('Beatriz', 'Milhazes', DEFAULT, '987654304', 'beatriz.milhazes@arte.com', '45678901234'),
	('Vik', 'Muniz', DEFAULT, '987654305', 'vik.muniz@arte.com', '56789012345'),
	('Claude', 'Monet', DEFAULT, '987654306', 'claude.monet@arte.com', '67890123456'),
	('Vincent', 'van Gogh', DEFAULT, '987654307', 'vincent.vangogh@arte.com', '78901234567'),
	('Frida', 'Kahlo', DEFAULT, '987654308', 'frida.kahlo@arte.com', '89012345678'),
	('Pablo', 'Picasso', DEFAULT, '987654309', 'pablo.picasso@arte.com', '90123456789'),
	('Sofia', 'Melo', DEFAULT, '987654310', 'sofia.melo@arte.com', '10987654321'),
	('Gabriel', 'Dias', DEFAULT, '987654311', 'gabriel.dias@arte.com', '21098765432'),
	('Manuela', 'Lima', DEFAULT, '987654312', 'manuela.lima@arte.com', '32109876543'),
	('Pedro', 'Nunes', DEFAULT, '987654313', 'pedro.nunes@arte.com', '43210987654'),
	('Mariana', 'Cunha', DEFAULT, '987654314', 'mariana.cunha@arte.com', '54321098765'),
	('Lucas', 'Rocha', DEFAULT, '987654315', 'lucas.rocha@arte.com', '65432109876');
    
    
INSERT INTO Obra (nome, ano, tecnica, disponibilidade, id_artista) VALUES
	('Os Retirantes', 1944, 'Óleo sobre tela', DEFAULT, 1),
	('O Lavrador de Café', 1939, 'Óleo sobre tela', 'N', 1),
	('Meninos com Carneiro', 1947, 'Óleo sobre tela', DEFAULT, 1),
	('Guerra e Paz (Paineis)', 1956, 'Óleo sobre madeira compensada', DEFAULT, 1),
	('O Mestiço', 1934, 'Óleo sobre tela', DEFAULT, 1),
	('Abaporu', 1928, 'Óleo sobre tela', DEFAULT, 2),
	('Antropofagia', 1929, 'Óleo sobre tela', 'N', 2),
	('A Negra', 1923, 'Óleo sobre tela', DEFAULT, 2),
	('O Pescador', 1925, 'Óleo sobre tela', DEFAULT, 2),
	('Operários', 1933, 'Óleo sobre tela', DEFAULT, 2),
	('Bandeirinhas e Mastro', 1958, 'Têmpera sobre tela', DEFAULT, 3),
	('Fachada com Bandeirinhas', 1950, 'Têmpera sobre tela', 'V', 3),
	('Casarão', 1955, 'Têmpera sobre tela', DEFAULT, 3),
	('Marinhas com Barcos', 1960, 'Têmpera sobre tela', DEFAULT, 3),
	('Composição Concreta', 1962, 'Têmpera sobre tela', DEFAULT, 3),
	('O Mágico', 2001, 'Acrílica e colagem sobre tela', DEFAULT, 4),
	('O Barco', 2003, 'Acrílica e colagem sobre tela', 'V', 4),
	('Beijo', 2000, 'Acrílica e colagem sobre tela', DEFAULT, 4),
	('Melhor de Mim', 2002, 'Acrílica, colagem e glitter sobre tela', DEFAULT, 4),
	('Avenida Brasil', 2007, 'Acrílica e colagem sobre tela', DEFAULT, 4),
	('Mona Lisa, depois de Leonardo da Vinci (Imagens de Sucata)', 2005, 'Impressão C-print digital', DEFAULT, 5),
	('A Coroa (depois de Jan van Eyck)', 2002, 'C-print', 'N', 5),
	('Narciso, depois de Caravaggio (Imagens de Chocolate)', 2006, 'Impressão em gelatina de prata', DEFAULT, 5),
	('Medusa, depois de Caravaggio (Imagens de Geléia)', 2007, 'Impressão C-print', DEFAULT, 5),
	('O Atlante, depois de Rubens (Imagens de Lixo)', 2003, 'Impressão C-print', DEFAULT, 5),
	('Impressão, Nascer do Sol', 1872, 'Óleo sobre tela', DEFAULT, 6),
	('Lírios d\'água', 1916, 'Óleo sobre tela', 'N', 6),
	('Mulher com Sombrinha', 1875, 'Óleo sobre tela', DEFAULT, 6),
	('Ponte Japonesa', 1899, 'Óleo sobre tela', DEFAULT, 6),
	('Campos de Papoulas', 1873, 'Óleo sobre tela', DEFAULT, 6),
	('A Noite Estrelada', 1889, 'Óleo sobre tela', DEFAULT, 7),
	('Girassóis', 1888, 'Óleo sobre tela', 'N', 7),
	('Os Comedores de Batata', 1885, 'Óleo sobre tela', DEFAULT, 7),
	('Retrato do Dr. Gachet', 1890, 'Óleo sobre tela', DEFAULT, 7),
	('Campo de Trigo com Ciprestes', 1889, 'Óleo sobre tela', DEFAULT, 7),
	('As Duas Fridas', 1939, 'Óleo sobre tela', DEFAULT, 8),
	('Autorretrato com Colar de Espinhos e Beija-flor', 1940, 'Óleo sobre tela', 'N', 8),
	('Diego e Eu', 1949, 'Óleo sobre Masonite', DEFAULT, 8),
	('A Coluna Partida', 1944, 'Óleo sobre Masonite', DEFAULT, 8),
	('O Veado Ferido', 1946, 'Óleo sobre Masonite', DEFAULT, 8),
	('Guernica', 1937, 'Óleo sobre tela', DEFAULT, 9),
	('As Demoiselles dAvignon', 1907, 'Óleo sobre tela', 'N', 9),
	('A Mulher Que Chora', 1937, 'Óleo sobre tela', DEFAULT, 9),
	('Sonho', 1932, 'Óleo sobre tela', DEFAULT, 9),
	('Retrato de Dora Maar', 1937, 'Óleo sobre tela', DEFAULT, 9),
	('Reflexos Urbanos', 2020, 'Acrílica sobre painel', DEFAULT, 10),
	('A Essência do Ser', 2021, 'Óleo sobre tela', 'V', 10),
	('Caminhos Invisíveis', 2022, 'Mídia mista', DEFAULT, 10),
	('Mosaico da Memória', 2018, 'Colagem e tinta acrílica', DEFAULT, 11),
	('Despertar de Cores', 2020, 'Óleo sobre tela', 'N', 11),
	('Fragmentos do Tempo', 2019, 'Escultura em bronze', DEFAULT, 11),
	('Jardim Secreto', 2023, 'Aquarela', DEFAULT, 12),
	('Alma Fluvial', 2021, 'Óleo sobre linho', 'V', 12),
	('Poesia do Olhar', 2022, 'Acrílica e spray', DEFAULT, 12),
	('A Fuga Silenciosa', 2019, 'Fotografia digital', DEFAULT, 13),
	('Ruído Branco', 2020, 'Instalação sonora e visual', 'N', 13),
	('Espelho Quebrado', 2021, 'Vídeo arte', DEFAULT, 13),
	('Entrelaços', 2022, 'Têxtil e fibras naturais', DEFAULT, 14),
	('Tecendo Sonhos', 2023, 'Bordado em tela', 'N', 14),
	('Vozes da Terra', 2021, 'Cerâmica esmaltada', DEFAULT, 14),
	('O Voo da Imaginação', 2020, 'Desenho a grafite', DEFAULT, 15),
	('Horizonte Infinito', 2021, 'Óleo sobre tela', 'V', 15),
	('A Dança das Sombras', 2019, 'Carvão sobre papel', DEFAULT, 15);
    
    
INSERT INTO Visitante (primeiro_nome, ultimo_nome, ddd, numero, email, cpf) VALUES
	('Jotaro Kujo', 'Diniz', DEFAULT, '999654321', 'jotaro.diniz@email.com', '62511287096'),
	('Giorno Giovanna', 'Fontes', '44', '999345678', 'giorno.fontes@email.com', '73802419055'),
	('Jolyne Cujoh', 'Melo', DEFAULT, '998765432', 'jolyne.melo@email.com', '04138967010'),
	('Joseph Joestar', 'Prado', '47', '999456789', 'joseph.prado@email.com', '51098632004'),
	('Josuke Higashikata', 'Valente', '41', '976543210', 'josuke.valente@email.com', '35926714020'),
	('Johnny Joestar', 'Andrade', DEFAULT, '934567890', 'johnny.andrade@email.com', '20384596099'),
	('Dio Brando', 'Bandeira', DEFAULT, '999432109', 'dio.bandeira@email.com', '80841620088'),
	('Kira Yoshikage', 'Queiroz', DEFAULT, '943210987', 'kira.queiroz@email.com', '14250388007'),
	('Bruno Bucciarati', 'Mendonça', '47', '998789012', 'bruno.mendonca@email.com', '38621597060'),
	('Narancia Ghirga', 'Barreto', DEFAULT, '999234567', 'narancia.barreto@email.com', '62473108004'),
	('Guido Mista', 'Rodrigues', DEFAULT, '910987654', 'mista.rodrigues@email.com', '27390541067'),
	('Pannacotta Fugo', 'Chaves', DEFAULT, '921098765', 'fugo.chaves@email.com', '45716923071'),
	('Enrico Pucci', 'Figueiredo', '45', '932109876', 'pucci.figueiredo@email.com', '61034895000'),
	('Gyro Zeppeli', 'Castro', '45', '943210987', 'gyro.castro@email.com', '18562947049'),
	('Rohan Kishibe', 'Luz', DEFAULT, '999321098', 'rohan.luz@email.com', '79423016003');


INSERT INTO Venda_Obra (data_aquisicao, valor_aquisicao, id_obra, id_funcionario, id_visitante) VALUES
	('2018-04-01', 18000.00, 12, 2, 4),
	('2020-04-15', 21500.00, 17, 1, 1),
	('2022-05-10', 15800.00, 46, 4, 10),
	('2024-06-05', 9900.00, 51, 5, 3),
	('2023-06-20', 24000.00, 59, 1, 11);

INSERT INTO Exposicao (nome, descricao, data_inicio, data_fim, id_funcionario) VALUES
	('Brasil Contemporaneo', 'Uma exposição que explora a produção artística nacional da atualidade.', '2025-03-02', '2025-06-02', 2),
    ('Vanguardas Européias', 'Emocionantes obras dos renomados artistas que moldaram a arte ocidental', '2023-07-23', '2023-09-30', 6),
    ('Cores e Abstração', 'Uma jornada vibrante pelas formas e cores da abstração brasileira.', '2020-05-10', '2020-08-10', 1),
	('Realismo Irreal', 'Obras que exploram as paisagens surreais do realismo mágico.', '2021-09-15', '2021-12-15', 7),
    ('Mídia Mista na Arte', 'Uma mostra que celebra a inovação na arte através do uso de materiais não convencionais e técnicas híbridas.', '2025-01-20', '2025-04-20', 3);

INSERT INTO Obra_exposicao (id_exposicao, id_obra) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(1, 19),
(1, 46),
(1, 48),
(1, 49),
(1, 52),
(1, 55),
(2, 26),
(2, 27),
(2, 28),
(2, 31),
(2, 32),
(2, 33),
(2, 41),
(2, 42),
(2, 43),
(3, 11),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 18),
(3, 19),
(4, 36),
(4, 37),
(4, 38),
(4, 39),
(4, 40),
(4, 21),
(4, 23),
(5, 20),
(5, 22),
(5, 24),
(5, 25),
(5, 48),
(5, 49),
(5, 51),
(5, 52),
(5, 54),
(5, 55),
(5, 57),
(5, 58),
(5, 61);

INSERT INTO Ingresso (data_compra, data_visita, id_visitante, id_exposicao) VALUES
('2025-06-01', '2025-06-05', 1, 1),
('2025-06-05', '2025-06-12', 2, 1),
('2025-06-10', '2025-06-20', 3, 1),
('2025-06-18', '2025-07-01', 5, 1),
('2025-06-20', '2025-07-05', 10, 1),
('2025-06-20', '2025-07-10', 11, 1),
('2023-07-20', '2023-07-25', 4, 2),
('2023-08-01', '2023-08-10', 5, 2),
('2023-08-15', '2023-08-20', 1, 2),
('2023-09-01', '2023-09-05', 8, 2),
('2020-05-05', '2020-05-12', 6, 3),
('2020-06-01', '2020-06-15', 7, 3),
('2020-07-01', '2020-07-05', 2, 3),
('2020-07-15', '2020-07-20', 10, 3),
('2020-08-01', '2020-08-05', 11, 3),
('2020-08-05', '2020-08-08', 3, 3),
('2021-09-10', '2021-09-20', 8, 4),
('2021-10-01', '2021-10-10', 9, 4),
('2021-11-01', '2021-11-05', 4, 4),
('2021-11-15', '2021-11-20', 12, 4),
('2021-12-01', '2021-12-05', 13, 4),
('2021-12-05', '2021-12-10', 14, 4),
('2021-12-10', '2021-12-12', 15, 4),
('2021-09-20', '2021-09-25', 1, 4),
('2025-03-28', '2025-04-05', 10, 5),
('2025-04-01', '2025-04-15', 11, 5),
('2025-04-10', '2025-05-01', 12, 5),
('2025-05-01', '2025-05-15', 1, 5),
('2025-05-15', '2025-06-01', 14, 5);

-- Quais exposições tiveram mais ingressos vendidos? Quem as organizou?
SELECT
    COUNT(Ingresso.id_ingresso) AS Total_Ingressos,
    Exposicao.nome AS Nome_Exposicao,
    Exposicao.data_inicio AS Inicio_Exposicao,
    Exposicao.data_fim AS Fim_Exposicao,
    CONCAT(Funcionario.primeiro_nome, ' ', Funcionario.ultimo_nome) AS Funcionario_Curador
FROM
    Exposicao
JOIN
    Funcionario ON Exposicao.id_funcionario = Funcionario.id_funcionario
LEFT JOIN
    Ingresso ON Exposicao.id_exposicao = Ingresso.id_exposicao
GROUP BY
    Exposicao.id_exposicao,
    Exposicao.nome,
    Exposicao.data_inicio,
    Exposicao.data_fim,
    Funcionario.id_funcionario
ORDER BY
    Total_Ingressos DESC;

-- Quem foram os visitantes mais frequentes, que compraram mais ingressos? eles compraram telas?
SELECT
	CONCAT(Visitante.primeiro_nome, ' ', Visitante.ultimo_nome) AS Nome_Visitante,
    (SELECT COUNT(Ingresso.id_ingresso) -- usando subconsultas, pq sem elas o resultado acabava dando errado (eram contabilizadas cada uma das linhas do left join com os ingressos, o que resultava no calculo errado das telas compradas)
     FROM Ingresso
     WHERE Ingresso.id_visitante = Visitante.id_visitante) AS Ingressos_Comprados,
    (SELECT COUNT(Venda_Obra.id_venda)
     FROM Venda_Obra
     WHERE Venda_Obra.id_visitante = Visitante.id_visitante) AS Telas_Compradas
FROM
    Visitante
ORDER BY
    Ingressos_Comprados DESC,
    Telas_Compradas DESC;
    
-- Quão antecipadamente os ingressos são comprados, em média?
SELECT
    AVG(DATEDIFF(Ingresso.data_visita, Ingresso.data_compra)) AS Media_Antecedencia
FROM
    Ingresso
WHERE
    Ingresso.data_visita IS NOT NULL;
    
-- Quais obras da galeria que participaram de exposições não estão à venda? 
SELECT
    Obra.nome AS Nome_Obra,
    Obra.ano AS Ano_Obra,
    Obra.tecnica AS Tecnica_Obra,
    Obra.disponibilidade AS Disponibilidade
FROM
    Obra
JOIN
    Obra_exposicao ON Obra.id_obra = Obra_exposicao.id_obra
WHERE
    Obra.disponibilidade = 'N';


-- Dentre todas as obras da galeria, quais possuem "óleo sobre tela" como técnica?
SELECT
    Obra.nome AS Nome_Obra,
    Obra.ano AS Ano_Obra,
    Obra.tecnica AS Tecnica_Obra,
    CONCAT(Artista.primeiro_nome, ' ', Artista.ultimo_nome) AS Nome_Artista
FROM
    Obra
JOIN
    Artista ON Obra.id_artista = Artista.id_artista
WHERE
    Obra.tecnica LIKE '%Óleo sobre tela%';
    
-- Artistas ordenados pela idade das telas
    SELECT
    CONCAT(Artista.primeiro_nome, ' ', Artista.ultimo_nome) AS Nome_Artista,
    COUNT(Obra.id_obra) AS Total_Telas,
    MIN(Obra.ano) AS Ano_Obra_Mais_Antiga,
    MAX(Obra.ano) AS Ano_Obra_Mais_Recente
FROM
    Artista
JOIN
    Obra ON Artista.id_artista = Obra.id_artista
GROUP BY
    Artista.id_artista, Artista.primeiro_nome, Artista.ultimo_nome
ORDER BY
    Ano_Obra_Mais_Antiga ASC,
    Ano_Obra_Mais_Recente ASC;
    