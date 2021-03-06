CREATE TABLE AUTHENTICATION_SYSTEM(
	U_ID INTEGER,
	A_NAME VARCHAR(30),
	U_NAME VARCHAR(30),
	PASSWORD VARCHAR(11),
	PRIMARY KEY (U_ID)
);

CREATE TABLE ADMIN_PANEL(
	ID INTEGER,
	FIRST_NAME VARCHAR(30),
	LAST_NAME VARCHAR(30),
	PRIMARY KEY (ID)
);

CREATE TABLE LOGGED_BY (
	U_ID INTEGER,
	ID char(20) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (U_ID) REFERENCES AUTHENTICATION_SYSTEM,
	FOREIGN KEY (ID) REFERENCES AUTHENTICATION_SYSTEM
	

);

CREATE TABLE USERS (
	USERS_ID INTEGER,
	USERS_NAME VARCHAR(30),
	EMAIL VARCHAR(30),
	USER_PASSWORD VARCHAR(30),
	PRIMARY KEY (USERS_ID)

);

CREATE TABLE KEEP_TRACK (
	ID INTEGER,
	USERS_ID INTEGER,
	PRIMARY KEY (ID,USERS_ID),
	FOREIGN KEY (ID) REFERENCES ADMIN_PANEL,
	FOREIGN KEY (USERS_ID) REFERENCES USERS
);

CREATE TABLE BOOKS (
	SI_NO INTEGER,
	ISBN VARCHAR(40),
	CATEGORY VARCHAR(30),
	PRICE INTEGER,
	AUTHOR VARCHAR(20),
	TITLE VARCHAR(30),
	RESERVATION_DATE DATE,
	ISSUE_DATE DATE,
	RETURN_DATE DATE,
	USERS_ID INTEGER,
	PRIMARY KEY(SI_NO),
	FOREIGN KEY (USERS_ID) REFERENCES USERS,
	UNIQUE (USERS_ID)

);

CREATE TABLE PERIODICALS (
	P_ID INTEGER,
	P_TITLE VARCHAR(30),
	P_YEAR VARCHAR(20),
	RESERVATION_DATE DATE,
	ISSUE_DATE DATE,
	RETURN_DATE DATE,
	USERS_ID INTEGER,
	PRIMARY KEY(P_ID),
	FOREIGN KEY (USERS_ID) REFERENCES USERS,
	UNIQUE (USERS_ID)
	
);

CREATE TABLE PUBLISHER (
	PU_ID INTEGER,
	PU_NAME VARCHAR(20),
	PUBLICATION_DATE DATE,
	PRIMARY KEY(PU_ID)
	
);

CREATE TABLE PUBLISH (
	SI_NO INTEGER,
	PU_ID INTEGER,
	PRIMARY KEY(SI_NO),
	FOREIGN KEY (PU_ID) REFERENCES PUBLISHER,
	FOREIGN KEY (SI_NO) REFERENCES BOOKS
	
);

CREATE TABLE PRINTI (
	P_ID INTEGER,
	PU_ID INTEGER,
	PRIMARY KEY(P_ID),
	FOREIGN KEY (PU_ID) REFERENCES PUBLISHER,
	FOREIGN KEY (P_ID) REFERENCES PERIODICALS
	);
	
	