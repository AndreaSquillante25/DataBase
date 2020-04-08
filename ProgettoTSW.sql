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
("1","Panificio", "San James", 84134,"Salerno"),
("2","Fruttivendolo", "Sant'Andreas",84100,"Salerno"),
("3","Pastificio", "San Paul", 84100,"Salerno");

Create table Cassetta(
id varchar(10) Primary key,
prezzo double not null
);

Create table Carrello(
id varchar(10) Primary key,
prezzo double not null
);

Create table Cliente(
id varchar(10) Primary Key,
carrello varchar(10),
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
username varchar(20),
email varchar(40),
password varchar(10), 
admin boolean,
ddnascita date,
cap int,
via varchar(30),
citta varchar(20)
);

Create table Categoria(
id varchar(10) Primary key,
 descrizione varchar(200),
 nome varchar(10) not null
);

Create table Prodotto(
id varchar(10) Primary Key,
produttore varchar(10),
foreign key (produttore) references Produttore(pIva) 
on delete cascade 
on update cascade,
categoria varchar(10),
foreign key (categoria) references Categoria(id) 
on delete cascade 
on update cascade,
nome varchar(20) not null,
descrizione varchar(200) not null,
offerta boolean,
prezzo double not null,
disponibili int,
immagine varchar(100)
);



Create table Inserimento(
cassetta varchar(10),
prodotto varchar(10),
foreign key (cassetta) references Cassetta(id) 
on delete cascade 
on update cascade,
foreign key (prodotto) references Prodotto(id) 
on delete cascade 
on update cascade,
primary key (cassetta, prodotto)
);

Create table Aggiungi(
carrello varchar(10),
prodotto varchar(10),
nprodotto int,
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
foreign key (prodotto) references Prodotto(id) 
on delete cascade 
on update cascade,

primary key (carrello, prodotto)
);

Create table Ordine(
id varchar(10),
data date not null,
orario time, #es: insert into utenti (orario) values ('17:34');
carrello varchar(10),
cliente varchar(10),

foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
foreign key (cliente) references Cliente(id) 
on delete cascade 
on update cascade
);

Create table Inserire(
carrello varchar(10),
cassetta varchar(10),
ncassette int,
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
foreign key (cassetta) references Cassetta(id) 
on delete cascade 
on update cascade,

primary key (carrello, cassetta)
);
