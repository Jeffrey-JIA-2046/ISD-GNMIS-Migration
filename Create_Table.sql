

CREATE TABLE AVIndex (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ClipDate datetime NULL,
	EngHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ThumbLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL,
	UploadTS datetime NULL,
	CONSTRAINT PK_AVIndexSub PRIMARY KEY (ID)
);

CREATE TABLE AVIndexHist (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipDate datetime NULL,
	EngHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ThumbLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL,
	CONSTRAINT PK_AVIndexHist PRIMARY KEY (ID)
);


CREATE TABLE AVLink (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL,
	CONSTRAINT PK_AVLink PRIMARY KEY (ID),
	KEY `ix_avlink1` (`refno`)
);



CREATE TABLE AVLinkHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL,
	CONSTRAINT PK_AVLinkHist PRIMARY KEY (ID),
	KEY `IX_AVLinkHist1` (`Refno`,`Version`)
);


CREATE TABLE AVLocation (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	Version int NOT NULL,
	FileFormat char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	VersionType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RetrievalType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4FloorInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4CantoneseInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4EnglishInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4PutonghuaInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_AVLocation PRIMARY KEY (ID)
);



CREATE TABLE AVLocationHist (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	Version int NOT NULL,
	FileFormat char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VersionType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RetrievalType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4FloorInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4CantoneseInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4EnglishInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4PutonghuaInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_AVLocationHist PRIMARY KEY (ID)
);


CREATE TABLE AccessControl (
	ID int NOT NULL,
	RoleID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FunctionID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptMode char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTs datetime NOT NULL,
	CONSTRAINT PK_AccessControl PRIMARY KEY (ID),
	KEY `IX_AccessControl1` (`RoleID`)
);


CREATE TABLE Attachment (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Header varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RemoveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadTS datetime NULL,
	BcTS datetime NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL,
	CONSTRAINT PK_Attachment PRIMARY KEY (ID),
	KEY `IX_Attachment1` (`Refno`)
);


CREATE TABLE AttachmentHist (
	ID bigint NOT NULL,
	Version int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Header varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RemoveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadTS datetime NULL,
	BcTS datetime NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL,
	CONSTRAINT PK_AttachmentHist PRIMARY KEY (ID),
	KEY `IX_AttachmentHist1` (`Version`,`Refno`)
);

CREATE TABLE AttachmentType (
	ID int NOT NULL,
	AttType varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FileType varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_AttachmentType PRIMARY KEY (ID)
);


CREATE TABLE BroadcastControl (
	IsRunning char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);



CREATE TABLE BroadcastExecutionProfiler (
	ID bigint NOT NULL,
	`Execution target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Execution time` bigint NULL,
	`Record timestamp` datetime NULL,
	`Execution order` int NULL,
	CONSTRAINT PK_BroadcastExecutionProfiler PRIMARY KEY (ID)
);



CREATE TABLE Contact (
	ID int NOT NULL,
	Name varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Tel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Fax varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Sms varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Email varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	CONSTRAINT PK_Contact PRIMARY KEY (ID)
);

CREATE TABLE ContactGroup (
	ID int NOT NULL,
	Name varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_ContactGroup PRIMARY KEY (ID)
);



CREATE TABLE ContactGroupItem (
	ID int NOT NULL,
	ContactGroupID int NOT NULL,
	ContactID int NOT NULL,
	CONSTRAINT PK_ContactGroupItem PRIMARY KEY (ID)
);


CREATE TABLE ContentRef (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Groupno bigint NULL,
	RefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_ContentRef PRIMARY KEY (ID),
	KEY `IX_ContentRef1` (`Refno`)
);

CREATE TABLE ContentRefHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Groupno bigint NULL,
	RefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL,
	CONSTRAINT PK_ContentRefHist PRIMARY KEY (ID),
	KEY `IX_ContentRefHist1` (`Refno`,`Version`)
);

CREATE TABLE ContentRefHist_bak_20160128 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Groupno bigint NULL,
	RefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL
);


