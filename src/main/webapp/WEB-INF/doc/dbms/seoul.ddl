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


/**********************************/
/* Table Name: 날짜별재고 */
/**********************************/
CREATE TABLE STOCK(
		STOCK_NO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		STOCK_CNT                     		NUMBER(5)		 NOT NULL,
		STOCK_DATE                    		DATE		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE STOCK is '날짜별재고';
COMMENT ON COLUMN STOCK.STOCK_NO is '날짜별재고번호';
COMMENT ON COLUMN STOCK.AT_NO is '상품번호';
COMMENT ON COLUMN STOCK.STOCK_CNT is '날짜별재고수량';
COMMENT ON COLUMN STOCK.STOCK_DATE is '날짜별재고날짜';


/**********************************/
/* Table Name: 전체결제이력 */
/**********************************/
CREATE TABLE ALL_PAY_HIS(
		ALL_PAY_HIS_NO                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		STOCK_NO                      		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (STOCK_NO) REFERENCES STOCK (STOCK_NO)
);

COMMENT ON TABLE ALL_PAY_HIS is '전체결제이력';
COMMENT ON COLUMN ALL_PAY_HIS.ALL_PAY_HIS_NO is '전체결제이력번호';
COMMENT ON COLUMN ALL_PAY_HIS.AT_NO is '상품번호';
COMMENT ON COLUMN ALL_PAY_HIS.MEM_NO is '회원번호';
COMMENT ON COLUMN ALL_PAY_HIS.STOCK_NO is '날짜별재고번호';


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
		SURV_RES                      		INTEGER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (SURV_ITEM_NO) REFERENCES SURV_ITEM (SURV_ITEM_NO)
);

COMMENT ON TABLE SURV_RES is '설문결과';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '설문결과번호';
COMMENT ON COLUMN SURV_RES.MEM_NO is '회원번호';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '설문결과날짜';
COMMENT ON COLUMN SURV_RES.SURV_RES is '설문결과';


