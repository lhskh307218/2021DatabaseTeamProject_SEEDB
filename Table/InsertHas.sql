INSERT INTO HAS VALUES ('생판-2013-230', '농촌진흥청');
INSERT INTO HAS VALUES ('생판-2014-2117', '농촌진흥청');
INSERT INTO HAS VALUES ('생판-2003-50', '농촌진흥청');
INSERT INTO HAS VALUES ('출원-2015-510', '농촌진흥청');
INSERT INTO HAS VALUES ('출원-2000-21', '농촌진흥청');
INSERT INTO HAS VALUES ('생판-1999-9789', '농촌진흥청');
INSERT INTO HAS VALUES ('출원-2002-124', '농촌진흥청');
INSERT INTO HAS VALUES ('출원-2020-633', '농촌진흥청');
INSERT INTO HAS VALUES ('출원-2018-2', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-2007-929', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-2003-50', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-2018-1633', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-1999-10036', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-2003-1235', '주식회사시드피아');
INSERT INTO HAS VALUES ('출원-2017-324', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-1999-10605', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-1997-748', '주식회사시드피아');
INSERT INTO HAS VALUES ('생판-2003-301', '주식회사시드피아');
INSERT INTO HAS VALUES ('출원-2000-21', '씨제이제일제당');
INSERT INTO HAS VALUES ('출원-2005-185', '씨제이제일제당');
INSERT INTO HAS VALUES ('생판-1997-748', '씨제이제일제당');
INSERT INTO HAS VALUES ('생판-2004-799', '씨제이제일제당');
INSERT INTO HAS VALUES ('생판-2003-1235', '씨제이제일제당');
INSERT INTO HAS VALUES ('출원-2017-213', '씨제이제일제당');
INSERT INTO HAS VALUES ('생판-1997-748', '남평농업협동조합장');
INSERT INTO HAS VALUES ('생판-2014-2117', '남평농업협동조합장');
INSERT INTO HAS VALUES ('생판-2003-354', '남평농업협동조합장');
INSERT INTO HAS VALUES ('출원-2016-632', '남평농업협동조합장');
INSERT INTO HAS VALUES ('생판-2007-929', '현대종묘');
INSERT INTO HAS VALUES ('출원-2000-21', '그린씨드');
INSERT INTO HAS VALUES ('생판-2003-50', '그린씨드');
INSERT INTO HAS VALUES ('생판-1999-947', '그린씨드');
INSERT INTO HAS VALUES ('생판-2014-2117', '그린씨드');
INSERT INTO HAS VALUES ('생판-1997-748', '그린씨드');
INSERT INTO HAS VALUES ('생판-2014-2117', '산림품종관리센터');
INSERT INTO HAS VALUES ('생판-2007-866', '산림품종관리센터');
INSERT INTO HAS VALUES ('생판-1999-9789', '산림품종관리센터');
INSERT INTO HAS VALUES ('출원-2016-629', '산림품종관리센터');
INSERT INTO HAS VALUES ('생판-2003-354', '산림품종관리센터');
INSERT INTO HAS VALUES ('생판-2003-325', '산림품종관리센터');
INSERT INTO HAS VALUES ('생판-2016-877', '산림품종관리센터');
INSERT INTO HAS VALUES ('출원-2009-313', '(주)제농 에스앤티 농업회사법인');
INSERT INTO HAS VALUES ('출원-2010-405', '(주)포테이토밸리');
INSERT INTO HAS VALUES ('생판-1997-748', '농업회사법인 오스템바이오㈜');
INSERT INTO HAS VALUES ('생판-2020-519', '수산식물관리센터');
INSERT INTO HAS VALUES ('생판-2003-301', '수산식물관리센터');
INSERT INTO HAS VALUES ('생판-2003-325', '수산식물관리센터');
INSERT INTO HAS VALUES ('생판-2003-354', '수산식물관리센터');
INSERT INTO HAS VALUES ('생판-1999-9789', '수산식물관리센터');
INSERT INTO HAS VALUES ('출원-2019-149', '수산식물관리센터');
INSERT INTO HAS VALUES ('출원-2000-21', '(주)농심');
INSERT INTO HAS VALUES ('생판-2015-188', '왕산종묘');
INSERT INTO HAS VALUES ('생판-2014-2117', '몬산토코리아 유한회사');
INSERT INTO HAS VALUES ('생판-1999-9789', '소이벤처(주)');
INSERT INTO HAS VALUES ('생판-2003-50', '소이벤처(주)');
INSERT INTO HAS VALUES ('생판-2007-929', '소이벤처(주)');
INSERT INTO HAS VALUES ('출원-2013-257', '소이벤처(주)');
INSERT INTO HAS VALUES ('생판-1997-748', '소이벤처(주)');

ALTER TABLE "HAS" ADD(Quantity NUMBER(8));

UPDATE "HAS" SET Quantity = 99999999
WHERE OrgName = '농촌진흥청';
UPDATE "HAS" SET Quantity = 90000000
WHERE OrgName = '주식회사씨드피아';
UPDATE "HAS" SET Quantity = 80000000
WHERE OrgName = '씨제이제일제당';
UPDATE "HAS" SET Quantity = 70000000
WHERE OrgName = '남평농업협동조합장';
UPDATE "HAS" SET Quantity = 60000000
WHERE OrgName = '현대종묘';
UPDATE "HAS" SET Quantity = 80000000
WHERE OrgName = '그린씨드';
UPDATE "HAS" SET Quantity = 70050000
WHERE OrgName = '산림품종관리센터';
UPDATE "HAS" SET Quantity = 89000000
WHERE OrgName = '(주)제농 에스앤티 농업회사법인';
UPDATE "HAS" SET Quantity = 80788460
WHERE OrgName = '(주)포테이토밸리';
UPDATE "HAS" SET Quantity = 8950000
WHERE OrgName = '농업회사법인 오스템바이오㈜';
UPDATE "HAS" SET Quantity = 99000000
WHERE OrgName = '수산식물관리센터';
UPDATE "HAS" SET Quantity = 89788460
WHERE OrgName = '(주)농심';
UPDATE "HAS" SET Quantity = 90000000
WHERE OrgName = '왕산종묘';
UPDATE "HAS" SET Quantity = 80000000
WHERE OrgName = '몬산토코리아 유한회사';
UPDATE "HAS" SET Quantity = 70000000
WHERE OrgName = '소이벤처(주)';

ALTER TABLE "HAS" ADD(RPermit NUMBER(2));

UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '농촌진흥청';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '주식회사씨드피아';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '씨제이제일제당';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '남평농업협동조합장';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '현대종묘';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '그린씨드';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '산림품종관리센터';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '(주)제농 에스앤티 농업회사법인';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '(주)포테이토밸리';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '농업회사법인 오스템바이오㈜';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '수산식물관리센터';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '(주)농심';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '왕산종묘';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '몬산토코리아 유한회사';
UPDATE "HAS" SET RPermit = 1
WHERE OrgName = '소이벤처(주)';

-- has 승인 요청된 seed 추가
insert into HAS VALUES ('생판-2007-929', '농촌진흥청', 123456, 0);
insert into HAS VALUES ('생판-2007-929', '(주)농심', 456879, 0);
insert into HAS VALUES ('생판-2018-1633', '농촌진흥청', 9876859, 0);
insert into HAS VALUES ('출원-2017-324', '농촌진흥청', 650000, 0);
insert into HAS VALUES ('생판-2007-866', '그린씨드', 170000, 0);
insert into HAS VALUES ('출원-2009-313', '(주)포테이토밸리', 230000, 0);
insert into HAS VALUES ('생판-2015-188', '소이벤처(주)', 230000, 0);
insert into HAS VALUES ('생판-2015-188', '남평농업협동조합장', 230000, 0);

COMMIT;