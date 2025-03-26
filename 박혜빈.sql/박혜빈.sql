-- 문제1
SELECT EMAIL
	   , MOBILE
	   , NAMES 
	   , ADDR
	FROM membertbl;
COMMIT;

-- 문제2
SELECT names AS "도서명"
	   , author AS "저자"
	   , ISBN
	   , price AS "정가"
	FROM bookstbl
	ORDER BY isbn;
COMMIT;

-- 문제3
SELECT m.names AS "비대여자명"
	   , m.levels AS "등급"
	   , m.addr AS "주소"
	   , r.rentaldate AS "대여일"
	FROM membertbl m
	LEFT JOIN rentaltbl r
	on m.idx = r.memberidx
    WHERE r.memberidx IS NULL
	ORDER BY "등급" ASC;
COMMIT;

-- 문제4
SELECT nvl(d.names,'--합계--') AS "장르"
	  , sum(b.price) AS "총합계금액"
	  FROM divtbl d, bookstbl b
	  WHERE d.division = b.division
	  GROUP BY ROLLUP(d.names);
COMMIT;