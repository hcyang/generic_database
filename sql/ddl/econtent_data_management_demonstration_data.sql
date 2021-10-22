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
== Subschema: Organization
===============================================================================
*/

CALL sp_ec_O_Organization(
  'econtent management',
  1, -- 1: publisher
  '408-555-4567',
  '2 Econtent Management Road, San Jose, CA 95100',
  1, -- 1: active
  'Project system administration demonstration'
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_O_Organization(
  _OrganizationName     VARCHAR(255),
  _OrganizationTypeID   BIGINT,
  _OrganizationPhone    VARCHAR(255),
  _OrganizationAddress  VARCHAR(255),
  _OrganizationStatusID BIGINT,
  _Description          VARCHAR(1024)
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_O_Organization(
    O_OrganizationName,
    O_OrganizationTypeID,
    O_OrganizationPhone,
    O_OrganizationAddress,
    O_OrganizationStatusID,
    O_Description
  ) VALUES (
    _OrganizationName,
    _OrganizationTypeID,
    _OrganizationPhone,
    _OrganizationAddress,
    _OrganizationStatusID,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_O_OrganizationFullText(
    Oft_OrganizationName,
    Oft_OrganizationPhone,
    Oft_OrganizationAddress,
    Oft_Description
  ) VALUES (
    _OrganizationName,
    _OrganizationPhone,
    _OrganizationAddress,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/
/*
  INSERT INTO ec_O_Organization(
    O_OrganizationID,
    O_OrganizationName,
    O_OrganizationTypeID,
    O_OrganizationPhone,
    O_OrganizationAddress,
    O_OrganizationStatusID,
    O_Description
  ) VALUES (
    1,
    'econtent management',
    1, -- 1: publisher
    '408-555-4567',
    '2 Econtent Management Road, San Jose, CA 95100',
    1, -- 1: active
    'Project system administration demonstration'
    -- _OrganizationName,
    -- _OrganizationTypeID,
    -- _OrganizationPhone,
    -- _OrganizationAddress,
    -- _OrganizationStatusID,
    -- _Description
  );
*/

/*
===============================================================================
== Subschema: Subject
===============================================================================
*/

CALL sp_ec_S_Subject(
  'author',
  'author',
  '',
  'Author Land',
  'When?',
  -- 1, -- 1: publisher
  -- '408-555-4567',
  -- '2 Econtent Management Road, San Jose, CA 95100',
  -- 1, -- 1: active
  '',
  'Project system administration demonstration'
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_S_Subject(
  _SubjectName             VARCHAR(255),
  _SubjectRealName         VARCHAR(255),
  _SubjectGender           CHAR(1),
  _SubjectFromInformation  VARCHAR(255),
  _SubjectBirthInformation VARCHAR(255),
  -- _SubjectTypeID        BIGINT,
  -- _SubjectPhone         VARCHAR(255),
  -- _SubjectAddress       VARCHAR(255),
  -- _SubjectStatusID      BIGINT,
  _SubjectBiography        TEXT,
  _Description             VARCHAR(1024)
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_S_Subject(
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
    _SubjectName,
    _SubjectRealName,
    _SubjectGender,
    _SubjectFromInformation,
    _SubjectBirthInformation,
    -- _SubjectTypeID,
    -- _SubjectPhone,
    -- _SubjectAddress,
    -- _SubjectStatusID,
    _SubjectBiography,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_S_SubjectFullText(
    Sft_SubjectName,
    Sft_SubjectRealName,
    Sft_SubjectFromInformation,
    Sft_SubjectBirthInformation,
    -- Sft_SubjectPhone,
    -- Sft_SubjectAddress,
    Sft_SubjectBiography,
    Sft_Description
  ) VALUES (
    _SubjectName,
    _SubjectRealName,
    _SubjectFromInformation,
    _SubjectBirthInformation,
    -- _SubjectPhone,
    -- _SubjectAddress,
    _SubjectBiography,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

/*
===============================================================================
== Subschema: Target
===============================================================================
*/

CALL sp_ec_T_Target(
  'system-administrator-a@econtent.management.com',
  'system-administrator-a',
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
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_T_Target(
  _TargetEmailAddress        VARCHAR(255),
  _TargetName                VARCHAR(255),
  _TargetPasswordHash        VARCHAR(255),
  -- _TargetGender           CHAR(1),
  -- _TargetFromInformation  VARCHAR(255),
  -- _TargetBirthInformation VARCHAR(255),
  -- _TargetTypeID           BIGINT,
  -- _TargetPhone            VARCHAR(255),
  -- _TargetAddress          VARCHAR(255),
  -- _TargetStatusID         BIGINT,
  _Description               VARCHAR(1024)
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_T_Target(
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
    _TargetEmailAddress,
    _TargetName,
    _TargetPasswordHash,
    -- _TargetGender,
    -- _TargetFromInformation,
    -- _TargetBirthInformation,
    -- _TargetTypeID,
    -- _TargetPhone,
    -- _TargetAddress,
    -- _TargetStatusID,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_T_TargetFullText(
    Tft_TargetEmailAddress,
    Tft_TargetName,
    -- Tft_TargetFromInformation,
    -- Tft_TargetBirthInformation,
    -- Tft_TargetPhone,
    -- Tft_TargetAddress,
    Tft_Description
  ) VALUES (
    _TargetEmailAddress,
    _TargetName,
    -- _TargetFromInformation,
    -- _TargetBirthInformation,
    -- _TargetPhone,
    -- _TargetAddress,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

/*
===============================================================================
== Subschema: Product
===============================================================================
*/

CALL sp_ec_P_Product(
  'econtent product',
  0,
  NULL,
  'econtent management',
  1,
  'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator product reference',
  'system-administrator product'
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_P_Product(
  _ProductTitle        VARCHAR(255),
  _ProductTypeID       BIGINT,
  __OrganizationID     BIGINT,
  _OrganizationName    VARCHAR(255),
  _ProductEdition      SMALLINT,
  _ProductStandardCode VARCHAR(255),
  _ProductPublishDate  VARCHAR(255),
  _ProductBasePricing  NUMERIC(16,2),
  _ProductStatusID     BIGINT,
  _ProductReference    VARCHAR(1024),
  _Description         VARCHAR(1024)
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_P_Product(
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
    _ProductTitle,
    _ProductTypeID,
    _OrganizationID,
    _ProductEdition,
    _ProductStandardCode,
    _ProductPublishDate
    _ProductBasePricing,
    _ProductStatusID,
    _ProductReference,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_P_ProductFullText(
    Pft_ProductTitle,
    Pft_OrganizationID,
    Pft_ProductEdition,
    Pft_ProductStandardCode,
    Pft_ProductPublishDate,
    Pft_ProductReference,
    Pft_Description
  ) VALUES (
    _ProductTitle,
    _OrganizationID,
    _ProductEdition,
    _ProductStandardCode,
    _ProductPublishDate,
    _ProductReference,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

/*
===============================================================================
== Subschema: SubjectProduct
===============================================================================
*/

CALL sp_ec_SP_SubjectProduct(
  NULL,
  'author',
  NULL,
  NULL,
  'econtent product',
  'econtent management',
  1,
  'ISBN 0-375-92713-1',
  0,
  'system-administrator subject-product'
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_SP_SubjectProduct(
  __SubjectID                 BIGINT,
  _SubjectName                VARCHAR(255),
  -- _SubjectRealName         VARCHAR(255),
  -- _SubjectGender           CHAR(1),
  -- _SubjectFromInformation  VARCHAR(255),
  -- _SubjectBirthInformation VARCHAR(255),
  -- -- _SubjectTypeID        BIGINT,
  -- -- _SubjectPhone         VARCHAR(255),
  -- -- _SubjectAddress       VARCHAR(255),
  -- -- _SubjectStatusID      BIGINT,
  -- _Description             VARCHAR(1024)
  __ProductID             BIGINT,
  __OrganizationID        BIGINT,
  _ProductTitle           VARCHAR(255),
  -- _ProductTypeID       BIGINT,
  _OrganizationName       VARCHAR(255),
  _ProductEdition         SMALLINT,
  _ProductStandardCode    VARCHAR(255),
  -- _ProductPublishDate  VARCHAR(255),
  -- _ProductBasePricing  NUMERIC(16,2),
  -- _ProductStatusID     BIGINT,
  -- _ProductReference    VARCHAR(1024),
  -- _Description         VARCHAR(1024)
  _Order              BIGINT,
  _Description        VARCHAR(1024)
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_SP_SubjectProduct(
    SP_SubjectID,
    SP_ProductID,
    SP_Order,
    SP_Description
  ) VALUES (
    _SubjectID,
    _ProductID,
    _Order,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

/*
===============================================================================
== Subschema: Content
===============================================================================
*/

CALL sp_ec_C_ContentText(
  -- --------------------------------------------------------------------------
  'system-administrator-a',
  -- 0,
  -- --------------------------------------------------------------------------
  NULL,
  NULL,
  'econtent product',
  -- 0,
  'econtent management',
  1,
  'ISBN 0-375-92713-1',
  -- --------------------------------------------------------------------------
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator product text',
  'text/text',
  'system-administrator product'
  -- --------------------------------------------------------------------------
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_C_ContentText(
  -- --------------------------------------------------------------------------
  _ContentTitle        VARCHAR(255),
  -- _ContentTypeID    BIGINT,
  -- --------------------------------------------------------------------------
  __ProductID            BIGINT,
  __OrganizationID       BIGINT,
  _ProductTitle          VARCHAR(255),
  -- _ProductTypeID      BIGINT,
  _OrganizationName      VARCHAR(255),
  _ProductEdition        SMALLINT,
  _ProductStandardCode   VARCHAR(255),
  -- _ProductPublishDate VARCHAR(255),
  -- _ProductBasePricing NUMERIC(16,2),
  -- _ProductStatusID    BIGINT,
  -- _ProductReference   VARCHAR(1024),
  -- _Description        VARCHAR(1024)
  -- _Order              BIGINT,
  -- _Description        VARCHAR(1024)
  -- --------------------------------------------------------------------------
  _ContentEdition      SMALLINT,
  -- _ContentStandardCode VARCHAR(255),
  _ContentPublishDate  VARCHAR(255),
  _ContentBasePricing  NUMERIC(16,2),
  _ContentStatusID     BIGINT,
  _ContentText         TEXT,
  _ContentMIMEsetting  VARCHAR(255),
  _Description         VARCHAR(1024)
  -- --------------------------------------------------------------------------
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentText(
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
    _ContentTitle,
    -- _ContentTypeID,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate
    _ContentBasePricing,
    _ContentStatusID,
    _ContentText,
    _ContentMIMEsetting,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentTextFullText(
    Cft_ContentTitle,
    Cft_ProductID,
    Cft_ContentEdition,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentText,
    Cft_Description
  ) VALUES (
    _ContentTitle,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate,
    _ContentText,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

CALL sp_ec_C_ContentTinyText(
  -- --------------------------------------------------------------------------
  'system-administrator-a',
  -- 0,
  -- --------------------------------------------------------------------------
  NULL,
  NULL,
  'econtent product',
  -- 0,
  'econtent management',
  1,
  'ISBN 0-375-92713-1',
  -- --------------------------------------------------------------------------
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator product tiny text',
  'text/text',
  'system-administrator product'
  -- --------------------------------------------------------------------------
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_C_ContentTinyText(
  -- --------------------------------------------------------------------------
  _ContentTitle        VARCHAR(255),
  -- _ContentTypeID    BIGINT,
  -- --------------------------------------------------------------------------
  __ProductID            BIGINT,
  __OrganizationID       BIGINT,
  _ProductTitle          VARCHAR(255),
  -- _ProductTypeID      BIGINT,
  _OrganizationName      VARCHAR(255),
  _ProductEdition        SMALLINT,
  _ProductStandardCode   VARCHAR(255),
  -- _ProductPublishDate VARCHAR(255),
  -- _ProductBasePricing NUMERIC(16,2),
  -- _ProductStatusID    BIGINT,
  -- _ProductReference   VARCHAR(1024),
  -- _Description        VARCHAR(1024)
  -- _Order              BIGINT,
  -- _Description        VARCHAR(1024)
  -- --------------------------------------------------------------------------
  _ContentEdition      SMALLINT,
  -- _ContentStandardCode VARCHAR(255),
  _ContentPublishDate  VARCHAR(255),
  _ContentBasePricing  NUMERIC(16,2),
  _ContentStatusID     BIGINT,
  _ContentTinyText     TINYTEXT,
  _ContentMIMEsetting  VARCHAR(255),
  _Description         VARCHAR(1024)
  -- --------------------------------------------------------------------------
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentTinyText(
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
    _ContentTitle,
    -- _ContentTypeID,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate
    _ContentBasePricing,
    _ContentStatusID,
    _ContentTinyText,
    _ContentMIMEsetting,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentTinyTextFullText(
    Cft_ContentTitle,
    Cft_ProductID,
    Cft_ContentEdition,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentTinyText,
    Cft_Description
  ) VALUES (
    _ContentTitle,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate,
    _ContentTinyText,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

CALL sp_ec_C_ContentMediumText(
  -- --------------------------------------------------------------------------
  'system-administrator-a',
  -- 0,
  -- --------------------------------------------------------------------------
  NULL,
  NULL,
  'econtent product',
  -- 0,
  'econtent management',
  1,
  'ISBN 0-375-92713-1',
  -- --------------------------------------------------------------------------
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator product medium text',
  'text/text',
  'system-administrator product'
  -- --------------------------------------------------------------------------
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_C_ContentMediumText(
  -- --------------------------------------------------------------------------
  _ContentTitle        VARCHAR(255),
  -- _ContentTypeID    BIGINT,
  -- --------------------------------------------------------------------------
  __ProductID            BIGINT,
  __OrganizationID       BIGINT,
  _ProductTitle          VARCHAR(255),
  -- _ProductTypeID      BIGINT,
  _OrganizationName      VARCHAR(255),
  _ProductEdition        SMALLINT,
  _ProductStandardCode   VARCHAR(255),
  -- _ProductPublishDate VARCHAR(255),
  -- _ProductBasePricing NUMERIC(16,2),
  -- _ProductStatusID    BIGINT,
  -- _ProductReference   VARCHAR(1024),
  -- _Description        VARCHAR(1024)
  -- _Order              BIGINT,
  -- _Description        VARCHAR(1024)
  -- --------------------------------------------------------------------------
  _ContentEdition      SMALLINT,
  -- _ContentStandardCode VARCHAR(255),
  _ContentPublishDate  VARCHAR(255),
  _ContentBasePricing  NUMERIC(16,2),
  _ContentStatusID     BIGINT,
  _ContentMediumText   MEDIUMTEXT,
  _ContentMIMEsetting  VARCHAR(255),
  _Description         VARCHAR(1024)
  -- --------------------------------------------------------------------------
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentMediumText(
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
    _ContentTitle,
    -- _ContentTypeID,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate
    _ContentBasePricing,
    _ContentStatusID,
    _ContentMediumText,
    _ContentMIMEsetting,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentMediumTextFullText(
    Cft_ContentTitle,
    Cft_ProductID,
    Cft_ContentEdition,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentMediumText,
    Cft_Description
  ) VALUES (
    _ContentTitle,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate,
    _ContentMediumText,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/

CALL sp_ec_C_ContentLongText(
  -- --------------------------------------------------------------------------
  'system-administrator-a',
  -- 0,
  -- --------------------------------------------------------------------------
  NULL,
  NULL,
  'econtent product',
  -- 0,
  'econtent management',
  1,
  'ISBN 0-375-92713-1',
  -- --------------------------------------------------------------------------
  1,
  -- 'ISBN 0-375-92713-1',
  CURDATE(),
  '100.0',
  0,
  'system-administrator product long text',
  'text/text',
  'system-administrator product'
  -- --------------------------------------------------------------------------
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_C_ContentLongText(
  -- --------------------------------------------------------------------------
  _ContentTitle        VARCHAR(255),
  -- _ContentTypeID    BIGINT,
  -- --------------------------------------------------------------------------
  __ProductID            BIGINT,
  __OrganizationID       BIGINT,
  _ProductTitle          VARCHAR(255),
  -- _ProductTypeID      BIGINT,
  _OrganizationName      VARCHAR(255),
  _ProductEdition        SMALLINT,
  _ProductStandardCode   VARCHAR(255),
  -- _ProductPublishDate VARCHAR(255),
  -- _ProductBasePricing NUMERIC(16,2),
  -- _ProductStatusID    BIGINT,
  -- _ProductReference   VARCHAR(1024),
  -- _Description        VARCHAR(1024)
  -- _Order              BIGINT,
  -- _Description        VARCHAR(1024)
  -- --------------------------------------------------------------------------
  _ContentEdition      SMALLINT,
  -- _ContentStandardCode VARCHAR(255),
  _ContentPublishDate  VARCHAR(255),
  _ContentBasePricing  NUMERIC(16,2),
  _ContentStatusID     BIGINT,
  _ContentLongText     LONGTEXT,
  _ContentMIMEsetting  VARCHAR(255),
  _Description         VARCHAR(1024)
  -- --------------------------------------------------------------------------
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentLongText(
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
    _ContentTitle,
    -- _ContentTypeID,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate
    _ContentBasePricing,
    _ContentStatusID,
    _ContentLongText,
    _ContentMIMEsetting,
    _Description    
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_C_ContentLongTextFullText(
    Cft_ContentTitle,
    Cft_ProductID,
    Cft_ContentEdition,
    -- Cft_ContentStandardCode,
    Cft_ContentPublishDate,
    Cft_ContentLongText,
    Cft_Description
  ) VALUES (
    _ContentTitle,
    _ProductID,
    _ContentEdition,
    -- _ContentStandardCode,
    _ContentPublishDate,
    _ContentLongText,
    _Description    
  );
  -- --------------------------------------------------------------------------
*/


/*
===============================================================================
== Subschema: User
===============================================================================
*/

CALL sp_ec_U_User(
  'system-administrator-a',
  0,
  NULL,
  'econtent management',
  0,
  'Mr.',
  'system-administrator-a@econtent.management.com',
  '',
  '1-408-555-1234',
  '1-408-555-5678',
  '1-408-555-9012',
  'system-administrator user'
);
/*
-- ----------------------------------------------------------------------------
CREATE PROCEDURE sp_ec_U_User(
  _UserName           VARCHAR(255),
  _UserTypeID         BIGINT,
  __OrganizationID    BIGINT,
  _OrganizationName   VARCHAR(255),
  _UserStatusID       BIGINT,
  _UserTitle          VARCHAR(255),
  _UserEmailAddress   VARCHAR(255),
  _UserPasswordHash   VARCHAR(255),
  _UserOfficePhone    VARCHAR(255),
  _UserCellPhone      VARCHAR(255),
  _UserSurrogatePhone VARCHAR(255),
  _Description        VARCHAR(1024)
)
-- ----------------------------------------------------------------------------
*/
/*
  -- --------------------------------------------------------------------------
  INSERT INTO ec_U_User(
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
    _UserTypeID,
    _OrganizationID,
    _UserStatusID,
    _UserName,
    _UserTitle,
    _UserEmailAddress,
    _UserPasswordHash,
    _UserOfficePhone,
    _UserCellPhone,
    _UserSurrogatePhone,
    _Description
  );
  -- --------------------------------------------------------------------------
  INSERT INTO ec_U_UserFullText(
    Uft_OrganizationID,
    Uft_UserName,
    Uft_UserTitle,
    Uft_UserEmailAddress,
    Uft_UserOfficePhone,
    Uft_UserCellPhone,
    Uft_UserSurrogatePhone,
    Uft_Description
  ) VALUES (
    _OrganizationID,
    _UserName,
    _UserTitle,
    _UserEmailAddress,
    _UserOfficePhone,
    _UserCellPhone,
    _UserSurrogatePhone,
    _Description
  );
  -- --------------------------------------------------------------------------
*/

/*
===============================================================================
===============================================================================
===============================================================================
===============================================================================
*/
