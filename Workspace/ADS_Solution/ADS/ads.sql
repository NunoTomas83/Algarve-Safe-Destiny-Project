DROP TABLE IF EXISTS "Comunicacao";
CREATE TABLE Comunicacao (ID INTEGER PRIMARY KEY ASC AUTOINCREMENT UNIQUE NOT NULL, Nome VARCHAR (20) NOT NULL, Estado VARCHAR (20) NOT NULL, Email VARCHAR (20) NOT NULL, Conteudo VARCHAR (50) NOT NULL, Tipo_Assunto VARCHAR (20) NOT NULL, Data_Recepcao DATE NOT NULL, Data_Envio DATE NOT NULL, Telefone NUMERIC (9) NOT NULL, Fax NUMERIC (9) NOT NULL, Anexo VARCHAR (50) NOT NULL, ID_Tipo_Comunicacao INTEGER REFERENCES Tipo_Comunicacao (ID) NOT NULL);
DROP TABLE IF EXISTS "Conteudo_Subtopico";
CREATE TABLE Conteudo_Subtopico (ID_Tema VARCHAR (64) NOT NULL REFERENCES Tema (Titulo), ID_Topico VARCHAR (64) NOT NULL REFERENCES Topico (Titulo), ID_Subtopico VARCHAR (64) NOT NULL REFERENCES Subtopico (Titulo), Codigo_Idioma VARCHAR (8) NOT NULL REFERENCES Idioma (Codigo_Idioma), Visibilidade bit NOT NULL, Documento VARCHAR (128) NOT NULL, Titulo VARCHAR (64) NOT NULL, PRIMARY KEY (ID_Subtopico, Codigo_Idioma));
INSERT INTO "Conteudo_Subtopico" VALUES('Fui Vítima de Crima','Fui Vítima de Roubo','Fui Vítima de Roubo em Casa','pt','on','reference.html','Fui Vítima de Roubo em Casa');
INSERT INTO "Conteudo_Subtopico" VALUES('Fui Vítima de Crima','Fui Vítima de Roubo','Fui Vítima de Roubo em Casa','en','on','reference.html','I was Robbed at Home');
DROP TABLE IF EXISTS "Conteudo_Tema";
CREATE TABLE Conteudo_Tema (ID_Tema VARCHAR (64) NOT NULL REFERENCES Tema (Titulo), Codigo_Idioma VARCHAR (8) NOT NULL REFERENCES Idioma (Codigo_Idioma), Visibilidade bit NOT NULL, Documento VARCHAR (128), Titulo VARCHAR (64) NOT NULL, PRIMARY KEY (ID_Tema, Codigo_Idioma));
INSERT INTO "Conteudo_Tema" VALUES('Fui Vítima de Crime','pt','on','reference.html','Fui Vítima de Crime');
INSERT INTO "Conteudo_Tema" VALUES('Fui Vítima de Crime','en','on','reference.html','I was a Crime Victim');
INSERT INTO "Conteudo_Tema" VALUES('Tive um Problema','pt','on','reference.html','Tive um Problema');
INSERT INTO "Conteudo_Tema" VALUES('Tive um Problema','en','on','reference.html','I had a Problem');
INSERT INTO "Conteudo_Tema" VALUES('Conselhos de Segurança','pt','on','reference.html','Conselhos de Segurança');
INSERT INTO "Conteudo_Tema" VALUES('Conselhos de Segurança','en','on','reference.html','Safety Advice');
DROP TABLE IF EXISTS "Conteudo_Topico";
CREATE TABLE Conteudo_Topico (ID_Tema VARCHAR (64) NOT NULL REFERENCES Tema (Titulo), ID_Topico VARCHAR (64) NOT NULL REFERENCES Topico (Titulo), Codigo_Idioma VARCHAR (8) NOT NULL REFERENCES Idioma (Codigo_Idioma), Visibilidade bit NOT NULL, Documento VARCHAR (128), Titulo VARCHAR (64) NOT NULL, PRIMARY KEY (ID_Topico, Codigo_Idioma));
INSERT INTO "Conteudo_Topico" VALUES('Fui Vítima de Crime','Fui Vítima de Roubo','pt','on','reference.html','Fui Vítima de Roubo');
INSERT INTO "Conteudo_Topico" VALUES('Fui Vítima de Crime','Fui Vítima de Roubo','en','on','reference.html','I was Robbed');
INSERT INTO "Conteudo_Topico" VALUES('Tive um Problema','Perdi o meu Passaporte','pt','on','reference.html','Perdi o meu Passaporte');
INSERT INTO "Conteudo_Topico" VALUES('Tive um Problema','Perdi o meu Passaporte','en','on','reference.html','I lost my Passport');
INSERT INTO "Conteudo_Topico" VALUES('Conselhos de Segurança','No Carro','pt','on','reference.html','No Carro');
INSERT INTO "Conteudo_Topico" VALUES('Conselhos de Segurança','No Carro','en','on','reference.html','In the Car');
DROP TABLE IF EXISTS "Entidade";
CREATE TABLE Entidade (Nome VARCHAR (20) UNIQUE NOT NULL, Telefone NUMERIC (9) NOT NULL, Morada VARCHAR (50) NOT NULL, Email VARCHAR (50) NOT NULL, Anexo VARCHAR (50) NOT NULL, Codigo_Postal VARCHAR (10) UNIQUE NOT NULL, Nome_Tipo_Entidade VARCHAR (20) REFERENCES Tipo_Entidade (Nome) NOT NULL, Codigo_Pais VARCHAR (5) REFERENCES Pais (Codigo_Pais) NOT NULL, Fax NUMERIC (9) NOT NULL, N_Vertice INTEGER NOT NULL REFERENCES Vertice (N_Vertice), PRIMARY KEY (Nome ASC, Codigo_Postal ASC));
INSERT INTO "Entidade" VALUES('Hospital de Faro',289700544,'Rua Calouste Glub','hdf@hospital.pt','Hospital.png','8000-001','Hospital','pt',289700544,2);
INSERT INTO "Entidade" VALUES('PSP - Faro',289899899,'Rua da Polícia de Segurança Pública, n.º 32','cpfaro@psp.pt','Police.png','8000-408','Policia','pt',289899894,1);
INSERT INTO "Entidade" VALUES('Consulado Geral de Angola',289897100,'Rua Moçambique Lote Q-lj A','geral@consuladogeralangola-faro.pt','Council.png','8005-203','Consulado','pt','',3);
INSERT INTO "Entidade" VALUES('Consulado Geral do Brasil',918803922,'Rua Misericórdia 60','cg.faro@itamaraty.gov.br','Council.png','8000-269','Consulado','br',289829710,4);
INSERT INTO "Entidade" VALUES('Consulado Britânico',282490750,'Avenida Guanaré Edifício A Fábrica, Portimão','Britcon.oporto@sapo.pt','Council.png','8500-507','Consulado','uk','',5);
INSERT INTO "Entidade" VALUES('Bombeiros Voluntários De Faro',289802147,'R. Cmte. Francisco Manuel 7','bvf@prociv.pt','FireDep.png','8000','Bombeiros','pt','',6);
INSERT INTO "Entidade" VALUES('GNR - Posto Territorial de Faro',289887603,'Largo de São sebastião 18','gnr@gnr.pt','Police.png','8000-155','Policia','pt','',7);
INSERT INTO "Entidade" VALUES('PSP - Esquadra de Olhão',289710770,'Avenida 5 de Outubro, n.º 178','olhao.faro@psp.pt','Police.png','8700-304','Policia','pt',289723391,8);
INSERT INTO "Entidade" VALUES('Centro de Saúde Olhão',289700260,'R. de Antero Nobre','olhao@ctrsaude.pt','Hospital.png','8700-240','Hospital','pt','',9);
DROP TABLE IF EXISTS "Entidade_Idioma";
CREATE TABLE Entidade_Idioma (Codigo_Idioma VARCHAR (5) REFERENCES Idioma (Codigo_Idioma) NOT NULL, Nome_Entidade VARCHAR (20) REFERENCES Entidade (Nome) NOT NULL, Codigo_Postal_Entidade VARCHAR (10) REFERENCES Entidade (Codigo_Postal) NOT NULL, Nome_Idioma VARCHAR (20) NOT NULL, PRIMARY KEY (Codigo_Idioma ASC, Nome_Entidade ASC, Codigo_Postal_Entidade ASC));
INSERT INTO "Entidade_Idioma" VALUES('en','Hospital de Faro','8000-001','Faro Districtal Hospital');
INSERT INTO "Entidade_Idioma" VALUES('en','PSP - Faro','8000-002','PSP - Faro Police Squad');
INSERT INTO "Entidade_Idioma" VALUES('en','Consulado Geral de Angola','8005-203','Angola''s General Council');
INSERT INTO "Entidade_Idioma" VALUES('en','Consulado Geral do Brasil','8000-269','Brazil''s General Council');
INSERT INTO "Entidade_Idioma" VALUES('en','Consulado Britânico','8500-507','British Council');
INSERT INTO "Entidade_Idioma" VALUES('en','Bombeiros Voluntários De Faro','8000','Fire Department - Faro');
INSERT INTO "Entidade_Idioma" VALUES('en','GNR - Posto Territorial de Faro','8000-155','GNR - Faro National Security Guard');
INSERT INTO "Entidade_Idioma" VALUES('en','PSP - Esquadra de Olhão','8700-304','PSP - Olhão Police Squad');
INSERT INTO "Entidade_Idioma" VALUES('en','Centro de Saúde Olhão','8700-240','Medical Center - Olhão');
DROP TABLE IF EXISTS "Idioma";
CREATE TABLE Idioma (Codigo_Idioma VARCHAR (5) NOT NULL PRIMARY KEY ASC UNIQUE, Nome VARCHAR (50) NOT NULL);
INSERT INTO "Idioma" VALUES('pt','Português');
INSERT INTO "Idioma" VALUES('en','English');
DROP TABLE IF EXISTS "Idioma_Pais";
CREATE TABLE Idioma_Pais (Codigo_Pais VARCHAR (5) NOT NULL REFERENCES Pais (Codigo_Pais), Codigo_Idioma VARCHAR (5) NOT NULL REFERENCES Idioma (Codigo_Idioma), PRIMARY KEY (Codigo_Pais ASC, Codigo_Idioma ASC));
INSERT INTO "Idioma_Pais" VALUES('pt','pt');
INSERT INTO "Idioma_Pais" VALUES('us','en');
INSERT INTO "Idioma_Pais" VALUES('uk','en');
DROP TABLE IF EXISTS "Pais";
CREATE TABLE Pais (Codigo_Pais VARCHAR (5) UNIQUE PRIMARY KEY ASC NOT NULL, Nome VARCHAR (20) NOT NULL);
INSERT INTO "Pais" VALUES('pt','Portugal');
INSERT INTO "Pais" VALUES('uk','United Kingdom');
INSERT INTO "Pais" VALUES('us','United States');
INSERT INTO "Pais" VALUES('de','Deutschland');
INSERT INTO "Pais" VALUES('fr','France');
INSERT INTO "Pais" VALUES('br','Brasil');
DROP TABLE IF EXISTS "Palavra";
CREATE TABLE Palavra (Codigo_Frase INTEGER PRIMARY KEY ASC AUTOINCREMENT UNIQUE NOT NULL, Frase VARCHAR (30) NOT NULL, Codigo_Ascendente INTEGER REFERENCES Palavra (Codigo_Frase), Codigo_Idioma VARCHAR (5) REFERENCES Idioma (Codigo_Idioma) NOT NULL);
INSERT INTO "Palavra" VALUES(1,'Contactos Úteis',NULL,'pt');
INSERT INTO "Palavra" VALUES(2,'Useful Contacts',1,'en');
INSERT INTO "Palavra" VALUES(3,'Esquadra mais próxima',NULL,'pt');
INSERT INTO "Palavra" VALUES(4,'Closest Police Station',3,'en');
INSERT INTO "Palavra" VALUES(5,'Perguntas Frequentes',NULL,'pt');
INSERT INTO "Palavra" VALUES(6,'Frequent Questions',5,'en');
INSERT INTO "Palavra" VALUES(7,'Resultados da Pesquisa',NULL,'pt');
INSERT INTO "Palavra" VALUES(8,'Search Results',7,'en');
INSERT INTO "Palavra" VALUES(9,'Início',NULL,'pt');
INSERT INTO "Palavra" VALUES(10,'Home',9,'en');
INSERT INTO "Palavra" VALUES(11,'Ajuda',NULL,'pt');
INSERT INTO "Palavra" VALUES(12,'Help',11,'en');
INSERT INTO "Palavra" VALUES(200,'Contactos Úteis',NULL,'pt');
INSERT INTO "Palavra" VALUES(201,'Important Contacts',200,'en');
INSERT INTO "Palavra" VALUES(202,'Morada:',NULL,'pt');
INSERT INTO "Palavra" VALUES(203,'Address: ',202,'en');
INSERT INTO "Palavra" VALUES(205,'Telefone:',NULL,'pt');
INSERT INTO "Palavra" VALUES(206,'Telephone : ',205,'en');
INSERT INTO "Palavra" VALUES(207,'Conteúdo',NULL,'pt');
INSERT INTO "Palavra" VALUES(208,'Contents',207,'en');
INSERT INTO "Palavra" VALUES(209,'Idioma:',NULL,'pt');
INSERT INTO "Palavra" VALUES(210,'Language:',209,'en');
INSERT INTO "Palavra" VALUES(211,'Receber Notificações de Segurança',NULL,'pt');
INSERT INTO "Palavra" VALUES(212,'Receive Safety Notifications',211,'en');
INSERT INTO "Palavra" VALUES(213,'Atualizações Automáticas',NULL,'pt');
INSERT INTO "Palavra" VALUES(214,'Automatic Updates',213,'en');
INSERT INTO "Palavra" VALUES(215,'Sim',NULL,'pt');
INSERT INTO "Palavra" VALUES(216,'Não',NULL,'pt');
INSERT INTO "Palavra" VALUES(217,'On',215,'en');
INSERT INTO "Palavra" VALUES(218,'Off',216,'en');
INSERT INTO "Palavra" VALUES(219,'Atualizar Agora',NULL,'pt');
INSERT INTO "Palavra" VALUES(220,'Update Now',219,'en');
INSERT INTO "Palavra" VALUES(221,'Definições',NULL,'pt');
INSERT INTO "Palavra" VALUES(222,'Settings',221,'en');
INSERT INTO "Palavra" VALUES(223,'Não Disponível',NULL,'pt');
INSERT INTO "Palavra" VALUES(224,'Not Available',223,'en');
INSERT INTO "Palavra" VALUES(225,'Bemvindo, melhore a sua experiência de utilizador fornecendo-nos os seguintes detalhes [opcional]',NULL,'pt');
INSERT INTO "Palavra" VALUES(226,'Welcome, improve your user experience by providing the following details [optional]',225,'en');
INSERT INTO "Palavra" VALUES(227,'Escolha o seu País',NULL,'pt');
INSERT INTO "Palavra" VALUES(228,'Choose your country',227,'en');
INSERT INTO "Palavra" VALUES(229,'País:',NULL,'pt');
INSERT INTO "Palavra" VALUES(230,'Country:',229,'en');
INSERT INTO "Palavra" VALUES(231,'Infelizmente a aplicação ainda não está traduzida no seu idioma',NULL,'pt');
INSERT INTO "Palavra" VALUES(232,'Unfortunately the application is not yet translated in your language',231,'en');
INSERT INTO "Palavra" VALUES(233,' Cancelar',NULL,'pt');
INSERT INTO "Palavra" VALUES(234,' Cancel',233,'en');
INSERT INTO "Palavra" VALUES(235,' Continuar',NULL,'pt');
INSERT INTO "Palavra" VALUES(236,' Continue',235,'en');
INSERT INTO "Palavra" VALUES(237,'Contactos:',NULL,'pt');
INSERT INTO "Palavra" VALUES(238,'Contacts:',237,'en');
INSERT INTO "Palavra" VALUES(239,'mapa',NULL,'pt');
INSERT INTO "Palavra" VALUES(240,'map ',239,'en');
INSERT INTO "Palavra" VALUES(241,'Distância',NULL,'pt');
INSERT INTO "Palavra" VALUES(242,'Distance',241,'en');
INSERT INTO "Palavra" VALUES(243,'Nome',NULL,'pt');
INSERT INTO "Palavra" VALUES(244,'Name',243,'en');
INSERT INTO "Palavra" VALUES(245,'Tipo',NULL,'pt');
INSERT INTO "Palavra" VALUES(246,'Type',245,'en');
INSERT INTO "Palavra" VALUES(247,'Ordenar Por:',NULL,'pt');
INSERT INTO "Palavra" VALUES(248,'Order By:',247,'en');
INSERT INTO "Palavra" VALUES(249,'Filtrar:',NULL,'pt');
INSERT INTO "Palavra" VALUES(250,'Filter:',249,'en');
INSERT INTO "Palavra" VALUES(251,'Geolocalização Inactiva, active-a agora para uma melhor exeriência',NULL,'pt');
INSERT INTO "Palavra" VALUES(252,'Geolocation Disabled, activate it  for a better user experience',251,'en');
INSERT INTO "Palavra" VALUES(253,'Policia',NULL,'pt');
INSERT INTO "Palavra" VALUES(254,'Police',253,'en');
INSERT INTO "Palavra" VALUES(255,'Definir como destino',NULL,'pt');
INSERT INTO "Palavra" VALUES(256,'Set as destination',255,'en');
DROP TABLE IF EXISTS "Subtopico";
CREATE TABLE Subtopico (ID_Tema VARCHAR (64) NOT NULL REFERENCES Tema (Titulo), ID_Topico VARCHAR (64) NOT NULL REFERENCES Topico (Titulo), Titulo VARCHAR (64) NOT NULL PRIMARY KEY, Descricao VARCHAR (64) NOT NULL, Visibilidade bit NOT NULL, Icone VARCHAR (128));
INSERT INTO "Subtopico" VALUES('Fui Vítima de Crime','Fui Vítima de Roubo','Fui Vítima de Roubo em Casa','Roubo em Casa','on','AtHome.png');
DROP TABLE IF EXISTS "Tema";
CREATE TABLE Tema (Titulo VARCHAR (64) NOT NULL PRIMARY KEY UNIQUE, Descricao VARCHAR (64) NOT NULL, Visibilidade bit NOT NULL, Icone VARCHAR (128));
INSERT INTO "Tema" VALUES('Fui Vítima de Crime','Vitima','on','CrimeVictim.png');
INSERT INTO "Tema" VALUES('Tive um Problema','Problema','on','CrimeVictim.png');
INSERT INTO "Tema" VALUES('Conselhos de Segurança','Conselhos','on','SafetyAdvice.png');
DROP TABLE IF EXISTS "Tipo_Comunicacao";
CREATE TABLE Tipo_Comunicacao (ID INTEGER PRIMARY KEY ASC AUTOINCREMENT UNIQUE NOT NULL, Nome VARCHAR (20) NOT NULL CHECK (Nome IN ('Sugestгo', 'Duvida')));
DROP TABLE IF EXISTS "Tipo_Entidade";
CREATE TABLE Tipo_Entidade (Nome VARCHAR (20) PRIMARY KEY ASC UNIQUE NOT NULL);
INSERT INTO "Tipo_Entidade" VALUES('Hospital');
INSERT INTO "Tipo_Entidade" VALUES('Policia');
INSERT INTO "Tipo_Entidade" VALUES('Consulado');
INSERT INTO "Tipo_Entidade" VALUES('Bombeiros');
DROP TABLE IF EXISTS "Tipo_Entidade_Idioma";
CREATE TABLE Tipo_Entidade_Idioma (Codigo_Idioma VARCHAR (5) REFERENCES Idioma (Codigo_Idioma) NOT NULL, Nome_Tipo_Entidade VARCHAR (20) REFERENCES Tipo_Entidade (Nome) NOT NULL, Nome_Idioma VARCHAR (20) NOT NULL, PRIMARY KEY (Codigo_Idioma ASC, Nome_Tipo_Entidade ASC));
INSERT INTO "Tipo_Entidade_Idioma" VALUES('en','Policia','Police');
INSERT INTO "Tipo_Entidade_Idioma" VALUES('en','Hospital','Hospital');
INSERT INTO "Tipo_Entidade_Idioma" VALUES('en','Consulado','Council');
INSERT INTO "Tipo_Entidade_Idioma" VALUES('en','Bombeiros','Fire Department');
DROP TABLE IF EXISTS "Tipo_Utilizador";
CREATE TABLE Tipo_Utilizador (ID INTEGER PRIMARY KEY ASC AUTOINCREMENT UNIQUE NOT NULL, Nome VARCHAR (20) NOT NULL, Leitura BOOLEAN, Escrita BOOLEAN);
DROP TABLE IF EXISTS "Tipo_Zona";
CREATE TABLE Tipo_Zona (Nome VARCHAR (20) PRIMARY KEY ASC UNIQUE NOT NULL, Notificacao VARCHAR (20) NOT NULL);
DROP TABLE IF EXISTS "Topico";
CREATE TABLE Topico (ID_Tema VARCHAR (64) NOT NULL REFERENCES Tema (Titulo), Titulo VARCHAR (64) NOT NULL PRIMARY KEY, Descricao VARCHAR (64) NOT NULL, Visibilidade bit NOT NULL, Icone VARCHAR (128));
INSERT INTO "Topico" VALUES('Fui Vítima de Crime','Fui Vítima de Roubo','Roubo','on','DomesticViolence.png');
INSERT INTO "Topico" VALUES('Tive um Problema','Perdi o meu Passaporte','Passaporte','on','Embassies.png');
INSERT INTO "Topico" VALUES('Conselhos de Segurança','No Carro','No Carro','on','Car.png');
DROP TABLE IF EXISTS "Utilizador";
CREATE TABLE Utilizador (Nome VARCHAR (20) NOT NULL PRIMARY KEY ASC UNIQUE, Email VARCHAR (50) NOT NULL, Categoria VARCHAR (20) NOT NULL, Data_Criacao DATE NOT NULL, ID_Tipo_Utilizador INTEGER NOT NULL REFERENCES Tipo_Utilizador (ID));
DROP TABLE IF EXISTS "Vertice";
CREATE TABLE Vertice (N_Vertice INTEGER PRIMARY KEY ASC AUTOINCREMENT UNIQUE NOT NULL, Latitude DOUBLE NOT NULL, Longitude DOUBLE NOT NULL);
INSERT INTO "Vertice" VALUES(1,37.01516,-7.92769);
INSERT INTO "Vertice" VALUES(2,37.02523,-7.92889);
INSERT INTO "Vertice" VALUES(3,37.029571,-7.9394853);
INSERT INTO "Vertice" VALUES(4,37.0147089,-7.9332171);
INSERT INTO "Vertice" VALUES(5,37.1322881,-8.5412648);
INSERT INTO "Vertice" VALUES(6,37.0142639,-7.9355519);
INSERT INTO "Vertice" VALUES(7,37.0201317,-7.9374278);
INSERT INTO "Vertice" VALUES(8,37.023775,-7.8440578);
INSERT INTO "Vertice" VALUES(9,37.0366936,-7.8402561);
DROP TABLE IF EXISTS "Zona_Horario";
CREATE TABLE Zona_Horario (Hora_Inicial TIME NOT NULL, Hora_Final TIME NOT NULL, Nome_Tipo_Zona VARCHAR (20) NOT NULL REFERENCES Tipo_Zona (Nome), Nome_Zona_Perigosa VARCHAR (20) NOT NULL REFERENCES Zona_Perigosa (Nome), PRIMARY KEY (Nome_Tipo_Zona ASC, Nome_Zona_Perigosa ASC));
DROP TABLE IF EXISTS "Zona_Perigosa";
CREATE TABLE Zona_Perigosa (Nome VARCHAR (20) PRIMARY KEY ASC UNIQUE NOT NULL, Raio DOUBLE NOT NULL);
CREATE INDEX IX_FK_EntidadeEntidade_Idioma ON Entidade_Idioma (Nome_Entidade ASC, Codigo_Postal_Entidade ASC);
CREATE INDEX IX_FK_IdiomaEntidade_Idioma ON Entidade_Idioma (Codigo_Idioma ASC);
CREATE INDEX IX_FK_IdiomaIdioma_Pais ON Idioma_Pais (Codigo_Idioma ASC);
CREATE INDEX IX_FK_IdiomaPalavra ON Palavra (Codigo_Idioma ASC);
CREATE INDEX IX_FK_IdiomaTipo_Entidade_Idioma ON Tipo_Entidade_Idioma (Codigo_Idioma ASC);
CREATE INDEX IX_FK_PaisEntidade ON Entidade (Codigo_Pais ASC);
CREATE INDEX IX_FK_PaisIdioma_Pais ON Idioma_Pais (Codigo_Pais ASC);
CREATE INDEX IX_FK_PalavraPalavra ON Palavra (Codigo_Ascendente ASC);
CREATE INDEX IX_FK_Tipo_ComunicacaoComunicacao ON Comunicacao (ID_Tipo_Comunicacao);
CREATE INDEX IX_FK_Tipo_EntidadeEntidade ON Entidade (Nome_Tipo_Entidade ASC);
CREATE INDEX IX_FK_Tipo_EntidadeTipo_Entidade_Idioma ON Tipo_Entidade_Idioma (Nome_Tipo_Entidade ASC);
CREATE INDEX IX_FK_Tipo_UtilizadorUtilizador ON Utilizador (ID_Tipo_Utilizador ASC);
CREATE INDEX IX_FK_Tipo_ZonaZona_Horario ON Zona_Horario (Nome_Tipo_Zona ASC);
CREATE INDEX IX_FK_VerticeEntidade ON Entidade (N_Vertice ASC);
CREATE INDEX IX_FK_Zona_PerigosaZona_Horario ON Zona_Horario (Nome_Zona_Perigosa ASC);
