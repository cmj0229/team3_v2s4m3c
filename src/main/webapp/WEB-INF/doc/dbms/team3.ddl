/**********************************/
/* Table Name: 상품그룹 */
/**********************************/
CREATE TABLE AT_GRP(
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NAME                   		VARCHAR2(50)		 NOT NULL,
		AT_GRP_SEQNO                  		NUMBER(7)		 NOT NULL,
		AT_GRP_VISIBLE                		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE AT_GRP is '상품그룹';
COMMENT ON COLUMN AT_GRP.AT_GRP_NO is '상품그룹번호';
COMMENT ON COLUMN AT_GRP.AT_GRP_NAME is '상품그룹명';
COMMENT ON COLUMN AT_GRP.AT_GRP_SEQNO is '상품그룹출력순서';
COMMENT ON COLUMN AT_GRP.AT_GRP_VISIBLE is '상품그룹출력모드';


/**********************************/
/* Table Name: 상품 */
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

COMMENT ON TABLE AT is '상품';
COMMENT ON COLUMN AT.AT_NO is '상품번호';
COMMENT ON COLUMN AT.AT_GRP_NO is '상품그룹번호';
COMMENT ON COLUMN AT.AT_SEQNO is '상품출력순서';
COMMENT ON COLUMN AT.AT_VISIBLE is '상품출력모드';
COMMENT ON COLUMN AT.AT_NAME is '상품명';
COMMENT ON COLUMN AT.AT_DETAIL is '상품명상세';
COMMENT ON COLUMN AT.AT_PRICE is '상품가격';
COMMENT ON COLUMN AT.AT_CONTENT is '상품내용';
COMMENT ON COLUMN AT.AT_CANCLE is '상품취소가능여부';
COMMENT ON COLUMN AT.AT_LOWEST is '상품최저가보장여부';
COMMENT ON COLUMN AT.AT_HIT is '상품조회수';
COMMENT ON COLUMN AT.AT_DUR is '상품소요시간';
COMMENT ON COLUMN AT.AT_LANG is '상품지원언어';
COMMENT ON COLUMN AT.AT_TAG is 'AT_TAG';
COMMENT ON COLUMN AT.AT_MAP is 'AT_MAP';


/**********************************/
/* Table Name: 상품이미지 */
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

COMMENT ON TABLE AT_IMG is '상품이미지';
COMMENT ON COLUMN AT_IMG.AT_IMG_NO is '상품이미지번호';
COMMENT ON COLUMN AT_IMG.AT_NO is '상품번호';
COMMENT ON COLUMN AT_IMG.AT_IMG_FNAME is '상품이미지원본이름';
COMMENT ON COLUMN AT_IMG.AT_IMG_FUPNAME is '상품이미지업로드이름';
COMMENT ON COLUMN AT_IMG.AT_IMG_THUMB is '상품이미지썸네일';
COMMENT ON COLUMN AT_IMG.AT_IMG_SIZE is '상품이미지사이즈';
COMMENT ON COLUMN AT_IMG.AT_IMG_SEQNO is '상품이미지순서';


/**********************************/
/* Table Name: 상품별날짜 */
/**********************************/
CREATE TABLE DATES(
		DATES_NO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		DATES_DATE                    		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE DATES is '상품별날짜';
COMMENT ON COLUMN DATES.DATES_NO is '상품별날짜번호';
COMMENT ON COLUMN DATES.AT_NO is '상품번호';
COMMENT ON COLUMN DATES.DATES_DATE is '상품별날짜';


/**********************************/
/* Table Name: 회원 */
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

COMMENT ON TABLE MEM is '회원';
COMMENT ON COLUMN MEM.MEM_NO is '회원 번호';
COMMENT ON COLUMN MEM.MEM_ID is '아이디';
COMMENT ON COLUMN MEM.MEM_PW is '비밀번호';
COMMENT ON COLUMN MEM.MEM_NAME is '이름';
COMMENT ON COLUMN MEM.MEM_NICK is '닉네임';
COMMENT ON COLUMN MEM.MEM_ADDR1 is '주소1';
COMMENT ON COLUMN MEM.MEM_ADDR2 is '주소2';
COMMENT ON COLUMN MEM.MEM_ZIP is '우편번호';
COMMENT ON COLUMN MEM.MEM_TEL is '전화번호';
COMMENT ON COLUMN MEM.MEM_PT is '포인트';
COMMENT ON COLUMN MEM.MEM_DATE is '가입일';
COMMENT ON COLUMN MEM.MEM_STS is '회원 상태';
COMMENT ON COLUMN MEM.MEM_PIC_NAME_UP is '회원 사진 업로드명';
COMMENT ON COLUMN MEM.MEM_PIC_TH is '회원 사진 썸네일';
COMMENT ON COLUMN MEM.MEM_PIC_SIZE is '회원 사진 크기';


/**********************************/
/* Table Name: 회원 사진 */
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

COMMENT ON TABLE MEM_PIC is '회원 사진';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_NO is '회원 사진 번호';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_NAME is '회원 사진 원본명';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_NAME_UP is '회원 사진 업로드명';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_TH is '회원 사진 썸네일';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_SIZE is '회원 사진 크기';
COMMENT ON COLUMN MEM_PIC.MEM_PIC_DATE is '회원 사진 등록일';
COMMENT ON COLUMN MEM_PIC.MEM_NO is '회원 번호';


/**********************************/
/* Table Name: 회원 위시리스트 */
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

COMMENT ON TABLE MEM_WISH is '회원 위시리스트';
COMMENT ON COLUMN MEM_WISH.MEM_WISH_NO is '회원 위시 번호';
COMMENT ON COLUMN MEM_WISH.AT_NO is '상품 번호';
COMMENT ON COLUMN MEM_WISH.MEM_NO is '회원 번호';
COMMENT ON COLUMN MEM_WISH.MEM_WISH_SEQNO is '회원 위시 출력 번호';
COMMENT ON COLUMN MEM_WISH.WORD is '회원 위시 검색어';


/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMIN_ID                      		VARCHAR2(100)		 NOT NULL,
		ADMIN_PASSWD                  		VARCHAR2(100)		 NOT NULL,
		ADMIN_MDATE                   		DATE		 NOT NULL
);

COMMENT ON TABLE ADMIN is '관리자';
COMMENT ON COLUMN ADMIN.ADMINNO is '관리자 번호';
COMMENT ON COLUMN ADMIN.ADMIN_ID is '관리자 아이디';
COMMENT ON COLUMN ADMIN.ADMIN_PASSWD is '관리자 비밀번호';
COMMENT ON COLUMN ADMIN.ADMIN_MDATE is '가입일';


/**********************************/
/* Table Name: 장바구니 */
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

COMMENT ON TABLE CART is '장바구니';
COMMENT ON COLUMN CART.CART_NO is '장바구니번호';
COMMENT ON COLUMN CART.MEM_NO is '회원번호';
COMMENT ON COLUMN CART.AT_NO is '상품번호';
COMMENT ON COLUMN CART.CART_CNT is '수량';
COMMENT ON COLUMN CART.CART_PAYMENT is '결제금액';
COMMENT ON COLUMN CART.CART_DATE is '담은시간';
COMMENT ON COLUMN CART.AT_NAME is '상품명';


/**********************************/
/* Table Name: 설문조사 */
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

COMMENT ON TABLE SURV is '설문조사';
COMMENT ON COLUMN SURV.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV.SURV_SEQNO is '설문조사출력순서';
COMMENT ON COLUMN SURV.SURV_TITLE is '설문조사제목';
COMMENT ON COLUMN SURV.SURV_PASSWD is '설문조사패스워드';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '설문조사시작날짜';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '설문조사종료날짜';
COMMENT ON COLUMN SURV.SURV_CNT is '설문조사참여인원';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '설문조사진행여부';
COMMENT ON COLUMN SURV.SURV_ITEM_NOWDATE is '현재시간';
COMMENT ON COLUMN SURV.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 설문항목 */
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

COMMENT ON TABLE SURV_ITEM is '설문항목';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_SEQNO is '설문항목순서';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_ANS is '답변';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_PASSWD is '설문항목패스워드';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_CNT is '설문항목선택인원';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '설문조사번호';


/**********************************/
/* Table Name: 설문 참여 회원 */
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

COMMENT ON TABLE SURV_APPLY is '설문 참여 회원';
COMMENT ON COLUMN SURV_APPLY.SURV_APPLY_NO is '설문 참여 회원 번호';
COMMENT ON COLUMN SURV_APPLY.SURV_ITEM_NO is '설문 조사 항목 번호';
COMMENT ON COLUMN SURV_APPLY.MEM_NO is '회원 번호';
COMMENT ON COLUMN SURV_APPLY.SURV_NO is '설문 번호';
COMMENT ON COLUMN SURV_APPLY.SURV_APPLY_DATE is '설문 참여 날짜';


/**********************************/
/* Table Name: 결제 */
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

COMMENT ON TABLE PAYMENT is '결제';
COMMENT ON COLUMN PAYMENT.PAYMENT_NO is '결제번호';
COMMENT ON COLUMN PAYMENT.MEM_NO is '회원번호';
COMMENT ON COLUMN PAYMENT.AT_NO is '상품번호';
COMMENT ON COLUMN PAYMENT.CART_NO is '카트번호';
COMMENT ON COLUMN PAYMENT.PAYMENT_WAY is '결제방법';
COMMENT ON COLUMN PAYMENT.PAYMENT_TOTAL is '결제금액';
COMMENT ON COLUMN PAYMENT.PAYMENT_DATE is '결제일';
COMMENT ON COLUMN PAYMENT.CART_CNT is '수량';
COMMENT ON COLUMN PAYMENT.AT_PRICE is '상품가격';
COMMENT ON COLUMN PAYMENT.AT_NAME is '상품명';


/**********************************/
/* Table Name: 댓글 */
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

COMMENT ON TABLE REVIEW is '댓글';
COMMENT ON COLUMN REVIEW.REVIEW_NO is '댓글번호';
COMMENT ON COLUMN REVIEW.AT_NO is '컨텐츠번호';
COMMENT ON COLUMN REVIEW.MEM_NO is '회원 번호';
COMMENT ON COLUMN REVIEW.PAYMENT_NO is '결제 번호';
COMMENT ON COLUMN REVIEW.REVIEW_WORD is '리뷰 내용';
COMMENT ON COLUMN REVIEW.REVIEW_RATE is '리뷰 평가';
COMMENT ON COLUMN REVIEW.RDATE is '등록일';


/**********************************/
/* Table Name: 공지사항 */
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

COMMENT ON TABLE NOTICE is '공지사항';
COMMENT ON COLUMN NOTICE.NOTICENO is '공지 번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE is '공지 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT is '공지 내용';
COMMENT ON COLUMN NOTICE.NOTICE_RNAME is '등록자';
COMMENT ON COLUMN NOTICE.NOTICE_PASSWD is '패스워드';
COMMENT ON COLUMN NOTICE.NOTICE_VISIBLE is '출력 모드';
COMMENT ON COLUMN NOTICE.NOTICE_CNT is '조회수';
COMMENT ON COLUMN NOTICE.NOTICE_DIVISION is '구분';
COMMENT ON COLUMN NOTICE.WORD is '검색어';
COMMENT ON COLUMN NOTICE.NOTICE_RDATE is '등록일';
COMMENT ON COLUMN NOTICE.ADMINNO is '관리자 번호';


/**********************************/
/* Table Name: 공지사항 첨부파일 */
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

COMMENT ON TABLE NOTICE_ATTACHFILE is '공지사항 첨부파일';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_ATTACHFILENO is '첨부파일 번호';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICENO is '공지 번호';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FNAME is '원본 파일명';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FUPNAME is '업로드 파일명';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_THUMB is 'Thumb 파일명';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FSIZE is '파일 사이즈';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_RDATE is '등록일';


/**********************************/
/* Table Name: 결제세부내역 */
/**********************************/
CREATE TABLE PAYMENT_DETAILS(
		PAYMENT_DETAILS_NO            		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		PAYMENT_NO                    		NUMBER(10)		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		PAYMENT_TOTAL                 		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (PAYMENT_NO) REFERENCES PAYMENT (PAYMENT_NO)
);

COMMENT ON TABLE PAYMENT_DETAILS is '결제세부내역';
COMMENT ON COLUMN PAYMENT_DETAILS.PAYMENT_DETAILS_NO is '결제세부내역번호';
COMMENT ON COLUMN PAYMENT_DETAILS.PAYMENT_NO is '결제번호';
COMMENT ON COLUMN PAYMENT_DETAILS.AT_NO is '상품번호';
COMMENT ON COLUMN PAYMENT_DETAILS.MEM_NO is '회원번호';
COMMENT ON COLUMN PAYMENT_DETAILS.PAYMENT_TOTAL is '총결제금액';


/**********************************/
/* Table Name: 1대1문의 */
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

COMMENT ON TABLE INQUIRE is '1대1문의';
COMMENT ON COLUMN INQUIRE.INQUIRENO is '문의 번호';
COMMENT ON COLUMN INQUIRE.MEM_NO is '회원 번호';
COMMENT ON COLUMN INQUIRE.INQUIRE_TITLE is '문의 제목';
COMMENT ON COLUMN INQUIRE.INQUIRE_CONTENT is '문의 내용';
COMMENT ON COLUMN INQUIRE.INQUIRE_RNAME is '등록자';
COMMENT ON COLUMN INQUIRE.INQUIRE_PASSWD is '패스워드';
COMMENT ON COLUMN INQUIRE.WORD is '검색어';
COMMENT ON COLUMN INQUIRE.INQUIRE_RDATE is '등록일';


/**********************************/
/* Table Name: 1대1문의 첨부파일 */
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

COMMENT ON TABLE INQUIRE_ATTACHFILE is '1대1문의 첨부파일';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_ATTACHFILENO is '첨부파일 번호';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRENO is '문의 번호';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_FNAME is '원본 파일명';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_FUPNAME is '업로드 파일명';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_THUMB is 'Thumb 파일';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_FSIZE is '파일 사이즈';
COMMENT ON COLUMN INQUIRE_ATTACHFILE.INQUIRE_RDATE is '등록일';


/**********************************/
/* Table Name: 1대1문의 답변 */
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

COMMENT ON TABLE INQUIRE_REPLY is '1대1문의 답변';
COMMENT ON COLUMN INQUIRE_REPLY.INQUIRE_REPLYNO is 'INQUIRE_REPLYNO';
COMMENT ON COLUMN INQUIRE_REPLY.INQUIRENO is '문의 번호';
COMMENT ON COLUMN INQUIRE_REPLY.MEM_NO is '회원 번호';
COMMENT ON COLUMN INQUIRE_REPLY.REPLY_CONTENT is '답변 내용';
COMMENT ON COLUMN INQUIRE_REPLY.REPLY_PASSWD is '패스워드';
COMMENT ON COLUMN INQUIRE_REPLY.REPLY_RDATE is '등록일';


/**********************************/
/* Table Name: 설문 댓글 */
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

COMMENT ON TABLE SURV_REPLY is '설문 댓글';
COMMENT ON COLUMN SURV_REPLY.SURV_REPLY_NO is '설문 댓글 번호';
COMMENT ON COLUMN SURV_REPLY.MEM_NO is '회원 번호';
COMMENT ON COLUMN SURV_REPLY.SURV_NO is '설문 조사 번호';
COMMENT ON COLUMN SURV_REPLY.CONTENT is '내용';
COMMENT ON COLUMN SURV_REPLY.REPLYCNT is '답글수';


