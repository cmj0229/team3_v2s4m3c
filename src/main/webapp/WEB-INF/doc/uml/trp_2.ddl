/**********************************/
/* Table Name: 설문조사 */
/**********************************/
CREATE TABLE survey(
		surveyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(300)		 NOT NULL,
		startdate                     		VARCHAR2(20)		 NOT NULL,
		enddate                       		VARCHAR2(20)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		continue                      		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE survey is '설문조사';
COMMENT ON COLUMN survey.surveyno is '설문조사번호';
COMMENT ON COLUMN survey.title is '제목';
COMMENT ON COLUMN survey.startdate is '시작날짜';
COMMENT ON COLUMN survey.enddate is '종료날짜';
COMMENT ON COLUMN survey.cnt is '참여인원';
COMMENT ON COLUMN survey.continue is '진행여부';


/**********************************/
/* Table Name: 설문조사항목 */
/**********************************/
CREATE TABLE surveyitem(
		surveyitemno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item                          		VARCHAR2(300)		 NOT NULL,
		itemcnt                       		NUMBER(10)		 NOT NULL,
		surveyno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE surveyitem is '설문조사항목';
COMMENT ON COLUMN surveyitem.surveyitemno is '설문조사항목번호';
COMMENT ON COLUMN surveyitem.item is '항목';
COMMENT ON COLUMN surveyitem.itemcnt is '항목선택인원';
COMMENT ON COLUMN surveyitem.surveyno is '설문조사번호';


/**********************************/
/* Table Name: 설문참여회원 */
/**********************************/
CREATE TABLE surveymember(
		surveymemberno                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		surveyrdate                   		DATE		 NOT NULL,
		surveyitemno                  		NUMBER(10)		 NULL 
);

COMMENT ON TABLE surveymember is '설문참여회원';
COMMENT ON COLUMN surveymember.surveymemberno is '설문참여회원번호';
COMMENT ON COLUMN surveymember.surveyrdate is '설문참여날짜';
COMMENT ON COLUMN surveymember.surveyitemno is '설문조사항목번호';


/**********************************/
/* Table Name: 상품리뷰 */
/**********************************/
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewmember                  		VARCHAR2(100)		 NOT NULL,
		reviewtitle                   		VARCHAR2(300)		 NOT NULL,
		reviewcontent                 		VARCHAR2(600)		 NOT NULL,
		reviewhits                    		NUMBER(10)		 NOT NULL,
		reviewcnt                     		NUMBER(10)		 NOT NULL,
		reviewgrade                   		NUMBER(10)		 NOT NULL,
		reviewtotalgrade              		NUMBER(10)		 NOT NULL,
		goodcnt                       		NUMBER(10)		 NULL ,
		reviewrdate                   		DATE		 NOT NULL
);

COMMENT ON TABLE review is '상품리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰번호';
COMMENT ON COLUMN review.reviewmember is '리뷰등록회원명';
COMMENT ON COLUMN review.reviewtitle is '제목';
COMMENT ON COLUMN review.reviewcontent is '내용';
COMMENT ON COLUMN review.reviewhits is '조회수';
COMMENT ON COLUMN review.reviewcnt is '리뷰개수';
COMMENT ON COLUMN review.reviewgrade is '평점';
COMMENT ON COLUMN review.reviewtotalgrade is '총평점';
COMMENT ON COLUMN review.goodcnt is '추천수';
COMMENT ON COLUMN review.reviewrdate is '등록일';


/**********************************/
/* Table Name: 상품리뷰답글 */
/**********************************/
CREATE TABLE reviewans(
		reviewansno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewanstitle                		VARCHAR2(200)		 NOT NULL,
		reviewanscontent              		VARCHAR2(500)		 NOT NULL,
		reviewno                      		NUMBER(10)		 NULL ,
		reviewansrdate                		DATE		 NOT NULL,
		reviewanscnt                  		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE reviewans is '상품리뷰답글';
COMMENT ON COLUMN reviewans.reviewansno is '리뷰답글번호';
COMMENT ON COLUMN reviewans.reviewanstitle is '리뷰답글제목';
COMMENT ON COLUMN reviewans.reviewanscontent is '리뷰답글내용';
COMMENT ON COLUMN reviewans.reviewno is '리뷰번호';
COMMENT ON COLUMN reviewans.reviewansrdate is '리뷰답변일자';
COMMENT ON COLUMN reviewans.reviewanscnt is '리뷰답변조회수';


/**********************************/
/* Table Name: 상품그룹 */
/**********************************/
CREATE TABLE ATGRP(
		ATGRPNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE ATGRP is '상품그룹';
COMMENT ON COLUMN ATGRP.ATGRPNO is '상품그룹번호';
COMMENT ON COLUMN ATGRP.NAME is '상품그룹명';


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
		SURV_CONTINUE                 		CHAR(1)		 NOT NULL
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
		SURV_SEQ                      		NUMBER(10)		 NOT NULL,
		SURV_QUES                     		VARCHAR2(300)		 NOT NULL,
		SURV_ANS                      		VARCHAR2(200)		 NOT NULL,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO)
);

COMMENT ON TABLE SURV_ITEM is '설문항목';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV_ITEM.SURV_SEQ is '설문항목순서';
COMMENT ON COLUMN SURV_ITEM.SURV_QUES is '설문항목질문';
COMMENT ON COLUMN SURV_ITEM.SURV_ANS is '설문항목답변';


/**********************************/
/* Table Name: 설문결과 */
/**********************************/
CREATE TABLE SURV_RES(
		SURV_RES_NO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL,
		SURV_DATE                     		DATE		 NOT NULL,
		SURV_RES                      		CLOB(4000)		 NOT NULL,
  FOREIGN KEY (SURV_ITEM_NO) REFERENCES SURV_ITEM (SURV_ITEM_NO)
);

COMMENT ON TABLE SURV_RES is '설문결과';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '설문결과번호';
COMMENT ON COLUMN SURV_RES.MEM_NO is '회원번호';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '설문결과날짜';
COMMENT ON COLUMN SURV_RES.SURV_RES is '설문결과';


