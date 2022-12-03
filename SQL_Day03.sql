CREATE TABLE ogrenciler_tablosu
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler_tablosu VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler_tablosu VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler_tablosu VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler_tablosu VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler_tablosu VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler_tablosu VALUES(127, 'Mustafa Bak', 'Ali', 99);

select *from ogrenciler_tablosu

--ismi Mustafa Bak veya Nesibe Yilmaz olan kayıtları silelim:
delete from ogrenciler_tablosu WHERE isim='Nesibe Yilmaz' or isim='Mustafa Bak'

--Veli ismi Hasan olan datayı silelim:
delete from ogrenciler_tablosu where veli_isim= 'Hasan'

--TRUNCATE--
--Bir tablodaki tüm verileri geri alamayacağımız şekilde siler, veriler tutulmaz/şartlı silme yapmaz.
truncate table ogrenciler_tablosu
truncate ogrenciler_tablosu

--ON DELETE CASCADE
--parenttaki silinen bir kayıt ile ilişkili olan child kayıtlarını silebiliriz.
--aksi takdirde önce child temizlenir sonra parenttaki silinir.
DROP TABLE IF EXISTS talebeler
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select *from talebe;
select * from not1;

--Notlar tablosundan id'si 123 olan datayı silelim:
delete from not1 where talebe_id='123';

--talebeler tablosundan id'si 126 olan datayı silelim:
delete from talebe where id='126';
/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yalnız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/
DROP TABLe if exists musteriler
CREATE TABLE musteriler  (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler
--Task: Musteriler tablsoundan urun ismi Orange, Apple veya Apricot olan tüm verileri listeleyiniz

SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot';

--IN CONDITION:
select * from musteriler where urun_isim in ('Orange','Apple','Apricot')

--NOT IN---> Yazdığımız verilerin dışındakileri getirir:
select * from musteriler where urun_isim not in ('Orange','Apple','Apricot')


--BETWEEN CONDITION:
--iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
--yazabilme imkani verir. Yazdigimiz 2 sayi da araliga dahildir.

--Task: Müsteriler tablosundan urun_id'si 20 ile 40 arasındaki tüm verileri listeleyiniz.
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40;
--Between ile çözüm:
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40

--NOT BETWEEN: BU ARALIKTA OLMAYAN

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40

-- 								SUBQUERIES
-- SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur

drop table if exists marka
CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select *from calisanlar2
select* from markalar

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim, maas, isyeri from calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000)

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
select isim,maas,sehir from calisanlar2
where isyeri IN (SELECT marka_isim from markalar where marka_id>101)

--Ankara'da calisani olan markaların marka id ve calisan sayilarini listeleyiniz.
select marka_id, calisan_sayisi from markalar
where marka_isim IN (SELECT isyeri from calisanlar2 where sehir='Ankara')

--AGGREGATE METHOD
--Eger bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek 
--istediğimiz ismi yazariz.

--Calisanlar tablosundan en yüksek maaşı:
SELECT max(maas) AS maksimum_maas FROM calisanlar2;

--Calisanlar tablosundan en düşük maaşı listeleyelim:
SELECT min(maas) AS en_dusuk_maas FROM calisanlar2;

--Calisanlar tablosundaki maasların toplamın listeleyiniz:
SELECT sum(maas) FROM calisanlar2

--Calisanlar tblosundaki maasların ortalamasını listeleyiniz 
--//ortalamayı derli toplu tam sayıya cevrilmiş hali ile istiyorsak round(avg(maas)).
--1234.55 gibi küsuratı net istiyorsak round(avg(maas),2)
SELECT round(avg(maas)) FROM calisanlar2

--Calisanlar2 tablosundaki maas'ların sayısını listeleyiniz:
--Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir.
-- count (Sutun adı) kullanırsak o sutundaki sayıları verir

SELECT count(maas) FROM calisanlar2
select count (*) from calisanlar2

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz

SELECT marka_id, marka_isim,
(SELECT count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri) 
from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum
--maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas)FROM calisanlar2 WHERE isyeri=marka_isim)as endusukmaas
FROM markalar

--VIEW KULLANIMI:
CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas)FROM calisanlar2 WHERE isyeri=marka_isim)as endusukmaas
FROM markalar;

select * from maxminmaas;

--EXISTS CONDITION
CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart
SELECT * FROM nisan

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
-- URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
-- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
SELECT urun_id, musteri_isim FROM mart
WHERE EXISTS (SELECT urun_id FROM nisan WHERE mart.urun_id = nisan.urun_id)

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri NİSAN ayında satın alan 
--MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız

SELECT urun_isim,musteri_isim FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim) 


CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
DROP TABLE if exists urunler
CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler
select * from urunler


-- 						UPDATE (DML)					 --
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi = 'istenen veri'
 */
UPDATE tedarikciler 
SET firma_ismi='Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve 
--irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler
SET firma_ismi='Casper', irtibat_ismi='Ali Veli' WHERE vergi_no=101 

--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler
SET urun_isim = 'Telefon' WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id degeri 1004'ten büyük olanların urun_id'sini 1 arttırın:
UPDATE urunler
SET urun_id = urun_id+1 WHERE urun_id>1004
--urunler tablosundaki tüm ürünlerin urun_id  degerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz
UPDATE urunler
SET urun_id =urun_id + ted_vergino

DELETE FROM urunler 

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urunler
SET urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adam Eve')--parantez içi Apple'ı verir.
WHERE musteri_isim='Ali Bak' 
-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in 
--irtibat_isim'i ile degistirin.
UPDATE urunler
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')
WHERE urun_isim='Laptop'









