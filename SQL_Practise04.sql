create table arac(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
)
insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--SORU1: arac tablosundaki en yüksek fiyat'ı listele
SELECT max(fiyat) as en_yuksek_fiyat FROM arac;
--SORU2: arac tablosundaki fiyatların toplamını listele
SELECT SUM(fiyat) FROM arac;
--SORU3: arac tablosundaki fiyat ortalamalarını listele
select round(avg(fiyat),2) from arac;
--SORU4: arac tablosunda kaç tane araç oldugunu listele
select count(marka) from arac;

CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
		
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');

--SORU5: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.
SELECT * FROM meslekler ORDER BY isim;
--SORU6: meslekler tablosunda maas'i buyukten kucuge siralayiniz
SELECT * FROM meslekler ORDER BY maas DESC;

--SORU7: meslekler tablosunda isim'i 'Ali' olanları,
-- maas'a göre büyükten küçüge sıralayarak sorgulayınız
SELECT * FROM meslekler 
WHERE isim='Ali' 
ORDER BY maas DESC

--SORU8: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas sıralı olarak sorgulayınız.
SELECT * FROM meslekler
WHERE soyisim='Bulut'
ORDER BY maas

--SORU9: meslekler tablosunda id degeri 5 den büyük olan,
-- ilk 2 veriyi listeleyiniz.
SELECT * FROM meslekler 
WHERE id>5
limit (2);





























