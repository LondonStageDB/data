# The London Stage Database

## About
This repository stores and versions the MariaDB SQL database underpinning the [London Stage Database](https://londonstagedb.uoregon.edu/) project.

## Files

### Database
The authoritative version of the London Stage Database, matches the version running on **[londonstagedb.uoregon.edu](londonstagedb.uoregon.edu)**
* `London.sql.zip`
    - A logical backup of the database created using [mysqldump](https://mariadb.com/kb/en/mysqldump/).

### Secondary Database Formats
These derivative formats are maintained concurrently. The code that generates these flattened structures by 
merging together several tables from the SQL database is in the [website](https://github.com/LondonStageDB/website) repository. 
* `LondonStageFull.csv.zip`
    - A comma-delimited file with one **Event** per row.
* `LondonStageFull.json.zip`
    - A serialized array with one **Event** per record.
* `LondonStageFull.xml.zip`
    - An XML markup file with one item per **Event**.


### Documentation
* `docs/release-notes.md`
    - Summarizes changes made to the database.
* `docs/schema.png` 
    - An entity-relationship diagram.

### Scripts
For reproducibility, these scripts document 
the SQL commands executed to increment or "upgrade" the database from 1.0 to 1.1.
They are applied to **v1.0** of the database in ascending order.

Because the corrections made to the database after versions 1.1 were so substantial, impacting thousands of rows, we have chosen not to provide SQL scripts to upgrade 1.1 to 2.0, or from
2.0 to 3.0 

#### v1.1
* `scripts/01_constraint_prep.sql`
    - Corrects rows that violate constraints.
* `scripts/02_add_constraints.sql`
    - Applies foreign key constraints. 

Researchers interested only in the data are encouraged to download the most recent version of the database in their preferred format.
