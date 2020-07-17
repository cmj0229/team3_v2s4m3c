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
 
COMMENT ON TABLE surv_apply is '���� ���� ȸ��';
COMMENT ON COLUMN surv_apply.surv_apply_no is '���� ���� ȸ�� ��ȣ';
COMMENT ON COLUMN surv_apply.surv_item_no is '���� ���� �׸� ��ȣ';
COMMENT ON COLUMN surv_apply.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN surv_apply.surv_no is '���� ��ȣ';
COMMENT ON COLUMN surv_apply.surv_apply_date is '���� ���� ��¥';

DROP SEQUENCE SURV_apply_seq;
CREATE SEQUENCE SURV_apply_seq
    START WITH 1         -- ���۹�ȣ
    INCREMENT BY 1     -- ���� ��
    MAXVALUE 9999999999 -- �ִ밪 : 9999999999 --> NUMBER(10) ����
    CACHE 2                  -- 2���� �޸𸮿����� ���(������Ʈ�� ����ؼ� ���� ���� ), insert�� ������ cache�� 100~200������ �ϸ� ����Ŭ �ӵ��� ������..
    NOCYCLE;   
    
1) ���
insert into surv_apply(surv_apply_no, surv_item_no, mem_no, surv_no, surv_apply_date)
values(SURV_apply_seq.nextval, 1, 1, 1, sysdate);

insert into surv_apply(surv_apply_no, surv_item_no, mem_no, surv_apply_date)
values(SURV_apply_seq.nextval, 2, 1, sysdate);

insert into surv_apply(surv_apply_no, surv_item_no, mem_no, surv_apply_date)
values(SURV_apply_seq.nextval, 3, 1, sysdate);

2) ���

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