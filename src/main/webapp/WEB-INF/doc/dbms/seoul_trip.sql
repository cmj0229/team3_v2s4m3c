/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_ID                        		VARCHAR2(60)		 NOT NULL,
		MEM_PW                        		VARCHAR2(60)		 NOT NULL,
		MEM_NAME                      		VARCHAR2(20)		 NOT NULL,
		MEM_ADRESS                    		VARCHAR2(400)		 NOT NULL,
		MEM_ZIPCODE                   		NUMBER(10)		 NOT NULL,
		MEM_PHONE                     		NUMBER(20)		 NOT NULL,
		MEM_POINT                     		NUMBER(10)		 NOT NULL,
		MEM_RDATE                     		DATE		 NOT NULL,
		POINT                         		NUMBER(10)		 NOT NULL
);
/**********************************/
/* Table Name: 설문조사 */
/**********************************/
CREATE TABLE SURV(
		SURV_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		SURV_TITLE                    		VARCHAR2(300)		 NOT NULL,
		SURV_STARTDATE                		VARCHAR2(20)		 NOT NULL,
		SURV_ENDDATE                  		VARCHAR2(20)		 NOT NULL,
		SURV_CNT                      		NUMBER(10)		 NOT NULL,
		SURV_CONTINUE                 		CHAR(1)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE SURV is '설문조사';
COMMENT ON COLUMN SURV.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV.MEM_NO is '회원번호';
COMMENT ON COLUMN SURV.SURV_TITLE is '설문조사제목';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '설문조사시작날짜';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '설문조사종료날짜';
COMMENT ON COLUMN SURV.SURV_CNT is '설문조사참여인원';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '설문조사진행여부';


/**********************************/
/* Table Name: 설문항목 */
/**********************************/
CREATE TABLE SURV_ITEM(
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_NO                       		NUMBER(10)		 NOT NULL,
		SUR_ITEM                      		VARCHAR2(300)		 NOT NULL,
		SUR_ITEM_CNT                  		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO)
);

COMMENT ON TABLE SURV_ITEM is '설문항목';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV_ITEM.SUR_ITEM is '설문항목';
COMMENT ON COLUMN SURV_ITEM.SUR_ITEM_CNT is '설문항목선택인원';


/**********************************/
/* Table Name: 설문결과 */
/**********************************/
CREATE TABLE SURV_RES(
		SURV_RES_NO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL,
		SURV_DATE                     		DATE		 NOT NULL,
		SURV_RES                      		CLOB		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (SURV_ITEM_NO) REFERENCES SURV_ITEM (SURV_ITEM_NO)
);

COMMENT ON TABLE SURV_RES is '설문결과';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '설문결과번호';
COMMENT ON COLUMN SURV_RES.MEM_NO is '회원번호';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '설문결과날짜';
COMMENT ON COLUMN SURV_RES.SURV_RES is '설문결과';

commit;
