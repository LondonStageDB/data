# The London Stage Database

## About
This repository stores and versions the MariaDB relational database underpinning the [London Stage Database](https://londonstagedb.uoregon.edu/) project.

## Files

### Database
The authoritative version of the London Stage Database, matches the version running on **[londonstagedb.uoregon.edu](londonstagedb.uoregon.edu)**
* `London.sql.zip`
    - A logical backup of the database created using [mysqldump](https://mariadb.com/kb/en/mysqldump/).

### Secondary Formats
Derivative formats are maintained concurrently. The code that generates these from the SQL database is in the [website](https://github.com/LondonStageDB/website) repository. 
* `LondonStageFull.csv.zip`
* `LondonStageFull.json.zip`
* `LondonStageFull.xml.zip`

### Scripts
For reproducibility, these scripts document 
the SQL commands executed to increment or "upgrade" the database.
They are applied to **v1.0** of the database in ascending order.

#### v1.1
* `scripts/01_constraint_prep.sql`
    - Corrects rows that violate constraints
* `scripts/02_add_constraints.sql`
    - Applies foreign key constraints 

Researchers interested in data are encouraged to download the most recent version of the database
in their preferred format instead.