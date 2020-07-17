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