/**********************************/
/* Table Name: 공지 */
/**********************************/
CREATE TABLE NOTI(
		NOTI_NO                       		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		NOTI_TITLE                    		VARCHAR2(100)		 NOT NULL,
		NOTI_CONTENT                  		CLOB(4000)		 NOT NULL,
		NOTI_RNAME                    		VARCHAR2(20)		 NOT NULL,
		NOTI_PASSWD                   		VARCHAR2(20)		 NOT NULL,
		NOTI_RDATE                    		DATE		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE NOTI is '공지';
COMMENT ON COLUMN NOTI.NOTI_NO is '공지번호';
COMMENT ON COLUMN NOTI.MEM_NO is '회원 번호';
COMMENT ON COLUMN NOTI.NOTI_TITLE is '공지제목';
COMMENT ON COLUMN NOTI.NOTI_CONTENT is '공지내용';
COMMENT ON COLUMN NOTI.NOTI_RNAME is '공지등록인';
COMMENT ON COLUMN NOTI.NOTI_PASSWD is '공지비빌번호';
COMMENT ON COLUMN NOTI.NOTI_RDATE is '공지등록일';


/**********************************/
/* Table Name: 문의사항 */
/**********************************/
CREATE TABLE Q(
		CENTERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE Q is '문의사항';
COMMENT ON COLUMN Q.CENTERNO is '고객센터';
COMMENT ON COLUMN Q.MEM_NO is '회원 번호';


/**********************************/
/* Table Name: 개별결제 */
/**********************************/
CREATE TABLE PAY(
		PAY_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE PAY is '개별결제';
COMMENT ON COLUMN PAY.PAY_NO is '개별결제번호';
COMMENT ON COLUMN PAY.MEM_NO is '회원번호';
COMMENT ON COLUMN PAY.AT_NO is '상품번호';


/**********************************/
/* Table Name: 결제세부내역 */
/**********************************/
CREATE TABLE PAY_DETAIL(
		PAY_DETAIL_NO                 		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		PAY_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (PAY_NO) REFERENCES PAY (PAY_NO)
);

COMMENT ON TABLE PAY_DETAIL is '결제세부내역';
COMMENT ON COLUMN PAY_DETAIL.PAY_DETAIL_NO is '결제세부내역번호';
COMMENT ON COLUMN PAY_DETAIL.PAY_NO is '개별결제번호';


/**********************************/
/* Table Name: 포인트적립내역 */
/**********************************/
CREATE TABLE SAVE_POINT(
		SAVE_POINT_NO                 		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		PAY_DETAIL_NO                 		INTEGER(10)		 NOT NULL,
  FOREIGN KEY (PAY_DETAIL_NO) REFERENCES PAY_DETAIL (PAY_DETAIL_NO)
);

COMMENT ON TABLE SAVE_POINT is '포인트적립내역';
COMMENT ON COLUMN SAVE_POINT.SAVE_POINT_NO is '포인트적립내역번호';
COMMENT ON COLUMN SAVE_POINT.PAY_DETAIL_NO is '결제세부내역번호';


/**********************************/
/* Table Name: 장바구니 */
/**********************************/
CREATE TABLE CART(
		CART_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE CART is '장바구니';
COMMENT ON COLUMN CART.CART_NO is '장바구니번호';
COMMENT ON COLUMN CART.AT_NO is '상품번호';
COMMENT ON COLUMN CART.MEM_NO is '회원번호';


/**********************************/
/* Table Name: 회원결제이력 */
/**********************************/
CREATE TABLE MEM_HIS(
		MEM_HIS_NO                    		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		PAY_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (PAY_NO) REFERENCES PAY (PAY_NO)
);

COMMENT ON TABLE MEM_HIS is '회원결제이력';
COMMENT ON COLUMN MEM_HIS.MEM_HIS_NO is '회원결제이력번호';
COMMENT ON COLUMN MEM_HIS.MEM_NO is '회원번호';
COMMENT ON COLUMN MEM_HIS.PAY_NO is '개별결제번호';


/**********************************/
/* Table Name: 회원위시리스트 */
/**********************************/
CREATE TABLE MEM_WISHLIST(
		MEM_NO                        		NUMBER(10)		 NULL ,
		AT_NO                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE MEM_WISHLIST is '회원위시리스트';
COMMENT ON COLUMN MEM_WISHLIST.MEM_NO is '회원번호';
COMMENT ON COLUMN MEM_WISHLIST.AT_NO is '상품번호';


/**********************************/
/* Table Name: 상품리뷰 */
/**********************************/
CREATE TABLE AT_REV(
		AT_REV_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		AT_REV_TITLE                  		VARCHAR2(300)		 NOT NULL,
		AT_REV_CONTENT                		VARCHAR2(600)		 NOT NULL,
		AT_REV_IMAGE                  		VARCHAR2(100)		 NOT NULL,
		AT_REV_HIT                    		NUMBER(10)		 NOT NULL,
		AT_REV_CNT                    		NUMBER(10)		 NOT NULL,
		AT_REV_GRADE                  		NUMBER(10)		 NOT NULL,
		AT_REV_TOT_GRADE              		NUMBER(10)		 NOT NULL,
		AT_REV_GOOD_CNT               		NUMBER(10)		 NOT NULL,
		AT_REV_VISIBLE                		CHAR(1)		 NOT NULL,
		AT_REV_DATE                   		DATE		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE AT_REV is '상품리뷰';
COMMENT ON COLUMN AT_REV.AT_REV_NO is '상품리뷰번호';
COMMENT ON COLUMN AT_REV.AT_NO is '상품번호';
COMMENT ON COLUMN AT_REV.MEM_NO is '회원번호';
COMMENT ON COLUMN AT_REV.AT_REV_TITLE is '상품리뷰제목';
COMMENT ON COLUMN AT_REV.AT_REV_CONTENT is '상품리뷰내용';
COMMENT ON COLUMN AT_REV.AT_REV_IMAGE is '상품리뷰이미지파일';
COMMENT ON COLUMN AT_REV.AT_REV_HIT is '상품리뷰조회수';
COMMENT ON COLUMN AT_REV.AT_REV_CNT is '삼품리뷰개수';
COMMENT ON COLUMN AT_REV.AT_REV_GRADE is '상품리뷰평점';
COMMENT ON COLUMN AT_REV.AT_REV_TOT_GRADE is '상품리뷰총평점';
COMMENT ON COLUMN AT_REV.AT_REV_GOOD_CNT is '상품리뷰추천수';
COMMENT ON COLUMN AT_REV.AT_REV_VISIBLE is '상품리뷰출력모드';
COMMENT ON COLUMN AT_REV.AT_REV_DATE is '상품리뷰등록일';


/**********************************/
/* Table Name: 상품리뷰답글 */
/**********************************/
CREATE TABLE REVIEWANS(
		REVIEWANSNO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NULL ,
		AT_REV_NO                     		NUMBER(10)		 NULL ,
		REVIEWANSTITLE                		VARCHAR2(200)		 NOT NULL,
		REVIEWANSCONTENT              		VARCHAR2(500)		 NOT NULL,
		REVIEWANSRDATE                		DATE		 NOT NULL,
		REVIEWANSCNT                  		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO),
  FOREIGN KEY (AT_REV_NO) REFERENCES AT_REV (AT_REV_NO)
);

COMMENT ON TABLE REVIEWANS is '상품리뷰답글';
COMMENT ON COLUMN REVIEWANS.REVIEWANSNO is '상품리뷰답글번호';
COMMENT ON COLUMN REVIEWANS.MEM_NO is '회원번호';
COMMENT ON COLUMN REVIEWANS.AT_REV_NO is '상품리뷰번호';
COMMENT ON COLUMN REVIEWANS.REVIEWANSTITLE is '상품리뷰답글제목';
COMMENT ON COLUMN REVIEWANS.REVIEWANSCONTENT is '상품리뷰답글내용';
COMMENT ON COLUMN REVIEWANS.REVIEWANSRDATE is '상품리뷰답변일자';
COMMENT ON COLUMN REVIEWANS.REVIEWANSCNT is '상품리뷰답변조회수';


/**********************************/
/* Table Name: 포인트사용내역 */
/**********************************/
CREATE TABLE USE_POINT(
		USE_POINT_NO                  		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		PAY_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (PAY_NO) REFERENCES PAY (PAY_NO)
);

COMMENT ON TABLE USE_POINT is '포인트사용내역';
COMMENT ON COLUMN USE_POINT.USE_POINT_NO is '포인트사용내역번호';
COMMENT ON COLUMN USE_POINT.PAY_NO is '개별결제번호';


/**********************************/
/* Table Name: 공지첨부파일 */
/**********************************/
CREATE TABLE NOTI_FILE(
		NOTI_FILE_NO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		NOTI_NO                       		NUMBER(7)		 NULL ,
  FOREIGN KEY (NOTI_NO) REFERENCES NOTI (NOTI_NO)
);

COMMENT ON TABLE NOTI_FILE is '공지첨부파일';
COMMENT ON COLUMN NOTI_FILE.NOTI_FILE_NO is '공지첨부파일번호';
COMMENT ON COLUMN NOTI_FILE.NOTI_NO is '공지번호';


/**********************************/
/* Table Name: 상품리뷰첨부파일 */
/**********************************/
CREATE TABLE AT_REV_FILE(
		AT_REV_FILE_NO                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_REV_NO                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (AT_REV_NO) REFERENCES AT_REV (AT_REV_NO)
);

COMMENT ON TABLE AT_REV_FILE is '상품리뷰첨부파일';
COMMENT ON COLUMN AT_REV_FILE.AT_REV_FILE_NO is '상품리뷰첨부파일번호';
COMMENT ON COLUMN AT_REV_FILE.AT_REV_NO is '상품리뷰번호';


/**********************************/
/* Table Name: 회원로그인내역 */
/**********************************/
CREATE TABLE MEM_LOG_HIS(
		MEM_LOG_HIS_NO                		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE MEM_LOG_HIS is '회원로그인내역';
COMMENT ON COLUMN MEM_LOG_HIS.MEM_LOG_HIS_NO is '회원로그인내역번호';
COMMENT ON COLUMN MEM_LOG_HIS.MEM_NO is '회원번호';


/**********************************/
/* Table Name: 상품이미지 */
/**********************************/
CREATE TABLE AT_IMAGE(
		AT_IMAGE_NO                   		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE AT_IMAGE is '상품이미지';
COMMENT ON COLUMN AT_IMAGE.AT_IMAGE_NO is '상품이미지번호';
COMMENT ON COLUMN AT_IMAGE.AT_NO is '상품번호';


