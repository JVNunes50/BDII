create table Cliente (
  CPF numeric(11) primary key,
  Nome varchar(100) not null,
  Endereco varchar(100) not null,
  DDD numeric(2) not null,
  Num_Telefone numeric(9) not null,
);

create table Aviao(
  NumAviao varchar(10) primary key,
  Fabricante varchar(100) not null,
  Tipo varchar(100) not null,
  Capacidade numeric(3) not null
);

create table Aeroporto(
  Codigo varchar(10) primary key,
  Nome varchar(100),
  Localizacao varchar(100) not null
);

create table Passagem(
  Numero numeric(10) primary key,
  Data date not null,
  Classe varchar(10) not null,
  Preco numeric(8,2) not null,
  Poltrona varchar(3) not null,
  CPF_Cliente numeric(11) not null,
  Voo_Referente varchar(10) not null,
  constraint FK_CPF_Cliente foreign key (CPF_Cliente) references Cliente (CPF),
  constraint FK_Voo_Referente foreign key (Voo_Referente) references Voo (NumVoo)
);

create table Voo(
  NumVoo varchar(10) primary key,
  Destino varchar(100) not null,
  Horario timestamp not null,
  Companhia varchar(100),
  Aviao_Referente varchar(10) not null,
  Codigo_Aeroporto varchar(10) not null,
  constraint FK_Aviao_Referente foreign key (Aviao_Referente) references Aviao (NumAviao),
  constraint FK_Codigo_Aeroporto foreign (Codigo_Aeroporto) references Aeroporto (Codigo)
);
