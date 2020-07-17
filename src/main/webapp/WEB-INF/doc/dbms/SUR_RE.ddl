/**********************************/
/* Table Name: ȸ�� */
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

COMMENT ON TABLE MEM is 'ȸ��';
COMMENT ON COLUMN MEM.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN MEM.MEM_ID is 'ȸ�����̵�';
COMMENT ON COLUMN MEM.MEM_PW is 'ȸ����й�ȣ';
COMMENT ON COLUMN MEM.MEM_NAME is 'ȸ����';
COMMENT ON COLUMN MEM.MEM_ADRESS is 'ȸ���ּ�';
COMMENT ON COLUMN MEM.MEM_ZIPCODE is 'ȸ�������ȣ';
COMMENT ON COLUMN MEM.MEM_PHONE is 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN MEM.MEM_POINT is 'ȸ������Ʈ';
COMMENT ON COLUMN MEM.MEM_RDATE is 'ȸ��������';
COMMENT ON COLUMN MEM.POINT is '����Ʈ';

1) MEM���̺� PK���

CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

INSERT INTO MEM(MEM_NO)
VALUES(1);

/**********************************/
/* Table Name: ��ǰ�׷� */
/**********************************/
CREATE TABLE AT_GRP(
		AT_GRPNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NAME                       		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE AT_GRP is '��ǰ�׷�';
COMMENT ON COLUMN AT_GRP.AT_GRPNO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT_GRP.AT_NAME is '��ǰ�׷��';


/**********************************/
/* Table Name: ��ǰ */
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

COMMENT ON TABLE AT is '��ǰ';
COMMENT ON COLUMN AT.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT.AT_GRPNO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT.AT_NAME is '��ǰ��';
COMMENT ON COLUMN AT.AT_PRICE is '��ǰ����';
COMMENT ON COLUMN AT.AT_DETAIL is '��ǰ����';
COMMENT ON COLUMN AT.AT_FIXDATE is '��ǰ��¥��������';
COMMENT ON COLUMN AT.AT_CANCEL is '��ǰ��Ұ��ɿ���';
COMMENT ON COLUMN AT.AT_LOWEST is '��ǰ���������忩��';
COMMENT ON COLUMN AT.AT_VISIBLE is '��ǰ��¸��';
COMMENT ON COLUMN AT.AT_HIT is '��ǰ��ȸ��';
COMMENT ON COLUMN AT.AT_DUR is '��ǰ�ҿ�ð�';
COMMENT ON COLUMN AT.AT_LANG is '��ǰ�������';


/**********************************/
/* Table Name: ��ǰ���� */
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

COMMENT ON TABLE review is '��ǰ����';
COMMENT ON COLUMN review.reviewno is '�����ȣ';
COMMENT ON COLUMN review.reviewtitle is '����';
COMMENT ON COLUMN review.reviewcontent is '����';
COMMENT ON COLUMN review.reviewimage is '�̹�������';
COMMENT ON COLUMN review.reviewhits is '��ȸ��';
COMMENT ON COLUMN review.reviewcnt is '���䰳��';
COMMENT ON COLUMN review.reviewgrade is '����';
COMMENT ON COLUMN review.reviewtotalgrade is '������';
COMMENT ON COLUMN review.goodcnt is '��õ��';
COMMENT ON COLUMN review.reviewvisible is '��¸��';
COMMENT ON COLUMN review.reviewrdate is '�����';
COMMENT ON COLUMN review.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN review.MEM_NO is 'ȸ����ȣ';


/**********************************/
/* Table Name: ��ǰ������ */
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

COMMENT ON TABLE reviewans is '��ǰ������';
COMMENT ON COLUMN reviewans.reviewansno is '�����۹�ȣ';
COMMENT ON COLUMN reviewans.reviewanstitle is '����������';
COMMENT ON COLUMN reviewans.reviewanscontent is '�����۳���';
COMMENT ON COLUMN reviewans.reviewno is '�����ȣ';
COMMENT ON COLUMN reviewans.reviewansrdate is '����亯����';
COMMENT ON COLUMN reviewans.reviewanscnt is '����亯��ȸ��';


/**********************************/
/* Table Name: ÷������ */
/**********************************/
drop table attachfile;
CREATE TABLE attachfile(
		attachfileno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewno                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (reviewno) REFERENCES review (reviewno)
);

COMMENT ON TABLE attachfile is '÷������';
COMMENT ON COLUMN attachfile.attachfileno is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN attachfile.reviewno is '�����ȣ';


/**********************************/
/* Table Name: ������õ�������� */
/**********************************/
CREATE TABLE survey_recom(
		survey_recom_no               		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE survey_recom is '������õ��������';
COMMENT ON COLUMN survey_recom.survey_recom_no is '������õ������ȣ';


/**********************************/
/* Table Name: ������õ���������׸� */
/**********************************/
CREATE TABLE survey_recom_item(
		survey_recom_item_not         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		survey_recom_no               		NUMBER(10)		 NULL 
);

COMMENT ON TABLE survey_recom_item is '������õ���������׸�';
COMMENT ON COLUMN survey_recom_item.survey_recom_item_not is '������õ���������׸��ȣ';
COMMENT ON COLUMN survey_recom_item.survey_recom_no is '������õ������ȣ';


/**********************************/
/* Table Name: �������� */
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

COMMENT ON TABLE SURV is '��������';
COMMENT ON COLUMN SURV.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV.SURV_SEQNO is '����������¼���';
COMMENT ON COLUMN SURV.SURV_TITLE is '������������';
COMMENT ON COLUMN SURV.SURV_CONTENT is '�������系��';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '����������۳�¥';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '�����������ᳯ¥';
COMMENT ON COLUMN SURV.SURV_CNT is '�������������ο�';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '�����������࿩��';
COMMENT ON COLUMN SURV.SURV_word is '��������˻���';
COMMENT ON COLUMN SURV.MEM_NO is 'ȸ����ȣ';

DROP SEQUENCE SURV_seq;
CREATE SEQUENCE SURV_seq
    START WITH 1         -- ���۹�ȣ
    INCREMENT BY 1     -- ���� ��
    MAXVALUE 9999999999 -- �ִ밪 : 9999999999 --> NUMBER(10) ����
    CACHE 2                  -- 2���� �޸𸮿����� ���(������Ʈ�� ����ؼ� ���� ���� ), insert�� ������ cache�� 100~200������ �ϸ� ����Ŭ �ӵ��� ������..
    NOCYCLE;   

commit;
1) ���
INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 1, '������������', '�������系��', '1234', sysdate, sysdate+7, '0', '��������','����', 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 2, '������������2', '�������系��2', '1234', sysdate, sysdate+7, '0', '��������','����', 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 3, '������������3', '�������系��3', '1234', sysdate, sysdate+7, '0', '��������','����', 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no)
VALUES(SURV_seq.nextval, 4, '������������4', '�������系��4', '1234', sysdate, sysdate+7, '0', '��������','����', 1);

