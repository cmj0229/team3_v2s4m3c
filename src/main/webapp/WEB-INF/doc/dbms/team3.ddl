/**********************************/
/* Table Name: ��ǰ�׷� */
/**********************************/
CREATE TABLE AT_GRP(
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NAME                   		VARCHAR2(50)		 NOT NULL,
		AT_GRP_SEQNO                  		NUMBER(7)		 NOT NULL,
		AT_GRP_VISIBLE                		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE AT_GRP is '��ǰ�׷�';
COMMENT ON COLUMN AT_GRP.AT_GRP_NO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT_GRP.AT_GRP_NAME is '��ǰ�׷��';
COMMENT ON COLUMN AT_GRP.AT_GRP_SEQNO is '��ǰ�׷���¼���';
COMMENT ON COLUMN AT_GRP.AT_GRP_VISIBLE is '��ǰ�׷���¸��';


/**********************************/
/* Table Name: ��ǰ */
/**********************************/
CREATE TABLE AT(
		AT_NO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL,
		AT_SEQNO                      		NUMBER(7)		 NOT NULL,
		AT_VISIBLE                    		CHAR(1)		 NOT NULL,
		AT_NAME                       		VARCHAR2(100)		 NOT NULL,
		AT_DETAIL                     		VARCHAR2(100)		 NOT NULL,
		AT_PRICE                      		NUMBER(10)		 NOT NULL,
		AT_CONTENT                    		CLOB(4000)		 NOT NULL,
		AT_CANCLE                     		CHAR(1)		 NOT NULL,
		AT_LOWEST                     		CHAR(1)		 NOT NULL,
		AT_HIT                        		NUMBER(10)		 NOT NULL,
		AT_DUR                        		NUMBER(10)		 NOT NULL,
		AT_LANG                       		VARCHAR2(100)		 NOT NULL,
		AT_TAG                        		VARCHAR2(1000)		 NOT NULL,
		AT_MAP                        		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_GRP_NO) REFERENCES AT_GRP (AT_GRP_NO)
);

COMMENT ON TABLE AT is '��ǰ';
COMMENT ON COLUMN AT.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT.AT_GRP_NO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT.AT_SEQNO is '��ǰ��¼���';
COMMENT ON COLUMN AT.AT_VISIBLE is '��ǰ��¸��';
COMMENT ON COLUMN AT.AT_NAME is '��ǰ��';
COMMENT ON COLUMN AT.AT_DETAIL is '��ǰ���';
COMMENT ON COLUMN AT.AT_PRICE is '��ǰ����';
COMMENT ON COLUMN AT.AT_CONTENT is '��ǰ����';
COMMENT ON COLUMN AT.AT_CANCLE is '��ǰ��Ұ��ɿ���';
COMMENT ON COLUMN AT.AT_LOWEST is '��ǰ���������忩��';
COMMENT ON COLUMN AT.AT_HIT is '��ǰ��ȸ��';
COMMENT ON COLUMN AT.AT_DUR is '��ǰ�ҿ�ð�';
COMMENT ON COLUMN AT.AT_LANG is '��ǰ�������';
COMMENT ON COLUMN AT.AT_TAG is 'AT_TAG';
COMMENT ON COLUMN AT.AT_MAP is 'AT_MAP';


