# London Stage Database: Release Notes

## 2.0

Released October 8th, 2025.

A major release of the database that adds two new tables to serve XML files from the [Text Creationship Partnership](https://textcreationpartnership.org/tcp-texts/eebo-tcp-early-english-books-online/) and incorporates corrections
to the Works and Author tables.

### Enhancements
* Adds the TCP and WorksTCP tables to the database.
* Add foreign key constraints linking TCP and WorksTCP tables to existing tables.
* Removes the unused WorksBak and AuthTemp tables.

### Bug fixes
* 

### Documentation
* Adds a new data dictionary to the `docs/` folder of this repository.

## 1.1 

Released April 4th, 2025.

The first release of the database after active development resumed in 2025. This revision incorporated minor changes that lay the foundation for future development work.

### Bug fixes
* Corrects the TheatreCode of 13 events.
* Corrects the TheatreID of 7 events.

### Enhancements
* Adds foreign key constraints between relational database tables. 
    - For example, it is no longer possible for Events to be held at a Theatre that does not exist in the Theatre table.
* These constraints will prevent the addition of values to one table that conflict with information in a corresponding table, a necessary safeguard as we expand the database.
