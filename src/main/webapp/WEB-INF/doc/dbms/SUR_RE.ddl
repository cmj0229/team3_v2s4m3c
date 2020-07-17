/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE SUV;
drop table review;
drop table mem;
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

COMMENT ON TABLE MEM is '회원';
COMMENT ON COLUMN MEM.MEM_NO is '회원번호';
COMMENT ON COLUMN MEM.MEM_ID is '회원아이디';
COMMENT ON COLUMN MEM.MEM_PW is '회원비밀번호';
COMMENT ON COLUMN MEM.MEM_NAME is '회원명';
COMMENT ON COLUMN MEM.MEM_ADRESS is '회원주소';
COMMENT ON COLUMN MEM.MEM_ZIPCODE is '회원우편번호';
COMMENT ON COLUMN MEM.MEM_PHONE is '회원전화번호';
COMMENT ON COLUMN MEM.MEM_POINT is '회원포인트';
COMMENT ON COLUMN MEM.MEM_RDATE is '회원가입일';
COMMENT ON COLUMN MEM.POINT is '포인트';

1) MEM테이블 PK등록

CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

INSERT INTO MEM(MEM_NO)
VALUES(1);

/**********************************/
/* Table Name: 상품그룹 */
/**********************************/
CREATE TABLE AT_GRP(
		AT_GRPNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NAME                       		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE AT_GRP is '상품그룹';
COMMENT ON COLUMN AT_GRP.AT_GRPNO is '상품그룹번호';
COMMENT ON COLUMN AT_GRP.AT_NAME is '상품그룹명';


/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE AT(
		AT_NO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRPNO                      		NUMBER(10)		 NOT NULL,
		AT_NAME                       		VARCHAR2(100)		 NOT NULL,
		AT_PRICE                      		NUMBER(10)		 NOT NULL,
		AT_DETAIL                     		CLOB(4000)		 NOT NULL,
		AT_FIXDATE                    		CHAR(1)		 NOT NULL,
		AT_CANCEL                     		CHAR(1)		 NOT NULL,
		AT_LOWEST                     		CHAR(1)		 NOT NULL,
		AT_VISIBLE                    		CHAR(1)		 NOT NULL,
		AT_HIT                        		NUMBER(10)		 NOT NULL,
		AT_DUR                        		NUMBER(10)		 NOT NULL,
		AT_LANG                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (AT_GRPNO) REFERENCES AT_GRP (AT_GRPNO)
);

COMMENT ON TABLE AT is '상품';
COMMENT ON COLUMN AT.AT_NO is '상품번호';
COMMENT ON COLUMN AT.AT_GRPNO is '상품그룹번호';
COMMENT ON COLUMN AT.AT_NAME is '상품명';
COMMENT ON COLUMN AT.AT_PRICE is '상품가격';
COMMENT ON COLUMN AT.AT_DETAIL is '상품내용';
COMMENT ON COLUMN AT.AT_FIXDATE is '상품날짜지정여부';
COMMENT ON COLUMN AT.AT_CANCEL is '상품취소가능여부';
COMMENT ON COLUMN AT.AT_LOWEST is '상품최저가보장여부';
COMMENT ON COLUMN AT.AT_VISIBLE is '상품출력모드';
COMMENT ON COLUMN AT.AT_HIT is '상품조회수';
COMMENT ON COLUMN AT.AT_DUR is '상품소요시간';
COMMENT ON COLUMN AT.AT_LANG is '상품지원언어';


/**********************************/
/* Table Name: 상품리뷰 */
/**********************************/
drop table review;
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewtitle                   		VARCHAR2(300)		 NOT NULL,
		reviewcontent                 		VARCHAR2(600)		 NOT NULL,
		reviewimage                   		VARCHAR2(100)		 NULL ,
		reviewhits                    		NUMBER(10)		 NOT NULL,
		reviewcnt                     		NUMBER(10)		 NOT NULL,
		reviewgrade                   		NUMBER(10)		 NOT NULL,
		reviewtotalgrade              		NUMBER(10)		 NOT NULL,
		goodcnt                       		NUMBER(10)		 NULL ,
		reviewvisible                 		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		reviewrdate                   		DATE		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NULL ,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE review is '상품리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰번호';
COMMENT ON COLUMN review.reviewtitle is '제목';
COMMENT ON COLUMN review.reviewcontent is '내용';
COMMENT ON COLUMN review.reviewimage is '이미지파일';
COMMENT ON COLUMN review.reviewhits is '조회수';
COMMENT ON COLUMN review.reviewcnt is '리뷰개수';
COMMENT ON COLUMN review.reviewgrade is '평점';
COMMENT ON COLUMN review.reviewtotalgrade is '총평점';
COMMENT ON COLUMN review.goodcnt is '추천수';
COMMENT ON COLUMN review.reviewvisible is '출력모드';
COMMENT ON COLUMN review.reviewrdate is '등록일';
COMMENT ON COLUMN review.AT_NO is '상품번호';
COMMENT ON COLUMN review.MEM_NO is '회원번호';


/**********************************/
/* Table Name: 상품리뷰답글 */
/**********************************/
drop table reviewans;
CREATE TABLE reviewans(
		reviewansno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewanstitle                		VARCHAR2(200)		 NOT NULL,
		reviewanscontent              		VARCHAR2(500)		 NOT NULL,
		reviewno                      		NUMBER(10)		 NULL ,
		reviewansrdate                		DATE		 NOT NULL,
		reviewanscnt                  		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (reviewno) REFERENCES review (reviewno)
);

COMMENT ON TABLE reviewans is '상품리뷰답글';
COMMENT ON COLUMN reviewans.reviewansno is '리뷰답글번호';
COMMENT ON COLUMN reviewans.reviewanstitle is '리뷰답글제목';
COMMENT ON COLUMN reviewans.reviewanscontent is '리뷰답글내용';
COMMENT ON COLUMN reviewans.reviewno is '리뷰번호';
COMMENT ON COLUMN reviewans.reviewansrdate is '리뷰답변일자';
COMMENT ON COLUMN reviewans.reviewanscnt is '리뷰답변조회수';


/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
drop table attachfile;
CREATE TABLE attachfile(
		attachfileno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (reviewno) REFERENCES review (reviewno)
);

COMMENT ON TABLE attachfile is '첨부파일';
COMMENT ON COLUMN attachfile.attachfileno is '첨부파일번호';
COMMENT ON COLUMN attachfile.reviewno is '리뷰번호';


/**********************************/
/* Table Name: 여행추천설문조사 */
/**********************************/
CREATE TABLE survey_recom(
		survey_recom_no               		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE survey_recom is '여행추천설문조사';
COMMENT ON COLUMN survey_recom.survey_recom_no is '여행추천설문번호';


/**********************************/
/* Table Name: 여행추천설문조사항목 */
/**********************************/
CREATE TABLE survey_recom_item(
		survey_recom_item_not         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_recom_no               		NUMBER(10)		 NULL 
);

COMMENT ON TABLE survey_recom_item is '여행추천설문조사항목';
COMMENT ON COLUMN survey_recom_item.survey_recom_item_not is '여행추천설문조사항목번호';
COMMENT ON COLUMN survey_recom_item.survey_recom_no is '여행추천설문번호';


/**********************************/
/* Table Name: 설문조사 */
/**********************************/
drop table MEM;
DROP TABLE SURV_RES;
DROP TABLE SURV_ITEM;
DROP TABLE SURV cascade constraints;
CREATE TABLE SURV(
		SURV_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        SURV_SEQNO                          NUMBER(10)		 NOT NULL,
		SURV_TITLE                    		    VARCHAR2(300)		 NOT NULL,
        SURV_CONTENT                    	CLOB		 NULL,
        SURV_PASSWD                        VARCHAR(15)          NOT NULL,
		SURV_STARTDATE                		DATE		 NOT NULL,
		SURV_ENDDATE                  		DATE		 NOT NULL,
		SURV_CNT                      		NUMBER(10)		 NOT NULL,
		SURV_CONTINUE                  VARCHAR2(100)			 NOT NULL,
        surv_word                            varchar2(300)      null,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE SURV is '설문조사';
COMMENT ON COLUMN SURV.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV.SURV_SEQNO is '설문조사출력순서';
COMMENT ON COLUMN SURV.SURV_TITLE is '설문조사제목';
COMMENT ON COLUMN SURV.SURV_CONTENT is '설문조사내용';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '설문조사시작날짜';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '설문조사종료날짜';
COMMENT ON COLUMN SURV.SURV_CNT is '설문조사참여인원';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '설문조사진행여부';
COMMENT ON COLUMN SURV.SURV_word is '설문조사검색어';
COMMENT ON COLUMN SURV.MEM_NO is '회원번호';

DROP SEQUENCE SURV_seq;
CREATE SEQUENCE SURV_seq
    START WITH 1         -- 시작번호
    INCREMENT BY 1     -- 증가 값
    MAXVALUE 9999999999 -- 최대값 : 9999999999 --> NUMBER(10) 대응
    CACHE 2                  -- 2번은 메모리에서만 계산(업데이트를 계속해서 하지 않음 ), insert가 많으면 cache를 100~200정도로 하면 오라클 속도가 빨라짐..
    NOCYCLE;   

commit;
1) 등록
INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 1, '설문조사제목', '설문조사내용', '1234', sysdate, sysdate+7, '0', '설문진행','설문', 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 2, '설문조사제목2', '설문조사내용2', '1234', sysdate, sysdate+7, '0', '설문진행','설문', 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 3, '설문조사제목3', '설문조사내용3', '1234', sysdate, sysdate+7, '0', '설문진행','설문', 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 4, '설문조사제목4', '설문조사내용4', '1234', sysdate, sysdate+7, '0', '설문진행','설문', 1);

commit;
2) 목록
SELECT SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
FROM SURV
ORDER BY SURV_NO DESC;
 
