DROP Database if exists ProgettoTSW;
CREATE DATABASE  ProgettoTSW;
use ProgettoTSW;

Create table Produttore(
pIva varchar(10) Primary Key,
nome varchar(20) not null,
via varchar(20) not null, 
cap int not null,
citta varchar(20) not null 
);

insert INTO Produttore values
("1","FruttaBio", "San James", 84134,"Salerno"),
("2","VerduraFresca", "Sant'Andreas",84100,"Salerno"),
("3","Caseificio Gaeta", "San Paul", 84100,"Salerno");

Create table Cassetta(
id int auto_increment  Primary key,
prezzo double not null
);

Create table Carrello(
id int auto_increment Primary key,
prezzo double not null
);

Create table utente(
id int auto_increment Key,
carrello int,
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
username varchar(20) not null,
email varchar(40) not null,
passwordhash varchar(100) not null, 
admin boolean not null default 0,
ddnascita varchar(15)not null,
citta varchar(20) not null
);

Create table Categoria(
id int auto_increment Primary key,
 descrizione varchar(200) not null,
 nome varchar(10) not null
);
insert into categoria value
(1,"si mangia","Verdura"),
(2,"SonoBuoni","Dolci"),
(3,"succosa","frutta");

Create table Prodotto(
id int auto_increment Primary Key,
produttore varchar(10),
foreign key (produttore) references Produttore(pIva) 
on delete cascade 
on update cascade,
categoria int,
foreign key (categoria) references Categoria(id) 
on delete cascade 
on update cascade,
nome varchar(20) not null,
descrizione varchar(200) not null,
prezzo double not null,
offerta boolean not null default 0,
disponibili int not null,
immagine varchar(100) not null
);

insert into prodotto value
(1,2,1,"Pomodoro","bio","2.4",0,1,"./img/pomodoro.jpg"),
(4,3,2,"Cioccolato","Fondente","3.50",1,1,"./img/cioccolato.jpg"),
(3,3,2,"Biscotti","Allo yogurt, senza glutine","3.00",1,10,"./img/biscottiAlloyogurtSenzaGlutine.jpg"),
(5,1,3,"Fragole","ciao","3.50",1,30,"./img/Fragolebio.jpg"),
(6,1,3,"Avocado","ciao","3",0,20,"./img/Avocado.jpg"),
(7,2,1,"rucola","ciao","1.23",1,20,"./img/rucola.jpg");



Create table Inserimento(
cassetta int,
prodotto int,
foreign key (cassetta) references Cassetta(id) 
on delete cascade 
on update cascade,
foreign key (prodotto) references Prodotto(id) 
on delete cascade 
on update cascade,
primary key (cassetta, prodotto)
);

Create table Aggiungi(
carrello int,
prodotto int,
nprodotto int not null,
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
foreign key (prodotto) references Prodotto(id) 
on delete cascade 
on update cascade,

primary key (carrello, prodotto)
);

Create table Ordine(
id int auto_increment primary key,
data date not null,
orario time, #es: insert into utenti (orario) values ('17:34');
carrello int,
cliente int,

foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
foreign key (cliente) references Cliente(id) 
on delete cascade 
on update cascade
);

Create table Inserire(
carrello int,
cassetta int,
ncassette int not null,
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
foreign key (cassetta) references Cassetta(id) 
on delete cascade 
on update cascade,

primary key (carrello, cassetta)
);


select * from Prodotto;