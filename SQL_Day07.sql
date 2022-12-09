-- DISTINCT KULLANIMI
CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);
SELECT * FROM maas
-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
--GROUP BY ÇÖZÜMÜ
SELECT urun_isim FROM musteri_urun
GROUP BY urun_isim
--DISTINCT ÇÖZÜMÜ
SELECT DISTINCT(urun_isim) FROM musteri_urun;
-- Tabloda kaç farklı meyve vardır
SELECT urun_isim, count(urun_isim) FROM musteri_urun
GROUP BY urun_isim
-- FETCH NEXT () ROW ONLY / OFFSET / LIMIT
-- Musteri urun tablosundan ilk üç kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id
FETCH NEXT 3 ROW ONLY
-- LIMIT
SELECT * FROM musteri_urun ORDER BY urun_id
limit 3
-- Musteri urun tablosundan ilk kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id
limit 1
-- Müsteri urun tablosundan son üç kaydı listeleyiniz
SELECT * FROM musteri_urun ORDER BY urun_id DESC
limit 3
-- EN yüksek maası alan müsteriyi listeleyiniz
SELECT * FROM maas ORDER BY maas DESC limit 1
-- Maas tablosundan en yüksek ikinci maası listeleyiniz
SELECT * FROM maas ORDER BY maas DESC offset 1 limit 1
/*
OFFSET --> Satır atlamak istediğimizde offset komutunu kullanırız
*/
SELECT * FROM maas ORDER BY maas desc
OFFSET 1 
FETCH NEXT 1 ROW ONLY
-- Maas tablosundan en düşük dördüncü maası listeleyiniz
SELECT * FROM maas ORDER BY maas offset 3 limit 1
-- DDL --> ALTER TABLE
drop table personel -- Tabloyu ortadan kaldırmak için kullanılır
CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
SELECT * FROM personel

--1) add default değer ile tabloya bir field ekleme
alter table personel 
add ulke varchar (30)

alter table personel 
add zipcode varchar (30)

alter table personel 
add adres varchar (50) default 'Deutschland' 
-- default yazılırsa oluşturulan sütuna belirtilen veriyi tüm satıra girer

--2) drop tablodan sütun silme
alter table personel 
drop column zipcode

alter table personel
drop adres, drop sirket -- iki sütun birden silindi

--3) rename column sütun adı değiştirme
alter table personel
rename column sehir to il

--4) rename tablonun ismini değiştirme
alter table personel
rename to isci

--5) type/set sütunlarının özelliklerini değiştirme
alter table isci
alter column il type varchar (30),

alter column maas set not null;

--