commit;


3-1) 조회
SELECT SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
FROM SURV
WHERE SURV_NO = 6;

COMMIT;

3-2) 조회수 증가
UPDATE SURV 
SET surv_cnt=surv_cnt+1 
WHERE surv_no = 4;       

4) 수정
UPDATE SURV
SET  surv_seqno=4, surv_title ='제목수정테스트', surv_content='내용 수정테스트', surv_startdate='2020-05-16', surv_enddate='2020-06-15', surv_cnt=4, surv_continue='Y', surv_word='설문작성', mem_no='1'
WHERE surv_no = 4;

UPDATE SURV
SET  surv_no=1
WHERE surv_no = 19;

commit;


5) 삭제
DELETE FROM SURV
WHERE SURV_NO=4;

6) 검색

7) 페이징
-- step1
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
from surv
where surv_no=1 and surv_word like '%설문%'
order by surv_no desc;

-- step2
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO, rownum as r
from(
        select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
        from surv
        where surv_no=1 and surv_word like '%설문%'
        order by surv_no desc
);

-- step3(rownum을 바깥으로 전달함), 1page
-- r이 1보다 크거나 같고 10보다 작거나 같으면 1페이지.
select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, r
from(
        select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, rownum as r
        from(
                select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
                from surv
                where surv_no=1 and surv_word like '%설문%'
                order by surv_no desc
        )
)
where r >=1 and r<=10;

