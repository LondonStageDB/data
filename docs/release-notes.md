# London Stage Database: Release Notes

## 2.1

Released June 1, 2026.

A minor release that adds WorkIds to thousands of performances in the
Performance table, significantly improving the accuracy of the 
Related Works algorithm. Improves interoperability among
the London Stage Database and other theatrical datasets.

### Enhancements
* Adds WorkIds to 4184 performances in the Performances table.
* Adds the WikidataId and URL fields to the Author table in preparation for a future 
new feature.
* Amends 43 authorship attributions in the WorkAuthMaster table.
* Corrects spacing, transcription, and spelling errors in the 
PerformanceTitle and PerfTitleClean fields of 648 performances.

### Bug fixes
* Removes extra white space from 3446 rows in the Cast table.
* Corrects titles related to Handel's Messiah in Works.
* Adds missing MatchType values to 33 rows in WorksTCP.
* Adds 9 variants to the AuthorVariant table.
* Removes 3 disqualified entries (not theatrical works) from the TCP table.

### Contributors
* Mattie Burkert
* Erin Winter
* Quynh-Tran Le
* Ceilidh McCallum
* Rose Ruhnke
* Chelsea Phillips

## 2.0

Released October 9th, 2025.

A major release of the database that adds two new tables to serve XML files from the [Text Creationship Partnership](https://textcreationpartnership.org/tcp-texts/eebo-tcp-early-english-books-online/) and incorporates corrections
to the Works and Author tables. 

The corrections reflect a mixture of systematic and ad-hoc fixes to issues identified by LSDB researchers while incorporating TCP data; further correction of known issues is planned. Verify key details against primary source records whenever possible.

### Enhancements
* Adds the TCP and WorksTCP tables to the database.
* Adds foreign key constraints linking TCP and WorksTCP tables to existing tables.
* Removes the unused WorksBak and AuthTemp tables.
* Updates the Author table with new Authors.
    - Add birth and death dates for some authors.
* Adds newly identified Works to the Works table.
    - Adds publication dates and known sources to some Works.
* Adds curated variant titles for some Works to WorksVariant to support better related work retrieval.
* Adds curated WorkIds for some Performances for better related work retrieval.

### Bug fixes
* Consolidates duplicate Works and updates associated pointers in Authors, WorkAuthMaster,
WorksVariant, and Performances tables.
* Corrects WorkIds for some Performances to reflect further research and verification.
* Enforces utf-8 encoding for all tables.

### Documentation
* Adds a new data dictionary to the `docs/` folder of this repository.
* Updates `docs/schema.png` to reflect new table structure.

### Contributors
* Michele Pflug
* Mattie Burkert
* Erin Winter

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

### Contributors
* Erin Winter
* Mattie Burkert