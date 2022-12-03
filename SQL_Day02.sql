CREATE TABLE ogrenciler5
(
ogrenci_no char(7),--uzunluğunu bildiğimiz stringler için char kullanılır.
isim varchar(20), --uzunluğunu bilmediğimiz stringler için varchar kullanılır.
soyisim varchar(25),
not_ort real, --Ondalıklı sayılar için kullanılır. (Javadaki double gibi)
kayit_tarih date
);
--VAROLAN BİR TABLODAN YENİ BİR TABLO OLUŞTRUMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar;

--INSERT - TABLO İCİNE EKLEME

insert into notlar values ('Veli',78.5);
insert into notlar values ('Aslı',88.5);
insert into notlar values ('Adem',76.5);

Create table talebeler

(
isim varchar(10),
notlar real
);

CREATE TABLE ogrenciler6
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real, 
kayit_tarih date
);
select *from ogrenciler6;
insert into ogrenciler6 VALUES ('1234567','Rukiye','Akyol',77.5,now());
insert into ogrenciler6 VALUES ('1234568','Ali','Veli',77.5,now());
insert into ogrenciler6 (ogrenci_no,soyisim,not_ort) values('1234569','Dogan','70.5');--not null sebebiyle isim value'si olmayan bir data eklenemez.

--PRIMARY KEY ATAMASI NASIL YAPILIR:
CREATE TABLE ogrenciler7
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real, 
kayit_tarih date
);
--PRIMARY KEY ATAMASI İKİNCİ YOL:
CREATE TABLE ogrenciler8
(
ogrenci_no char(7),
isim varchar(20) not null,
soyisim varchar(25),
not_ort real, 
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)
	
);

--FOREIGN KEY OLUŞTURMA
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
CREATE TABLE tedarikciler3
(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
)

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)	
);

select * from tedarikciler3


/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi 
Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın. “adresler” isminde baska bir tablo olusturun.Icinde 
“adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id char(5) PRIMARY KEY,
isim varchar(20) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(adres_id char(5) ,
sokak varchar(15),
cadde varchar(15),
sehir varchar(10),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
)

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');--İSİMDE UNIQUE CONSTRAINT OLDUGU İCİN KABUL ETMEDİ
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--MAAŞTA NOT NULL CONSTRAINT OLDUGU İCİN KABUL ETMEDİ
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--İSİMDE UNIQUE CONSTRAINT OLDUGU İCİN KABUL ETMEDİ
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--SYNTAX HATASI INT. VALUE AAM STRİNG GİRMEYE CALISTI
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--HİÇLİK DE OLSA İKİNCİ KERE OLDUGU İÇİN YANİ UNIQUE OLMADIGI İÇİN KABUL EDİLMİYOR.
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');--İD'Lar aynı olmalı
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');


select * from calisanlar;
select *from adresler;

--CHECK CONSTRAINT
CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');

-- DQL --- WHERE KULLANIMI:

SELECT * FROM calisanlar;

SELECT isim FROM calisanlar; 

--Calisanlar tablosundan maası 5000'den büyük olan isimleri listeleyiniz

select isim,maas from calisanlar WHERE maas>5000;

--Calisanlar tablosundan ismi Veli Han olan tüm verileri getiiriniz:
select * from calisanlar WHERE isim='Veli Han';

--Calisanlar tablosundan maası 5000 olan tüm veileri listeleyiniz:
select * from calisanlar where maas=5000;


--DML-- DELETE KOMUTU:
DELETE FROM calisanlar;--Eger parent table(primary keyin oldugu tablo) başka bir child tablo ile ilişkili ise önce child table silinmelidir.
delete from adresler;
select *from adresler;

--adresler tablosundan sehri antep olan verileri silelim:
delete from adresler where sehir='Antep';


CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select *from ogrenciler3;
--ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler3 where isim='Nesibe Yilmaz' or isim='Mustafa Bak';








