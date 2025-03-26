CREATE TABLE "CustomerInfo" (
	"cst_id"	number		NOT NULL,
	"cst_name"	varchar2(100)		NOT NULL,
	"cst_addr"	varchar2(100)		NOT NULL,
	"cst_tel"	varchar2(20)		NULL
);

CREATE TABLE "ManagerInfo" (
	"mng_id"	number		NOT NULL,
	"pub_id"	number		NOT NULL,
	"mng_name"	varchar2(100)		NOT NULL,
	"mng_tel"	varchar2(20)		NOT NULL
);

CREATE TABLE "Bookinfo" (
	"book_id"	number		NOT NULL,
	"pub_id"	number		NOT NULL,
	"book_name"	varchar2(100)		NOT NULL,
	"book_price"	number(8,0)		NOT NULL,
	"author"	varchar2(100)		NULL,
	"release_dt"	date		NULL
);

CREATE TABLE "PublishComplnfo" (
	"pub_id"	number		NOT NULL,
	"pub_name"	varchar2(100)		NOT NULL,
	"pub_ceo"	varchar2(100)		NULL,
	"pub_tel"	varchar2(20)		NULL,
	"pub_addr"	varchar2(100)		NULL
);

COMMENT ON COLUMN "PublishComplnfo"."pub_ceo" IS '담당자명';

CREATE TABLE "OrderInfo" (
	"Key"	integer		NOT NULL,
	"book_id"	number		NOT NULL,
	"cst_id"	number		NOT NULL,
	"ord_dt"	date		NULL,
	"ord_price"	number		NULL
);

ALTER TABLE "CustomerInfo" ADD CONSTRAINT "PK_CUSTOMERINFO" PRIMARY KEY (
	"cst_id"
);

ALTER TABLE "ManagerInfo" ADD CONSTRAINT "PK_MANAGERINFO" PRIMARY KEY (
	"mng_id"
);

ALTER TABLE "Bookinfo" ADD CONSTRAINT "PK_BOOKINFO" PRIMARY KEY (
	"book_id"
);

ALTER TABLE "PublishComplnfo" ADD CONSTRAINT "PK_PUBLISHCOMPLNFO" PRIMARY KEY (
	"pub_id"
);

ALTER TABLE "OrderInfo" ADD CONSTRAINT "PK_ORDERINFO" PRIMARY KEY (
	"Key"
);

ALTER TABLE "ManagerInfo" ADD CONSTRAINT "FK_PubComInfo_BookInfo_1" FOREIGN KEY (
	"pub_id"
)
REFERENCES "PublishComplnfo" (
	"pub_id"
);

ALTER TABLE "Bookinfo" ADD CONSTRAINT "FK_PubComInfo_MngInf_1" FOREIGN KEY (
	"pub_id"
)
REFERENCES "PublishComplnfo" (
	"pub_id"
);

ALTER TABLE "OrderInfo" ADD CONSTRAINT "FK_Bookinfo_TO_OrderInfo_1" FOREIGN KEY (
	"book_id"
)
REFERENCES "Bookinfo" (
	"book_id"
);

ALTER TABLE "OrderInfo" ADD CONSTRAINT "FK_CustomerInfo_TO_OrderInfo_1" FOREIGN KEY (
	"cst_id"
)
REFERENCES "CustomerInfo" (
	"cst_id"
);

COMMIT;