CREATE TABLE DC_VLAVLink (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Src_ClipId varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Target_ClipId varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VLAttach (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Src_AttId varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Target_AttId varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VLPhoto (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Src_PhotoId varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Target_PhotoId varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VLRelContent (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Src_RelRefNo varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Target_RelRefNo varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyAVIndex (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ClipDate datetime NULL,
	EngHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ThumbLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL,
	UploadTS datetime NULL
);

CREATE TABLE DC_VerifyAVLink (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL
);


CREATE TABLE DC_VerifyAVLinkHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL
);

CREATE TABLE DC_VerifyAVLocation (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	Version int NOT NULL,
	FileFormat char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	VersionType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RetrievalType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4FloorInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4CantoneseInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4EnglishInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4PutonghuaInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VerifyAVLocationHist (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	Version int NOT NULL,
	FileFormat char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VersionType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RetrievalType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4FloorInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4CantoneseInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4EnglishInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4PutonghuaInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE DC_VerifyAccessControl (
	ID int NOT NULL,
	RoleID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FunctionID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptMode char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTs datetime NOT NULL
);



CREATE TABLE DC_VerifyAttachment (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Header varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RemoveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadTS datetime NULL,
	BcTS datetime NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL
);

CREATE TABLE DC_VerifyAttachmentHist (
	ID bigint NOT NULL,
	Version int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Header varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RemoveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadTS datetime NULL,
	BcTS datetime NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL
);



CREATE TABLE DC_VerifyAttachment_mssql (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyAttachment_ora (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VerifyAvIndexHist (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipDate datetime NULL,
	EngHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeader varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ThumbLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL
);


CREATE TABLE DC_VerifyContentRef (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Groupno bigint NULL,
	RefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyContentRefHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Groupno bigint NULL,
	RefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL
);



CREATE TABLE DC_VerifyCount (
	tableDescription varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SourceCount bigint NULL,
	TargetCount bigint NULL
);


CREATE TABLE DC_VerifyDeptPRType (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);

CREATE TABLE DC_VerifyLangRef (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL
);
CREATE TABLE DC_VerifyLangRefHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL
);


CREATE TABLE DC_VerifyPRHeader (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NULL,
	Author varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SrcDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubscriberInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PublicInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PrefBcTS datetime NULL,
	PrefBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SchBcTS datetime NULL,
	SchBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeletedInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SenderRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MediaEnquiry varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NoteToEditors varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OtherNoteToEditors varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficer varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactHomeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactMobileNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VideoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AudioInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachAvlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CreateTS datetime NULL,
	ReceiveTS datetime NULL,
	ReceiveBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ReleaseBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HtmlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisableHyperlink char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyPRTemplateType (
	ID int NOT NULL,
	TemplateType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);


CREATE TABLE DC_VerifyPhotoIndex (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PhotoID bigint NOT NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NOT NULL,
	BcTS datetime NULL
);



CREATE TABLE DC_VerifyPhotoIndexHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	PhotoID bigint NOT NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NOT NULL,
	BcTs datetime NULL
);

CREATE TABLE DC_VerifyPrContentHist_mssql (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VerifyPrContentHist_ora (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyPrContent_mssql (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE DC_VerifyPrContent_ora (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyPrStatus (
	ID int NOT NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NULL
);


CREATE TABLE DC_VerifyPrTemplate (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	TemplateType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Name varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Headline varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	G400Headline varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);

CREATE TABLE DC_VerifyPrType (
	ID int NOT NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTS datetime NOT NULL
);

CREATE TABLE DC_VerifyRmkFollowItem (
	ID bigint NOT NULL,
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);


CREATE TABLE DC_VerifyRmkFollowItemHist (
	ID bigint NOT NULL,
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);


CREATE TABLE DC_VerifyRmkFollowItemType (
	ID int NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkEngDesc varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkChiDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DisplayOrder int NOT NULL
);



CREATE TABLE DC_VerifyRowCountSync (
	tableDescription varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SourceCount bigint NULL,
	TargetCount bigint NULL
);

CREATE TABLE DC_VerifySubscriber (
	ID int NOT NULL,
	SubscriberID varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldAdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Name varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OrgNameEng varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OrgNameChi varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Address varchar(480) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Fax varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactName varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactPost varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactMobile varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactEmail varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactName varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactPost varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactMobile varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactEmail varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangPref char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ActiveDate datetime NULL,
	MaxLogins int NULL,
	MaxWebfeeds int NULL,
	Remarks varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SMSNumbers varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PwdExpInterval int NULL,
	PwdUpdateDate datetime NULL,
	Token varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateDate datetime NULL
);

CREATE TABLE DC_VerifyUserProfile (
	ID int NOT NULL,
	UserID varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	FullName varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactName varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OfficeTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MobileTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Pager varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Email varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RoleID varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCodes varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PwdExpInterval int NULL,
	CreateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateDate datetime NULL,
	PwdUpdateDate datetime NULL
);

CREATE TABLE DC_VerifyUserRole (
	ID int NOT NULL,
	RoleID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTS datetime NOT NULL,
	DelInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DefaultChannel (
	ID int NOT NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubscriberInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PublicInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_DefaultChannel PRIMARY KEY (ID),
	KEY `IX_DefaultChannel_SearchEditPR` (`PRType`)
);

CREATE TABLE Department (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DefaultPRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	InactiveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IncHeadlinePrefix varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DIPSDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL,
	CONSTRAINT PK_Department PRIMARY KEY (ID),
	KEY `IX_Department_SearchActiveDepartment` (`DeptCode`,`InactiveInd`),
	KEY `IX_Department_SearchEditPR` (`DIPSDeptCode`)
);

CREATE TABLE DeptCodeMap (
	ID int NOT NULL,
	GNMISDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DIPSDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	CONSTRAINT PKDeptCodeMap PRIMARY KEY (ID)
);

CREATE TABLE DeptPRType (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_DeptPRType PRIMARY KEY (ID),
	KEY `IX_DeptPRType` (`DeptCode`)
);

CREATE TABLE DistLog (
	ID bigint NOT NULL,
	BcTS datetime NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	GICAction char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubmitTS datetime NULL,
	WebBcTS datetime NULL,
	GICBcTS datetime NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL,
	DistqueueID bigint NULL,
	CONSTRAINT PK_DistLog PRIMARY KEY (ID)
);

CREATE TABLE DistQueue (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubmitTS datetime NULL,
	WebBcTS datetime NULL,
	GICBcTS datetime NULL,
	GICCompleted char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICAction char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL,
	CONSTRAINT PK_BroadcastQueue PRIMARY KEY (ID),
	KEY `IX_BroadcastQueue1` (`Refno`),
	KEY `IX_BroadcastQueue2` (`Action`),
	KEY `IX_Broadcast_GIC` (`Refno`,`GICAction`,`GICCompleted`),
	KEY `IX_GICBcTS` (`Refno`,`Action`),
	KEY `IX_SubmitTS` (`SubmitTS`)
);


CREATE TABLE Distqueue_bak_20160121 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubmitTS datetime NULL,
	WebBcTS datetime NULL,
	GICBcTS datetime NULL,
	GICCompleted char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICAction char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL
);

CREATE TABLE DistributionList (
	ID int NOT NULL,
	ListID int NOT NULL,
	ListType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	CreateTS datetime NULL,
	CONSTRAINT PK_DistributionList PRIMARY KEY (ID)
);

CREATE TABLE DistributionListItem (
	ID int NOT NULL,
	ListID int NOT NULL,
	ItemID int NOT NULL,
	ContactName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ItemValue varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	CONSTRAINT PK_DistributionListItem PRIMARY KEY (ID)
);

CREATE TABLE FaxOutQueue (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FaxNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ContactName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	FaxHeader varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IncludeBodyIND char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubmitTS datetime NOT NULL,
	CompleteTS datetime NULL,
	CONSTRAINT PK_FaxOutQueue PRIMARY KEY (ID),
	KEY `IX_FaxOutQueue1` (`SubmitTS`)
);

CREATE TABLE FtpLog (
	ID bigint NOT NULL,
	filename varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`action` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	status varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	createDT datetime NOT NULL,
	completeDT datetime NOT NULL,
	location varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_FtpLog PRIMARY KEY (ID)
);

CREATE TABLE FtpQueue (
	ID bigint NOT NULL,
	filename varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`action` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	status varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	createDT datetime NOT NULL,
	completeDT datetime NULL,
	location varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	status_pri varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	status_sec varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_FtpQueue PRIMARY KEY (ID)
);


CREATE TABLE FunctionList (
	ID int NOT NULL,
	FuncID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptControlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MenuID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_FunctionList PRIMARY KEY (ID)
);

CREATE TABLE G400Headline (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	G400Headline varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_G400Headline PRIMARY KEY (ID),
	KEY `IX_G400Headline` (`Refno`)
);
CREATE TABLE G400HeadlineHist (
	ID bigint NOT NULL,
	Version int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	G400Headline varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_G400HeadlineHist PRIMARY KEY (ID),
	KEY `IX_G400HeadlineHist1` (`Refno`)
);
CREATE TABLE GNMIS_Support_EmailList (
	id bigint NOT NULL,
	EmailAddress varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_GNMIS_Support_EmailList PRIMARY KEY (id)
);
CREATE TABLE HotLink (
	ID bigint NOT NULL,
	ItemID int NOT NULL,
	EngDesc LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiDesc LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EffectiveFrom datetime NULL,
	EffectiveTo datetime NULL,
	LinkType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiURL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	CONSTRAINT PK_HotLink PRIMARY KEY (ID)
);


CREATE TABLE LangRef (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_LangRef PRIMARY KEY (ID),
	KEY `IX_LangRef1` (`Refno`),
	KEY `IX_LangRef2` (`LangRefno`),
	KEY `IX_LangRef3` (`Refno`,`DisplayOrder`)
);


CREATE TABLE LangRefHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_LangRefHist PRIMARY KEY (ID),
	KEY `IX_LangRefHist1` (`Refno`,`Version`)
);
CREATE TABLE LoginLogoutLog (
	ID bigint NOT NULL,
	UserID varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IPAddr varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ActionTS datetime NULL,
	SessionID varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_LoginLogoutLog PRIMARY KEY (ID)
);


CREATE TABLE LoginLogoutLogSub (
	ID bigint NOT NULL,
	SubscriberID varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IPAddr varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ActionTS datetime NULL,
	SessionID varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_LoginLogoutLogSub PRIMARY KEY (ID)
);


CREATE TABLE MenuItem (
	ID int NOT NULL,
	MenuID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ParentMenuID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NULL,
	CONSTRAINT PK_MenuItem PRIMARY KEY (ID)
);



CREATE TABLE PARALLEL_RUN (
	ID bigint NOT NULL,
	LastSyncDateTime datetime NOT NULL,
	CONSTRAINT PK_PARALLEL_RUN PRIMARY KEY (ID)
);

CREATE TABLE PRContent (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	EngContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngContent_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_PRContent PRIMARY KEY (ID),
	KEY `IX_PRContent1` (`Refno`)
);

CREATE TABLE PRContentHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NOT NULL,
	EngContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_PRContentHist PRIMARY KEY (ID),
	KEY `IX_PRContentHist1` (`Refno`,`Version`)
);


CREATE TABLE PRHeader (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	Author varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SrcDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubscriberInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PublicInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PrefBcTS datetime NULL,
	PrefBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SchBcTS datetime NULL,
	SchBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeletedInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SenderRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MediaEnquiry varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NoteToEditors varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OtherNoteToEditors varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficer varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactHomeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactMobileNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PhotoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VideoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AudioInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachAvlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CreateTS datetime NULL,
	ReceiveTS datetime NULL,
	ReceiveBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ReleaseBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HtmlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisableHyperlink char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT CK_PrHeader UNIQUE (Refno),
	CONSTRAINT PK_PRHeader PRIMARY KEY (ID),
	KEY `IX_PRHeader1` (`SchBcImmdInd`,`Status`,`DeletedInd`,`SchBcTS`),
	KEY `IX_PRHeader3` (`Status`,`DeletedInd`,`PRType`),
	KEY `IX_PRHeader6` (`BcTS`,`Refno`),
	KEY `IX_PRHeader8` (`Status`,`BcTS`,`CreateTS`,`ReceiveTS`,`Priority`,`Refno`),
	KEY `IX_PRHeader9` (`PRType`,`PublicInd`,`Language`),
	KEY `IX_PRHeader_ForBroadcast` (`Refno`,`Status`),
	KEY `IX_PRHeader_ForMaintenancelist1` (`Refno`,`DeletedInd`,`Status`,`Priority`,`SchBcTS`),
	KEY `IX_PRHeader_ForMaintenancelist2` (`DeletedInd`,`PRType`),
	KEY `IX_PRHeader_ForMaintenancelist3` (`Priority`,`DeletedInd`,`PRType`),
	KEY `IX_PRHeader_ForMaintenancelist4` (`DeletedInd`,`Language`,`PRType`),
	KEY `IX_PRHeader_ForMaintenancelist5` (`SrcDeptCode`,`Status`,`DeletedInd`,`Language`,`PRType`),
	KEY `IX_PRHeader_ForMaintenancelist6` (`Status`,`DeletedInd`,`Language`,`PRType`),
	KEY `IX_PRHeader_ForMaintenancelist7` (`Priority`,`Status`,`DeletedInd`,`Language`,`PRType`),
	KEY `IX_PRHeader_GIC` (`PublicInd`,`Refno`,`ID`),
	KEY `IX_PRHeader_PRStatus_View` (`Status`,`DeletedInd`,`DeptCode`),
	KEY `IX_SchBcTS` (`SchBcTS`),
	KEY `IX_TEST3` (`DeletedInd`,`Status`,`BcTS`,`Refno`)
);

CREATE TABLE PRHeaderHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	VersionInd varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Author varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SrcDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubscriberInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PublicInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PrefBcTS datetime NULL,
	PrefBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SchBcTS datetime NULL,
	SchBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeletedInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SenderRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MediaEnquiry varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NoteToEditors varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OtherNoteToEditors varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficer varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactHomeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactMobileNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VideoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AudioInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachAvlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CreateTS datetime NULL,
	ReceiveTS datetime NULL,
	ReceiveBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ReleaseBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HtmlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisableHyperlink char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_PRHeaderHist PRIMARY KEY (ID),
	KEY `IX_PRHeaderHist1` (`Refno`)
);


CREATE TABLE PRPriority (
	ID int NOT NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_PRPriority PRIMARY KEY (ID),
	KEY `IX_PRPriority1` (`DisplayOrder`),
	KEY `IX_PRPriority_ForMaintenancelist` (`Priority`)
);


CREATE TABLE PRRole (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RoleIDForward varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RoleIDBroadcast varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdatedBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdatedTS datetime NOT NULL,
	CONSTRAINT PK_PRRole PRIMARY KEY (ID),
	CONSTRAINT UQ_PRRole UNIQUE (Refno),
	KEY `IX_PRRole_Broadcast` (`RoleIDBroadcast`),
	KEY `IX_PRRole_Forward` (`RoleIDForward`)
);


CREATE TABLE PRStatus (
	ID int NOT NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NULL,
	CONSTRAINT PK_PRStatus PRIMARY KEY (ID),
	KEY `IX_PRStatus1` (`DisplayOrder`),
	KEY `IX_PRStatus_ForMaintenancelist` (`Status`)
);


CREATE TABLE PRTemplate (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	TemplateType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Name varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Headline varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	G400Headline varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_PRTemplate PRIMARY KEY (ID),
	KEY `IX_PRTemplate1` (`DeptCode`)
);


CREATE TABLE PRTemplateType (
	ID int NOT NULL,
	TemplateType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_PRTemplateType PRIMARY KEY (ID)
);

CREATE TABLE PRType (
	ID int NOT NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTS datetime NOT NULL,
	CONSTRAINT PK_PRType PRIMARY KEY (ID)
);

CREATE TABLE PRUnlockLog (
	ID bigint NOT NULL,
	LockType char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID bigint NULL,
	ClipID bigint NULL,
	UnlockBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UnlockTS datetime NOT NULL,
	CONSTRAINT PK_PRUnlockLog PRIMARY KEY (ID)
);

CREATE TABLE PhotoEmbedded (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PhotoID int NOT NULL,
	ShowCaptionIND char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	WidthRatio int NULL,
	CONSTRAINT PK_PhotoEmbedded PRIMARY KEY (ID),
	KEY `ID_PhotoEmbedded1` (`Refno`,`PhotoID`)
);


CREATE TABLE PhotoEmbeddedHist (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	PhotoID int NOT NULL,
	ShowCaptionIND char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	WidthRatio int NULL,
	CONSTRAINT PK_PhotoEmbeddedHist PRIMARY KEY (ID)
);


CREATE TABLE PhotoIndex (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PhotoID bigint NOT NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NOT NULL,
	BcTS datetime NULL,
	CONSTRAINT PK_PhotoIndex PRIMARY KEY (ID),
	KEY `IX_PhotoIndex1` (`Refno`),
	KEY `IX_PhotoIndex2` (`BcTS`),
	KEY `IX_PhotoIndex3` (`PhotoID`),
	KEY `IX_PhotoIndex_ForBroadcast` (`Refno`,`PhotoID`)
);

CREATE TABLE PhotoIndexHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	PhotoID bigint NOT NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NOT NULL,
	BcTs datetime NULL,
	CONSTRAINT PK_PhotoIndexHist PRIMARY KEY (ID),
	KEY `IX_PhotoIndexHist1` (`Refno`,`Version`)
);


CREATE TABLE PolicyKeyMap (
	ID int NOT NULL,
	PolicyKey varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_PolicyKeyMap PRIMARY KEY (ID)
);

CREATE TABLE REFNO (
	REFNO varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE RefnoSeq (
	ID bigint NOT NULL,
	CreateTS datetime NOT NULL,
	NextSeq int NOT NULL,
	CONSTRAINT PK_RefnoSeq PRIMARY KEY (ID)
);

CREATE TABLE RelatedLink (
	ID int NOT NULL,
	GroupID int NOT NULL,
	LinkID int NOT NULL,
	EngName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngURL varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiURL varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	CONSTRAINT PK_RelatedLink PRIMARY KEY (ID)
);

CREATE TABLE RelatedLinkGroup (
	ID int NOT NULL,
	GroupID int NOT NULL,
	EngName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_RelatedLinkGroup PRIMARY KEY (ID)
);

CREATE TABLE RmkFollowItem (
	ID bigint NOT NULL,
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_RmkFollowItem PRIMARY KEY (ID),
	KEY `IX_RmkFollowItem_SearchEditPR` (`RefNo`)
);

CREATE TABLE RmkFollowItemHist (
	ID bigint NOT NULL,
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_RmkFollowItemHist PRIMARY KEY (ID)
);

CREATE TABLE RmkFollowItemType (
	ID int NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkEngDesc varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkChiDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_RmkFollowItemType PRIMARY KEY (ID)
);

CREATE TABLE Semaphore (
	ID bigint NOT NULL,
	LockType char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID bigint NULL,
	ClipID bigint NULL,
	LockBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	LockUntil datetime NOT NULL,
	CONSTRAINT PK_Semaphore PRIMARY KEY (ID),
	KEY `IX_Semaphore_ForMaintenanceList` (`Refno`),
	KEY `[NonClusteredIndex-20150115-112704]` (`Refno`),
	KEY `[NonClusteredIndex-20150115-112727]` (`LockType`),
	KEY `[NonClusteredIndex-20150115-112805]` (`LockBy`),
	KEY `[NonClusteredIndex-20150115-112827]` (`LockUntil`)
);

CREATE TABLE SmsManualSendLog (
	ID int NOT NULL,
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SmsPhoneNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SendTs datetime NOT NULL,
	SmsMsg varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UserID varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_SmsManualSendLog PRIMARY KEY (ID)
);

CREATE TABLE SpecialChar (
	ID int NOT NULL,
	HTMLCode varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DisplayOrder int NULL,
	CONSTRAINT PK_SpecialChar PRIMARY KEY (ID)
);

CREATE TABLE StoreProcedureErrorInfo (
	id bigint NOT NULL,
	logTS datetime NULL,
	errorNumber bigint NULL,
	ErrorSeverity LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ErrorState LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ErrorProcedure LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ErrorLine bigint NULL,
	ErrorMessage LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE Subscriber (
	ID int NOT NULL,
	SubscriberID varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldAdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Name varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OrgNameEng varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OrgNameChi varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Address varchar(480) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Fax varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactName varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactPost varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactMobile varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactEmail varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactName varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactPost varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactMobile varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactEmail varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangPref char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ActiveDate datetime NULL,
	MaxLogins int NULL,
	MaxWebfeeds int NULL,
	Remarks varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SMSNumbers varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PwdExpInterval int NULL,
	PwdUpdateDate datetime NULL,
	Token varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateDate datetime NULL,
	ENC_Name LONGBLOB NULL,
	ENC_Type LONGBLOB NULL,
	ENC_OrgNameEng LONGBLOB NULL,
	ENC_OrgNameChi LONGBLOB NULL,
	ENC_Address LONGBLOB NULL,
	ENC_Fax LONGBLOB NULL,
	ENC_PriContactName LONGBLOB NULL,
	ENC_PriContactPost LONGBLOB NULL,
	ENC_PriContactTel LONGBLOB NULL,
	ENC_PriContactMobile LONGBLOB NULL,
	ENC_PriContactEmail LONGBLOB NULL,
	ENC_ITContactName LONGBLOB NULL,
	ENC_ITContactPost LONGBLOB NULL,
	ENC_ITContactTel LONGBLOB NULL,
	ENC_ITContactMobile LONGBLOB NULL,
	ENC_ITContactEmail LONGBLOB NULL,
	EncryptedPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_Subscriber PRIMARY KEY (ID)
);
CREATE TABLE SubscriberLog (
	SubscriberID varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	ActionTS datetime NOT NULL,
	IntranetCompletionTS datetime NULL,
	CloudDB1CompletionTS datetime NULL,
	CloudDB2CompletionTS datetime NULL,
	SendStatus char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE SubscriberType (
	ID int NOT NULL,
	`Type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeleteInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'N' NOT NULL,
	CONSTRAINT PK_SubscriberType PRIMARY KEY (ID)
);

CREATE TABLE SyncControl (
	TableName varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	IsSyncInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_SyncControl PRIMARY KEY (TableName)
);

CREATE TABLE SystemConfig (
	ID int NOT NULL,
	Name varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	IntValue bigint NULL,
	StringValue varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NumericValue numeric(12,5) NULL,
	CONSTRAINT PK_SystemConfig PRIMARY KEY (Name)
);

CREATE TABLE TDFaxSeq (
	ID bigint NOT NULL,
	CreateTS datetime NOT NULL,
	NextSeq int NOT NULL,
	CONSTRAINT PK_TDFaxSeq PRIMARY KEY (ID)
);

CREATE TABLE TEMP_NEW_CREATED_PR (
	ref_num varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	author varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	createTs datetime NULL
);

CREATE TABLE TEMP_NEW_CREATED_PR_BAKUP (
	ref_num varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	author varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	createTs datetime NULL
);

CREATE TABLE UserActivityLog (
	ID bigint NOT NULL,
	UserID varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	LogTime datetime NOT NULL,
	refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	photoID bigint NULL,
	clipID bigint NULL,
	remark varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	attachID bigint NULL,
	CONSTRAINT PK_UserActivityLog PRIMARY KEY (ID)
);

CREATE TABLE UserProfile (
	ID int NOT NULL,
	UserID varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	FullName varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactName varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OfficeTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MobileTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Pager varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Email varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RoleID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCodes varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PwdExpInterval int NULL,
	CreateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateDate datetime NULL,
	PwdUpdateDate datetime NULL,
	LoginFailed int DEFAULT 0 NOT NULL,
	PwdVoid varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'N' NOT NULL,
	OldPassword1 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword2 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword3 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword4 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword5 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword6 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword7 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword8 varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_UserProfile PRIMARY KEY (ID),
	KEY `IX_UserProfile1` (`UserID`)
);

CREATE TABLE UserProfile_bak (
	ID int NOT NULL,
	UserID varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	FullName varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactName varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OfficeTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MobileTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Pager varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Email varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RoleID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeptCodes varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PwdExpInterval int NULL,
	CreateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateDate datetime NULL,
	PwdUpdateDate datetime NULL
);

CREATE TABLE UserRole (
	ID int NOT NULL,
	RoleID varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Description varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTS datetime NOT NULL,
	DelInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_UserRole PRIMARY KEY (ID)
);

CREATE TABLE a (
	ref_num varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	KEY `[NonClusteredIndex-20150908-141127]` (`ref_num`)
);

CREATE TABLE a_logshipping (
	id int NOT NULL,
	value char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE attachmentHist_bak_20151209 (
	ID bigint NOT NULL,
	Version int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Header varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RemoveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UploadTS datetime NULL,
	BcTS datetime NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL
);

CREATE TABLE avlink_bak_20151209 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Version int NOT NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL
);

CREATE TABLE batch_ctrl (
	batch_name varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	start_time datetime NULL,
	end_time datetime NULL,
	machine_name varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE contentRefHist_bak_20151209 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Groupno bigint NULL,
	RefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL
);

CREATE TABLE dc_verifycountsync (
	tableDescription varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SourceCount bigint NULL,
	TargetCount bigint NULL
);


CREATE TABLE delta_ref (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE delta_ref_20151217 (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE delta_ref_bak (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE delta_ref_dtpatch (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE delta_ref_patch (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE delta_vrec (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE distlog_bak_20160128 (
	ID bigint NOT NULL,
	BcTS datetime NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	GICAction char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubmitTS datetime NULL,
	WebBcTS datetime NULL,
	GICBcTS datetime NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	GICBcFtpTS datetime NULL,
	DistqueueID bigint NULL
);


CREATE TABLE hotlink_Audit (
	ID bigint NOT NULL,
	ItemID int NOT NULL,
	EngDesc LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiDesc LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EffectiveFrom datetime NULL,
	EffectiveTo datetime NULL,
	LinkType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiURL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	AuditDataState varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AuditDMLAction varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AuditUser varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AuditDateTime datetime NULL,
	CONSTRAINT PK_hotlink_Audit_1 PRIMARY KEY (ID)
);


CREATE TABLE ispn_entry_gnmis_war (
	id varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	datum binary(1) NOT NULL,
	version bigint NOT NULL,
	segment int NOT NULL,
	CONSTRAINT PK__ispn_ent__3213E83F6E26340F PRIMARY KEY (id),
	KEY `ispn_entry_gnmis_war_segment_index` (`segment`),
	KEY `ispn_entry_gnmis_war_timestamp_index` (`version`)
);

CREATE TABLE ispn_entry_igs_gnmis_war (
	id varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	datum BLOB NOT NULL,
	version bigint NOT NULL,
	segment int NOT NULL,
	CONSTRAINT PK__ispn_ent__3213E83F8AD69F0C PRIMARY KEY (id)
);

CREATE TABLE langrefHist_bak_20151209 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL
);


CREATE TABLE param (
	description varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	value datetime NULL,
	valueStr varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE photoindexHist_bak_20151209 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	PhotoID bigint NOT NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NOT NULL,
	BcTs datetime NULL
);

CREATE TABLE prheader_bak_20160128 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	Author varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SrcDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubscriberInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PublicInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PrefBcTS datetime NULL,
	PrefBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SchBcTS datetime NULL,
	SchBcImmdInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeletedInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SenderRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsroomRemarks varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MediaEnquiry varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NoteToEditors varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OtherNoteToEditors varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficer varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactOfficeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactHomeNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContactMobileNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PhotoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VideoInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AudioInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachAvlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CreateTS datetime NULL,
	ReceiveTS datetime NULL,
	ReceiveBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ReleaseBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HtmlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisableHyperlink char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE srcref (
	refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE subscriber_bk (
	ID int NOT NULL,
	SubscriberID varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OldAdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Name varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OrgNameEng varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OrgNameChi varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Address varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Fax varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactName varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactPost varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactMobile varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PriContactEmail varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactName varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactPost varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactTel varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactMobile varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ITContactEmail varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	LangPref char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ActiveDate datetime NULL,
	MaxLogins int NULL,
	MaxWebfeeds int NULL,
	Remarks varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SMSNumbers varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PwdExpInterval int NULL,
	PwdUpdateDate datetime NULL,
	Token varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateDate datetime NULL
);


CREATE TABLE systranschemas (
	tabid int NOT NULL,
	startlsn binary(10) NOT NULL,
	endlsn binary(10) NOT NULL,
	typeid int DEFAULT 52 NOT NULL,
	KEY `uncsystranschemas` (`startlsn`)
);


CREATE TABLE tmp_hdr_hist_ora (
	refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	version int NOT NULL,
	versionInd varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE tt_tmp (
	test varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE user_dept_multiple_hat_map (
	oldDeptCode varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	newDeptCodes varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
);


CREATE TABLE SupersedeList (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OriginalRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_SupersedeList PRIMARY KEY (ID),
	CONSTRAINT SupersedeList_OrgRefNo_FK FOREIGN KEY (OriginalRefno) REFERENCES PRHeader(Refno),
	CONSTRAINT SupersedeList_RefNo_FK FOREIGN KEY (Refno) REFERENCES PRHeader(Refno),
	KEY `IX_SupersedeList_OldRefNo` (`OriginalRefno`),
	KEY `IX_SupersedeList_Refno` (`Refno`)
);