commit;
8) 검색된갯수
select count(*) as cnt
from surv

/**********************************/
/* Table Name: 설문항목 */
/**********************************/
DROP TABLE SURV_ITEM;
CREATE TABLE SURV_ITEM(
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_NO                       		NUMBER(10)		 NOT NULL,
		SURV_item_SEQNO                      		NUMBER(10)		 NULL,
		SURV_item_QUES                     		VARCHAR2(300)		 NOT NULL,
		SURV_item_ANS_1                      		CLOB		 NULL,
        SURV_item_ANS_2                      		CLOB		 NULL,
        SURV_item_ANS_3                      		CLOB		 NULL,
        SURV_item_ANS_4                      		CLOB		 NULL,
        SURV_item_RESP                            NUMBER(10)           NOT NULL,
        surv_item_passwd                    varchar2(300)       not null,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO)
);

COMMENT ON TABLE SURV_ITEM is '설문항목';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV_ITEM.SURV_item_SEQNO is '설문항목순서';
COMMENT ON COLUMN SURV_ITEM.SURV_item_QUES is '설문항목질문';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_1  is '설문항목답변1';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_2  is '설문항목답변2';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_3  is '설문항목답변3';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_4  is '설문항목답변4';
COMMENT ON COLUMN SURV_ITEM.SURV_item_RESP is '설문항목선택인원';
COMMENT ON COLUMN SURV_ITEM.SURV_item_passwd is '설문항목패스워드';

DROP SEQUENCE SURV_ITEM_seq;
CREATE SEQUENCE SURV_ITEM_seq
    START WITH 1         -- 시작번호
    INCREMENT BY 1     -- 증가 값
    MAXVALUE 9999999999 -- 최대값 : 9999999999 --> NUMBER(10) 대응
    CACHE 2                  -- 2번은 메모리에서만 계산(업데이트를 계속해서 하지 않음 ), insert가 많으면 cache를 100~200정도로 하면 오라클 속도가 빨라짐..
    NOCYCLE;   

