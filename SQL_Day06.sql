-- 							JOINS
/*
Iki Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/
CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler  (
siparis_id int,  sirket_id int,  siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18');
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19');
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20');
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

select * from sirketler
select * from siparisler

--Soru1: Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun

--INNER JOIN-->Kesişim görmek için
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi 
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id

--Soru2: Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun

-- LEFT JOIN
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

--RIGHT JOIN
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM  siparisler RIGHT JOIN sirketler
ON sirketler.sirket_id = siparisler.sirket_id;

--FULL JOIN-->iki tablodaki her şeyi görmek için kullanılır. Bir tabloda olup diğer tabloda yoksa null gözükür ama yazdırır
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM  siparisler FULL JOIN sirketler
ON sirketler.sirket_id = siparisler.sirket_id;

CREATE TABLE personel1 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel1 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel1 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel1 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel1 VALUES(4, 'Fatma Can', 'CEO', 5);
--Soru3: Her personelin yanına yönetici ismini yaxdıran bir tablo oluşturunuz
select * from personel1
--SELF JOIN
SELECT isim FROM personel

SELECT p1.isim AS personel_isim , p2.isim AS yonetici_isim 
FROM personel1 p1 INNER JOIN personel1 p2 ON p1.yonetici_id = p2.id;

--------------------------------LIKE CONDITION-----------------------
-- Like kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE komutunu kullanırız. (Ignoredan geliyor)
--Like yerine ~~ sembolü kullanılabilir.
-- büyük küçük harf gözetmemesi için ise ~~* şeklinde yapılır.

DROP table musteriler
CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);  
SELECT * FROM musteriler

--Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim LIKE 'A%';
SELECT * FROM musteriler WHERE isim ~~ 'A%';

SELECT * FROM musteriler WHERE isim ILIKE 'A%';
SELECT * FROM musteriler WHERE isim ~~* 'A%';


--Ismi e harfi ile biten müsterilerin isimlerini ve gelirlerini yazdıran bir QUERY yazdırınız
SELECT isim,gelir FROM musteriler WHERE isim LIKE '%e';

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler WHERE isim ILIKE '%er%';

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdıran query yazın.
SELECT * FROM musteriler WHERE isim LIKE '_atma';

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim ~~ '_a%';

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim ~~ '__s%';

--2. harfi a,  4. harfi m olan müsterilerin tüm bilgilerini yazdıran query yazın
SELECT * FROM musteriler WHERE isim ~~ '_a_m%';

--REGEXP_LIKE ==> ~ ile kullanılır.
--Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
--	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
--	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1010, 'hAt', 3);

--Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* 'h[ai]t';

--Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* 'h[a-k]t';

--a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin --başlayan diyince ^
SELECT * FROM kelimeler WHERE kelime ~* '^[as]';

--m veya f ile biten kelimelerin tüm bilgilerini yazdır
SELECT * FROM kelimeler WHERE kelime ~* '[mf]$'

-- ilk harfi h olmayan kelimelerin tüm bilgilerini yazdır
SELECT * FROM kelimeler WHERE kelime NOT LIKE 'h%';

--ikinci harfi e,i veya o olmayan kelimelerin tüm bilgilerini yazdır
SELECT * FROM kelimeler WHERE kelime !~~* '[_eio]';


---------UPPER-LOWER-INITCAP-------------------
--Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
--kucuk harf yazdirmak icin kullaniriz. 
--INITCAP--> ilk harfi büyük yazar, UPPER--> tüm harfleri büyük yazar, LOWER-->tüm harfleri küçük yazar
--Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek select lower(tittle), upper(isim) from musteriler seklinde yazarız.


--SORU: Kelimeler tablosundaki kelime sutunundaki verileri once hepsi buyuk harf,
--sonra kucuk harf ve ilk harfleri buyuk olacak sekilde yazdiralim

SELECT UPPER(kelime) as upper_kelime FROM kelimeler -- hepsi büyük harf
SELECT LOWER(kelime) as lower_kelime FROM kelimeler -- hepsi küçük harf
SELECT INITCAP(kelime) as ilkharfbuyuk FROM kelimeler --ilk harf büyük













