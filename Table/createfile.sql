--SEED TABLE
CREATE TABLE "SEED"
(
    VarietyID           VARCHAR2(30)    NOT NULL,                                  
    SeedName            VARCHAR2(40)    NOT NULL,
    VarietyName         VARCHAR2(25)    NOT NULL,
    SeedPurPose         VARCHAR2(20)    NOT NULL,
    Seed_Category       VARCHAR2(20)    NOT NULL,
    PRIMARY KEY (VarietyID)
);



--ORGANIZATION TABLE
CREATE TABLE ORGANIZATION
(
    OrgName             VARCHAR2(40)    PRIMARY KEY,
    Org_Purpose         VARCHAR(4)      CHECK(Org_Purpose IN ('L', 'S', 'A')), -- lend : L, sell : S, All : A
    Region              VARCHAR2(20)     NOT NULL,
    Affiliate_Date      DATE DEFAULT sysdate,
    Affiliate_Period    NUMBER(5)        NOT NULL
);



--HAS TABLE
CREATE TABLE HAS
(
   VarietyID            VARCHAR2(30)    NOT NULL,
   OrgName              VARCHAR2(40),
   PRIMARY KEY (VarietyID, OrgName),
   FOREIGN KEY(VarietyID) REFERENCES SEED(VarietyID),
   FOREIGN KEY(OrgName) REFERENCES ORGANIZATION(OrgName)
);



--USER TABLE
CREATE TABLE "USER"
(
    UserID              VARCHAR2(20)    PRIMARY KEY,
    User_Name           VARCHAR2(20)    NOT NULL,
    PW                  VARCHAR2(20)    NOT NULL,
    Address             NVARCHAR2(100)  NOT NULL,
    Age                 NUMBER(3)       NOT NULL,
    Phone_Num           NUMBER(11)      NOT NULL,
    Gender              VARCHAR2(4)     CHECK(Gender IN ('F', 'M')), -- male : M, female : F
    Email_Adr           VARCHAR2(40)    NOT NULL
);



--ORDER TABLE
CREATE TABLE "ORDER"
(
    OrderNum            NUMBER(10)      NOT NULL,
    OD_UserID           VARCHAR2(20)    NOT NULL,
    Purchase_Date       DATE DEFAULT sysdate,
    Order_Purpose       VARCHAR(4) CHECK(Order_Purpose IN ('R', 'B')), -- rent : R, buy : B
    OD_OrgName          VARCHAR2(20)    NOT NULL,
    OD_VarietyID        VARCHAR2(30)    NOT NULL,
    Quantity            NUMBER(5)       NOT NULL,
    FOREIGN KEY(OD_UserID) REFERENCES "USER"(UserID),
    FOREIGN KEY(OD_OrgName) REFERENCES ORGANIZATION(OrgName),
    FOREIGN KEY(OD_VarietyID) REFERENCES SEED(VarietyID)
);
CREATE SEQUENCE ORDER_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;
-- INSERT 할 때 OrderNum부분에 ORDER_SEQ.NEXTVAL 넣으시면 됩니다.



--BULLETIN_BOARD TABLE
CREATE TABLE "BULLETIN_BOARD"
(
   BWNum                NUMBER          PRIMARY KEY,              
   BWPurpose            VARCHAR2(10),
   BWTitle              NVARCHAR2(20)   NOT NULL,
   BUserID              VARCHAR2(20)    NOT NULL,
   BWTime               DATE  DEFAULT sysdate,
   BWContent            NVARCHAR2(600),
   FOREIGN KEY (BUserID) REFERENCES "USER"(UserID)
);
CREATE SEQUENCE BW_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;
-- INSERT 할 때 BWNUM부분에 BW_SEQ.NEXTVAL 넣으시면 됩니다.



--NOTICE_BOARD TABLE
CREATE TABLE NOTICE_BOARD
(
   NWNum                NUMBER          PRIMARY KEY,
   NWTitle              NVARCHAR2(20)   NOT NULL,
   NWTime               DATE  DEFAULT sysdate,
   NWContent            NVARCHAR2(1000)
);
CREATE SEQUENCE NW_SEQ START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;
-- INSERT 할 때 NWNUM부분에 NW_SEQ.NEXTVAL 넣으시면 됩니다.



--READ TABLE
CREATE TABLE "READ"
(
  UserID                VARCHAR2(20)    NOT NULL,
  NWNum                 Number          NOT NULL,
  FOREIGN KEY (UserID) REFERENCES "USER"(UserID),
  FOREIGN KEY (NWNum) REFERENCES NOTICE_BOARD(NWNum)
);
