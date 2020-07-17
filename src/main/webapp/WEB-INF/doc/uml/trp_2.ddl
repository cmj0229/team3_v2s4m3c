/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE survey(
		surveyno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(300)		 NOT NULL,
		startdate                     		VARCHAR2(20)		 NOT NULL,
		enddate                       		VARCHAR2(20)		 NOT NULL,
		cnt                           		NUMBER(10)		 NOT NULL,
		continue                      		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE survey is '��������';
COMMENT ON COLUMN survey.surveyno is '���������ȣ';
COMMENT ON COLUMN survey.title is '����';
COMMENT ON COLUMN survey.startdate is '���۳�¥';
COMMENT ON COLUMN survey.enddate is '���ᳯ¥';
COMMENT ON COLUMN survey.cnt is '�����ο�';
COMMENT ON COLUMN survey.continue is '���࿩��';


/**********************************/
/* Table Name: ���������׸� */
/**********************************/
CREATE TABLE surveyitem(
		surveyitemno                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item                          		VARCHAR2(300)		 NOT NULL,
		itemcnt                       		NUMBER(10)		 NOT NULL,
		surveyno                      		NUMBER(10)		 NULL 
);

COMMENT ON TABLE surveyitem is '���������׸�';
COMMENT ON COLUMN surveyitem.surveyitemno is '���������׸��ȣ';
COMMENT ON COLUMN surveyitem.item is '�׸�';
COMMENT ON COLUMN surveyitem.itemcnt is '�׸����ο�';
COMMENT ON COLUMN surveyitem.surveyno is '���������ȣ';


/**********************************/
/* Table Name: ��������ȸ�� */
/**********************************/
CREATE TABLE surveymember(
		surveymemberno                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		surveyrdate                   		DATE		 NOT NULL,
		surveyitemno                  		NUMBER(10)		 NULL 
);

COMMENT ON TABLE surveymember is '��������ȸ��';
COMMENT ON COLUMN surveymember.surveymemberno is '��������ȸ����ȣ';
COMMENT ON COLUMN surveymember.surveyrdate is '����������¥';
COMMENT ON COLUMN surveymember.surveyitemno is '���������׸��ȣ';


/**********************************/
/* Table Name: ��ǰ���� */
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

COMMENT ON TABLE review is '��ǰ����';
COMMENT ON COLUMN review.reviewno is '�����ȣ';
COMMENT ON COLUMN review.reviewmember is '������ȸ����';
COMMENT ON COLUMN review.reviewtitle is '����';
COMMENT ON COLUMN review.reviewcontent is '����';
COMMENT ON COLUMN review.reviewhits is '��ȸ��';
COMMENT ON COLUMN review.reviewcnt is '���䰳��';
COMMENT ON COLUMN review.reviewgrade is '����';
COMMENT ON COLUMN review.reviewtotalgrade is '������';
COMMENT ON COLUMN review.goodcnt is '��õ��';
COMMENT ON COLUMN review.reviewrdate is '�����';


/**********************************/
/* Table Name: ��ǰ������ */
/**********************************/
CREATE TABLE reviewans(
		reviewansno                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewanstitle                		VARCHAR2(200)		 NOT NULL,
		reviewanscontent              		VARCHAR2(500)		 NOT NULL,
		reviewno                      		NUMBER(10)		 NULL ,
		reviewansrdate                		DATE		 NOT NULL,
		reviewanscnt                  		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE reviewans is '��ǰ������';
COMMENT ON COLUMN reviewans.reviewansno is '�����۹�ȣ';
COMMENT ON COLUMN reviewans.reviewanstitle is '����������';
COMMENT ON COLUMN reviewans.reviewanscontent is '�����۳���';
COMMENT ON COLUMN reviewans.reviewno is '�����ȣ';
COMMENT ON COLUMN reviewans.reviewansrdate is '����亯����';
COMMENT ON COLUMN reviewans.reviewanscnt is '����亯��ȸ��';


/**********************************/
/* Table Name: ��ǰ�׷� */
/**********************************/
CREATE TABLE ATGRP(
		ATGRPNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE ATGRP is '��ǰ�׷�';
COMMENT ON COLUMN ATGRP.ATGRPNO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN ATGRP.NAME is '��ǰ�׷��';


/**********************************/
/* Table Name: �������� */
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

COMMENT ON TABLE SURV is '��������';
COMMENT ON COLUMN SURV.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN SURV.SURV_TITLE is '������������';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '����������۳�¥';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '�����������ᳯ¥';
COMMENT ON COLUMN SURV.SURV_CNT is '�������������ο�';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '�����������࿩��';


/**********************************/
/* Table Name: �����׸� */
/**********************************/
CREATE TABLE SURV_ITEM(
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_NO                       		NUMBER(10)		 NOT NULL,
		SURV_SEQ                      		NUMBER(10)		 NOT NULL,
		SURV_QUES                     		VARCHAR2(300)		 NOT NULL,
		SURV_ANS                      		VARCHAR2(200)		 NOT NULL,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO)
);

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_SEQ is '�����׸����';
COMMENT ON COLUMN SURV_ITEM.SURV_QUES is '�����׸�����';
COMMENT ON COLUMN SURV_ITEM.SURV_ANS is '�����׸�亯';


/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE SURV_RES(
		SURV_RES_NO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL,
		SURV_DATE                     		DATE		 NOT NULL,
		SURV_RES                      		CLOB(4000)		 NOT NULL,
  FOREIGN KEY (SURV_ITEM_NO) REFERENCES SURV_ITEM (SURV_ITEM_NO)
);

COMMENT ON TABLE SURV_RES is '�������';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '���������ȣ';
COMMENT ON COLUMN SURV_RES.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '���������¥';
COMMENT ON COLUMN SURV_RES.SURV_RES is '�������';


