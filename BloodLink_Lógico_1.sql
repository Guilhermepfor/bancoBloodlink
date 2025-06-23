/* BloodLink_Lógico_1: */

CREATE TABLE Hemocentro (
    idHemocentro INTEGER PRIMARY KEY,
    nomeHemocentro VARCHAR,
    cnpjHemocentro CHAR,
    enderecoHemocentro VARCHAR,
    telefoneHemocentro VARCHAR,
    emailHemocentro VARCHAR,
    horariofuncionamentoHemocentro TIMESTAMP,
    urgenciaHemocentro VARCHAR
);

CREATE TABLE Usuario (
    emailDoador VARCHAR,
    idDoador INTEGER PRIMARY KEY,
    enderecoDoador VARCHAR,
    ultimaDoacaoDoador DATE,
    nomeDoador VARCHAR,
    cpfDoador CHAR,
    dataNascimentoDoador DATE,
    sexoDoador VARCHAR,
    tipoSanguineoDoador CHARACTER,
    telefoneDoador VARCHAR,
    emailDoador VARCHAR,
    tipoUsuario USUARIO/DOADOR/VITALINKER,
    fk_Vitalink_idVitalink INTEGER
);

CREATE TABLE Vitalink (
    idVitalink INTEGER PRIMARY KEY,
    nivelVitalink INTEGER,
    nomeVitalink VARCHAR,
    statusVitalink VARCHAR,
    acessorioVitalink BLOB,
    rankVitalink INTEGER,
    tituloVitalink VARCHAR
);

CREATE TABLE Missao (
    idMissao INTEGER PRIMARY KEY,
    dificuldadeMissao VARCHAR,
    tituloMissao VARCHAR,
    descricaoMissao VARCHAR,
    tipoMissao VARCHAR,
    progressoMissao FLOAT
);

CREATE TABLE Doacao (
    idDoacao INTEGER PRIMARY KEY,
    dataDoacao DATE,
    validadeDoacao DATE,
    quantidadeDoacao INTEGER,
    tipoDoacao VARCHAR,
    obervacoesDoacao VARCHAR
);

CREATE TABLE Recompensa (
    idRecompensa INTEGER PRIMARY KEY,
    expRecompensa INTEGER,
    moedaRecompensa INTEGER,
    statusRecompensa VARCHAR,
    conquistaRecompensa VARCHAR,
    acessorioRecompensa BLOB
);

CREATE TABLE Campanha (
    idCampanha INTEGER PRIMARY KEY,
    hemocentroCampanha VARCHAR,
    tituloCampanha VARCHAR,
    descricaoCampanha VARCHAR,
    dataInicioCampanha DATE,
    dataFimCampanha DATE,
    quantidadeCampanha INTEGER,
    tipoSanguineoCampanha VARCHAR,
    metaCampanha INTEGER,
    publicoAlvoCampanha VARCHAR
);

CREATE TABLE Agendamento (
    idAgendamento INTEGER PRIMARY KEY,
    dataHoraAgendamento DATE,
    statusAgendamento VARCHAR
);

CREATE TABLE Ranking (
    idRanking INTEGER PRIMARY KEY,
    periodoRanking DATE,
    posicaoRanking INTEGER,
    localRanking VARCHAR,
    tipoRanking VARCHAR,
    pontosRanking INTEGER,
    tituloRanking VARCHAR
);

CREATE TABLE Badge (
    idBadge INTEGER PRIMARY KEY,
    nomeBadge VARCHAR,
    descricaoBadge VARCHAR,
    iconeBadge BLOB
);

CREATE TABLE Conectar (
    fk_Hemocentro_idHemocentro INTEGER,
    fk_Usuario_idDoador INTEGER
);

CREATE TABLE Atribuir (
    fk_Missao_idMissao INTEGER,
    fk_Vitalink_idVitalink INTEGER
);

CREATE TABLE Doar (
    fk_Doacao_idDoacao INTEGER,
    fk_Usuario_idDoador INTEGER
);

