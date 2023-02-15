CREATE TABLE mvcboard(
	idx NUMBER PRIMARY KEY,
	name varchar2(50) NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	postdate DATE DEFAULT sysdate NOT NULL,
	office varchar2(200),
	sfile varchar2(30),
	downcount number(5) DEFAULT 0 NOT NULL,
	pass varchar2(50) NOT NULL,
	visitcount NUMBER DEFAULT 0 NOT null
);

INSERT INTO mvcboard(idx, name, title, content, pass)
	values(seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
INSERT INTO mvcboard(idx, name, title, content, pass)
	values(seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
INSERT INTO mvcboard(idx, name, title, content, pass)
	values(seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
INSERT INTO mvcboard(idx, name, title, content, pass)
	values(seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
INSERT INTO mvcboard(idx, name, title, content, pass)
	values(seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

COMMIT;
