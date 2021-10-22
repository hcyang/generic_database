/*
-- -*- SQL -*-  -- To make emacs recognize the correct program type.
///////////////////////////////////////////////////////////////////////////////
//=============================================================================
// Script:
//   --------------------------------------------------------------------------
//   econtent database
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Purpose:
//   --------------------------------------------------------------------------
//   DDL for managing econtent data.
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// By: Hung-chih Yang
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Initiated date: DATELL--____INITIALIZATION_DATE____--DATERL
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Finalized date: DATELL--____INITIALIZATION_DATE____--DATERL
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Version Control information:
//   --------------------------------------------------------------------------
//   $Author$
//   --------------------------------------------------------------------------
//   $Date$
//   --------------------------------------------------------------------------
//   $Id$
//   --------------------------------------------------------------------------
//   $Header$
//   --------------------------------------------------------------------------
//   $Log$
//   --------------------------------------------------------------------------
//   $Source$
//   --------------------------------------------------------------------------
//   $Revision$
//   --------------------------------------------------------------------------
//   $State$
//   --------------------------------------------------------------------------
//   $Locker$
//   --------------------------------------------------------------------------
//   $Name$
//   --------------------------------------------------------------------------
//   $RCSfile$
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// To do List:
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Change List:
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Notes:
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Functionalities:
//   --------------------------------------------------------------------------
//   --------------------------------------------------------------------------
//=============================================================================
//
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
===============================================================================
== Schema design guidelines
===============================================================================

  a) This schema is designed for managing e-content data.
     It is comprised of several inter-dependent sub-schemas.
  b) Each sub-schema is noted by an abbreviation,
     such as "O" for "organization", "P" for "product", etc.
  c) Tables/Relations are created in generic names, so that they can
     extend to areas not covered or represented by a design with specific,
     limiting table names.
     For example, instead of
     creating a "book" table that is specific for storing book information (while it can be awkward for storing audio or video data in it) we use
     a generic relation name called "product," which is applicable for
     sotring almost anything.
  d) Tables/Relations should always be created using a transactional storage engine,
     such as InnoDB.
  e) Each sub-schema is comprised of one or more tables. There is a main
     entity or relationship table for storing first-class information.
     There can be a "type" table that is referenced by the main table for
     categorization purpose. There can be a "status" table that is referenced
     by the main table for "status" purpose.
     There can also be a "full-text" table to be indexed for full-text search.
     This full-text table must be stored in the non-transctional MyISAM
     storage engine, and that is why we take it out of the main
     table, which is always managed by a transactional engine, such as
     InnoDB.
  f) The Outline section below shows how the generically-named sub-schemas
     can be used for domain-specific purposes. For example,
     the "organization" relation can be
     used to repesent a website, i.e., website data can be stored in the
     "host" table.
  g) Below is a list of DDL (data definition language) and DCL
     (data control language) programs for building a database with this schema.
     These files are located under
       sql\ddl
     To initialize a database, execute these scripts in order
     after a 'CREATE DATABASE' command.
     1) generic_data_management_MySQL.ddl
        - Create some common utility stored functions.
     2) econtent_data_management_clear.dll
        - Clean up and drop all database objects.
     3) econtent_data_management.dll
        - Create tables.
     4) econtent_data_management_MySQL.dll
        - Create stored functions, procedures, and triggers.
     5) econtent_data_management_demonstration_data.dll
        - An optional DML (data manipulation language) program 
          for entering some test, demonstration tuples.
     6) econtent_data_management_migration.dll
        - An optional DML program for copying data from a previously-built
          database.
          At this time, this migration script would copy from a prototype
          database.
          In next release, this migration script should be revised for
          copying data from a database built by a previous version of this
          script set.

===============================================================================
== Outline
===============================================================================

===============================================================================
== This schema is comprised of several modular schema systems:
===============================================================================

  =============================================================================
  -----------------------------------------------------------------------------
  Organization Management    -- organization management sub-schema
    e.g., publishers, websites, companies
  -----------------------------------------------------------------------------
  Subject Management         -- subject management sub-schema
    e.g., authors, editors, creators, maintainers, sales.
  -----------------------------------------------------------------------------
  Target Management          -- target management sub-schema
    e.g., readers, consumers.
  -----------------------------------------------------------------------------
  Product Management         -- product management sub-schema
    e.g., books, images, albums, videos, etc.
  -----------------------------------------------------------------------------
  Subject-Product Management -- subject-product management sub-schema
    e.g., author-book relationship, etc.
  -----------------------------------------------------------------------------
  Target-Product Management  -- target-product management sub-schema
    e.g., reader-book relationship
  -----------------------------------------------------------------------------
  Cotent Management          -- content management sub-schema
    e.g., book pages, images, audio pieces, vedio pieces, external files
  -----------------------------------------------------------------------------
  Annotation Management      -- content annotation sub-schema
    e.g., categories, tags, annotations, user comments.
  -----------------------------------------------------------------------------
  Product-Content Management -- product-content management sub-schema
    e.g., book - chapter, image, album - track, video - scence, file-set - file
  -----------------------------------------------------------------------------
  User Management            -- user management sub-schema
    e.g., system administrator, data entry operator, publisher represenatives
  -----------------------------------------------------------------------------
  Log Management             -- system log management sub-schema
  -----------------------------------------------------------------------------
  =============================================================================
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
  =============================================================================
  -----------------------------------------------------------------------------
 *Log-Billing Management     -- billing log management sub-schema
  -----------------------------------------------------------------------------
 *Log-Usage Management       -- usage log management sub-schema
  -----------------------------------------------------------------------------
  =============================================================================
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
===============================================================================
== CLEAR database
===============================================================================
*/

/*
\. econtent_data_management_clear.ddl
*/

/*
@econtent_data_management_clear.ddl
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
===============================================================================
== CREATE DATABASE
===============================================================================
*/

/*
CREATE DATABASE 
  ec_main 
CHARACTER SET 
  'utf8'
;
*/

/*
===============================================================================
== USE DATABASE
===============================================================================
*/

