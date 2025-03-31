# London Stage Database: Release Notes

## 1.1 

Released April [REPLACE], 2025.

The first release of the database after active development resumed in 2025. This revision incorporated minor changes that lay the foundation for future development work.

### Bug fixes
* Corrects the TheatreCode of 13 events.
* Corrects the TheatreID of 7 events.

### Enhancements
* Adds foreign key constraints between relational database tables. 
    - For example, it is no longer possible for Events to be held at a  Theatre that does not exist in the Theatre table.
* These constraints will prevent the addition of values to one table that conflict with information in a corresponding table, a necessary safeguard as we expand the database.