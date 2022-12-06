CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--Soru1: Isme gore toplam maaslari bulun
select isim, sum(maas) from personel
group by isim

--Soru2: Personel tablosundaki isimleri gruplayın
select isim from personel group by isim

--Soru3: Sirketlere göre maası 5000 tlden fazla olan personel sayısını bulun.
select sirket, count(*) as calisan_sayisi 
from personel
where maas>5000 
group by sirket

---------------HAVING CLAUSE--------
--HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanılan FILTRELEME komutudur. where ile aynı işlevdedir fakat;
--having komutu yalnızca 'group by' komutu ile kullanılır.Eğer gruplamadan sonra bir şart varsa having komutu kullanılır.

--Soru4: her sirketin min maaşlarını eğer 4000'den büyükse göster
select * from personel 
select sirket, min(maas) from personel 
group by sirket
having min(maas)>2000;

--Soru5: Ayni isimdeki kişilerin aldığı toplam gelir 1000 liradan fazla ise ismi ve toplam maaşı gösteren sorgu yazınız.
select isim,sum(maas) as toplam_maas from personel
group by isim 
having sum(maas)>10000

--Soru6: Eger bir sehirde calisan personel sayısı 1'den coksa sehir ismini ve personel sayısını veren sorgu yazınız.
select sehir,count(isim) as toplam_personel_sayisi from personel
group by sehir
having count(isim)>1

--Soru7: Eger bir sehirde alınan max maaas 5000'den düsükse sehir ismini ve max maasi veren sorgu yazınız.

select sehir, max(maas) as en_yuksek_maas from personel
group by sehir
having max(maas)<5000

----UNION OPERATOR--------
--İki farklı sorgulamanın sonucunu bilreştiren işlemdir. Secilen field sayısı ve data type'ı aynı olmalıdır.

--Soru8: Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim as isim_ve_sehirler,maas from personel where maas>4000
union
select sehir,maas from personel where maas>5000

--Soru9: Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yazarak maasa göre sıralanan tabloyu olusturunuz.
select isim as isim_ve_sehir,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul' order by maas

DROP TABLE if exists personel

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
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

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);
select * from personel
select * from personel_bilgi

--Soru10: id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
select sehir as sehir_ve_telefon,maas as maas_ve_cocuksayisi from personel where id=123456789
union
select tel ,cocuk_sayisi from personel_bilgi where id=123456789;

--------UNION ALL--------
--UNION tekrarlı verileri toplar ve tek bir tablo halinde sonuç verir.
--UNION ALL ise tekrarlı verilerle birlikte tüm sorguları getirir.

--Soru11: personel tablosundan maasi 5000'den az olan tum isimleri ve maasları bulunuz
select isim,maas from personel where maas<5000
union all
select sehir,maas from personel where maas<4000

-----------------------INTERSECT OPERATOR--------------------
--farklı iki tablodaki sorgulamalarda ortak elemanları bulur. iki sorgu arasına yazılır ve kesişimi getirir.

--Soru12: a- Personel tablosundan Istanbul veya Ankara'da calısan id'lerini yazdir.
	   -- b- Personel bilgi tablosundan 2 veya 3 cocugu olanların id'lerini yazdir.
select id from personel where sehir in('Istanbul','Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in(2,3)	   

--Soru13: Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
-- Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
-- Iki sorguyu INTERSECT ile birlestirin

SELECT id FROM personel WHERE maas NOT BETWEEN 4800 AND 5000
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3)

--Soru14: Honda,Ford ve Tofas'ta calısan ortak isimdeki personel varsa listeleyelim.
SELECT isim FROM personel WHERE sirket='Honda'
INTERSECT
SELECT isim FROM personel WHERE sirket='Ford'
INTERSECT
SELECT isim FROM personel WHERE sirket='Tofas'

------------EXCEPT OPERATOR-------------
--İki sorgulamada hariç tutulacak bir sorgulama yapılacaksa EXCEPT komutu kullanılır.

--Soru15: 5000'den az maas alıp Honda'da calısmayanları yazdıralım.
SELECT isim,sirket FROM personel WHERE maas<5000 
EXCEPT 
SELECT isim,sirket FROM personel WHERE sirket='Honda' 











