DROP Database if exists ProgettoTSW;
CREATE DATABASE  ProgettoTSW;
use ProgettoTSW;

Create table Produttore(
id int auto_increment Primary Key,
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
id int auto_increment  Primary key,
prezzo double not null
);

Create table Carrello(
id int auto_increment Primary key,
prezzo double not null
);

Create table Cliente(
id int auto_increment Key,
carrello int,
foreign key (carrello) references Carrello(id) 
on delete cascade 
on update cascade,
username varchar(20) not null,
email varchar(40) not null,
password varchar(10) not null, 
admin boolean not null default 0,
ddnascita date not null,
cap int not null ,
via varchar(30) not null,
citta varchar(20) not null
);

Create table Categoria(
id int auto_increment Primary key,
 descrizione varchar(200) not null,
 nome varchar(10) not null
);

Create table Prodotto(
id int auto_increment Primary Key,
produttore int,
foreign key (produttore) references Produttore(id) 
on delete cascade 
on update cascade,
categoria int,
foreign key (categoria) references Categoria(id) 
on delete cascade 
on update cascade,
nome varchar(20) not null,
descrizione varchar(200) not null,
offerta boolean not null default 0,
prezzo double not null,
disponibili int not null,
immagine varchar(100) not null
);



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