commit;
2) ���
SELECT SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
FROM SURV
ORDER BY SURV_NO DESC;
 
commit;


3-1) ��ȸ
SELECT SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
FROM SURV
WHERE SURV_NO = 6;

COMMIT;

3-2) ��ȸ�� ����
UPDATE SURV 
SET surv_cnt=surv_cnt+1 
WHERE surv_no = 4;       

4) ����
UPDATE SURV
SET  surv_seqno=4, surv_title ='��������׽�Ʈ', surv_content='���� �����׽�Ʈ', surv_startdate='2020-05-16', surv_enddate='2020-06-15', surv_cnt=4, surv_continue='Y', surv_word='�����ۼ�', mem_no='1'
WHERE surv_no = 4;

UPDATE SURV
SET  surv_no=1
WHERE surv_no = 19;

commit;


5) ����
DELETE FROM SURV
WHERE SURV_NO=4;

6) �˻�

7) ����¡
-- step1
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
from surv
where surv_no=1 and surv_word like '%����%'
order by surv_no desc;

-- step2
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO, rownum as r
from(
        select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
        from surv
        where surv_no=1 and surv_word like '%����%'
        order by surv_no desc
);

-- step3(rownum�� �ٱ����� ������), 1page
-- r�� 1���� ũ�ų� ���� 10���� �۰ų� ������ 1������.
select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, r
from(
        select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, rownum as r
        from(
                select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
                from surv
                where surv_no=1 and surv_word like '%����%'
                order by surv_no desc
        )
)
where r >=1 and r<=10;

