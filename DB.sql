DROP DATABASE IF EXISTS `Mushion`;
CREATE DATABASE `Mushion`;
USE `Mushion`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);


# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# member TD 생성
# (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcd@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1',
cellphoneNum = '01043214321',
email = 'axdswww12@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2',
cellphoneNum = '01056785678',
email = 'abcdef@gmail.com';

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE article
SET memberId = 2
WHERE id IN (1,2);

UPDATE article
SET memberId = 3
WHERE id IN (3,4);


# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';


ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

# reactionPoint 테이블 생성
CREATE TABLE reactionPoint(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

# article 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE article AS A
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`body` = '댓글 4';

# reply 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE reply ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE reply ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 1번 회원이 2번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 2,
`point` = 1;

# 2번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 2번 회원이 2번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 2,
`point` = -1;

# 3번 회원이 1번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'reply',
relId = 1,
`point` = 1;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE reply AS R
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON R.id = RP_SUM.relId
SET R.goodReactionPoint = RP_SUM.goodReactionPoint,
R.badReactionPoint = RP_SUM.badReactionPoint;

# 파일 테이블 추가
CREATE TABLE genFile (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, # 번호
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delDate DATETIME DEFAULT NULL, # 삭제날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  relTypeCode CHAR(50) NOT NULL, # 관련 데이터 타입(article, member)
  relId INT(10) UNSIGNED NOT NULL, # 관련 데이터 번호
  originFileName VARCHAR(100) NOT NULL, # 업로드 당시의 파일이름
  fileExt CHAR(10) NOT NULL, # 확장자
  typeCode CHAR(20) NOT NULL, # 종류코드 (common)
  type2Code CHAR(20) NOT NULL, # 종류2코드 (attatchment)
  fileSize INT(10) UNSIGNED NOT NULL, # 파일의 사이즈
  fileExtTypeCode CHAR(10) NOT NULL, # 파일규격코드(img, video)
  fileExtType2Code CHAR(10) NOT NULL, # 파일규격2코드(jpg, mp4)
  fileNo SMALLINT(2) UNSIGNED NOT NULL, # 파일번호 (1)
  fileDir CHAR(20) NOT NULL, # 파일이 저장되는 폴더명
  PRIMARY KEY (id),
  KEY relId (relTypeCode,relId,typeCode,type2Code,fileNo)
);

# 기존의 회원 비번을 암호화
UPDATE `member`
SET loginPw = SHA2(loginPw,256);

###############################################

UPDATE article 
SET title = '제목5'
WHERE id = 5;

UPDATE article 
SET title = '제목11'
WHERE id = 6;

UPDATE article 
SET title = '제목45'
WHERE id = 7;

# ================================================================= 

CREATE TABLE FashionStyle (
    id INT AUTO_INCREMENT,
    styleName VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO FashionStyle (styleName) VALUES
('Biker'),
('Bohemian'),
('Casual'),
('Classic'),
('Goth'),
('Grunge'),
('Hippie'),
('Minimal'),
('Punk'),
('Resort'),
('Retro'),
('Sporty'),
('Street'),
('Vintage');

CREATE TABLE musicType (
    id INT AUTO_INCREMENT PRIMARY KEY,
    typeName VARCHAR(50)
);

INSERT INTO musicType (typeName) VALUES
('Blues'),
('Classical'),
('Country'),
('Dance'),
('Electronic'),
('Folk'),
('Hip-hop'),
('Jazz'),
('Metal'),
('Pop'),
('Punk'),
('Reggae'),
('Rhythm and Blues'),
('Rock');


# =======================================================================================

CREATE TABLE fashionMusic (
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL
	
);

CREATE TABLE topdb (
	id INT PRIMARY KEY NOT NULL,
	genre VARCHAR(50),
	artist VARCHAR(50),
	track VARCHAR(50)
);

INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('1','Se?rita','Shawn Mendes','canadian pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('2','China','Anuel AA','reggaeton flow\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('3','boyfriend (with Social House)','Ariana Grande','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('4','Beautiful People (feat. Khalid)','Ed Sheeran','pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('5','Goodbyes (Feat. Young Thug)','Post Malone','dfw rap\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('6','I Don\'t Care (with Justin Bieber)','Ed Sheeran','pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('7','Ransom','Lil Tecca','trap music\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('8','How Do You Sleep?','Sam Smith','pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('9','Old Town Road - Remix','Lil Nas X','country rap\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('10','bad guy','Billie Eilish','electropop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('11','Callaita','Bad Bunny','reggaeton\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('12','Loco Contigo (feat. J. Balvin & Tyga)','DJ Snake','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('13','Someone You Loved','Lewis Capaldi','pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('14','Otro Trago - Remix','Sech','panamanian pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('15','Money In The Grave (Drake ft. Rick Ross)','Drake','canadian hip hop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('16','No Guidance (feat. Drake)','Chris Brown','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('17','LA CANCI?','J Balvin','latin\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('18','Sunflower - Spider-Man: Into the Spider-Verse','Post Malone','dfw rap\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('19','Lalala','Y2K','canadian hip hop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('20','Truth Hurts','Lizzo','escape room\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('21','Piece Of Your Heart','MEDUZA','pop house\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('22','Panini','Lil Nas X','country rap\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('23','No Me Conoce - Remix','Jhay Cortez','reggaeton flow\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('24','Soltera - Remix','Lunay','latin\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('25','bad guy (with Justin Bieber)','Billie Eilish','electropop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('26','If I Can\'t Have You','Shawn Mendes','canadian pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('27','Dance Monkey','Tones and I','australian pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('28','It\'s You','Ali Gatie','canadian hip hop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('29','Con Calma','Daddy Yankee','latin\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('30','QUE PRETENDES','J Balvin','latin\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('31','Takeaway','The Chainsmokers','edm\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('32','7 rings','Ariana Grande','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('33','The London (feat. J. Cole & Travis Scott)','Young Thug','atl hip hop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('34','Never Really Over','Katy Perry','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('35','Summer Days (feat. Macklemore & Patrick Stump of F','Martin Garrix','big room\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('36','Otro Trago','Sech','panamanian pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('37','Antisocial (with Travis Scott)','Ed Sheeran','pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('38','Sucker','Jonas Brothers','boy band\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('39','\"fuck',' i\'m lonely (with Anne-Marie) - from ?3 Reasons Wh','Lauv\"\"\"');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('40','Higher Love','Kygo','edm\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('41','You Need To Calm Down','Taylor Swift','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('42','Shallow','Lady Gaga','dance pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('43','Talk','Khalid','pop\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('44','Con Altura','ROSAL?','r&b en espanol\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('45','One Thing Right','Marshmello','brostep\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('46','\"Te Robar?','Nicky Jam\"\"\"','latin');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('47','Happier','Marshmello','brostep\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('48','Call You Mine','The Chainsmokers','edm\r');
INSERT INTO `topdb` (`id`, `genre`, `artist`, `track`) VALUES('49','Cross Me (feat. Chance the Rapper & PnB Rock)','Ed Sheeran','pop\r');


CREATE TABLE snapshotUrl (

id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
url TEXT,
fashionStyleId INT NOT NULL
);


# =======================================================================================

DROP TABLE topdb;

DROP TABLE snapshotUrl;

SELECT * FROM topdb;

SELECT * FROM snapshotUrl;

SELECT * FROM `member`;

SELECT * FROM article;

SELECT * FROM genFile;