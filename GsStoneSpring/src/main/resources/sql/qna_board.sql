CREATE TABLE IF NOT EXISTS `QNA_BOARD` (
  `IDX` int(200) NOT NULL COMMENT '인덱스',
  `TITLE` varchar(100) NOT NULL COMMENT '제목',
  `CONTENTS` varchar(4000) NOT NULL COMMENT '내용',
  `DEL_GB` varchar(1) NOT NULL DEFAULT 'N' COMMENT '삭제구분',
  `CREA_DTM` varchar(200) NOT NULL DEFAULT 'now()' COMMENT '생성일자',
  `CREA_ID` varchar(30) NOT NULL COMMENT '생성자 ID',
  PRIMARY KEY (`IDX`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='customerQNA';

ALTER TABLE `QNA_BOARD` ADD `customerContact` VARCHAR( 100 ) NOT NULL AFTER `CREA_ID` ;

-- 기초 데이터

INSERT INTO `gsstone`.`QNA_BOARD` (
 `IDX` ,
`TITLE` ,
`CONTENTS` ,
`DEL_GB` ,
`CREA_DTM` ,
`CREA_ID` 
)
VALUES (
 0, 'test', 'test', 'N', now(), 'test', '123-1234-1234'
);