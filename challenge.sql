set serveroutput on
set verify off


CREATE TABLE T_CLYVO_VET(
id_vet number(2) primary key not null,
nm_vet VARCHAR(20) not null,
cpf_vet VARCHAR(14) not null,
crmv_vet VARCHAR(20) not null,
email VARCHAR(254) NOT NULL,
senha VARCHAR(60) NOT NULL
);

CREATE TABLE T_CLYVO_CLINICA(
id_clinica number(2) primary key not null,
cnpj_clinica VARCHAR(20) not null,
nm_clinica VARCHAR(20) not null
);

CREATE TABLE T_CLYVO_PRESCRICAO(
id_prescricao number(2) PRIMARY KEY NOT NULL,
medicamento_prescricao VARCHAR(20),
nm_tutor_prescricao VARCHAR(20),
nm_animal_prescricao VARCHAR(20),
dt_emissao DATE,
dt_expiracao DATE
);

CREATE TABLE T_CLYVO_VET_CLINICA(
id_vet number(2) not null,
id_clinica number(2) not null,
CONSTRAINT fk_vet FOREIGN KEY(id_vet) REFERENCES T_CLYVO_VET(id_vet),
CONSTRAINT fk_clinica FOREIGN KEY(id_clinica) REFERENCES T_CLYVO_CLINICA(id_clinica)
);


CREATE TABLE T_CLYVO_ENDERECO(
id_endereco number(2) PRIMARY KEY,
pais VARCHAR(20) NOT NULL,
estado VARCHAR(20) NOT NULL,
cidade VARCHAR(20) NOT NULL,
bairro VARCHAR(20) NOT NULL,
logradouro_rua VARCHAR(20) NOT NULL,
nr_rua VARCHAR(20) NOT NULL,
completo VARCHAR(20) NOT NULL,
cep VARCHAR(9) NOT NULL,
tipo VARCHAR(20) NOT NULL,
id_clinica number(2),
CONSTRAINT fk_clinica FOREIGN KEY (id_clinica) REFERENCES T_CLYVO_CLINICA(id_clinica)
);

CREATE TABLE T_CLYVO_TUTOR(
id_tutor number(2) primary key not null,
cpf_tutor VARCHAR(14) NOT NULL,
nm_tutor VARCHAR(20) NOT NULL,
nr_telefone_tutor VARCHAR(13),
id_endereco number(2) not null,
CONSTRAINT fk_tutor_endereco FOREIGN KEY (id_endereco) REFERENCES T_CLYVO_ENDERECO(id_endereco)
);


CREATE TABLE T_CLYVO_ANIMAL(
id_animal number(2) PRIMARY KEY NOT NULL,
rg_animal VARCHAR(20),
nr_microchip_animal VARCHAR(20),
nm_animal VARCHAR(20) NOT NULL,
dt_nascimento_animal DATE NOT NULL,
peso_animal number(5,2) NOT NULL,
especie_animal VARCHAR(20) NOT NULL,
raca_animal VARCHAR(20) NOT NULL,
id_tutor number(2) NOT NULL,
id_carteiravacinal number(2) NOT NULL,
id_endereco number(2) NOT NULL,
CONSTRAINT fk_an_tutor FOREIGN KEY (id_tutor) REFERENCES T_CLYVO_TUTOR(id_tutor),
CONSTRAINT fk_an_carteiravacinal FOREIGN KEY (id_carteiravacinal) REFERENCES T_CLYVO_CARTEIRAVACINAL(id_carteiravacinal),
CONSTRAINT fk_an_endereco FOREIGN KEY (id_endereco) REFERENCES T_CLYVO_ENDERECO(id_endereco)
);

CREATE TABLE T_CLYVO_MEDICAMENTO(
id_medicamento number(2) PRIMARY KEY NOT NULL,
id_prescricao number(2) not null,
nm_medicamento VARCHAR(20),
dosagem_medicamento VARCHAR(20),
frequencia VARCHAR(10),
qtd_dias number(2),
CONSTRAINT fk_med_prescicao FOREIGN KEY (id_prescricao) REFERENCES T_CLYVO_PRESCRICAO(id_prescricao))


CREATE TABLE T_CLYVO_CARTEIRAVACINAL(
id_carteiravacinal number(2) PRIMARY KEY NOT NULL,
nm_vacina VARCHAR(20) NOT NULL,
dt_vacinacao_prevista DATE,
dt_vacinacao,efetuada DATE,
st_vacinacao VARCHAR(20),
id_animal number(2),
CONSTRAINT fk_vac_animal FOREIGN KEY (id_animal) REFERENCES T_CLYVO_ANIMAL(id_animal)
);

CREATE TABLE T_CLYVO_CONSULTA(
id_consulta number(2) PRIMARY KEY NOT NULL,
historico_cosnsulta VARCHAR(200) NOT NULL,
st_consulta VARCHAR(20) CHECK (st_consulta IN ('passada','execução','futura','cancelada')) NOT NULL,
dt_consulta DATE NOT NULL,
id_vet number(2)NOT NULL,
id_animal number(2) NOT NULL,
id_prescricao number(2) NOT NULL,
CONSTRAINT fk_con_vet FOREIGN KEY (id_vet) REFERENCES T_CLYVO_VET(id_vet),
CONSTRAINT fk_con_animal FOREIGN KEY (id_animal) REFERENCES T_CLYVO_ANIMAL(id_animal),
CONSTRAINT fk_con_prescricao FOREIGN KEY (id_prescricao) REFERENCES T_CLYVO_PRESCRICAO(id_prescricao)
);
//entrada do usuario ao sistema 

DECLARE 
    CURSOR c_vet IS SELECT email, senha FROM T_CLYVO_VET;
    v_email VARCHAR(254) := '&email';
    v_senha VARCHAR(60) :='&senha';
BEGIN

END;

//cadastrar a consulta - opcao se tem o animal no banco de dados e se nao tem e ai tem que criar



//buscar informação do pet

//buscar informacao do tutor