commit;
8) �˻��Ȱ���
select count(*) as cnt
from surv

/**********************************/
/* Table Name: �����׸� */
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

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_item_SEQNO is '�����׸����';
COMMENT ON COLUMN SURV_ITEM.SURV_item_QUES is '�����׸�����';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_1  is '�����׸�亯1';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_2  is '�����׸�亯2';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_3  is '�����׸�亯3';
COMMENT ON COLUMN SURV_ITEM.SURV_item_ANS_4  is '�����׸�亯4';
COMMENT ON COLUMN SURV_ITEM.SURV_item_RESP is '�����׸����ο�';
COMMENT ON COLUMN SURV_ITEM.SURV_item_passwd is '�����׸��н�����';

DROP SEQUENCE SURV_ITEM_seq;
CREATE SEQUENCE SURV_ITEM_seq
    START WITH 1         -- ���۹�ȣ
    INCREMENT BY 1     -- ���� ��
    MAXVALUE 9999999999 -- �ִ밪 : 9999999999 --> NUMBER(10) ����
    CACHE 2                  -- 2���� �޸𸮿����� ���(������Ʈ�� ����ؼ� ���� ���� ), insert�� ������ cache�� 100~200������ �ϸ� ����Ŭ �ӵ��� ������..
    NOCYCLE;   

1) ���
INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 1, 1, '��������1','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0, '1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 2, 2, '��������2','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0,'1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 3, 3, '��������3','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0,'1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd)
VALUES(surv_item_seq.nextval, 5, 4, '��������4','�����亯�׸�1', '�����亯�׸�2', '�����亯�׸�3', '�����亯�׸�4', 0,'1234'); 

update surv_item
set surv_item_resp=2
where surv_no=1;

2) ���
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM SURV_ITEM
ORDER BY SURV_item_SEQNO ASC;

commit;

3) ��ȸ
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM SURV_ITEM
where surv_item_seqno=1;

4) ����
update surv_item
set surv_item_seqno=2, surv_item_ques='��������', surv_item_ans_1='�׸����1',  surv_item_ans_2='�׸����2',  surv_item_ans_3='�׸����3',  surv_item_ans_4='�׸����4',surv_item_passwd='5678'
where surv_item_no=2;

commit;
5) ����
delete 
from surv_item
where surv_item_no=6;

commit;

-- �н����� Ȯ��

SELECT COUNT(*) as passwd_cnt
FROM surv_item
WHERE surv_item_no= 1 AND surv_item_passwd='1234'

--  surv�� surv_item ���̺� join

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

-- surv_no�� ���
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM surv_item
WHERE surv_no = 1
ORDER BY surv_item_no DESC;
                                                                             
/**********************************/
/* Table Name: ������� */
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

COMMENT ON TABLE SURV_RES is '�������';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '���������ȣ';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '���������¥';
COMMENT ON COLUMN SURV_RES.SURV_RES is '�������';
COMMENT ON COLUMN SURV_RES.MEM_NO is 'ȸ����ȣ';

commit;

-- �н����� �˻� --select�� commit �ʿ����
SELECT COUNT(*) as passwd_cnt
FROM surv
WHERE surv_no=1 AND surv_passwd='1234';

-- surv_no�� �˻� ���ڵ� ����
select count(*) as cnt
from surv
where surv_no=1 and (surv_title like '%��%' or surv_content like '%��%' or surv_word like '%��%');


commit;

