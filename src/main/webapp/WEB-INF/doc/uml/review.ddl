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

