create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

--- INSERT:Veritabanına yeni veri ekler.
insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);
select * from ogrenciler;

--Soru1: ogrenciler tablosundaki id ve isim sütununu getiriniz
SELECT id, isim FROM ogrenciler;

--Soru2: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu>80

--Soru3: Adresi Ankara olan ögrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE adres='Ankara'

--Soru4: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele
SELECT isim FROM ogrenciler WHERE sinav_notu=85 AND adres='Ankara'

--Soru5:Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu=65 or sinav_notu=85
SELECT * FROM ogrenciler WHERE sinav_notu IN(65,85)

--Soru6: Sınav notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu between 65 and 85;

--Soru7:id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele
select isim,sinav_notu from ogrenciler where id not between 122 and 125;

--Soru8: sinav_notu 75 olan satırı siliniz
--dml
delete from ogrenciler where sinav_notu=75;
select * from ogrenciler;

--Soru9: Adres'i Trabzon olan satırı siliniz
delete from ogrenciler where adres='Trabzon';

--Soru10: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz
delete from ogrenciler where isim='Derya Soylu' or isim='Yavuz Bal';
delete from ogrenciler where isim in('Derya Soylu','Yavuz Bal')

--Soru11: sınav notu 100 den küçük olan satırları siliniz
delete from ogrenciler where sinav_notu<100

--Soru12: Tablodaki tüm satırları siliniz
delete from ogrenciler;

--Soru13:SORU: memurlar isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
--id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
--isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
--maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması olsun.
create table memurlar
(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>5000) NOT NULL
)

--Soru14:  insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
-- isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
-- soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
create table insanlar
(
isim int ,
soyisim varchar(30)	,
CONSTRAINT  pr_ks PRIMARY KEY(isim),
CONSTRAINT uni_ks UNIQUE (soyisim)
)











