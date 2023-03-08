CREATE TABLE mvcboard (
    idx NUMBER NOT NULL PRIMARY KEY, -- 일련번호, 기본키
    name VARCHAR2(50) NOT NULL, -- 작성자 이름
    title VARCHAR2(200) NOT NULL, -- 제목
    content VARCHAR2(2000) NOT NULL, -- 내용
    postdate DATE DEFAULT SYSDATE NOT NULL, -- 작성일, 기본값은 현재 시각
    ofile VARCHAR2(200), -- 원본 파일명, NULL 허용
    sfile VARCHAR2(30), -- 저장된 파일명, NULL 허용
    downcount NUMBER DEFAULT 0 NOT NULL, -- 다운로드 횟수, 기본값은 0
    pass VARCHAR2(50) NOT NULL, -- 비밀번호
    visitcount NUMBER DEFAULT 0 NOT NULL -- 조회수, 기본값은 0
);