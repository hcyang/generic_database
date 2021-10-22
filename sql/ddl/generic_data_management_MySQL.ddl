/*
-- -*- SQL -*-  -- To make emacs recognize the correct program type.
///////////////////////////////////////////////////////////////////////////////
//=============================================================================
// Script:
//   --------------------------------------------------------------------------
//   generic database
//   --------------------------------------------------------------------------
//=============================================================================
//
//=============================================================================
// Purpose:
//   --------------------------------------------------------------------------
//   DDL for managing generic data.
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
== Functions: 
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
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash(
  _InputString VARCHAR(8192
                       -- 65535
                       )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(SHA2(_InputString,512),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash2;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash2(
  _InputString0 VARCHAR(4096
                        -- 32767
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 32767
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash3;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash3(
  _InputString0 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512),
                          SHA2(_InputString2,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash4;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash4(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512),
                          SHA2(_InputString2,512),
                          SHA2(_InputString3,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash5;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash5(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512),
                          SHA2(_InputString2,512),
                          SHA2(_InputString3,512),
                          SHA2(_InputString4,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash6;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash6(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512),
                          SHA2(_InputString2,512),
                          SHA2(_InputString3,512),
                          SHA2(_InputString4,512),
                          SHA2(_InputString5,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash7;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash7(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString6 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512),
                          SHA2(_InputString2,512),
                          SHA2(_InputString3,512),
                          SHA2(_InputString4,512),
                          SHA2(_InputString5,512),
                          SHA2(_InputString6,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255StrongHash8;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255StrongHash8(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString6 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString7 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(SHA2(_InputString0,512),
                          SHA2(_InputString1,512),
                          SHA2(_InputString2,512),
                          SHA2(_InputString3,512),
                          SHA2(_InputString4,512),
                          SHA2(_InputString5,512),
                          SHA2(_InputString6,512),
                          SHA2(_InputString7,512)
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Functions: 
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
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash(
  _InputString VARCHAR(8192
                       -- 65535
                       )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(_InputString,
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash2;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash2(
  _InputString0 VARCHAR(4096
                        -- 32767
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 32767
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash3;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash3(
  _InputString0 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1,
                          _InputString2
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash4;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash4(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1,
                          _InputString2,
                          _InputString3
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash5;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash5(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1,
                          _InputString2,
                          _InputString3,
                          _InputString4
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash6;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash6(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1,
                          _InputString2,
                          _InputString3,
                          _InputString4,
                          _InputString5
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash7;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash7(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString6 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1,
                          _InputString2,
                          _InputString3,
                          _InputString4,
                          _InputString5,
                          _InputString6
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetVarchar255Hash8;
DELIMITER //
CREATE FUNCTION sqlGetVarchar255Hash8(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString6 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString7 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  RETURN
    SUBSTRING(SHA2(CONCAT(_InputString0,
                          _InputString1,
                          _InputString2,
                          _InputString3,
                          _InputString4,
                          _InputString5,
                          _InputString6,
                          _InputString7
                          ),
                   512
                   ),
              1,255
              );
END;
//
DELIMITER ;

-- print

/*
----------------------------------------|-----------------------------|--------
-------------------------------------------------------------------------------
--23456789012345678901234567890123456789012345678901234567890123456789012345678
-------------------------------------------------------------------------------
----------------------------------------|-----------------------------|--------
*/

/*
===============================================================================
== Functions: 
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
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId;
DELIMITER //
CREATE FUNCTION sqlGetId(
  _InputString VARCHAR(8192
                       -- 65535
                       )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(_InputString
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId2;
DELIMITER //
CREATE FUNCTION sqlGetId2(
  _InputString0 VARCHAR(4096
                        -- 32767
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 32767
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId3;
DELIMITER //
CREATE FUNCTION sqlGetId3(
  _InputString0 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 21845
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1,
                                   _InputString2
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId4;
DELIMITER //
CREATE FUNCTION sqlGetId4(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1,
                                   _InputString2,
                                   _InputString3
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId5;
DELIMITER //
CREATE FUNCTION sqlGetId5(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1,
                                   _InputString2,
                                   _InputString3,
                                   _InputString4
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId6;
DELIMITER //
CREATE FUNCTION sqlGetId6(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1,
                                   _InputString2,
                                   _InputString3,
                                   _InputString4,
                                   _InputString5
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId7;
DELIMITER //
CREATE FUNCTION sqlGetId7(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString6 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1,
                                   _InputString2,
                                   _InputString3,
                                   _InputString4,
                                   _InputString5,
                                   _InputString6
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

/*
-------------------------------------------------------------------------------
--              012345678901234567890123456789
-------------------------------------------------------------------------------
*/
DROP FUNCTION IF EXISTS sqlGetId8;
DELIMITER //
CREATE FUNCTION sqlGetId8(
  _InputString0 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString1 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString2 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString3 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString4 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString5 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString6 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
  ,
  _InputString7 VARCHAR(4096
                        -- 16383
                        )
    CHARACTER SET UTF8
    -- ---- COLLATE UTF8_UNICODE_CI
)
RETURNS BIGINT
DETERMINISTIC
BEGIN
  RETURN
    CAST(CONV(SUBSTRING(MD5(CONCAT(_InputString0,
                                   _InputString1,
                                   _InputString2,
                                   _InputString3,
                                   _InputString4,
                                   _InputString5,
                                   _InputString6,
                                   _InputString7
                                   )
                            ),
                        1,15
                        ),
              16,10
              )
         AS UNSIGNED INTEGER
         );
END;
//
DELIMITER ;

-- print

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
