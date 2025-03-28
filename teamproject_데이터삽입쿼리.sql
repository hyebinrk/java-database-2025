-- attendance 로그인

-- 조회
SELECT * FROM "ATD";
SELECT * FROM "STUDENT";
SELECT * FROM "CLASS";

INSERT INTO "CLASS"("CLASS_NO","CLASS_NAME") VALUES (CLASS_CLASS_NO_SEQ.nextval,03);
INSERT INTO "ATD"("ATD_NO", "S_NO", "T_NO") VALUES (ATD_NO_SEQ.nextval, STUDENT_S_NO_SEQ.nextval, TEACHER_T_NO_SEQ.nextval);


-- 더미데이터 삽입
INSERT INTO "STUDENT" ("S_NO", "S_ID", "S_PW", "S_NAME", "S_BIRTH", "S_TEL", "S_ADDR", "CLASS_NO") 
VALUES (STUDENT_S_NO_SEQ.nextval, '0101', '0000', '홍길동', '091111', '010-9999-8888', '부산시 해운대구', '03');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '0583', '0000', '김철수', '090201', '010-1234-5678', '서울시 강남구', '01');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '1542', '0000', '이영희', '090103', '010-5678-1234', '서울시 서초구', '02');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '6532', '0000', '박민수', '090808', '010-1111-2222', '부산시 해운대구', '03');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '4568', '0000', '최지우', '090502', '010-2222-3333', '대구시 동구', '04');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '9632', '0000', '한가람', '080222', '010-3333-4444', '대전시 서구', '05');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '3698', '0000', '정호진', '081212', '010-4444-5555', '광주시 남구', '01');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '1613', '0000', '서윤아', '080505', '010-5555-6666', '인천시 연수구', '02');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '0921', '0000', '김동현', '080411', '010-6666-7777', '울산시 북구', '03');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '0326', '0000', '이서진', '080130', '010-7777-8888', '경기도 수원시', '04');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '0808', '0000', '장민혁', '081122', '010-8888-9999', '충청북도 청주시', '05');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '0122', '0000', '오하늘', '080509', '010-9999-0000', '경상북도 포항시', '01');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '9999', '0000', '신유진', '071211', '010-0000-1111', '전라북도 전주시', '02');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '3825', '0000', '강태호', '070506', '010-1122-2233', '제주특별자치도 제주시', '03');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '6666', '0000', '문지호', '070112', '010-2233-3344', '강원도 춘천시', '04');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '7777', '0000', '배준서', '070522', '010-3344-4455', '서울시 종로구', '05');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '8889', '0000', '윤채원', '070326', '010-4455-5566', '부산시 사상구', '01');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '3535', '0000', '송지훈', '070926', '010-5566-6677', '대구시 남구', '02');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '1514', '0000', '고민정', '071127', '010-6677-7788', '광주시 서구', '03');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '4788', '0000', '전하린', '071129', '010-7788-8899', '인천시 남동구', '04');

INSERT INTO "STUDENT" VALUES (STUDENT_S_NO_SEQ.nextval, '8520', '0000', '하도윤', '070802', '010-8899-9900', '경기도 성남시', '05');





COMMIT;



--SELECT s_id, s_name
--		, s_mobile, s_regyear
--	FROM Student;
--
--INSERT INTO STUDENT (std_id, std_name, std_mobile, std_regyear)
--VALUES(SEQ_STUDEN.NEXTVAL, :v_std_name, :v_std_mobile, :v_std_regyear);