/*
USE ec_main;
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

set character_set_client = 'utf8';
set character_set_connection = 'utf8';
set character_set_database = 'utf8';
set character_set_filesystem = 'binary';
set character_set_results = 'utf8';
set character_set_server = 'utf8';
--  set character_set_system = 'utf8';
--  set character_sets_dir = 'C:\Program Files\MySQL\MySQL Server5.1\share\charsets\';
set collation_connection = 'utf8_unicode_ci';
set collation_database = 'utf8_unicode_ci';
set collation_server = 'utf8_unicode_ci';

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
SHOW VARIABLES LIKE 'character_set_%'; 
SHOW VARIABLES LIKE 'collation_%'; 
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
===============================================================================
== Subschema: Log
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_L_LogType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  LT_EntryUpdatedTime                   TIMESTAMP                         NULL,
  LT_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  LT_LogTypeID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  LT_LogTypeName                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  LT_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_L_LogType
  UNIQUE (
    LT_LogTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_L_LogType
  PRIMARY KEY (
    LT_LogTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_LT_LogTypeID
  CHECK (LT_LogTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_L_LogType(
  ----   LT_LogTypeName,
  ----   LT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator log type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  1,
  'before-dml-select',
  'before-dml-select type'
);
INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  2,
  'after-dml-select',
  'after-dml-select type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  3,
  'before-dml-insert',
  'before-dml-insert type'
);
INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  4,
  'after-dml-insert',
  'after-dml-insert type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  5,
  'before-dml-update',
  'before-dml-update type'
);
INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  6,
  'after-dml-update',
  'after-dml-update type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  7,
  'before-dml-delete',
  'before-dml-delete type'
);
INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  8,
  'after-dml-delete',
  'after-dml-delete type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  9,
  'before-compound-dml-operation',
  'before-compound-dml-operation type'
);
INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  10,
  'after-compound-dml-operation',
  'after-compound-dml-operation type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  11,
  'before-non-dml-operation',
  'before-non-dml-operation type'
);
INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  12,
  'after-non-dml-operation',
  'after-non-dml-operation type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  13,
  'unexpected-operation',
  'unexpected-operation type'
);

INSERT
INTO ec_L_LogType (
  LT_LogTypeID,
  LT_LogTypeName,
  LT_Description
) VALUES (
  14,
  'abnormal-operation',
  'abnormal-operation type'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_L_LogSeriousness (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  LS_EntryUpdatedTime                   TIMESTAMP                         NULL,
  LS_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  LS_LogSeriousnessID                   BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  LS_LogSeriousnessName                 VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  LS_LogSeriousnessCode                 BIGINT                        NOT NULL,
  -- --------------------------------------------------------------------------
  LS_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_L_LogSeriousness
  UNIQUE (
    LS_LogSeriousnessID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_L_LogSeriousness
  PRIMARY KEY (
    LS_LogSeriousnessName
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_L_LogSeriousness_Code
  UNIQUE (
    LS_LogSeriousnessCode
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_LS_LogSeriousnessCode
  CHECK (LS_LogSeriousnessCode >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_L_LogSeriousness(
  ----   LS_LogSeriousnessName,
  ----   LS_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  0,
  'system-administrator',
  0,
  'system-administrator log type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  1,
  'normal',
  1,
  'normal type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  2,
  'warning',
  2,
  'warning type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  3,
  'alert',
  3,
  'alert type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  4,
  'error',
  4,
  'error type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  5,
  'critical',
  5,
  'alert type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  6,
  'immediate',
  6,
  'immediate type'
);

INSERT
INTO ec_L_LogSeriousness (
  LS_LogSeriousnessID,
  LS_LogSeriousnessName,
  LS_LogSeriousnessCode,
  LS_Description
) VALUES (
  7,
  'under-attack',
  7,
  'under-attack type'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_L_Log (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  L_EntryUpdatedTime                    TIMESTAMP                         NULL,
  L_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  L_LogID                               BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogTypeID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogSeriousnessID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogUser                             VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogDatabase                         VARCHAR(512)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogConnectionID                     BIGINT                        NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogCatalog                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogMessage                          VARCHAR(4096)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogSqlStatement                     VARCHAR(4096)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogSqlCode                          BIGINT                        NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogSqlErrorMessage                  VARCHAR(4096)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_LogContext                          VARCHAR(4096)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  L_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_L_Log
  PRIMARY KEY (
    L_LogID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_L_LogType
  FOREIGN KEY (
    L_LogTypeID
  ) REFERENCES ec_L_LogType(
    LT_LogTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_L_LogSeriousness
  FOREIGN KEY (
    L_LogSeriousnessID
  ) REFERENCES ec_L_LogSeriousness(
    LS_LogSeriousnessID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_L_LogID
  CHECK (L_LogID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_L_LogTypeID
  CHECK (L_LogTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_L_LogSeriousnessID
  CHECK (L_LogSeriousnessID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_L_Log(
  ----   L_LogUser,
  ----   L_LogDatabase,
  ----   L_LogCatalog,
  ----   L_LogMessage,
  ----   L_LogSqlStatement,
  ----   L_LogSqlErrorMessage,
  ----   L_LogContext,
  ----   L_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_L_Log (
  L_LogID,
  L_LogTypeID,
  L_LogSeriousnessID,
  L_LogUser,
  L_LogDatabase,
  L_LogConnectionID,
  L_LogCatalog,
  L_LogMessage,
  L_LogSqlStatement,
  L_LogSqlCode,
  L_LogSqlErrorMessage,
  L_LogContext,
  L_Description
) VALUES (
  0,
  0,
  0,
  USER(),
  DATABASE(),
  CONNECTION_ID(),
  'system-administrator catalog',
  'system-administrator log',
  '',
  0,
  '',
  'system-administrator log',
  'system-administrator log'
);

/*
===============================================================================
== Subschema: Organization
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_O_OrganizationType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  OT_EntryUpdatedTime                   TIMESTAMP                         NULL,
  OT_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  OT_OrganizationTypeID                 BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  OT_OrganizationTypeName               VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  OT_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_O_OrganizationType
  UNIQUE (
    OT_OrganizationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_O_OrganizationType
  PRIMARY KEY (
    OT_OrganizationTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_OT_OrganizationTypeID
  CHECK (OT_OrganizationTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_OT_OrganizationType(
  ----   OT_OrganizationTypeName,
  ----   OT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_O_OrganizationType (
  OT_OrganizationTypeID,
  OT_OrganizationTypeName,
  OT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator organization type'
);
INSERT
INTO ec_O_OrganizationType (
  OT_OrganizationTypeID,
  OT_OrganizationTypeName,
  OT_Description
) VALUES (
  1,
  'publisher',
  'a publisher'
);
INSERT
INTO ec_O_OrganizationType (
  OT_OrganizationTypeID,
  OT_OrganizationTypeName,
  OT_Description
) VALUES (
  2,
  'copyright holder',
  'a copyright holder'
);
INSERT
INTO ec_O_OrganizationType (
  OT_OrganizationTypeID,
  OT_OrganizationTypeName,
  OT_Description
) VALUES (
  3,
  'library',
  'a library'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_O_OrganizationStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Os_EntryUpdatedTime                   TIMESTAMP                         NULL,
  Os_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Os_OrganizationStatusID               BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Os_OrganizationStatusName             VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Os_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_O_OrganizationStatus
  UNIQUE (
    Os_OrganizationStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_O_OrganizationStatus
  PRIMARY KEY (
    Os_OrganizationStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Os_OrganizationStatusID
  CHECK (Os_OrganizationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_O_OrganizationStatus(
  ----   Os_OrganizationStatusName,
  ----   Os_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_O_OrganizationStatus (
  Os_OrganizationStatusID,
  Os_OrganizationStatusName,
  Os_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator organization status'
);

INSERT
INTO ec_O_OrganizationStatus (
  Os_OrganizationStatusID,
  Os_OrganizationStatusName,
  Os_Description
) VALUES (
  1,
  'active',
  'Organization is in active mode.'
);

INSERT
INTO ec_O_OrganizationStatus (
  Os_OrganizationStatusID,
  Os_OrganizationStatusName,
  Os_Description
) VALUES (
  2,
  'suspended',
  'Organization is in suspended mode.'
);

INSERT
INTO ec_O_OrganizationStatus (
  Os_OrganizationStatusID,
  Os_OrganizationStatusName,
  Os_Description
) VALUES (
  3,
  'limited',
  'Organization is in limited mode.'
);

INSERT
INTO ec_O_OrganizationStatus (
  Os_OrganizationStatusID,
  Os_OrganizationStatusName,
  Os_Description
) VALUES (
  4,
  'inactive',
  'Organization is in inactive mode.'
);

INSERT
INTO ec_O_OrganizationStatus (
  Os_OrganizationStatusID,
  Os_OrganizationStatusName,
  Os_Description
) VALUES (
  5,
  'pending',
  'Organization info has not been published yet.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_O_Organization (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  O_EntryUpdatedTime                    TIMESTAMP                         NULL,
  O_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  O_OrganizationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  O_OrganizationName                    VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  O_OrganizationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  O_OrganizationPhone                   VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  O_OrganizationAddress                 VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  O_OrganizationStatusID                BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  O_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_O_Organization
  UNIQUE (
    O_OrganizationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_O_Organization
  PRIMARY KEY (
    O_OrganizationName
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_O_OrganizationType
  FOREIGN KEY (
    O_OrganizationTypeID
  ) REFERENCES ec_O_OrganizationType(
    OT_OrganizationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_O_OrganizationStatus
  FOREIGN KEY (
    O_OrganizationStatusID
  ) REFERENCES ec_O_OrganizationStatus(
    Os_OrganizationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_O_OrganizationID
  CHECK (O_OrganizationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_O_OrganizationTypeID
  CHECK (O_OrganizationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_O_OrganizationStatusID
  CHECK (O_OrganizationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_O_Organization(
  --   O_OrganizationName,
  --   O_OrganizationPhone,
  --   O_OrganizationAddress,
  --   O_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_O_Organization (
  O_OrganizationID,
  O_OrganizationName,
  O_OrganizationTypeID,
  O_OrganizationPhone,
  O_OrganizationAddress,
  O_OrganizationStatusID,
  O_Description
) VALUES (
  0,
  'system-administrator',
  0,
  '408-123-4567',
  '1 GenericDatabase Road, San Jose, CA 95100',
  1,
  'system-administrator organization'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_O_OrganizationFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Oft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Oft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Oft_OrganizationID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Oft_OrganizationName                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Oft_OrganizationPhone                 VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Oft_OrganizationAddress               VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Oft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_O_OrganizationFullText
  PRIMARY KEY (
    Oft_OrganizationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Oft_Organization
  FOREIGN KEY (
    Oft_OrganizationID
  ) REFERENCES ec_O_Organization(
    O_OrganizationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Oft_OrganizationID
  CHECK (Oft_OrganizationID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_O_Organization(
    Oft_OrganizationName,
    Oft_OrganizationPhone,
    Oft_OrganizationAddress,
    Oft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_O_OrganizationFullText (
  Oft_OrganizationID,
  Oft_OrganizationName,
  Oft_OrganizationPhone,
  Oft_OrganizationAddress,
  Oft_Description
) VALUES (
  0,
  'system-administrator',
  '408-123-4567',
  '1 GenericDatabase Road, San Jose, CA 95100',
  'system-administrator organization'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: Subject
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_S_Subject (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  S_EntryUpdatedTime                    TIMESTAMP                         NULL,
  S_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  S_SubjectID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  S_SubjectName                         VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  S_SubjectRealName                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  S_SubjectGender                       CHAR(1)                       NOT NULL,
  -- --------------------------------------------------------------------------
  S_SubjectFromInformation              VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  S_SubjectBirthInformation             VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- S_SubjectTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  -- S_SubjectPhone                     VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- S_SubjectAddress                   VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- S_SubjectStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  S_SubjectBiography                    TEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  S_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_S_Subject
  UNIQUE (
    S_SubjectID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_S_Subject
  PRIMARY KEY (
    S_SubjectName
  )-- ,
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_S_SubjectType
  -- FOREIGN KEY (
  --   S_SubjectTypeID
  -- ) REFERENCES ec_S_SubjectType(
  --   ST_SubjectTypeID
  -- ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_S_SubjectStatus
  -- FOREIGN KEY (
  --   S_SubjectStatusID
  -- ) REFERENCES ec_S_SubjectStatus(
  --   Ss_SubjectStatusID
  -- )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_S_SubjectID
  CHECK (S_SubjectID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_S_SubjectGender
  CHECK (S_SubjectGender IN ('M', 'F', ''))
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_S_SubjectTypeID
  -- CHECK (S_SubjectTypeID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_S_SubjectStatusID
  -- CHECK (S_SubjectStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_S_Subject(
  --   S_SubjectName,
  --   S_SubjectRealName,
  --   S_SubjectFromInformation,
  --   S_SubjectBirthInformation,
  --   -- S_SubjectPhone,
  --   -- S_SubjectAddress,
  --   S_SubjectBiography,
  --   S_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_S_Subject (
  S_SubjectID,
  S_SubjectName,
  S_SubjectRealName,
  S_SubjectGender,
  S_SubjectFromInformation,
  S_SubjectBirthInformation,
  -- S_SubjectTypeID,
  -- S_SubjectPhone,
  -- S_SubjectAddress,
  -- S_SubjectStatusID,
  S_SubjectBiography,
  S_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator',
  '',
  'Data Center',
  'When?',
  -- 0,
  -- '408-123-4567',
  -- '1 GenericDatabase Road, San Jose, CA 95100',
  -- 1,
  '',
  'system-administrator organization'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_S_SubjectFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Sft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Sft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Sft_SubjectID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Sft_SubjectName                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Sft_SubjectRealName                   VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Sft_SubjectFromInformation            VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Sft_SubjectBirthInformation           VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Sft_SubjectPhone                   VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Sft_SubjectAddress                 VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Sft_SubjectBiography                  TEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Sft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_S_SubjectFullText
  PRIMARY KEY (
    Sft_SubjectID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Sft_Subject
  FOREIGN KEY (
    Sft_SubjectID
  ) REFERENCES ec_S_Subject(
    S_SubjectID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Sft_SubjectID
  CHECK (Sft_SubjectID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_S_Subject(
    Sft_SubjectName,
    Sft_SubjectRealName,
    Sft_SubjectFromInformation,
    Sft_SubjectBirthInformation,
    -- Sft_SubjectPhone,
    -- Sft_SubjectAddress,
    Sft_SubjectBiography,
    Sft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_S_SubjectFullText (
  Sft_SubjectID,
  Sft_SubjectName,
  Sft_SubjectRealName,
  Sft_SubjectFromInformation,
  Sft_SubjectBirthInformation,
  -- Sft_SubjectPhone,
  -- Sft_SubjectAddress,
  Sft_SubjectBiography,
  Sft_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator',
  'Data Center',
  'When?',
  -- '408-123-4567',
  -- '1 GenericDatabase Road, San Jose, CA 95100',
  '',
  'system-administrator organization'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: Target
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_T_Target (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  T_EntryUpdatedTime                    TIMESTAMP                         NULL,
  T_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  T_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  T_TargetEmailAddress                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  T_TargetName                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  T_TargetPasswordHash                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetGender                     CHAR(1)                       NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetFromInformation            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetBirthInformation           VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetTypeID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetPhone                      VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetAddress                    VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- T_TargetStatusID                   BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  T_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_T_Target
  UNIQUE (
    T_TargetID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_T_Target
  PRIMARY KEY (
    T_TargetEmailAddress
  ) -- ,
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_T_TargetType
  -- FOREIGN KEY (
  --   T_TargetTypeID
  -- ) REFERENCES ec_T_TargetType(
  --   TT_TargetTypeID
  -- ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_T_TargetStatus
  -- FOREIGN KEY (
  --   T_TargetStatusID
  -- ) REFERENCES ec_T_TargetStatus(
  --   Ts_TargetStatusID
  -- )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_T_TargetID
  CHECK (T_TargetID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_T_TargetGender
  -- CHECK (T_TargetGender IN ('M', 'F', ''))
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_T_TargetTypeID
  -- CHECK (T_TargetTypeID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_T_TargetStatusID
  -- CHECK (T_TargetStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_T_Target(
  --   T_TargetEmailAddress,
  --   T_TargetName,
  --   -- T_TargetFromInformation,
  --   -- T_TargetBirthInformation,
  --   -- T_TargetPhone,
  --   -- T_TargetAddress,
  --   T_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_T_Target (
  T_TargetID,
  T_TargetEmailAddress,
  T_TargetName,
  T_TargetPasswordHash,
  -- T_TargetGender,
  -- T_TargetFromInformation,
  -- T_TargetBirthInformation,
  -- T_TargetTypeID,
  -- T_TargetPhone,
  -- T_TargetAddress,
  -- T_TargetStatusID,
  T_Description
) VALUES (
  0,
  'system-administrator@econtent.management.com',
  'system-administrator',
  '0',
  -- '',
  -- 'Data Center',
  -- 'When?',
  -- 0,
  -- '408-123-4567',
  -- '1 GenericDatabase Road, San Jose, CA 95100',
  -- 1,
  'system-administrator organization'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_T_TargetFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Tft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Tft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Tft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Tft_TargetEmailAddress                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Tft_TargetName                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Tft_TargetFromInformation          VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Tft_TargetBirthInformation         VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Tft_TargetPhone                    VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Tft_TargetAddress                  VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Tft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_T_TargetFullText
  PRIMARY KEY (
    Tft_TargetID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Tft_Target
  FOREIGN KEY (
    Tft_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Tft_TargetID
  CHECK (Tft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_T_Target(
    Tft_TargetEmailAddress,
    Tft_TargetName,
    -- Tft_TargetFromInformation,
    -- Tft_TargetBirthInformation,
    -- Tft_TargetPhone,
    -- Tft_TargetAddress,
    Tft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_T_TargetFullText (
  Tft_TargetID,
  Tft_TargetEmailAddress,
  Tft_TargetName,
  -- Tft_TargetFromInformation,
  -- Tft_TargetBirthInformation,
  -- Tft_TargetPhone,
  -- Tft_TargetAddress,
  Tft_Description
) VALUES (
  0,
  'system-administrator@econtent.management.com',
  'system-administrator',
  -- 'Data Center',
  -- 'When?',
  -- '408-123-4567',
  -- '1 GenericDatabase Road, San Jose, CA 95100',
  'system-administrator organization'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: Product
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_P_ProductType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  PT_EntryUpdatedTime                   TIMESTAMP                         NULL,
  PT_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  PT_ProductTypeID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  PT_ProductTypeName                    VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  PT_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_P_ProductType
  UNIQUE (
    PT_ProductTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_P_ProductType
  PRIMARY KEY (
    PT_ProductTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_PT_ProductTypeID
  CHECK (PT_ProductTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_PT_ProductType(
  ----   PT_ProductTypeName,
  ----   PT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator product type'
);
INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  1,
  'book',
  'a book'
);
INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  2,
  'picture',
  'a picture collection'
);
INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  3,
  'audio',
  'an audio product'
);
INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  4,
  'video',
  'a video product'
);
INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  5,
  'interactive',
  'an interactive product'
);
INSERT
INTO ec_P_ProductType (
  PT_ProductTypeID,
  PT_ProductTypeName,
  PT_Description
) VALUES (
  6,
  'presentation',
  'a presentation product'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_P_ProductStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Ps_EntryUpdatedTime                   TIMESTAMP                         NULL,
  Ps_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Ps_ProductStatusID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Ps_ProductStatusName                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Ps_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_P_ProductStatus
  UNIQUE (
    Ps_ProductStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_P_ProductStatus
  PRIMARY KEY (
    Ps_ProductStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Ps_ProductStatusID
  CHECK (Ps_ProductStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_P_ProductStatus(
  ----   Ps_ProductStatusName,
  ----   Ps_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator product status'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  1,
  'active',
  'Product is in active mode.'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  2,
  'suspended',
  'Product is in suspended mode.'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  3,
  'limited',
  'Product is in limited mode.'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  4,
  'inactive',
  'Product is in inactive mode.'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  5,
  'pending',
  'Product has not been published yet.'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  6,
  'incomplete',
  'Product is incomplete.'
);

INSERT
INTO ec_P_ProductStatus (
  Ps_ProductStatusID,
  Ps_ProductStatusName,
  Ps_Description
) VALUES (
  7,
  'pending removal',
  'Product is pending for removal.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_P_Product (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  P_EntryUpdatedTime                    TIMESTAMP                         NULL,
  P_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  P_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductTypeID                       BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  P_OrganizationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductStandardCode                 VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  P_ProductReference                    VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  P_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_P_Product
  UNIQUE (
    P_ProductID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_P_Product
  PRIMARY KEY (
    P_OrganizationID,
    P_ProductTitle,
    P_ProductEdition,
    P_ProductStandardCode
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_P_ProductStandardCode
  UNIQUE (
    P_ProductStandardCode,
    P_ProductTitle,
    P_ProductEdition,
    P_OrganizationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_P_ProductTitle
  UNIQUE (
    P_ProductTitle,
    P_ProductStandardCode,
    P_OrganizationID,
    P_ProductEdition
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_P_ProductType
  FOREIGN KEY (
    P_ProductTypeID
  ) REFERENCES ec_P_ProductType(
    PT_ProductTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_P_Organization
  FOREIGN KEY (
    P_OrganizationID
  ) REFERENCES ec_O_Organization(
    O_OrganizationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_P_ProductStatus
  FOREIGN KEY (
    P_ProductStatusID
  ) REFERENCES ec_P_ProductStatus(
    Ps_ProductStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_P_ProductID
  CHECK (P_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_P_ProductTypeID
  CHECK (P_ProductTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_P_OrganizationID
  CHECK (P_OrganizationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_P_ProductStatusID
  CHECK (P_ProductStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_P_Product(
  --   P_ProductTitle,
  --   P_ProductPublishDate,
  --   P_ProductStandardCode,
  --   P_ProductReference,
  --   P_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_P_Product (
  P_ProductID,
  P_ProductTitle,
  P_ProductTypeID,
  P_OrganizationID,
  P_ProductEdition,
  P_ProductStandardCode,
  P_ProductPublishDate,
  P_ProductBasePricing,
  P_ProductStatusID,
  P_ProductReference,
  P_Description
) VALUES (
  0,
  'system-administrator',
  0,
  0,
  1,
  'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator product reference',
  'system-administrator product'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_P_ProductFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Pft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Pft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Pft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_ProductTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_OrganizationID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_ProductEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_ProductStandardCode               VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_ProductPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_ProductReference                  VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Pft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_P_ProductFullText
  UNIQUE (
    Pft_ProductID
  ),
  -- --------------------------------------------------------------------------
  ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_P_ProductFullText
  -- PRIMARY KEY (
  --   Pft_OrganizationID,
  --   Pft_ProductTitle,
  --   Pft_ProductEdition,
  --   Pft_ProductStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Pft_Product
  FOREIGN KEY (
    Pft_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Pft_ProductUnique
  -- FOREIGN KEY (
  --   Pft_OrganizationID,
  --   Pft_ProductTitle,
  --   Pft_ProductEdition,
  --   Pft_ProductStandardCode
  -- ) REFERENCES ec_P_Product(
  --   P_OrganizationID,
  --   P_ProductTitle,
  --   P_ProductEdition,
  --   P_ProductStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Pft_ProductID
  CHECK (Pft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Pft_OrganizationID
  CHECK (Pft_OrganizationID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_P_Product(
    Pft_ProductTitle,
    Pft_ProductStandardCode,
    Pft_ProductPublishDate,
    Pft_ProductReference,
    Pft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_P_ProductFullText (
  Pft_ProductID,
  Pft_ProductTitle,
  Pft_OrganizationID,
  Pft_ProductEdition,
  Pft_ProductStandardCode,
  Pft_ProductPublishDate,
  Pft_ProductReference,
  Pft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator product reference',
  'system-administrator product'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: SubjectProduct
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_SP_SubjectProduct (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  SP_EntryUpdatedTime                   TIMESTAMP                         NULL,
  SP_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  SP_SubjectID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  SP_ProductID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  SP_Order                              BIGINT DEFAULT 1              NOT NULL,
  -- --------------------------------------------------------------------------
  SP_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_SP_SubjectProduct
  PRIMARY KEY (
    SP_SubjectID,
    SP_ProductID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_SP_ProductSubject
  UNIQUE KEY (
    SP_ProductID,
    SP_SubjectID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_SP_Subject
  FOREIGN KEY (
    SP_SubjectID
  ) REFERENCES ec_S_Subject(
    S_SubjectID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_SP_Product
  FOREIGN KEY (
    SP_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_SP_SubjectID
  CHECK (SP_SubjectID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_SP_ProductID
  CHECK (SP_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_SP_SubjectProduct(
  --   SP_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_SP_SubjectProduct (
  SP_SubjectID,
  SP_ProductID,
  SP_Order,
  SP_Description
) VALUES (
  0,
  0,
  0,
  'system-administrator subject-product'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: TargetProduct
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_TP_TargetProductType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  TPT_EntryUpdatedTime                  TIMESTAMP                         NULL,
  TPT_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  TPT_TargetProductTypeID               BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  TPT_TargetProductTypeName             VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  TPT_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_TP_TargetProductType
  UNIQUE (
    TPT_TargetProductTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_TP_TargetProductType
  PRIMARY KEY (
    TPT_TargetProductTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_TPT_TargetProductTypeID
  CHECK (TPT_TargetProductTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_TPT_TargetProductType(
  ----   TPT_TargetProductTypeName,
  ----   TPT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_TP_TargetProductType (
  TPT_TargetProductTypeID,
  TPT_TargetProductTypeName,
  TPT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator product-content type'
);
INSERT
INTO ec_TP_TargetProductType (
  TPT_TargetProductTypeID,
  TPT_TargetProductTypeName,
  TPT_Description
) VALUES (
  1,
  'purchased',
  'a target has purchased a product'
);
INSERT
INTO ec_TP_TargetProductType (
  TPT_TargetProductTypeID,
  TPT_TargetProductTypeName,
  TPT_Description
) VALUES (
  2,
  'wishlist',
  'a target has put a product in a wishlist'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_TP_TargetProductStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  TPs_EntryUpdatedTime                  TIMESTAMP                         NULL,
  TPs_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  TPs_TargetProductStatusID             BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  TPs_TargetProductStatusName           VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  TPs_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_TP_TargetProductStatus
  UNIQUE (
    TPs_TargetProductStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_TP_TargetProductStatus
  PRIMARY KEY (
    TPs_TargetProductStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_TPs_TargetProductStatusID
  CHECK (TPs_TargetProductStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_TP_TargetProductStatus(
  ----   TPs_TargetProductStatusName,
  ----   TPs_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_TP_TargetProductStatus (
  TPs_TargetProductStatusID,
  TPs_TargetProductStatusName,
  TPs_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator product-content status'
);

INSERT
INTO ec_TP_TargetProductStatus (
  TPs_TargetProductStatusID,
  TPs_TargetProductStatusName,
  TPs_Description
) VALUES (
  1,
  'active',
  'TargetProduct is in active mode.'
);

INSERT
INTO ec_TP_TargetProductStatus (
  TPs_TargetProductStatusID,
  TPs_TargetProductStatusName,
  TPs_Description
) VALUES (
  2,
  'suspended',
  'TargetProduct is in suspended mode.'
);

INSERT
INTO ec_TP_TargetProductStatus (
  TPs_TargetProductStatusID,
  TPs_TargetProductStatusName,
  TPs_Description
) VALUES (
  3,
  'limited',
  'TargetProduct is in limited mode.'
);

INSERT
INTO ec_TP_TargetProductStatus (
  TPs_TargetProductStatusID,
  TPs_TargetProductStatusName,
  TPs_Description
) VALUES (
  4,
  'inactive',
  'TargetProduct is in inactive mode.'
);

INSERT
INTO ec_TP_TargetProductStatus (
  TPs_TargetProductStatusID,
  TPs_TargetProductStatusName,
  TPs_Description
) VALUES (
  5,
  'pending',
  'TargetProduct has not been published yet.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_TP_TargetProduct (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  TP_EntryUpdatedTime                   TIMESTAMP                         NULL,
  TP_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  TP_TargetID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  TP_ProductID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  TP_TargetProductTypeID                BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  TP_TargetProductStatusID              BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  TP_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_TP_TargetProduct
  PRIMARY KEY (
    TP_TargetID,
    TP_ProductID,
    TP_TargetProductTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_TP_TargetProduct
  UNIQUE KEY (
    TP_ProductID,
    TP_TargetID,
    TP_TargetProductTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_TP_Target
  FOREIGN KEY (
    TP_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_TP_Product
  FOREIGN KEY (
    TP_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_TP_TargetProductType
  FOREIGN KEY (
    TP_TargetProductTypeID
  ) REFERENCES ec_TP_TargetProductType(
    TPT_TargetProductTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_TP_TargetProductStatus
  FOREIGN KEY (
    TP_TargetProductStatusID
  ) REFERENCES ec_TP_TargetProductStatus(
    TPs_TargetProductStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_TP_TargetID
  CHECK (TP_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_TP_ProductID
  CHECK (TP_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_TP_TargetProductTypeID
  CHECK (TP_TargetProductTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_TP_TargetProductStatusID
  CHECK (TP_TargetProductStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_TP_TargetProduct(
  --   TP_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_TP_TargetProduct (
  TP_TargetID,
  TP_ProductID,
  TP_TargetProductTypeID,
  TP_TargetProductStatusID,
  TP_Description
) VALUES (
  0,
  0,
  0,
  0,
  'system-administrator taget-product'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: Content
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  CT_EntryUpdatedTime                   TIMESTAMP                         NULL,
  CT_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  CT_ContentTypeID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  CT_ContentTypeName                    VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  CT_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentType
  UNIQUE (
    CT_ContentTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentType
  PRIMARY KEY (
    CT_ContentTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_CT_ContentTypeID
  CHECK (CT_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_CT_ContentType(
  ----   CT_ContentTypeName,
  ----   CT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator content type'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  1,
  'text',
  'text'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  2,
  'tiny-text',
  'tiny-text'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  3,
  'medium-text',
  'medium-text'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  4,
  'long-text',
  'long-text'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  5,
  'blob',
  'blob'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  6,
  'tiny-blob',
  'tiny-blob'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  7,
  'medium-blob',
  'medium-blob'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  8,
  'long-blob',
  'long-blob'
);
INSERT
INTO ec_C_ContentType (
  CT_ContentTypeID,
  CT_ContentTypeName,
  CT_Description
) VALUES (
  9,
  'external-file',
  'external-file'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cs_EntryUpdatedTime                   TIMESTAMP                         NULL,
  Cs_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cs_ContentStatusID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cs_ContentStatusName                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cs_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentStatus
  UNIQUE (
    Cs_ContentStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentStatus
  PRIMARY KEY (
    Cs_ContentStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cs_ContentStatusID
  CHECK (Cs_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_C_ContentStatus(
  ----   Cs_ContentStatusName,
  ----   Cs_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator content status'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  1,
  'active',
  'Content is in active mode.'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  2,
  'suspended',
  'Content is in suspended mode.'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  3,
  'limited',
  'Content is in limited mode.'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  4,
  'inactive',
  'Content is in inactive mode.'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  5,
  'pending',
  'Content has not been published yet.'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  6,
  'incomplete',
  'Content is incomplete.'
);

INSERT
INTO ec_C_ContentStatus (
  Cs_ContentStatusID,
  Cs_ContentStatusName,
  Cs_Description
) VALUES (
  7,
  'pending removal',
  'Content is pending for removal.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentText                         TEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'text/text'           NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentText
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentText
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeText
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductText
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusText
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDText
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDText
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDText
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDText
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentText(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   C_ContentText,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentText (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentText,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content text',
  'text/text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentText                       TEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentTextFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentTextFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentText
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentTextUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentText(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDTextFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDTextFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentText(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentText,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentTextFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentText,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentTinyText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTinyText                     TINYTEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'text/text'           NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentTinyText
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentTinyText
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeTinyText
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductTinyText
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusTinyText
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDTinyText
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDTinyText
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDTinyText
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDTinyText
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentTinyText(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   C_ContentTinyText,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentTinyText (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentTinyText,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content text',
  'text/text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentTinyTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTinyText                   TINYTEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentTinyTextFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentTinyTextFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentTinyText
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentTinyText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentTinyTextUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentTinyText(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDTinyTextFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDTinyTextFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentTinyText(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentTinyText,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentTinyTextFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentTinyText,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentMediumText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMediumText                   MEDIUMTEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'text/text'           NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentMediumText
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentMediumText
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeMediumText
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductMediumText
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusMediumText
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDMediumText
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDMediumText
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDMediumText
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDMediumText
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentMediumText(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   C_ContentMediumText,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentMediumText (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentMediumText,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content text',
  'text/text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentMediumTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentMediumText                 MEDIUMTEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentMediumTextFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentMediumTextFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentMediumText
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentMediumText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentMediumTextUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentMediumText(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDMediumTextFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDMediumTextFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentMediumText(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentMediumText,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentMediumTextFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentMediumText,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentLongText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentLongText                     LONGTEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'text/text'           NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentLongText
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentLongText
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeLongText
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductLongText
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusLongText
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDLongText
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDLongText
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDLongText
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentStatusIDLongText
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentLongText(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   C_ContentLongText,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentLongText (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentLongText,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content text',
  'text/text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentLongTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentLongText                   LONGTEXT
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentLongTextFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentLongTextFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentLongText
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentLongText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentLongTextUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentLongText(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDLongTextFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDLongTextFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentLongText(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentLongText,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentLongTextFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentLongText,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content text',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBlob                         BLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'application/octet-stream'
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentBlob
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentBlob
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeBlob
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductBlob
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusBlob
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDBlob
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDBlob
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDBlob
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDBlob
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentBlob(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   -- C_ContentBlob,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentBlob (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentBlob,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content blob',
  'application/octet-stream',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentBlob                       BLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentBlobFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentBlobFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentBlob
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentBlobUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentBlob(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDBlobFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDBlobFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentBlob(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    -- Cft_ContentBlob,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentBlobFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentBlob,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content blob',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentTinyBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTinyBlob                     TINYBLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'application/octet-stream'
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentTinyBlob
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentTinyBlob
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeTinyBlob
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductTinyBlob
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusTinyBlob
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDTinyBlob
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDTinyBlob
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDTinyBlob
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDTinyBlob
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentTinyBlob(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   -- C_ContentTinyBlob,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentTinyBlob (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentTinyBlob,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content blob',
  'application/octet-stream',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentTinyBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTinyBlob                   TINYBLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentTinyBlobFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentTinyBlobFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentTinyBlob
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_Cft_ContentTinyBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentTinyBlobUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentTinyBlob(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDTinyBlobFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDTinyBlobFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentTinyBlob(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    -- Cft_ContentTinyBlob,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentTinyBlobFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentTinyBlob,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content blob',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentMediumBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMediumBlob                   MEDIUMBLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'application/octet-stream'
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentMediumBlob
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentMediumBlob
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeMediumBlob
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductMediumBlob
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusMediumBlob
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDMediumBlob
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDMediumBlob
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDMediumBlob
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDMediumBlob
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentMediumBlob(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   -- C_ContentMediumBlob,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentMediumBlob (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentMediumBlob,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content blob',
  'application/octet-stream',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentMediumBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentMediumBlob                 MEDIUMBLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentMediumBlobFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentMediumBlobFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentMediumBlob
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentMediumBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentMediumBlobUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentMediumBlob(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDMediumBlobFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDMediumBlobFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentMediumBlob(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    -- Cft_ContentMediumBlob,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentMediumBlobFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentMediumBlob,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content blob',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentLongBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentLongBlob                     LONGBLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'application/octet-stream'
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentLongBlob
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentLongBlob
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeLongBlob
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductLongBlob
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusLongBlob
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDLongBlob
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDLongBlob
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDLongBlob
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDLongBlob
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentLongBlob(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   -- C_ContentLongBlob,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentLongBlob (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentLongBlob,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator content blob',
  'application/octet-stream',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentLongBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentLongBlob                   LONGBLOB
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentLongBlobFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentLongBlobFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentLongBlob
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentLongBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentLongBlobUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentLongBlob(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDLongBlobFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDLongBlobFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentLongBlob(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    -- Cft_ContentLongBlob,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentLongBlobFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentLongBlob,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  'system-administrator content blob',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentExternalFile (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  C_EntryUpdatedTime                    TIMESTAMP                         NULL,
  C_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  C_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentTitle                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentEdition                      SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- C_ContentStandardCode              VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentPublishDate                  DATE                          NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentBasePricing                  NUMERIC(12,2)                 NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentStatusID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentExternalFile                 VARCHAR(255)
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_ContentMIMEsetting                  VARCHAR(255)
                                        DEFAULT 'application/octet-stream'
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  C_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentExternalFile
  UNIQUE (
    C_ContentID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_C_ContentExternalFile
  PRIMARY KEY (
    C_ContentTitle,
    C_ProductID,
    C_ContentEdition -- ,
    -- C_ContentStandardCode
  ),
  -- --------------------------------------------------------------------------
  -- CONSTRAINT fk_ec_C_ContentTypeExternalFile
  -- FOREIGN KEY (
  --   C_ContentTypeID
  -- ) REFERENCES ec_C_ContentType(
  --   CT_ContentTypeID
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ProductExternalFile
  FOREIGN KEY (
    C_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_C_ContentStatusExternalFile
  FOREIGN KEY (
    C_ContentStatusID
  ) REFERENCES ec_C_ContentStatus(
    Cs_ContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentIDExternalFile
  CHECK (C_ContentID >= 0)
  -- --------------------------------------------------------------------------
  -- ,
  -- CONSTRAINT ck_ec_C_ContentTypeIDExternalFile
  -- CHECK (C_ContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ProductIDExternalFile
  CHECK (C_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_C_ContentStatusIDExternalFile
  CHECK (C_ContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_C_ContentExternalFile(
  --   C_ContentTitle,
  --   C_ContentPublishDate,
  --   -- C_ContentStandardCode,
  --   -- C_ContentExternalFile,
  --   C_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentExternalFile (
  C_ContentID,
  C_ContentTitle,
  -- C_ContentTypeID,
  C_ProductID,
  C_ContentEdition,
  -- C_ContentStandardCode,
  C_ContentPublishDate,
  C_ContentBasePricing,
  C_ContentStatusID,
  C_ContentExternalFile,
  C_ContentMIMEsetting,
  C_Description
) VALUES (
  0,
  'system-administrator',
  -- 0,
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  '\temp\external-file.txt',
  'application/octet-stream',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_C_ContentExternalFileFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Cft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Cft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentTitle                      VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentEdition                    SMALLINT DEFAULT 1            NOT NULL,
  -- --------------------------------------------------------------------------
  -- Cft_ContentStandardCode            VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentPublishDate                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_ContentExternalFile               VARCHAR(255)
                                                                      NOT NULL,
  -- --------------------------------------------------------------------------
  Cft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_C_ContentExternalFileFullText
  UNIQUE (
    Cft_ContentID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_C_ContentExternalFileFullText
  -- PRIMARY KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Cft_ContentExternalFile
  FOREIGN KEY (
    Cft_ContentID
  ) REFERENCES ec_C_ContentExternalFile(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Cft_ContentExternalFileUnique
  -- FOREIGN KEY (
  --   Cft_ContentTitle,
  --   Cft_ProductID,
  --   Cft_ContentEdition -- ,
  --   -- Cft_ContentStandardCode
  -- ) REFERENCES ec_C_ContentExternalFile(
  --   C_ContentTitle,
  --   C_ProductID,
  --   C_ContentEdition -- ,
  --   -- C_ContentStandardCode
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ContentIDExternalFileFullText
  CHECK (Cft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Cft_ProductIDExternalFileFullText
  CHECK (Cft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_C_ContentExternalFile(
    Cft_ContentTitle,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentExternalFile,
    Cft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_C_ContentExternalFileFullText (
  Cft_ContentID,
  Cft_ContentTitle,
  Cft_ProductID,
  Cft_ContentEdition,
  -- Cft_ContentStandardCode,
  Cft_ContentPublishDate,
  Cft_ContentExternalFile,
  Cft_Description
) VALUES (
  0,
  'system-administrator',
  0,
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '\temp\external-file.txt',
  'system-administrator content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: ProductContent
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_PC_ProductContentType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  PCT_EntryUpdatedTime                  TIMESTAMP                         NULL,
  PCT_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  PCT_ProductContentTypeID              BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  PCT_ProductContentTypeName            VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  PCT_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentType
  UNIQUE (
    PCT_ProductContentTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_PC_ProductContentType
  PRIMARY KEY (
    PCT_ProductContentTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_PCT_ProductContentTypeID
  CHECK (PCT_ProductContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_PCT_ProductContentType(
  ----   PCT_ProductContentTypeName,
  ----   PCT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_PC_ProductContentType (
  PCT_ProductContentTypeID,
  PCT_ProductContentTypeName,
  PCT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator product-content type'
);
INSERT
INTO ec_PC_ProductContentType (
  PCT_ProductContentTypeID,
  PCT_ProductContentTypeName,
  PCT_Description
) VALUES (
  1,
  'complete',
  'a complete product and its content set'
);
INSERT
INTO ec_PC_ProductContentType (
  PCT_ProductContentTypeID,
  PCT_ProductContentTypeName,
  PCT_Description
) VALUES (
  2,
  'complete-smartphone',
  'a complete product, but limited content for smartphone viewing'
);
INSERT
INTO ec_PC_ProductContentType (
  PCT_ProductContentTypeID,
  PCT_ProductContentTypeName,
  PCT_Description
) VALUES (
  3,
  'preview',
  'a partial product with a selected set of contents for free preview'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_PC_ProductContentStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  PCs_EntryUpdatedTime                  TIMESTAMP                         NULL,
  PCs_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  PCs_ProductContentStatusID            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  PCs_ProductContentStatusName          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  PCs_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentStatus
  UNIQUE (
    PCs_ProductContentStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_PC_ProductContentStatus
  PRIMARY KEY (
    PCs_ProductContentStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_PCs_ProductContentStatusID
  CHECK (PCs_ProductContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_PC_ProductContentStatus(
  ----   PCs_ProductContentStatusName,
  ----   PCs_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator product-content status'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  1,
  'active',
  'ProductContent is in active mode.'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  2,
  'suspended',
  'ProductContent is in suspended mode.'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  3,
  'limited',
  'ProductContent is in limited mode.'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  4,
  'inactive',
  'ProductContent is in inactive mode.'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  5,
  'pending',
  'ProductContent has not been published yet.'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  6,
  'incomplete',
  'ProductContent is incomplete.'
);

INSERT
INTO ec_PC_ProductContentStatus (
  PCs_ProductContentStatusID,
  PCs_ProductContentStatusName,
  PCs_Description
) VALUES (
  7,
  'pending removal',
  'ProductContent is pending for removal.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_PC_ProductContent (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  PC_EntryUpdatedTime                   TIMESTAMP                         NULL,
  PC_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  PC_ProductID                          BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_PresentationOrder                  BIGINT DEFAULT 1              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ProductContentTypeID               BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ProductContentStatusID             BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentTextID                      BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentTinyTextID                  BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentMediumTextID                BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentLongTextID                  BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentBlobID                      BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentTinyBlobID                  BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentMediumBlobID                BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentLongBlobID                  BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_ContentExternalFileID              BIGINT DEFAULT 0              NOT NULL,
  -- --------------------------------------------------------------------------
  PC_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_PC_ProductContent
  PRIMARY KEY (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentTextID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentTinyText
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentTinyTextID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentMediumText
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentMediumTextID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentLongText
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentLongTextID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentBlob
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentBlobID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentTinyBlob
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentTinyBlobID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentMediumBlob
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentMediumBlobID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentLongBlob
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentLongBlobID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_PC_ProductContentExternalFile
  UNIQUE (
    PC_ProductID,
    -- ----PC_ProductContentTypeID,
    PC_PresentationOrder,
    PC_ContentExternalFileID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_Product
  FOREIGN KEY (
    PC_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ProductContentType
  FOREIGN KEY (
    PC_ProductContentTypeID
  ) REFERENCES ec_PC_ProductContentType(
    PCT_ProductContentTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ProductContentStatus
  FOREIGN KEY (
    PC_ProductContentStatusID
  ) REFERENCES ec_PC_ProductContentStatus(
    PCs_ProductContentStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_PC_ProductID
  CHECK (PC_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_PC_ProductContentTypeID
  CHECK (PC_ProductContentTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_PC_ProductContentStatusID
  CHECK (PC_ProductContentStatusID >= 0)
  -- --------------------------------------------------------------------------
  ,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentText
  FOREIGN KEY (
    PC_ContentTextID
  ) REFERENCES ec_C_ContentText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentTinyText
  FOREIGN KEY (
    PC_ContentTinyTextID
  ) REFERENCES ec_C_ContentTinyText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentMediumText
  FOREIGN KEY (
    PC_ContentMediumTextID
  ) REFERENCES ec_C_ContentMediumText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentLongText
  FOREIGN KEY (
    PC_ContentLongTextID
  ) REFERENCES ec_C_ContentLongText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentBlob
  FOREIGN KEY (
    PC_ContentBlobID
  ) REFERENCES ec_C_ContentBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentTinyBlob
  FOREIGN KEY (
    PC_ContentTinyBlobID
  ) REFERENCES ec_C_ContentTinyBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentMediumBlob
  FOREIGN KEY (
    PC_ContentMediumBlobID
  ) REFERENCES ec_C_ContentMediumBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentLongBlob
  FOREIGN KEY (
    PC_ContentLongBlobID
  ) REFERENCES ec_C_ContentLongBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_PC_ContentExternalFile
  FOREIGN KEY (
    PC_ContentExternalFileID
  ) REFERENCES ec_C_ContentExternalFile(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  -- --------------------------------------------------------------------------
  CONSTRAINT ck_ec_PC_ProductContent
  CHECK (
    ((PC_ContentTextID > 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID > 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID > 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID > 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID > 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID > 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID > 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID > 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID > 0)
    )
    OR
    ((PC_ContentTextID = 0)
     AND
     (PC_ContentTinyTextID = 0)
     AND
     (PC_ContentMediumTextID = 0)
     AND
     (PC_ContentLongTextID = 0)
     AND
     (PC_ContentBlobID = 0)
     AND
     (PC_ContentTinyBlobID = 0)
     AND
     (PC_ContentMediumBlobID = 0)
     AND
     (PC_ContentLongBlobID = 0)
     AND
     (PC_ContentExternalFileID = 0)
    )
  )
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_PC_ProductContent(
  --   PC_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print
INSERT
INTO ec_PC_ProductContent (
  PC_ProductID,
  PC_PresentationOrder,
  PC_ProductContentTypeID,
  PC_ProductContentStatusID,
  PC_ContentTextID,
  PC_ContentTinyTextID,
  PC_ContentMediumTextID,
  PC_ContentLongTextID,
  PC_ContentBlobID,
  PC_ContentTinyBlobID,
  PC_ContentMediumBlobID,
  PC_ContentLongBlobID,
  PC_ContentExternalFileID,
  PC_Description
) VALUES (
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  'system-administrator product-content'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: Annotation
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  AT_EntryUpdatedTime                   TIMESTAMP                         NULL,
  AT_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  AT_AnnotationTypeID                   BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  AT_AnnotationTypeName                 VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  AT_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationType
  UNIQUE (
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationType
  PRIMARY KEY (
    AT_AnnotationTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_AT_AnnotationTypeID
  CHECK (AT_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_AT_AnnotationType(
  ----   AT_AnnotationTypeName,
  ----   AT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationType (
  AT_AnnotationTypeID,
  AT_AnnotationTypeName,
  AT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator annotation type'
);
INSERT
INTO ec_A_AnnotationType (
  AT_AnnotationTypeID,
  AT_AnnotationTypeName,
  AT_Description
) VALUES (
  1,
  'category',
  'category'
);
INSERT
INTO ec_A_AnnotationType (
  AT_AnnotationTypeID,
  AT_AnnotationTypeName,
  AT_Description
) VALUES (
  2,
  'user-annotation',
  'user-annotation'
);
INSERT
INTO ec_A_AnnotationType (
  AT_AnnotationTypeID,
  AT_AnnotationTypeName,
  AT_Description
) VALUES (
  3,
  'system-annotation',
  'system-annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  As_EntryUpdatedTime                   TIMESTAMP                         NULL,
  As_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  As_AnnotationStatusID                 BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  As_AnnotationStatusName               VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  As_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationStatus
  UNIQUE (
    As_AnnotationStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationStatus
  PRIMARY KEY (
    As_AnnotationStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_As_AnnotationStatusID
  CHECK (As_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_A_AnnotationStatus(
  ----   As_AnnotationStatusName,
  ----   As_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator annotation status'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  1,
  'active',
  'Annotation is in active mode.'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  2,
  'suspended',
  'Annotation is in suspended mode.'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  3,
  'limited',
  'Annotation is in limited mode.'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  4,
  'inactive',
  'Annotation is in inactive mode.'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  5,
  'pending',
  'Annotation has not been published yet.'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  6,
  'incomplete',
  'Annotation is incomplete.'
);

INSERT
INTO ec_A_AnnotationStatus (
  As_AnnotationStatusID,
  As_AnnotationStatusName,
  As_Description
) VALUES (
  7,
  'pending removal',
  'Annotation is pending for removal.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_Annotation (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ProductID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_Annotation
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_Annotation
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ProductID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationType
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_Target
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_Product
  FOREIGN KEY (
    A_ProductID
  ) REFERENCES ec_P_Product(
    P_ProductID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatus
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationID
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeID
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetID
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ProductID
  CHECK (A_ProductID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusID
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_Annotation(
  --   A_Annotation,
  --   A_AnnotationPublishDate,
  --   -- A_AnnotationStandardCode,
  --   A_AnnotationText,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_Annotation (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ProductID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ProductID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ProductID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_Annotation
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_Annotation(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ProductID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_Annotation(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ProductID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ProductIDFullText
  CHECK (Aft_ProductID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_Annotation(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ProductID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationText
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationText
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeText
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetText
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductText
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusText
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDText
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDText
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDText
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDText
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDText
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationText(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationText (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationTextFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationTextFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationText
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationText(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationTextUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationText(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDTextFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDTextFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDTextFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDTextFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationText(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationTextFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationTinyText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationTinyText
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationTinyText
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeTinyText
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetTinyText
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductTinyText
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentTinyText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusTinyText
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDTinyText
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDTinyText
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDTinyText
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDTinyText
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDTinyText
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationTinyText(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationTinyText (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationTinyTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationTinyTextFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationTinyTextFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationTinyText
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationTinyText(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationTinyTextUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationTinyText(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDTinyTextFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDTinyTextFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDTinyTextFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDTinyTextFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationTinyText(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationTinyTextFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationMediumText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationMediumText
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationMediumText
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeMediumText
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetMediumText
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductMediumText
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentMediumText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusMediumText
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDMediumText
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDMediumText
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDMediumText
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDMediumText
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDMediumText
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationMediumText(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationMediumText (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationMediumTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationMediumTextFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationMediumTextFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationMediumText
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationMediumText(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationMediumTextUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationMediumText(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDMediumTextFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDMediumTextFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDMediumTextFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDMediumTextFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationMediumText(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationMediumTextFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationLongText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationLongText
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationLongText
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeLongText
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetLongText
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductLongText
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentLongText(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusLongText
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDLongText
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDLongText
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDLongText
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDLongText
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationStatusIDLongText
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationLongText(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationLongText (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationLongTextFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationLongTextFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationLongTextFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationLongText
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationLongText(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationLongTextUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationLongText(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDLongTextFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDLongTextFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDLongTextFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDLongTextFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationLongText(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationLongTextFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationBlob
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationBlob
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeBlob
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetBlob
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductBlob
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusBlob
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDBlob
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDBlob
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDBlob
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDBlob
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDBlob
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationBlob(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationBlob (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationBlobFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationBlobFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationBlob
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationBlob(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationBlobUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationBlob(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDBlobFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDBlobFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDBlobFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDBlobFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationBlob(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationBlobFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationTinyBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationTinyBlob
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationTinyBlob
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeTinyBlob
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetTinyBlob
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductTinyBlob
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentTinyBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusTinyBlob
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDTinyBlob
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDTinyBlob
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDTinyBlob
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDTinyBlob
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDTinyBlob
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationTinyBlob(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationTinyBlob (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationTinyBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationTinyBlobFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationTinyBlobFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationTinyBlob
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_Aft_AnnotationTinyBlob(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationTinyBlobUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationTinyBlob(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDTinyBlobFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDTinyBlobFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDTinyBlobFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDTinyBlobFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationTinyBlob(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationTinyBlobFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationMediumBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationMediumBlob
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationMediumBlob
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeMediumBlob
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetMediumBlob
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductMediumBlob
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentMediumBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusMediumBlob
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDMediumBlob
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDMediumBlob
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDMediumBlob
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDMediumBlob
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDMediumBlob
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationMediumBlob(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationMediumBlob (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationMediumBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationMediumBlobFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationMediumBlobFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationMediumBlob
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationMediumBlob(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationMediumBlobUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationMediumBlob(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDMediumBlobFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDMediumBlobFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDMediumBlobFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDMediumBlobFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationMediumBlob(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationMediumBlobFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationLongBlob (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationLongBlob
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationLongBlob
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeLongBlob
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetLongBlob
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductLongBlob
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentLongBlob(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusLongBlob
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDLongBlob
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDLongBlob
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDLongBlob
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDLongBlob
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDLongBlob
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationLongBlob(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationLongBlob (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationLongBlobFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationLongBlobFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationLongBlobFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationLongBlob
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationLongBlob(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationLongBlobUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationLongBlob(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDLongBlobFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDLongBlobFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDLongBlobFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDLongBlobFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationLongBlob(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationLongBlobFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationExternalFile (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  A_EntryUpdatedTime                    TIMESTAMP                         NULL,
  A_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationKey                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_Annotation                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationTypeID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_TargetID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_ContentID                           BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_AnnotationStatusID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  A_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationExternalFile
  UNIQUE (
    A_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_A_AnnotationExternalFile
  PRIMARY KEY (
    A_TargetID,
    A_AnnotationTypeID,
    A_ContentID,
    A_AnnotationKey,
    A_Annotation
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationTypeExternalFile
  FOREIGN KEY (
    A_AnnotationTypeID
  ) REFERENCES ec_A_AnnotationType(
    AT_AnnotationTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_TargetExternalFile
  FOREIGN KEY (
    A_TargetID
  ) REFERENCES ec_T_Target(
    T_TargetID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_ProductExternalFile
  FOREIGN KEY (
    A_ContentID
  ) REFERENCES ec_C_ContentExternalFile(
    C_ContentID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_A_AnnotationStatusExternalFile
  FOREIGN KEY (
    A_AnnotationStatusID
  ) REFERENCES ec_A_AnnotationStatus(
    As_AnnotationStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationIDExternalFile
  CHECK (A_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationTypeIDExternalFile
  CHECK (A_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_TargetIDExternalFile
  CHECK (A_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_ContentIDExternalFile
  CHECK (A_ContentID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_A_AnnotationStatusIDExternalFile
  CHECK (A_AnnotationStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_A_AnnotationExternalFile(
  --   A_Annotation,
  --   A_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationExternalFile (
  A_AnnotationID,
  A_AnnotationKey,
  A_Annotation,
  A_AnnotationTypeID,
  A_TargetID,
  A_ContentID,
  A_AnnotationStatusID,
  A_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_A_AnnotationExternalFileFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Aft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Aft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationKey                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Annotation                        VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_AnnotationTypeID                  BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_TargetID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_ContentID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Aft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_A_AnnotationExternalFileFullText
  UNIQUE (
    Aft_AnnotationID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_A_AnnotationExternalFileFullText
  -- PRIMARY KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_AnnotationKey,
  --   Aft_Annotation
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Aft_AnnotationExternalFile
  FOREIGN KEY (
    Aft_AnnotationID
  ) REFERENCES ec_A_AnnotationExternalFile(
    A_AnnotationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Aft_AnnotationExternalFileUnique
  -- FOREIGN KEY (
  --   Aft_TargetID,
  --   Aft_AnnotationTypeID,
  --   Aft_ContentID,
  --   Aft_Annotation
  -- ) REFERENCES ec_A_AnnotationExternalFile(
  --   A_TargetID,
  --   A_AnnotationTypeID,
  --   A_ContentID,
  --   A_Annotation
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationIDExternalFileFullText
  CHECK (Aft_AnnotationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_AnnotationTypeIDExternalFileFullText
  CHECK (Aft_AnnotationTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_TargetIDExternalFileFullText
  CHECK (Aft_TargetID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Aft_ContentIDExternalFileFullText
  CHECK (Aft_ContentID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_A_AnnotationExternalFile(
    Aft_Annotation,
    Aft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_A_AnnotationExternalFileFullText (
  Aft_AnnotationID,
  Aft_AnnotationKey,
  Aft_Annotation,
  Aft_AnnotationTypeID,
  Aft_TargetID,
  Aft_ContentID,
  Aft_Description
) VALUES (
  0,
  'system',
  'system-administrator',
  0,
  0,
  0,
  'system-administrator annotation'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Subschema: User
===============================================================================
*/

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_U_UserType (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  UT_EntryUpdatedTime                   TIMESTAMP                         NULL,
  UT_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  UT_UserTypeID                         BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  UT_UserTypeName                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  UT_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_U_UserType
  UNIQUE (
    UT_UserTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_U_UserType
  PRIMARY KEY (
    UT_UserTypeName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_UT_UserTypeID
  CHECK (UT_UserTypeID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_UT_UserType(
  ----   UT_UserTypeName,
  ----   UT_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_U_UserType (
  UT_UserTypeID,
  UT_UserTypeName,
  UT_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator user type'
);
INSERT
INTO ec_U_UserType (
  UT_UserTypeID,
  UT_UserTypeName,
  UT_Description
) VALUES (
  1,
  'system operator',
  'a system operator'
);
INSERT
INTO ec_U_UserType (
  UT_UserTypeID,
  UT_UserTypeName,
  UT_Description
) VALUES (
  2,
  'publisher representative',
  'a publisher representative'
);
INSERT
INTO ec_U_UserType (
  UT_UserTypeID,
  UT_UserTypeName,
  UT_Description
) VALUES (
  3,
  'advertiser represnetative',
  'an advertiser represnetative'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_U_UserStatus (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Us_EntryUpdatedTime                   TIMESTAMP                         NULL,
  Us_EntryCreatedTime                   TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Us_UserStatusID                       BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Us_UserStatusName                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Us_Description                        VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_U_UserStatus
  UNIQUE (
    Us_UserStatusID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_U_UserStatus
  PRIMARY KEY (
    Us_UserStatusName
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Us_UserStatusID
  CHECK (Us_UserStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ---- ,
  ---- FULLTEXT INDEX ft_ec_U_UserStatus(
  ----   Us_UserStatusName,
  ----   Us_Description
  ---- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_U_UserStatus (
  Us_UserStatusID,
  Us_UserStatusName,
  Us_Description
) VALUES (
  0,
  'system-administrator',
  'system-administrator user status'
);

INSERT
INTO ec_U_UserStatus (
  Us_UserStatusID,
  Us_UserStatusName,
  Us_Description
) VALUES (
  1,
  'active',
  'User is in active mode.'
);

INSERT
INTO ec_U_UserStatus (
  Us_UserStatusID,
  Us_UserStatusName,
  Us_Description
) VALUES (
  2,
  'suspended',
  'User is in suspended mode.'
);

INSERT
INTO ec_U_UserStatus (
  Us_UserStatusID,
  Us_UserStatusName,
  Us_Description
) VALUES (
  3,
  'limited',
  'User is in limited mode.'
);

INSERT
INTO ec_U_UserStatus (
  Us_UserStatusID,
  Us_UserStatusName,
  Us_Description
) VALUES (
  4,
  'inactive',
  'User is in inactive mode.'
);

INSERT
INTO ec_U_UserStatus (
  Us_UserStatusID,
  Us_UserStatusName,
  Us_Description
) VALUES (
  5,
  'pending',
  'User info has not been published yet.'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_U_User (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  U_EntryUpdatedTime                    TIMESTAMP                         NULL,
  U_EntryCreatedTime                    TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  U_UserID                              BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserTypeID                          BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  U_OrganizationID                      BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserStatusID                        BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserName                            VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserTitle                           VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserEmailAddress                    VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserPasswordHash                    VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserOfficePhone                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserCellPhone                       VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_UserSurrogatePhone                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  U_Description                         VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_U_User
  UNIQUE (
    U_UserID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT pk_ec_U_User
  PRIMARY KEY (
    U_OrganizationID,
    U_UserName,
    U_UserEmailAddress
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_U_UserType
  FOREIGN KEY (
    U_UserTypeID
  ) REFERENCES ec_U_UserType(
    UT_UserTypeID
  ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_U_Organization
  FOREIGN KEY (
    U_OrganizationID
  ) REFERENCES ec_O_Organization(
    O_OrganizationID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_U_UserStatus
  FOREIGN KEY (
    U_UserStatusID
  ) REFERENCES ec_U_UserStatus(
    Us_UserStatusID
  )
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_U_UserID
  CHECK (U_UserID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_U_UserTypeID
  CHECK (U_UserTypeID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_U_OrganizationID
  CHECK (U_OrganizationID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_U_UserStatusID
  CHECK (U_UserStatusID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  -- ,
  -- FULLTEXT INDEX ft_ec_U_User(
  --   U_UserName,
  --   U_UserTitle,
  --   U_UserEmailAddress,
  --   U_UserOfficePhone,
  --   U_UserCellPhone,
  --   U_UserSurrogatePhone,
  --   U_Description
  -- )
  -- --------------------------------------------------------------------------
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_U_User (
  U_UserID,
  U_UserTypeID,
  U_OrganizationID,
  U_UserStatusID,
  U_UserName,
  U_UserTitle,
  U_UserEmailAddress,
  U_UserPasswordHash,
  U_UserOfficePhone,
  U_UserCellPhone,
  U_UserSurrogatePhone,
  U_Description
) VALUES (
  0,
  0,
  0,
  0,
  'system-administrator',
  'Mr.',
  'system-administrator@econtent.management.com',
  '',
  '1-408-555-1234',
  '1-408-555-5678',
  '1-408-555-9012',
  'system-administrator user'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
-------------------------------------------------------------------------------
--           012345678901234567890123456789
-------------------------------------------------------------------------------
*/
CREATE TABLE ec_U_UserFullText (
  -- --------------------------------------------------------------------------
  -- 345678901234567890123456789
  -- --------------------------------------------------------------------------
  Uft_EntryUpdatedTime                  TIMESTAMP                         NULL,
  Uft_EntryCreatedTime                  TIMESTAMP                         NULL,
  -- --------------------------------------------------------------------------
  Uft_UserID                            BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  -- Uft_UserTypeID                     BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_OrganizationID                    BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  -- Uft_UserStatusID                   BIGINT DEFAULT -1             NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_UserName                          VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_UserTitle                         VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_UserEmailAddress                  VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  -- Uft_UserPasswordHash               VARCHAR(255)
  --                                    CHARACTER SET UTF8
  --                                    COLLATE UTF8_UNICODE_CI
  --                                    DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_UserOfficePhone                   VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_UserCellPhone                     VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_UserSurrogatePhone                VARCHAR(255)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  Uft_Description                       VARCHAR(1024)
                                        CHARACTER SET UTF8
                                        COLLATE UTF8_UNICODE_CI
                                        DEFAULT ''                    NOT NULL,
  -- --------------------------------------------------------------------------
  --         012345678901234567890123456789
  -- --------------------------------------------------------------------------
  CONSTRAINT uk_ec_U_UserFullText
  UNIQUE (
    Uft_UserID
  ),
  -- --------------------------------------------------------------------------
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT pk_ec_U_UserFullText
  -- PRIMARY KEY (
  --   Uft_OrganizationID,
  --   Uft_UserName,
  --   Uft_UserEmailAddress
  -- ),
  -- --------------------------------------------------------------------------
  CONSTRAINT fk_ec_Uft_User
  FOREIGN KEY (
    Uft_UserID
  ) REFERENCES ec_U_User(
    U_UserID
  )
  ON DELETE CASCADE
  ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  -- ,
  -- ---- commented because MyISAM cannot support key length > 1000 bytes
  -- CONSTRAINT fk_ec_Uft_UserUnique
  -- FOREIGN KEY (
  --   Uft_OrganizationID,
  --   Uft_UserName,
  --   Uft_UserEmailAddress
  -- ) REFERENCES ec_U_User(
  --   U_OrganizationID,
  --   U_UserName,
  --   U_UserEmailAddress
  -- )
  -- ON DELETE CASCADE
  -- ON UPDATE CASCADE
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Uft_UserID
  CHECK (Uft_UserID >= 0)
  -- --------------------------------------------------------------------------
  ,
  CONSTRAINT ck_ec_Uft_OrganizationID
  CHECK (Uft_OrganizationID >= 0)
  -- --------------------------------------------------------------------------
  --             012345678901234567890123456789
  -- --------------------------------------------------------------------------
  ,
  FULLTEXT INDEX ft_ec_U_User(
    Uft_UserName,
    Uft_UserTitle,
    Uft_UserEmailAddress,
    Uft_UserOfficePhone,
    Uft_UserCellPhone,
    Uft_UserSurrogatePhone,
    Uft_Description
  )
  -- --------------------------------------------------------------------------
)
ENGINE = MyISAM, -- InnoDB,
DEFAULT CHARACTER SET = UTF8,
DEFAULT COLLATE = UTF8_UNICODE_CI
COMMENT = ''
;
-- print

INSERT
INTO ec_U_UserFullText (
  Uft_UserID,
  Uft_OrganizationID,
  Uft_UserName,
  Uft_UserTitle,
  Uft_UserEmailAddress,
  Uft_UserOfficePhone,
  Uft_UserCellPhone,
  Uft_UserSurrogatePhone,
  Uft_Description
) VALUES (
  0,
  0,
  'system-administrator',
  'Mr.',
  'system-administrator@econtent.management.com',
  '1-408-555-1234',
  '1-408-555-5678',
  '1-408-555-9012',
  'system-administrator user'
);

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/


/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/
