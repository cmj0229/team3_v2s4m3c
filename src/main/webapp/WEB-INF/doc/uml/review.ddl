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

