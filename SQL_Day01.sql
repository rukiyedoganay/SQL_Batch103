--Database(Veritabanı) Oluşturma
Create dataBase evren;


--DDL - DATA DEFINITION LANGUAGE
--CREATE - TABLO OLUŞTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, --Ondalıklı sayılar için kullanılır. (Javadaki double gibi)
kayit_tarih date
);

--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA:

CREATE TABLE ogrenci_notlari
AS --benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için normal tablo oluştururkenki parantezler yerine as kullanıp select komutuyla almak istedigimiz verileri alırız.
SELECT isim, soyisim, not_ort FROM ogrenciler1;

--DML - DATA MANIPULATION LANGUAGE
-- INSERT (Database'e veri ekleme)

insert into ogrenciler1 values('1234567','Rukiye','Akyol',85.5,now());
insert into ogrenciler1 values('1233567','Furkan','Akyol',84.5,'2022-12-01');

--BİR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK:

insert into ogrenciler1 (isim,soyisim) values ('Tom','Hanks');


--DQL -- DATA QUERY LANGUAGE
-- SELECT

select * from ogrenciler1; --Buradaki * sembolü her şey anlamındadır.












