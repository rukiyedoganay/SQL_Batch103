-----------------ALIASES---------------------- 
--tablo yazdırılırken field isimleri sadece o çıktı için değiştirilebilir.
--iki ayrı sutun içindeki verileri birleştirmek (concat) için kullanılır. || ile yapılır.
CREATE TABLE personeller (
personel_id char(9),
personel_isim varchar(50),
personel_dogdugu_sehir varchar(50)
);
INSERT INTO personeller VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO personeller VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO personeller VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from personeller

--iki sütunu concat yapmak: 
--1.yol:
select personel_id as id, personel_isim||' '||personel_dogdugu_sehir as personel_bilgisi from personeller 
--2.yol:
select personel_id as id, concat (personel_isim,'-',personel_dogdugu_sehir) as personel_bilgisi from personeller

------------IS NULL CONDITION------------IS NOT NULL CONDITION-----------

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select * from insanlar

--Soru1: Name sutununda null olan degerleri listeleyiniz:

select adres from insanlar where name is null
 	
--Soru2: İnsanlar tablosunda sadece name null olmayan değerleri listeleyiniz:

select * from insanlar where name is not null

--Soru3: İnsanlar tablosunda null değer almış verileri no name olarak değiştiriniz:

update insanlar
set name='No Name' 
where name is null

---------ORDER BY CLAUSE(KOMUT)--------

--belli bir field'a göre natural order olarak sıralama yapmak için kullanılır.
--order by komutu sadece SELECT komutu ile kullanılır.
--Default olarak kücükten büyüge, alfabetik sıralama yapar. (ASC)
--Eğer büyükten küçüğe sıralamak istersek ORDER BY komutundan sonra DESC komutunu kullanırız. --select * from people order by ssn desc
--Order by komutundan sonra field(sütun) ismi yerine field numarası da yazılabilir.--select * from people where soyisim='Bulut' order by 2

CREATE TABLE people
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO people VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO people VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO people VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO people VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO people VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO people VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Soru4: People tablosundaki datalari adres’e gore sıralayın.
SELECT * FROM people ORDER BY adres;

--Soru5: People tablosundaki datalari soyisim’e gore sıralayın.
SELECT * FROM people ORDER BY soyisim;

--Soru6: People tablosundaki ismi Mine olanları SSN' sıralı olarak listeleyin.
select * from people where isim='Mine' order by ssn;

--Soru7: People tablosundaki soyismi Bulut olanları isim sıralı olarak listeleyin.
select * from people where soyisim='Bulut' order by 2;

--Soru8: People tablosundaki tum kayıtları SSN numarası buyukten kücüge olacak sekilde sıralayın.
select * from people order by ssn desc;

--Soru9: People tablosundaki tüm kayıtları isimler Natural sıralı, Soyisimler ters sıralı olarak listeleyin.
select * from people order by isim ASC, soyisim DESC;

--Soru10: İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayın.
select isim,soyisim from people order by LENGTH(soyisim);
--Not: eger sutun uzunluğuna göre sıralamak istersek length komutu kullanırız.

--Soru11: Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH(isim||soyisim)
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))

--------GROUP BY CLAUSE---------
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT komutuyla birlikte kullanılır.

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav

--Soru12: Isme gore alinan toplam urunleri bulun 
select isim, sum(urun_miktar) as aldigi_toplam_urun from manav group by isim 

--Soru13: Isme gore alinan toplam urunleri bulun  ve urunleri buyukten kucuge listeleyiniz.
select isim, sum(urun_miktar) as aldigi_toplam_urun from manav group by isim 
order by aldigi_toplam_urun desc 

--Soru14: Ürün adına göre ürünü alan toplam kişi sayısını listeleyiniz.
select Urun_adi,count(isim) from manav
group by urun_adi

















