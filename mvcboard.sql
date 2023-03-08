CREATE TABLE mvcboard (
    idx NUMBER NOT NULL PRIMARY KEY, -- �Ϸù�ȣ, �⺻Ű
    name VARCHAR2(50) NOT NULL, -- �ۼ��� �̸�
    title VARCHAR2(200) NOT NULL, -- ����
    content VARCHAR2(2000) NOT NULL, -- ����
    postdate DATE DEFAULT SYSDATE NOT NULL, -- �ۼ���, �⺻���� ���� �ð�
    ofile VARCHAR2(200), -- ���� ���ϸ�, NULL ���
    sfile VARCHAR2(30), -- ����� ���ϸ�, NULL ���
    downcount NUMBER DEFAULT 0 NOT NULL, -- �ٿ�ε� Ƚ��, �⺻���� 0
    pass VARCHAR2(50) NOT NULL, -- ��й�ȣ
    visitcount NUMBER DEFAULT 0 NOT NULL -- ��ȸ��, �⺻���� 0
);