1) 등록
INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 1, 1, '설문질문1','설문답변항목1', '설문답변항목2', '설문답변항목3', '설문답변항목4', 0, '1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 2, 2, '설문질문2','설문답변항목1', '설문답변항목2', '설문답변항목3', '설문답변항목4', 0,'1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 3, 3, '설문질문3','설문답변항목1', '설문답변항목2', '설문답변항목3', '설문답변항목4', 0,'1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 5, 4, '설문질문4','설문답변항목1', '설문답변항목2', '설문답변항목3', '설문답변항목4', 0,'1234'); 

update surv_item
set surv_item_resp=2
where surv_no=1;

2) 목록
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM SURV_ITEM
ORDER BY SURV_item_SEQNO ASC;

commit;

3) 조회
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM SURV_ITEM
where surv_item_seqno=1;

4) 수정
update surv_item
set surv_item_seqno=2, surv_item_ques='질문수정', surv_item_ans_1='항목수정1',  surv_item_ans_2='항목수정2',  surv_item_ans_3='항목수정3',  surv_item_ans_4='항목수정4',surv_item_passwd='5678'
where surv_item_no=2;

commit;
5) 삭제
delete 
from surv_item
where surv_item_no=6;

commit;

-- 패스워드 확인

SELECT COUNT(*) as passwd_cnt
FROM surv_item
WHERE surv_item_no= 1 AND surv_item_passwd='1234'

--  surv와 surv_item 테이블 join

SELECT s.surv_no as s_surv_no, s.surv_seqno as s_surv_seqno, s.surv_title as s_surv_title, s.surv_content as s_surv_content, s.surv_passwd as surv_passwd, 
           s.surv_startdate as s_surv_startdate, s.surv_enddate as s_surv_enddate, s.surv_cnt as s_surv_cnt, s.surv_continue as s_surv_continue, s.mem_no as s_mem_no,
           i.surv_item_no as i_surv_item_no, i.surv_no as i_surv_no, i.surv_item_seqno as i_surv_item_seqno, i.surv_item_ques as i_surv_item_ques, i.surv_item_ans_1 as i_surv_item_ans_1, 
           i.surv_item_ans_2 as i_surv_item_ans_2, i.surv_item_ans_3 as i_surv_item_ans_3, i.surv_item_ans_4 as i_surv_item_ans_4, i.surv_item_resp as i_surv_item_resp, i.surv_item_passwd as i_surv_item_passwd
FROM surv s, surv_item i
WHERE (s.surv_no = i.surv_no) and s.surv_no = 4
ORDER BY  s.surv_no ASC, i.surv_no DESC;

SELECT s.surv_no as s_surv_no, s.surv_seqno as s_surv_seqno, s.surv_title as s_surv_title, s.surv_content as s_surv_content, s.surv_passwd as surv_passwd, 
           s.surv_startdate as s_surv_startdate, s.surv_enddate as s_surv_enddate, s.surv_cnt as s_surv_cnt, s.surv_continue as s_surv_continue, s.mem_no as s_mem_no,
           i.surv_item_no, i.surv_no, i.surv_item_seqno, i.surv_item_ques, i.surv_item_ans_1, i.surv_item_ans_2, i.surv_item_ans_3, i.surv_item_ans_4, i.surv_item_resp, i.surv_item_passwd
FROM surv s, surv_item i
WHERE s.surv_no = i.surv_no
ORDER BY  s.surv_no ASC, i.surv_no asc;

-- surv_no별 목록
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM surv_item
WHERE surv_no = 1
ORDER BY surv_item_no DESC;
                                                                             
/**********************************/
/* Table Name: 설문결과 */
/**********************************/
CREATE TABLE SURV_RES(
		SURV_RES_NO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL,
		SURV_DATE                     		DATE		 NOT NULL,
		SURV_RES                      		CLOB(4000)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (SURV_ITEM_NO) REFERENCES SURV_ITEM (SURV_ITEM_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE SURV_RES is '설문결과';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '설문결과번호';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '설문결과날짜';
COMMENT ON COLUMN SURV_RES.SURV_RES is '설문결과';
COMMENT ON COLUMN SURV_RES.MEM_NO is '회원번호';

commit;

-- 패스워드 검사 --select는 commit 필요없음
SELECT COUNT(*) as passwd_cnt
FROM surv
WHERE surv_no=1 AND surv_passwd='1234';

-- surv_no별 검색 레코드 갯수
select count(*) as cnt
from surv
where surv_no=1 and (surv_title like '%설%' or surv_content like '%설%' or surv_word like '%설%');


commit;

