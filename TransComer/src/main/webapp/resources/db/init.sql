--------------------------------------------------
--------------     MEMBER 관련   ------------------   
--------------------------------------------------
DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER (
  USERID VARCHAR2(30) PRIMARY KEY,
  PASSWORD VARCHAR2(100) NOT NULL,
  USERNAME VARCHAR2(15) NOT NULL,
  EMAIL VARCHAR2(100),
  GENDER VARCHAR2(1) CHECK (GENDER IN('M', 'F')),
  AGE NUMBER,
  PHONE VARCHAR2(13),
  ADDRESS VARCHAR2(100),
  ENROLL_DATE DATE DEFAULT SYSDATE,
  UPDATE_DATE DATE DEFAULT SYSDATE,
  M_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(M_STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.USERID IS '회원아이디';
COMMENT ON COLUMN MEMBER.PASSWORD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.USERNAME IS '회원이름';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';
COMMENT ON COLUMN MEMBER.GENDER IS '회원성별';
COMMENT ON COLUMN MEMBER.AGE IS '회원나이';
COMMENT ON COLUMN MEMBER.PHONE IS '회원전화번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '회원주소';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입날짜';
COMMENT ON COLUMN MEMBER.UPDATE_DATE IS '회원수정날짜';
COMMENT ON COLUMN MEMBER.M_STATUS IS '회원상태값';       
       
INSERT INTO MEMBER 
VALUES ('admin', '1234', '관리자', 'admin@kh.or.kr', 'F', 30, '010-1111-2222', '07200,서울특별시 영등포구 선유로 343,(당산동) 11', '20180101', '20180101', DEFAULT);

INSERT INTO MEMBER 
VALUES ('user01', 'pass01', '홍길동', 'user01@kh.or.kr', 'M', 25, '010-3333-4444', '41092,대구광역시 동구 대림로 28,(대림동) 22', '20180201', '20180202', DEFAULT);

INSERT INTO MEMBER 
VALUES ('user02', 'pass02', '김말똥', 'user02@kh.or.kr', 'F', 23, '010-5555-6666', '07233,서울특별시 영등포구 의사당대로 1,(여의도동) 33', '20180301', '20180302', DEFAULT);

COMMIT;

----------------------------------------------------
----------------     NOTICE 관련        -----------------   
----------------------------------------------------
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_NID;

CREATE TABLE NOTICE (
  NID NUMBER PRIMARY KEY,
  NTITLE VARCHAR2(30) NOT NULL,
  NWRITER VARCHAR2(30),
  NCONTENT VARCHAR2(200),
  N_CREATE_DATE DATE DEFAULT SYSDATE,
  N_MODIFY_DATE DATE DEFAULT SYSDATE,
  FILE_PATH VARCHAR2(300),
  FOREIGN KEY (NWRITER) REFERENCES MEMBER(USERID) ON DELETE CASCADE
);

COMMENT ON COLUMN NOTICE.NID IS '공지사항번호';
COMMENT ON COLUMN NOTICE.NTITLE IS '공지사항제목';
COMMENT ON COLUMN NOTICE.NWRITER IS '공지사항작성자아이디';
COMMENT ON COLUMN NOTICE.NCONTENT IS '공지사항내용';
COMMENT ON COLUMN NOTICE.N_CREATE_DATE IS '공지사항작성날짜';
COMMENT ON COLUMN NOTICE.N_MODIFY_DATE IS '공지사항수정날짜';
COMMENT ON COLUMN NOTICE.FILE_PATH IS '첨부파일경로';

CREATE SEQUENCE SEQ_NID;

INSERT INTO NOTICE VALUES (SEQ_NID.NEXTVAL, '관리자 공지', 'admin',
                          '공지서비스를 게시합니다.  많이 이용해 주세요', 
                          '20180201', '20180201', NULL);
                          
INSERT INTO NOTICE VALUES (SEQ_NID.NEXTVAL, '공지서비스 오픈 환영', 'admin',
                          '드디어 오픈되었군요. 많이 이용하겠습니다.', 
                          '20180201', '20180201', NULL);
                          
INSERT INTO NOTICE VALUES (SEQ_NID.NEXTVAL, '공지서비스 이용 안내', 'admin',
                          '공지서비스는 회원만 이용할 수 있습니다. 회원 가입하세요.', 
                          '20180201', '20180201', NULL);

COMMIT;