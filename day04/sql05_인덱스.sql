/*
 *  인덱스 - DB검색을 효율적으로 빠르게 처리하는 기술
 * */
-- 기본 테이블 생성(인덱스없음)
CREATE TABLE test_noindex(
	id NUMBER NOT NULL,
	name varchar(20) NOT NULL,
	phone varchar(20) NULL,
	rdate DATE DEFAULT sysdate
);

-- 인덱스 테이블 생성
CREATE TABLE test_index(
	id NUMBER NOT NULL PRIMARY key,
	name varchar(20) NOT NULL,
	phone varchar(20) NULL,
	rdate DATE DEFAULT sysdate
);

-- 유니크인덱스 테이블 생성(유니크인덱스)
CREATE TABLE test_uniqueindex(
	id NUMBER NOT NULL,
	name varchar(20) NOT NULL UNIQUE,
	phone varchar(20) NULL,
	rdate DATE DEFAULT sysdate
);

-- 인덱스 생성 쿼리 테스트용 테이블 생성
CREATE TABLE test_index2(
	id NUMBER NOT NULL,
	name varchar(20) NOT NULL,
	phone varchar(20) NULL,
	rdate DATE DEFAULT sysdate
);

-- 인덱스 생성 쿼리
CREATE INDEX idx_id ON test_index2(id);

CREATE INDEX idx_name_phone ON test_index2(name, phone);

CREATE INDEX idx_id_name2 ON test_index2(id,name);


/*
 * 인덱스 테스트. 인덱스가 없을 때 검색쿼리 실행소요시간,
 * 			   인덱스 구성 후 검색쿼리 실행소요시간 비교
 * */
-- 인덱스 테스트 sample_t
-- 번호가 중복된게 있는지 확인 쿼리
SELECT count(id1)
 FROM sample_t
 GROUP BY id1
 HAVING count(id1) > 1;

SELECT *
 FROM sample_t WHERE ID1 = 10000000;

-- 검색
SELECT *
 FROM sample_t
 WHERE id1 in (976453, 934564, 174555, 6785, 146789, 897554); 	

SELECT *
 FROM sample_t;

-- sample_t에 PK추가
ALTER TABLE sample_t ADD PRIMARY key(id1);

-- date1번에서 조회
SELECT *
FROM sample_t
WHERE date1 = '20171206';
-- 0.45초 소요. 인덱스 생성 후는 0.0207초 소요

CREATE INDEX idx_date1 ON sample_t(date1);

-- test3 컬럼 값 조회
SELECT *
FROM sample_t
WHERE test3 = 'A678';

-- autocommit을 끄고나면 DDL, DML(select이외) 작업 후 필이 commit; 수행 후 파일 저장
COMMIT;