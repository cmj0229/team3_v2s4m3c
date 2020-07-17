drop table surv_apply cascade constraints;

CREATE TABLE surv_apply(
    surv_apply_no                NUMBER(10) NOT NULL PRIMARY KEY,
    surv_item_no                  NUMBER(10) NULL ,
    mem_no                           NUMBER(6) NULL ,
    surv_no                           NUMBER(6) NULL ,
    surv_apply_date                         DATE NOT NULL,
      FOREIGN KEY (surv_item_no) REFERENCES surv_item (surv_item_no),
      FOREIGN KEY (mem_no) REFERENCES MEM (mem_no),
      FOREIGN KEY (surv_no) REFERENCES surv (surv_no)
);
 
COMMENT ON TABLE surv_apply is '설문 참여 회원';
COMMENT ON COLUMN surv_apply.surv_apply_no is '설문 참여 회원 번호';
COMMENT ON COLUMN surv_apply.surv_item_no is '설문 조사 항목 번호';
COMMENT ON COLUMN surv_apply.mem_no is '회원 번호';
COMMENT ON COLUMN surv_apply.surv_no is '설문 번호';
COMMENT ON COLUMN surv_apply.surv_apply_date is '설문 참여 날짜';

DROP SEQUENCE SURV_apply_seq;
CREATE SEQUENCE SURV_apply_seq
    START WITH 1         -- 시작번호
    INCREMENT BY 1     -- 증가 값
    MAXVALUE 9999999999 -- 최대값 : 9999999999 --> NUMBER(10) 대응
    CACHE 2                  -- 2번은 메모리에서만 계산(업데이트를 계속해서 하지 않음 ), insert가 많으면 cache를 100~200정도로 하면 오라클 속도가 빨라짐..
    NOCYCLE;   
    
1) 등록
insert into surv_apply(surv_apply_no, surv_item_no, mem_no, surv_no, surv_apply_date)
values(SURV_apply_seq.nextval, 1, 1, 1, sysdate);

insert into surv_apply(surv_apply_no, surv_item_no, mem_no, surv_apply_date)
values(SURV_apply_seq.nextval, 2, 1, sysdate);

insert into surv_apply(surv_apply_no, surv_item_no, mem_no, surv_apply_date)
values(SURV_apply_seq.nextval, 3, 1, sysdate);

2) 목록

select surv_apply_no, surv_item_no, mem_no, surv_no, surv_apply_date
from surv_apply;

3) surv + surv_item + surv_apply + mem_no
SELCET i.surv_item_no,i.surv_item_ans,
       m.mem_id,m.mem_name,
       a.surv_apply_no,a.surv_item_no,a.mem_no,a.rdate,s.surveyno,s.survey_title
FROM surveyitem i,member m,surveyparty p,survey s
WHERE p.surveyitemno = i.surveyitemno and p.memberno = m.memberno and p.surveyno=s.surveyno

SELECT i.surv_item_no as i_surv_item_no, i.surv_item_ans as i_surv_item_ans,
           m.mem_id as m_mem_id, m.mem_name as m_mem_name, m.mem_no as m_mem_no,
           a.surv_apply_no as surv_apply_no, a.surv_item_no as surv_item_no, a.mem_no as mem_no, a.surv_apply_date as surv_apply_date,
           s.surv_no as s_surv_no, s.surv_title as s_surv_title
FROM surv_item i, mem m, surv_apply a, surv s
WHERE a.surv_item_no = i.surv_item_no and a.mem_no = m.mem_no and a.surv_no=s.surv_no;