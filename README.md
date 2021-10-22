# generic_database
A generic, flexible relational database schema design

## Introduction

- a) This schema is designed for managing e-content data.
     It is comprised of several inter-dependent sub-schemas.
- b) Each sub-schema is noted by an abbreviation,
     such as "O" for "organization", "P" for "product", etc.
- c) Tables/Relations are created in generic names, so that they can
     extend to areas not covered or represented by a design with specific,
     limiting table names.
     For example, instead of
     creating a "book" table that is specific for storing book information (while it can be awkward for storing audio or video data in it) we use
     a generic relation name called "product," which is applicable for
     sotring almost anything.
- d) Tables/Relations should always be created using a
     transactional storage engine, such as InnoDB.
- e) Each sub-schema is comprised of one or more tables.
     There is a main
     entity or relationship table for storing first-class information.
     There can be a "type" table that is referenced by the main table for
     categorization purpose. There can be a "status" table that is referenced
     by the main table for "status" purpose.
     There can also be a "full-text" table to be indexed for full-text search.
     This full-text table must be stored in the non-transctional MyISAM
     storage engine, and that is why we take it out of the main
     table, which is always managed by a transactional engine, such as
     InnoDB.
- f) The Outline section below shows how the
     generically-named sub-schemas
     can be applied for domain-specific purposes. For example,
     the "organization" relation can be
     used to repesent a website, i.e., website data can be stored in the
     "host" table.
- g) Below is a list of DDL (data definition language) and
     DCL (data control language) programs for
     building a database with this schema.
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

## Create database

```
\. .\econtent_data_management_clear.ddl
show tables;
show procedure status;
show function status;
warnings
\. .\generic_data_management_MySQL.ddl
-- show engine innodb status;
\. .\econtent_data_management.ddl
-- show engine innodb status;
\. .\econtent_data_management_MySQL.ddl
-- show engine innodb status;
\. .\econtent_data_management_demonstration_data.sql
-- show tables;
-- \. .\econtent_data_management_migration.sql
-- show tables;
show procedure status; -- 27  -- 27
show function status;  -- 24  -- 24
show tables;           -- 68  -- 68
```