/**********************************/
/* Table Name: ��ǰ�̹��� */
/**********************************/
CREATE TABLE AT_IMG(
		AT_IMG_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		AT_IMG_FNAME                  		VARCHAR2(100)		 NOT NULL,
		AT_IMG_FUPNAME                		VARCHAR2(100)		 NOT NULL,
		AT_IMG_THUMB                  		VARCHAR2(100)		 NOT NULL,
		AT_IMG_SIZE                   		NUMBER(10)		 NOT NULL,
		AT_IMG_SEQNO                  		NUMBER(7)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE AT_IMG is '��ǰ�̹���';
COMMENT ON COLUMN AT_IMG.AT_IMG_NO is '��ǰ�̹�����ȣ';
COMMENT ON COLUMN AT_IMG.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT_IMG.AT_IMG_FNAME is '��ǰ�̹��������̸�';
COMMENT ON COLUMN AT_IMG.AT_IMG_FUPNAME is '��ǰ�̹������ε��̸�';
COMMENT ON COLUMN AT_IMG.AT_IMG_THUMB is '��ǰ�̹��������';
COMMENT ON COLUMN AT_IMG.AT_IMG_SIZE is '��ǰ�̹���������';
COMMENT ON COLUMN AT_IMG.AT_IMG_SEQNO is '��ǰ�̹�������';


/**********************************/
/* Table Name: ��ǰ����¥ */
/**********************************/
CREATE TABLE DATES(
		DATES_NO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		DATES_DATE                    		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE DATES is '��ǰ����¥';
COMMENT ON COLUMN DATES.DATES_NO is '��ǰ����¥��ȣ';
COMMENT ON COLUMN DATES.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN DATES.DATES_DATE is '��ǰ����¥';


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_ID                        		VARCHAR2(60)		 NOT NULL,
		MEM_PW                        		VARCHAR2(60)		 NOT NULL,
		MEM_NAME                      		VARCHAR2(20)		 NOT NULL,
		MEM_NICK                      		VARCHAR2(20)		 NOT NULL,
		MEM_ADDR1                     		VARCHAR2(400)		 NULL ,
		MEM_ADDR2                     		VARCHAR2(400)		 NULL ,
		MEM_ZIP                       		VARCHAR2(10)		 NULL ,
		MEM_TEL                       		VARCHAR2(20)		 NOT NULL,
		MEM_PT                        		NUMBER(10)		 NOT NULL,
		MEM_DATE                      		DATE		 NOT NULL,
		MEM_STS                       		NUMBER(1)		 NOT NULL,
		MEM_PIC_NAME_UP               		VARCHAR2(100)		 NULL ,
		MEM_PIC_TH                    		VARCHAR2(100)		 NULL ,
		MEM_PIC_SIZE                  		NUMBER(10)		 NULL ,
  CONSTRAINT SYS_C008749 UNIQUE (MEM_ID),
  CONSTRAINT SYS_C008750 UNIQUE (MEM_NICK),
  CONSTRAINT SYS_C008751 UNIQUE (MEM_TEL)
);

COMMENT ON TABLE MEM is 'ȸ��';
COMMENT ON COLUMN MEM.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEM.MEM_ID is '���̵�';
COMMENT ON COLUMN MEM.MEM_PW is '��й�ȣ';
COMMENT ON COLUMN MEM.MEM_NAME is '�̸�';
COMMENT ON COLUMN MEM.MEM_NICK is '�г���';
COMMENT ON COLUMN MEM.MEM_ADDR1 is '�ּ�1';
COMMENT ON COLUMN MEM.MEM_ADDR2 is '�ּ�2';
COMMENT ON COLUMN MEM.MEM_ZIP is '�����ȣ';
COMMENT ON COLUMN MEM.MEM_TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEM.MEM_PT is '����Ʈ';
COMMENT ON COLUMN MEM.MEM_DATE is '������';
COMMENT ON COLUMN MEM.MEM_STS is 'ȸ�� ����';
COMMENT ON COLUMN MEM.MEM_PIC_NAME_UP is 'ȸ�� ���� ���ε��';
COMMENT ON COLUMN MEM.MEM_PIC_TH is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM.MEM_PIC_SIZE is 'ȸ�� ���� ũ��';


/**********************************/
/* Table Name: ȸ�� ���� */
/**********************************/
CREATE TABLE MEM_PIC(
		MEM_PIC_NO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_PIC_NAME                  		VARCHAR2(100)		 NOT NULL,
		MEM_PIC_NAME_UP               		VARCHAR2(100)		 NOT NULL,
		MEM_PIC_TH                    		VARCHAR2(100)		 NOT NULL,
		MEM_PIC_SIZE                  		VARCHAR2(100)		 NOT NULL,
		MEM_PIC_DATE                  		VARCHAR2(100)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE MEM_PIC is 'ȸ�� ����';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_NO is 'ȸ�� ���� ��ȣ';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_NAME is 'ȸ�� ���� ������';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_NAME_UP is 'ȸ�� ���� ���ε��';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_TH is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_SIZE is 'ȸ�� ���� ũ��';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_DATE is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM_PIC.MEM_NO is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: ȸ�� ���ø���Ʈ */
/**********************************/
CREATE TABLE MEM_WISH(
		MEM_WISH_NO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		MEM_WISH_SEQNO                		NUMBER(10)		 NOT NULL,
		WORD                          		VARCHAR2(100)		 NULL ,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  CONSTRAINT SYS_C008786 UNIQUE (AT_NO)
);

COMMENT ON TABLE MEM_WISH is 'ȸ�� ���ø���Ʈ';
COMMENT ON COLUMN MEM_WISH.MEM_WISH_NO is 'ȸ�� ���� ��ȣ';
COMMENT ON COLUMN MEM_WISH.AT_NO is '��ǰ ��ȣ';
COMMENT ON COLUMN MEM_WISH.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEM_WISH.MEM_WISH_SEQNO is 'ȸ�� ���� ��� ��ȣ';
COMMENT ON COLUMN MEM_WISH.WORD is 'ȸ�� ���� �˻���';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMIN_ID                      		VARCHAR2(100)		 NOT NULL,
		ADMIN_PASSWD                  		VARCHAR2(100)		 NOT NULL,
		ADMIN_MDATE                   		DATE		 NOT NULL
);

COMMENT ON TABLE ADMIN is '������';
COMMENT ON COLUMN ADMIN.ADMINNO is '������ ��ȣ';
COMMENT ON COLUMN ADMIN.ADMIN_ID is '������ ���̵�';
COMMENT ON COLUMN ADMIN.ADMIN_PASSWD is '������ ��й�ȣ';
COMMENT ON COLUMN ADMIN.ADMIN_MDATE is '������';


/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
CREATE TABLE CART(
		CART_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		CART_CNT                      		NUMBER(10)		 NOT NULL,
		CART_PAYMENT                  		NUMBER(10)		 NOT NULL,
		CART_DATE                     		DATE		 NOT NULL,
		AT_NAME                       		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE CART is '��ٱ���';
COMMENT ON COLUMN CART.CART_NO is '��ٱ��Ϲ�ȣ';
COMMENT ON COLUMN CART.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN CART.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN CART.CART_CNT is '����';
COMMENT ON COLUMN CART.CART_PAYMENT is '�����ݾ�';
COMMENT ON COLUMN CART.CART_DATE is '�����ð�';
COMMENT ON COLUMN CART.AT_NAME is '��ǰ��';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE SURV(
		SURV_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_SEQNO                    		NUMBER(10)		 NOT NULL,
		SURV_TITLE                    		VARCHAR2(300)		 NOT NULL,
		SURV_PASSWD                   		VARCHAR2(15)		 NOT NULL,
		SURV_STARTDATE                		VARCHAR2(50)		 NOT NULL,
		SURV_ENDDATE                  		VARCHAR2(50)		 NOT NULL,
		SURV_CNT                      		NUMBER(10)		 NOT NULL,
		SURV_CONTINUE                 		VARCHAR2(100)		 NOT NULL,
		SURV_ITEM_NOWDATE             		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE SURV is '��������';
COMMENT ON COLUMN SURV.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV.SURV_SEQNO is '����������¼���';
COMMENT ON COLUMN SURV.SURV_TITLE is '������������';
COMMENT ON COLUMN SURV.SURV_PASSWD is '���������н�����';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '����������۳�¥';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '�����������ᳯ¥';
COMMENT ON COLUMN SURV.SURV_CNT is '�������������ο�';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '�����������࿩��';
COMMENT ON COLUMN SURV.SURV_ITEM_NOWDATE is '����ð�';
COMMENT ON COLUMN SURV.ADMINNO is '������ ��ȣ';


/**********************************/
/* Table Name: �����׸� */
/**********************************/
CREATE TABLE SURV_ITEM(
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_ITEM_SEQNO               		NUMBER(10)		 NOT NULL,
		SURV_ITEM_ANS                 		VARCHAR2(1000)		 NULL ,
		SURV_ITEM_PASSWD              		VARCHAR2(1000)		 NOT NULL,
		SURV_ITEM_CNT                 		NUMBER(10)		 NULL ,
		SURV_NO                       		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO)
);

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_SEQNO is '�����׸����';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_ANS is '�亯';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_PASSWD is '�����׸��н�����';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_CNT is '�����׸����ο�';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';


/**********************************/
/* Table Name: ���� ���� ȸ�� */
/**********************************/
CREATE TABLE SURV_APPLY(
		SURV_APPLY_NO                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_ITEM_NO                  		NUMBER(10)		 NULL ,
		MEM_NO                        		NUMBER(6)		 NULL ,
		SURV_NO                       		NUMBER(6)		 NULL ,
		SURV_APPLY_DATE               		DATE		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO),
  FOREIGN KEY (SURV_ITEM_NO) REFERENCES SURV_ITEM (SURV_ITEM_NO)
);

COMMENT ON TABLE SURV_APPLY is '���� ���� ȸ��';
COMMENT ON COLUMN SURV_APPLY.SURV_APPLY_NO is '���� ���� ȸ�� ��ȣ';
COMMENT ON COLUMN SURV_APPLY.SURV_ITEM_NO is '���� ���� �׸� ��ȣ';
COMMENT ON COLUMN SURV_APPLY.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN SURV_APPLY.SURV_NO is '���� ��ȣ';
COMMENT ON COLUMN SURV_APPLY.SURV_APPLY_DATE is '���� ���� ��¥';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE PAYMENT(
		PAYMENT_NO                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		CART_NO                       		NUMBER(10)		 NOT NULL,
		PAYMENT_WAY                   		VARCHAR2(100)		 NOT NULL,
		PAYMENT_TOTAL                 		NUMBER(10)		 NOT NULL,
		PAYMENT_DATE                  		DATE		 NOT NULL,
		CART_CNT                      		NUMBER(10)		 NOT NULL,
		AT_PRICE                      		NUMBER(10)		 NOT NULL,
		AT_NAME                       		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE PAYMENT is '����';
COMMENT ON COLUMN PAYMENT.PAYMENT_NO is '������ȣ';
COMMENT ON COLUMN PAYMENT.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN PAYMENT.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN PAYMENT.CART_NO is 'īƮ��ȣ';
COMMENT ON COLUMN PAYMENT.PAYMENT_WAY is '�������';
COMMENT ON COLUMN PAYMENT.PAYMENT_TOTAL is '�����ݾ�';
COMMENT ON COLUMN PAYMENT.PAYMENT_DATE is '������';
COMMENT ON COLUMN PAYMENT.CART_CNT is '����';
COMMENT ON COLUMN PAYMENT.AT_PRICE is '��ǰ����';
COMMENT ON COLUMN PAYMENT.AT_NAME is '��ǰ��';


/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE REVIEW(
		REVIEW_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		PAYMENT_NO                    		NUMBER(10)		 NOT NULL,
		REVIEW_WORD                   		VARCHAR2(1000)		 NOT NULL,
		REVIEW_RATE                   		NUMBER(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (PAYMENT_NO) REFERENCES PAYMENT (PAYMENT_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  CONSTRAINT SYS_C008834 UNIQUE (PAYMENT_NO)
);

COMMENT ON TABLE REVIEW is '���';
COMMENT ON COLUMN REVIEW.REVIEW_NO is '��۹�ȣ';
COMMENT ON COLUMN REVIEW.AT_NO is '��������ȣ';
COMMENT ON COLUMN REVIEW.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN REVIEW.PAYMENT_NO is '���� ��ȣ';
COMMENT ON COLUMN REVIEW.REVIEW_WORD is '���� ����';
COMMENT ON COLUMN REVIEW.REVIEW_RATE is '���� ��';
COMMENT ON COLUMN REVIEW.RDATE is '�����';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE NOTICE(
		NOTICENO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NOTICE_TITLE                  		VARCHAR2(100)		 NOT NULL,
		NOTICE_CONTENT                		VARCHAR2(100)		 NOT NULL,
		NOTICE_RNAME                  		VARCHAR2(10)		 NOT NULL,
		NOTICE_PASSWD                 		VARCHAR2(15)		 NOT NULL,
		NOTICE_VISIBLE                		CHAR(1)		 NOT NULL,
		NOTICE_CNT                    		NUMBER(7)		 NOT NULL,
		NOTICE_DIVISION               		VARCHAR2(10)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		NOTICE_RDATE                  		DATE		 NOT NULL,
		ADMINNO                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE NOTICE is '��������';
COMMENT ON COLUMN NOTICE.NOTICENO is '���� ��ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE is '���� ����';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT is '���� ����';
COMMENT ON COLUMN NOTICE.NOTICE_RNAME is '�����';
COMMENT ON COLUMN NOTICE.NOTICE_PASSWD is '�н�����';
COMMENT ON COLUMN NOTICE.NOTICE_VISIBLE is '��� ���';
COMMENT ON COLUMN NOTICE.NOTICE_CNT is '��ȸ��';
COMMENT ON COLUMN NOTICE.NOTICE_DIVISION is '����';
COMMENT ON COLUMN NOTICE.WORD is '�˻���';
COMMENT ON COLUMN NOTICE.NOTICE_RDATE is '�����';
COMMENT ON COLUMN NOTICE.ADMINNO is '������ ��ȣ';


/**********************************/
/* Table Name: �������� ÷������ */
/**********************************/
CREATE TABLE NOTICE_ATTACHFILE(
		NOTICE_ATTACHFILENO           		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NOTICENO                      		NUMBER(10)		 NOT NULL,
		NOTICE_FNAME                  		VARCHAR2(100)		 NOT NULL,
		NOTICE_FUPNAME                		VARCHAR2(100)		 NOT NULL,
		NOTICE_THUMB                  		VARCHAR2(100)		 NULL ,
		NOTICE_FSIZE                  		NUMBER(10)		 NOT NULL,
		NOTICE_RDATE                  		DATE		 NOT NULL,
  FOREIGN KEY (NOTICENO) REFERENCES NOTICE (NOTICENO)
);

COMMENT ON TABLE NOTICE_ATTACHFILE is '�������� ÷������';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_ATTACHFILENO is '÷������ ��ȣ';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICENO is '���� ��ȣ';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FNAME is '���� ���ϸ�';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FUPNAME is '���ε� ���ϸ�';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_THUMB is 'Thumb ���ϸ�';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FSIZE is '���� ������';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_RDATE is '�����';


/**********************************/
/* Table Name: �������γ��� */
/**********************************/
CREATE TABLE PAYMENT_DETAILS(
		PAYMENT_DETAILS_NO            		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		PAYMENT_NO                    		NUMBER(10)		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		PAYMENT_TOTAL                 		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (PAYMENT_NO) REFERENCES PAYMENT (PAYMENT_NO)
);

COMMENT ON TABLE PAYMENT_DETAILS is '�������γ���';
COMMENT ON COLUMN PAYMENT_DETAILS.PAYMENT_DETAILS_NO is '�������γ�����ȣ';
COMMENT ON COLUMN PAYMENT_DETAILS.PAYMENT_NO is '������ȣ';
COMMENT ON COLUMN PAYMENT_DETAILS.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN PAYMENT_DETAILS.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN PAYMENT_DETAILS.PAYMENT_TOTAL is '�Ѱ����ݾ�';


/**********************************/
/* Table Name: 1��1���� */
/**********************************/
CREATE TABLE INQUIRE(
		INQUIRENO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		INQUIRE_TITLE                 		VARCHAR2(100)		 NOT NULL,
		INQUIRE_CONTENT               		VARCHAR2(300)		 NOT NULL,
		INQUIRE_RNAME                 		VARCHAR2(10)		 NOT NULL,
		INQUIRE_PASSWD                		VARCHAR2(15)		 NOT NULL,
		WORD                          		VARCHAR2(300)		 NULL ,
		INQUIRE_RDATE                 		DATE		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE INQUIRE is '1��1����';
COMMENT ON COLUMN INQUIRE.INQUIRENO is '���� ��ȣ';
COMMENT ON COLUMN INQUIRE.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN INQUIRE.INQUIRE_TITLE is '���� ����';
COMMENT ON COLUMN INQUIRE.INQUIRE_CONTENT is '���� ����';
COMMENT ON COLUMN INQUIRE.INQUIRE_RNAME is '�����';
COMMENT ON COLUMN INQUIRE.INQUIRE_PASSWD is '�н�����';
COMMENT ON COLUMN INQUIRE.WORD is '�˻���';
COMMENT ON COLUMN INQUIRE.INQUIRE_RDATE is '�����';


/**********************************/
/* Table Name: 1��1���� ÷������ */
/**********************************/
CREATE TABLE INQUIRE_ATTACHFILE(
		INQUIRE_ATTACHFILENO          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		INQUIRENO                     		NUMBER(10)		 NULL ,
		INQUIRE_FNAME                 		VARCHAR2(100)		 NOT NULL,
		INQUIRE_FUPNAME               		VARCHAR2(100)		 NOT NULL,
		INQUIRE_THUMB                 		VARCHAR2(100)		 NULL ,
		INQUIRE_FSIZE                 		NUMBER(10)		 NOT NULL,
		INQUIRE_RDATE                 		DATE		 NOT NULL,
  FOREIGN KEY (INQUIRENO) REFERENCES INQUIRE (INQUIRENO)
);

COMMENT ON TABLE INQUIRE_ATTACHFILE is '1��1���� ÷������';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_ATTACHFILENO is '÷������ ��ȣ';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRENO is '���� ��ȣ';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_FNAME is '���� ���ϸ�';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_FUPNAME is '���ε� ���ϸ�';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_THUMB is 'Thumb ����';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_FSIZE is '���� ������';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_RDATE is '�����';


/**********************************/
/* Table Name: 1��1���� �亯 */
/**********************************/
CREATE TABLE INQUIRE_REPLY(
		INQUIRE_REPLYNO               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		INQUIRENO                     		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		REPLY_CONTENT                 		VARCHAR2(300)		 NOT NULL,
		REPLY_PASSWD                  		VARCHAR2(20)		 NOT NULL,
		REPLY_RDATE                   		DATE		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (INQUIRENO) REFERENCES INQUIRE (INQUIRENO)
);

COMMENT ON TABLE INQUIRE_REPLY is '1��1���� �亯';
COMMENT ON COLUMN INQUIRE_REPLY.INQUIRE_REPLYNO is 'INQUIRE_REPLYNO';
COMMENT ON COLUMN INQUIRE_REPLY.INQUIRENO is '���� ��ȣ';
COMMENT ON COLUMN INQUIRE_REPLY.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN INQUIRE_REPLY.REPLY_CONTENT is '�亯 ����';
COMMENT ON COLUMN INQUIRE_REPLY.REPLY_PASSWD is '�н�����';
COMMENT ON COLUMN INQUIRE_REPLY.REPLY_RDATE is '�����';


/**********************************/
/* Table Name: ���� ��� */
/**********************************/
CREATE TABLE SURV_REPLY(
		SURV_REPLY_NO                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(6)		 NULL ,
		SURV_NO                       		NUMBER(10)		 NULL ,
		CONTENT                       		VARCHAR2(500)		 NOT NULL,
		REPLYCNT                      		NUMBER(7)		 NOT NULL,
  FOREIGN KEY (SURV_NO) REFERENCES SURV (SURV_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE SURV_REPLY is '���� ���';
COMMENT ON COLUMN SURV_REPLY.SURV_REPLY_NO is '���� ��� ��ȣ';
COMMENT ON COLUMN SURV_REPLY.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN SURV_REPLY.SURV_NO is '���� ���� ��ȣ';
COMMENT ON COLUMN SURV_REPLY.CONTENT is '����';
COMMENT ON COLUMN SURV_REPLY.REPLYCNT is '��ۼ�';


