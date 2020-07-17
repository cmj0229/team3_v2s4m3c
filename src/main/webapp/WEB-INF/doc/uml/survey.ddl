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