CREATE TABLE Receber (
    fk_Doacao_idDoacao INTEGER,
    fk_Hemocentro_idHemocentro INTEGER
);

CREATE TABLE Agendar (
    fk_Agendamento_idAgendamento INTEGER,
    fk_Doacao_idDoacao INTEGER
);

CREATE TABLE Realizar (
    fk_Agendamento_idAgendamento INTEGER,
    fk_Usuario_idDoador INTEGER
);

CREATE TABLE Publicar (
    fk_Hemocentro_idHemocentro INTEGER,
    fk_Campanha_idCampanha INTEGER
);

CREATE TABLE Resgatar (
    fk_Recompensa_idRecompensa INTEGER,
    fk_Missao_idMissao INTEGER
);

CREATE TABLE Participar (
    fk_Ranking_idRanking INTEGER,
    fk_Vitalink_idVitalink INTEGER
);

CREATE TABLE Conquista (
    fk_Ranking_idRanking INTEGER,
    fk_Badge_idBadge INTEGER
);

CREATE TABLE Progresso (
    fk_Badge_idBadge INTEGER,
    fk_Missao_idMissao INTEGER
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Vitalink_idVitalink)
    REFERENCES Vitalink (idVitalink)
    ON DELETE RESTRICT;
 
ALTER TABLE Conectar ADD CONSTRAINT FK_Conectar_1
    FOREIGN KEY (fk_Hemocentro_idHemocentro)
    REFERENCES Hemocentro (idHemocentro)
    ON DELETE RESTRICT;
 
ALTER TABLE Conectar ADD CONSTRAINT FK_Conectar_2
    FOREIGN KEY (fk_Usuario_idDoador)
    REFERENCES Usuario (idDoador)
    ON DELETE SET NULL;
 
