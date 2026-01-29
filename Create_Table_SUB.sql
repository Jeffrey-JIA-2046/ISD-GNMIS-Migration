

CREATE TABLE AVIndexSub (
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
	CONSTRAINT PK_AVIndexSub PRIMARY KEY (ID),
	KEY `IX_AVIndexSub1` (`ClipID`)
);


CREATE TABLE AVLinkSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL,
	CONSTRAINT PK_AVLinkSub PRIMARY KEY (ID),
	KEY `IX_AVLinkSub1` (`Refno`)
);

CREATE TABLE AVLocationSub (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	Version int NULL,
	FileFormat char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VersionType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RetrievalType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4FloorInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4CantoneseInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4EnglishInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4PutonghuaInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_AVLocationSub PRIMARY KEY (ID),
	KEY `IX_AVLocationSub1` (`ClipID`)
);

CREATE TABLE AttachmentSub (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Header varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	BcTS datetime NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_AttachmentSub PRIMARY KEY (ID),
	KEY `IX_AttachmentSub1` (`Refno`)
);

CREATE TABLE ContentRefSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_ContentRefSub PRIMARY KEY (ID),
	KEY `IX_ContentRefSub1` (`Refno`)
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


CREATE TABLE DC_VerifyAttachmentSUB_mssql (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyAttachmentSUB_ora (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VerifyAttachmentSub (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	AttachID int NOT NULL,
	FaxInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Header varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	BcTS datetime NULL,
	FileName1 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachData1 LONGBLOB NULL,
	ThumbnailData1 LONGBLOB NULL,
	FileName2 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AttachData2 LONGBLOB NULL,
	ThumbnailData2 LONGBLOB NULL,
	Description varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VerifyAvIndexSub (
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
CREATE TABLE DC_VerifyAvLinkSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipID bigint NOT NULL,
	ClipType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL
);



CREATE TABLE DC_VerifyAvLocationSub (
	ID bigint NOT NULL,
	ClipID bigint NOT NULL,
	Version int NULL,
	FileFormat char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	VersionType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	RetrievalType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4FloorInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4CantoneseInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4EnglishInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MP4PutonghuaInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ClipLocation varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyContentRefSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	Message varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ContentRefType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE DC_VerifyCountSUB (
	tableDescription varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SourceCount bigint NULL,
	TargetCount bigint NULL
);


CREATE TABLE DC_VerifyDepartment (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	EngDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DefaultPRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	InactiveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IncHeadlinePrefix varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DIPSDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL
);

CREATE TABLE DC_VerifyLangRefSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL
);

CREATE TABLE DC_VerifyPPhotoSub_mssql (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE DC_VerifyPRContentSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngContent_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyPRHeaderSub (
	ID bigint NOT NULL,
	Refno varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SrcDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeletedInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NoteToEditors varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MediaEnquiry varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OtherNoteToEditors varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HtmlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE DC_VerifyPhotoLinkSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID int NOT NULL,
	DisplayOrder int NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL
);


CREATE TABLE DC_VerifyPhotoSub_src (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyPrContentSUB_mssql (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);


CREATE TABLE DC_VerifyPrContentSUB_ora (
	RefNo varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE DC_VerifySubscriber (
	ID int NOT NULL,
	SubscriberID varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
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
	ENC_ITContactEmail LONGBLOB NULL
);


CREATE TABLE DC_VerifyTPhotoSub_mssql (
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID int NOT NULL,
	hashVal LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);



CREATE TABLE Department (
	ID int NOT NULL,
	DeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	EngDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DefaultPRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	InactiveInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IncHeadlinePrefix varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DIPSDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateBy varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	UpdateTS datetime NULL,
	Version int NULL,
	CONSTRAINT PK_Department PRIMARY KEY (ID)
);


CREATE TABLE DistQueue (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	GICAction char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SubmitTS datetime NULL,
	WebBcTS datetime NULL,
	GICBcTS datetime NULL,
	GICCompleted char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_BroadcastQueue PRIMARY KEY (ID),
	KEY `IX_BroadcastQueue1` (`Refno`)
);

CREATE TABLE G400HeadlineSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	G400Headline varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_G400Headline PRIMARY KEY (ID),
	KEY `IX_Refno` (`Refno`)
);

CREATE TABLE Hotlink (
	ID bigint NOT NULL,
	ItemID int NOT NULL,
	EngDesc LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiDesc LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EffectiveFrom datetime NULL,
	EffectiveTo datetime NULL,
	LinkType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	URL varchar(360) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiURL varchar(360) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_Hotlink PRIMARY KEY (ID)
);

CREATE TABLE LangRefSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	LangRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_LangRefSub PRIMARY KEY (ID),
	KEY `IX_LangRefSub1` (`Refno`)
);
CREATE TABLE LoginLogoutLogSub (
	ID bigint NOT NULL,
	SubscriberID varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IPAddr varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ActionTS datetime NULL,
	SessionID varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_LoginLogoutLogSub PRIMARY KEY (ID)
);

CREATE TABLE LoginSession (
	SubscriberID varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SessionID varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CreateTS DATETIME(3) NOT NULL DEFAULT (CURRENT_TIMESTAMP(3))
);

CREATE TABLE PRContentSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngContent_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiContent_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_PRContentSub PRIMARY KEY (ID),
	KEY `IX_PRContentSub1` (`Refno`)
);

CREATE TABLE PRHeaderSub (
	ID bigint NOT NULL,
	Refno varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SrcDeptCode varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	Status char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DeletedInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NoteToEditors varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	MediaEnquiry varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OtherNoteToEditors varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HtmlInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeadline_Plain LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	DisplayOrder int NULL,
	CONSTRAINT PK_PRHeaderSub PRIMARY KEY (ID),
	KEY `ID_PRHeaderSub2` (`BcTS`),
	KEY `IX_Language` (`Language`),
	KEY `IX_PRHeaderSub1` (`Refno`),
	KEY `IX_Priority` (`Priority`)
);

CREATE TABLE PRPrioritySub (
	ID int NOT NULL,
	Priority char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_PRPrioritySub PRIMARY KEY (ID)
);

CREATE TABLE PhotoEmbeddedSub (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	PhotoID int NOT NULL,
	ShowCaptionIND char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	WidthRatio int NULL,
	CONSTRAINT PK_PhotoEmbedded PRIMARY KEY (ID)
);

CREATE TABLE PhotoImgSub (
	ID bigint NOT NULL,
	PhotoID int NOT NULL,
	FileType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	ThumbnailData LONGBLOB NULL,
	ProgressiveData LONGBLOB NULL,
	OriginalLink varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngHeader varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngCaption varchar(3200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiHeader varchar(640) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiCaption varchar(3200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_PhotoSub PRIMARY KEY (ID),
	KEY `IX_PhotoImgSub1` (`PhotoID`)
);


CREATE TABLE PhotoLinkSub (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PhotoID int NOT NULL,
	DisplayOrder int NULL,
	LinkTS datetime NULL,
	BcTS datetime NULL,
	CONSTRAINT PK_PhotoLinkSub PRIMARY KEY (ID),
	KEY `IX_PhotoLinkSub1` (`Refno`)
);

CREATE TABLE PublishQueue (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubmitTS datetime NULL,
	ReadyTs datetime NOT NULL,
	CloudDB1CompletionTS datetime NULL,
	CloudDB2CompletionTS datetime NULL,
	DistqueueID bigint NULL,
	CONSTRAINT PK_PublishQueue PRIMARY KEY (ID)
);

CREATE TABLE PublishQueueHist (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubmitTS datetime NULL,
	ReadyTs datetime NOT NULL,
	CloudDB1CompletionTS datetime NULL,
	CloudDB2CompletionTS datetime NULL,
	DistqueueID bigint NULL
);

CREATE TABLE RelatedLink (
	ID int NOT NULL,
	GroupID int NOT NULL,
	LinkID int NOT NULL,
	EngName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	EngURL varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiURL varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_RelatedLink PRIMARY KEY (ID)
);


CREATE TABLE RelatedLinkGroup (
	ID int NOT NULL,
	GroupID int NOT NULL,
	EngName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	ChiName varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_RelatedLinkGroup PRIMARY KEY (ID)
);

CREATE TABLE RmkFollowItemSub (
	ID bigint NOT NULL,
	RefNo varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_RmkFollowItem PRIMARY KEY (ID),
	KEY `IX_Refno` (`RefNo`)
);
CREATE TABLE RmkFollowItemTypeSub (
	ID int NOT NULL,
	RmkType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkEngDesc varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	RmkChiDesc varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DisplayOrder int NOT NULL,
	CONSTRAINT PK_RmkFollowItemTypeSub PRIMARY KEY (ID)
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
	Password varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	OldPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AdminPassword varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
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


CREATE TABLE SubscriberIndex (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PRType varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	`Language` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	BcTS datetime NULL,
	DisplayOrder int NULL,
	CONSTRAINT PK_SubscriberIndex PRIMARY KEY (ID),
	KEY `IX_SubscriberIndex_Temp` (`Refno`)
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

CREATE TABLE SupersedeList (
	ID int NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	OriginalRefno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_SupersedeList PRIMARY KEY (ID)
);

CREATE TABLE SyncControl (
	TableName varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	IsSyncInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	CONSTRAINT PK_SyncControl PRIMARY KEY (TableName)
);

CREATE TABLE SystemParameter (
	ParamId int NOT NULL,
	paramName varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	paramValue varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_SystemParameter PRIMARY KEY (ParamId)
);

CREATE TABLE WebFeedAckLog (
	ID bigint NOT NULL,
	Token varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	TxnID varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	DLType char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	AckType varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	AckTS datetime NULL,
	IPAddr varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PCName varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Remark varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_WebFeedAckLog PRIMARY KEY (ID)
);


CREATE TABLE WebFeedConnection (
	ID bigint NOT NULL,
	Token varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	MACAddr varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	UpdateTS datetime NOT NULL,
	CONSTRAINT PK_WebFeedConnection PRIMARY KEY (ID)
);


CREATE TABLE WebFeedDistLog (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NOT NULL,
	BcTS datetime NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	WebBcTS datetime NULL,
	NewsMLInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HTMLInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	TextInd char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_WebFeedDistLog PRIMARY KEY (ID),
	KEY `IX_Refno` (`Refno`),
	KEY `IX_WebBcTS` (`WebBcTS`)
);

CREATE TABLE WebFeedNoti (
	ID int NOT NULL,
	NotiID int NULL,
	Version varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	Message LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SchSendTS datetime NULL,
	CONSTRAINT PK_WebFeedNoti PRIMARY KEY (ID)
);

CREATE TABLE WebFeedNotiLog (
	ID int NOT NULL,
	NotiID int NULL,
	Token varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	IPAddr varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	PCName varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	SendTS datetime NULL,
	MACAddress varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_WebFeedNotiLog PRIMARY KEY (ID)
);

CREATE TABLE WebFeedPRFile (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	Version int NULL,
	WebFeedVersion varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	NewsMLFile LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HTMLFile LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	HTMLPrintFile LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	TextFile LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	CONSTRAINT PK_WebFeedPRFile PRIMARY KEY (ID)
);

CREATE TABLE delta_ref (
	ref_num varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
	src char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL
);

CREATE TABLE publishqueuehist_bak_20160128 (
	ID bigint NOT NULL,
	Refno varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	`Action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
	SubmitTS datetime NULL,
	ReadyTs datetime NOT NULL,
	CloudDB1CompletionTS datetime NULL,
	CloudDB2CompletionTS datetime NULL,
	DistqueueID bigint NULL
);