ALTER TABLE Atribuir ADD CONSTRAINT FK_Atribuir_1
    FOREIGN KEY (fk_Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE RESTRICT;
 
ALTER TABLE Atribuir ADD CONSTRAINT FK_Atribuir_2
    FOREIGN KEY (fk_Vitalink_idVitalink)
    REFERENCES Vitalink (idVitalink)
    ON DELETE SET NULL;
 
ALTER TABLE Doar ADD CONSTRAINT FK_Doar_1
    FOREIGN KEY (fk_Doacao_idDoacao)
    REFERENCES Doacao (idDoacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Doar ADD CONSTRAINT FK_Doar_2
    FOREIGN KEY (fk_Usuario_idDoador)
    REFERENCES Usuario (idDoador)
    ON DELETE SET NULL;
 
ALTER TABLE Receber ADD CONSTRAINT FK_Receber_1
    FOREIGN KEY (fk_Doacao_idDoacao)
    REFERENCES Doacao (idDoacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Receber ADD CONSTRAINT FK_Receber_2
    FOREIGN KEY (fk_Hemocentro_idHemocentro)
    REFERENCES Hemocentro (idHemocentro)
    ON DELETE RESTRICT;
 
ALTER TABLE Agendar ADD CONSTRAINT FK_Agendar_1
    FOREIGN KEY (fk_Agendamento_idAgendamento)
    REFERENCES Agendamento (idAgendamento)
    ON DELETE SET NULL;
 
ALTER TABLE Agendar ADD CONSTRAINT FK_Agendar_2
    FOREIGN KEY (fk_Doacao_idDoacao)
    REFERENCES Doacao (idDoacao)
    ON DELETE SET NULL;
 
ALTER TABLE Realizar ADD CONSTRAINT FK_Realizar_1
    FOREIGN KEY (fk_Agendamento_idAgendamento)
    REFERENCES Agendamento (idAgendamento)
    ON DELETE SET NULL;
 
ALTER TABLE Realizar ADD CONSTRAINT FK_Realizar_2
    FOREIGN KEY (fk_Usuario_idDoador)
    REFERENCES Usuario (idDoador)
    ON DELETE SET NULL;
 
ALTER TABLE Publicar ADD CONSTRAINT FK_Publicar_1
    FOREIGN KEY (fk_Hemocentro_idHemocentro)
    REFERENCES Hemocentro (idHemocentro)
    ON DELETE RESTRICT;
 
ALTER TABLE Publicar ADD CONSTRAINT FK_Publicar_2
    FOREIGN KEY (fk_Campanha_idCampanha)
    REFERENCES Campanha (idCampanha)
    ON DELETE SET NULL;
 
ALTER TABLE Resgatar ADD CONSTRAINT FK_Resgatar_1
    FOREIGN KEY (fk_Recompensa_idRecompensa)
    REFERENCES Recompensa (idRecompensa)
    ON DELETE RESTRICT;
 
ALTER TABLE Resgatar ADD CONSTRAINT FK_Resgatar_2
    FOREIGN KEY (fk_Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE RESTRICT;
 
ALTER TABLE Participar ADD CONSTRAINT FK_Participar_1
    FOREIGN KEY (fk_Ranking_idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE RESTRICT;
 
ALTER TABLE Participar ADD CONSTRAINT FK_Participar_2
    FOREIGN KEY (fk_Vitalink_idVitalink)
    REFERENCES Vitalink (idVitalink)
    ON DELETE SET NULL;
 
ALTER TABLE Conquista ADD CONSTRAINT FK_Conquista_1
    FOREIGN KEY (fk_Ranking_idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE SET NULL;
 
ALTER TABLE Conquista ADD CONSTRAINT FK_Conquista_2
    FOREIGN KEY (fk_Badge_idBadge)
    REFERENCES Badge (idBadge)
    ON DELETE SET NULL;
 
ALTER TABLE Progresso ADD CONSTRAINT FK_Progresso_1
    FOREIGN KEY (fk_Badge_idBadge)
    REFERENCES Badge (idBadge)
    ON DELETE RESTRICT;
 
ALTER TABLE Progresso ADD CONSTRAINT FK_Progresso_2
    FOREIGN KEY (fk_Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE RESTRICT;/* BloodLink_Lógico_1: */

CREATE TABLE Hemocentro (
    idHemocentro INTEGER PRIMARY KEY,
    nomeHemocentro VARCHAR,
    cnpjHemocentro CHAR,
    enderecoHemocentro VARCHAR,
    telefoneHemocentro VARCHAR,
    emailHemocentro VARCHAR,
    horariofuncionamentoHemocentro TIMESTAMP,
    urgenciaHemocentro VARCHAR
);

CREATE TABLE Usuario (
    emailDoador VARCHAR,
    idDoador INTEGER PRIMARY KEY,
    enderecoDoador VARCHAR,
    ultimaDoacaoDoador DATE,
    nomeDoador VARCHAR,
    cpfDoador CHAR,
    dataNascimentoDoador DATE,
    sexoDoador VARCHAR,
    tipoSanguineoDoador CHARACTER,
    telefoneDoador VARCHAR,
    emailDoador VARCHAR,
    tipoUsuario USUARIO/DOADOR/VITALINKER,
    fk_Vitalink_idVitalink INTEGER
);

CREATE TABLE Vitalink (
    idVitalink INTEGER PRIMARY KEY,
    nivelVitalink INTEGER,
    nomeVitalink VARCHAR,
    statusVitalink VARCHAR,
    acessorioVitalink BLOB,
    rankVitalink INTEGER,
    tituloVitalink VARCHAR
);

CREATE TABLE Missao (
    idMissao INTEGER PRIMARY KEY,
    dificuldadeMissao VARCHAR,
    tituloMissao VARCHAR,
    descricaoMissao VARCHAR,
    tipoMissao VARCHAR,
    progressoMissao FLOAT
);

CREATE TABLE Doacao (
    idDoacao INTEGER PRIMARY KEY,
    dataDoacao DATE,
    validadeDoacao DATE,
    quantidadeDoacao INTEGER,
    tipoDoacao VARCHAR,
    obervacoesDoacao VARCHAR
);

CREATE TABLE Recompensa (
    idRecompensa INTEGER PRIMARY KEY,
    expRecompensa INTEGER,
    moedaRecompensa INTEGER,
    statusRecompensa VARCHAR,
    conquistaRecompensa VARCHAR,
    acessorioRecompensa BLOB
);

CREATE TABLE Campanha (
    idCampanha INTEGER PRIMARY KEY,
    hemocentroCampanha VARCHAR,
    tituloCampanha VARCHAR,
    descricaoCampanha VARCHAR,
    dataInicioCampanha DATE,
    dataFimCampanha DATE,
    quantidadeCampanha INTEGER,
    tipoSanguineoCampanha VARCHAR,
    metaCampanha INTEGER,
    publicoAlvoCampanha VARCHAR
);

CREATE TABLE Agendamento (
    idAgendamento INTEGER PRIMARY KEY,
    dataHoraAgendamento DATE,
    statusAgendamento VARCHAR
);

CREATE TABLE Ranking (
    idRanking INTEGER PRIMARY KEY,
    periodoRanking DATE,
    posicaoRanking INTEGER,
    localRanking VARCHAR,
    tipoRanking VARCHAR,
    pontosRanking INTEGER,
    tituloRanking VARCHAR
);

CREATE TABLE Badge (
    idBadge INTEGER PRIMARY KEY,
    nomeBadge VARCHAR,
    descricaoBadge VARCHAR,
    iconeBadge BLOB
);

CREATE TABLE Conectar (
    fk_Hemocentro_idHemocentro INTEGER,
    fk_Usuario_idDoador INTEGER
);

CREATE TABLE Atribuir (
    fk_Missao_idMissao INTEGER,
    fk_Vitalink_idVitalink INTEGER
);

CREATE TABLE Doar (
    fk_Doacao_idDoacao INTEGER,
    fk_Usuario_idDoador INTEGER
);

CREATE TABLE Receber (
    fk_Doacao_idDoacao INTEGER,
    fk_Hemocentro_idHemocentro INTEGER
);

CREATE TABLE Agendar (
    fk_Agendamento_idAgendamento INTEGER,
    fk_Doacao_idDoacao INTEGER
);

CREATE TABLE Realizar (
    fk_Agendamento_idAgendamento INTEGER,
    fk_Usuario_idDoador INTEGER
);

CREATE TABLE Publicar (
    fk_Hemocentro_idHemocentro INTEGER,
    fk_Campanha_idCampanha INTEGER
);

CREATE TABLE Resgatar (
    fk_Recompensa_idRecompensa INTEGER,
    fk_Missao_idMissao INTEGER
);

CREATE TABLE Participar (
    fk_Ranking_idRanking INTEGER,
    fk_Vitalink_idVitalink INTEGER
);

CREATE TABLE Conquista (
    fk_Ranking_idRanking INTEGER,
    fk_Badge_idBadge INTEGER
);

CREATE TABLE Progresso (
    fk_Badge_idBadge INTEGER,
    fk_Missao_idMissao INTEGER
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Vitalink_idVitalink)
    REFERENCES Vitalink (idVitalink)
    ON DELETE RESTRICT;
 
ALTER TABLE Conectar ADD CONSTRAINT FK_Conectar_1
    FOREIGN KEY (fk_Hemocentro_idHemocentro)
    REFERENCES Hemocentro (idHemocentro)
    ON DELETE RESTRICT;
 
ALTER TABLE Conectar ADD CONSTRAINT FK_Conectar_2
    FOREIGN KEY (fk_Usuario_idDoador)
    REFERENCES Usuario (idDoador)
    ON DELETE SET NULL;
 
ALTER TABLE Atribuir ADD CONSTRAINT FK_Atribuir_1
    FOREIGN KEY (fk_Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE RESTRICT;
 
ALTER TABLE Atribuir ADD CONSTRAINT FK_Atribuir_2
    FOREIGN KEY (fk_Vitalink_idVitalink)
    REFERENCES Vitalink (idVitalink)
    ON DELETE SET NULL;
 
ALTER TABLE Doar ADD CONSTRAINT FK_Doar_1
    FOREIGN KEY (fk_Doacao_idDoacao)
    REFERENCES Doacao (idDoacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Doar ADD CONSTRAINT FK_Doar_2
    FOREIGN KEY (fk_Usuario_idDoador)
    REFERENCES Usuario (idDoador)
    ON DELETE SET NULL;
 
ALTER TABLE Receber ADD CONSTRAINT FK_Receber_1
    FOREIGN KEY (fk_Doacao_idDoacao)
    REFERENCES Doacao (idDoacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Receber ADD CONSTRAINT FK_Receber_2
    FOREIGN KEY (fk_Hemocentro_idHemocentro)
    REFERENCES Hemocentro (idHemocentro)
    ON DELETE RESTRICT;
 
ALTER TABLE Agendar ADD CONSTRAINT FK_Agendar_1
    FOREIGN KEY (fk_Agendamento_idAgendamento)
    REFERENCES Agendamento (idAgendamento)
    ON DELETE SET NULL;
 
ALTER TABLE Agendar ADD CONSTRAINT FK_Agendar_2
    FOREIGN KEY (fk_Doacao_idDoacao)
    REFERENCES Doacao (idDoacao)
    ON DELETE SET NULL;
 
ALTER TABLE Realizar ADD CONSTRAINT FK_Realizar_1
    FOREIGN KEY (fk_Agendamento_idAgendamento)
    REFERENCES Agendamento (idAgendamento)
    ON DELETE SET NULL;
 
ALTER TABLE Realizar ADD CONSTRAINT FK_Realizar_2
    FOREIGN KEY (fk_Usuario_idDoador)
    REFERENCES Usuario (idDoador)
    ON DELETE SET NULL;
 
ALTER TABLE Publicar ADD CONSTRAINT FK_Publicar_1
    FOREIGN KEY (fk_Hemocentro_idHemocentro)
    REFERENCES Hemocentro (idHemocentro)
    ON DELETE RESTRICT;
 
ALTER TABLE Publicar ADD CONSTRAINT FK_Publicar_2
    FOREIGN KEY (fk_Campanha_idCampanha)
    REFERENCES Campanha (idCampanha)
    ON DELETE SET NULL;
 
ALTER TABLE Resgatar ADD CONSTRAINT FK_Resgatar_1
    FOREIGN KEY (fk_Recompensa_idRecompensa)
    REFERENCES Recompensa (idRecompensa)
    ON DELETE RESTRICT;
 
ALTER TABLE Resgatar ADD CONSTRAINT FK_Resgatar_2
    FOREIGN KEY (fk_Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE RESTRICT;
 
ALTER TABLE Participar ADD CONSTRAINT FK_Participar_1
    FOREIGN KEY (fk_Ranking_idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE RESTRICT;
 
ALTER TABLE Participar ADD CONSTRAINT FK_Participar_2
    FOREIGN KEY (fk_Vitalink_idVitalink)
    REFERENCES Vitalink (idVitalink)
    ON DELETE SET NULL;
 
ALTER TABLE Conquista ADD CONSTRAINT FK_Conquista_1
    FOREIGN KEY (fk_Ranking_idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE SET NULL;
 
ALTER TABLE Conquista ADD CONSTRAINT FK_Conquista_2
    FOREIGN KEY (fk_Badge_idBadge)
    REFERENCES Badge (idBadge)
    ON DELETE SET NULL;
 
ALTER TABLE Progresso ADD CONSTRAINT FK_Progresso_1
    FOREIGN KEY (fk_Badge_idBadge)
    REFERENCES Badge (idBadge)
    ON DELETE RESTRICT;
 
ALTER TABLE Progresso ADD CONSTRAINT FK_Progresso_2
    FOREIGN KEY (fk_Missao_idMissao)
    REFERENCES Missao (idMissao)
    ON DELETE RESTRICT;