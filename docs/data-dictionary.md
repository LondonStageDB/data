# London Stage Database Data Dictionary

## AsSeeDate
Represents the ladder structure of the *The London Stage* by mapping performances to associated theatres and previous performance dates.

| Column | Type    | Constraints  | Description | Example |
|---------|--------------|-------------|---------------------------|----------------|
| PerformanceId | int(6)  | NOT NULL  | PerformanceId | `2657` |
| TheatreCode   | varchar(16)  | NOT NULL | theatre code from *The London Stage* | `dl`  |
| Ptype | varchar(2)   | NOT NULL | Performance type: `a` afterpiece, `b` ballet, `d` dance, `e` entertainment, `m` music, `o` opera, `p` mainpiece, `s` song | `d` |
| AsDateType | varchar(4) | NOT NULL | Always `As` | `As` |
| AsSeeDate  | int(8)  | NOT NULL  | Date of previous performance in the "ladder"  | `17161022` |

## Author
Stores information about authors and their dates of flourishing.

| Column| Type | Constraints | Description | Example |
|------------------|-----------|-------------------|-------------|------------|
| AuthId   | int(6) | PRIMARY KEY, NOT NULL  | unique author identifier | `1` |
| AuthName  | varchar(50)  | NOT NULL  | name in "First Last" form  | `John Suckling`    |
| StartDate | varchar(20)  | NOT NULL  | birth date or earliest known flourish date | `1609` |
| StartType  | varchar(15)  | NOT NULL  | type of start date, flourishing, baptism, birth | `baptism` |
| EndDate | varchar(20)  | NOT NULL | death date or earliest known flourish date  |`1641?` |
| EndType  | varchar(15)  | NOT NULL  | type of end date,  flourishing or death | `death`|
| AuthNameClean   | varchar(50)  | NULL, FULLTEXT INDEX | cleaned author name, indexed for faceted search | `John Suckling` |

## AuthorVariant
Stores mappings between authors and variant spellings of their names.

| Column | Type    | Constraints  | Description | Example |
|----------------|--------------|-----------|-------------|----------------|
| AuthId | int(6) | NOT NULL | AuthId |  `13` |
| VariantName   | varchar(50)  | NOT NULL  | variant name spelling | `Sir William D'Avenant` |
| VarNameClean  | varchar(50)  | NULL  | normalized variant spelling |  `Sir William DAvenant` |

## Cast
Stores information about casting lists from *The London Stage*.

| Column | Type | Constraints | Description | Example |
|--------------------|-----------|------------------|--------------------|----------------|
| CastId  | int(6)  | PRIMARY KEY, AUTO_INCREMENT  | unique identifier for casting | `3` |
| PerformanceId | int(6) | NOT NULL | PerformanceId  | `24` |
| Role  | varchar(50)  | NOT NULL | Role name  | `Duke's Sister` |
| Performer  | text  | NOT NULL  | Performer as named in the cast list | `Kynaston` |
| RoleClean  | varchar(50)  | NULL, FULLTEXT INDEX | cleaned role, indexed for faceted search |`Dukes Sister`|
| PerformerClean | text  | NULL, FULLTEXT INDEX | cleaned performer, indexed for faceted search | `Kynaston` |

## Events
Stores information about nightly events from *The London Stage*.

| Column | Type | Constraints  | Description | Example |
|-----------|---------|-----------|-------------|----------------------|
| EventId  | int(6)       | PRIMARY KEY, NOT NULL   | unique identifier | `52491`  |
| EventDate | int(8)       | NOT NULL, INDEX  | performance date in YYYYMMDD form | `18000603` |
| TheatreCode | varchar(16)  | NOT NULL, INDEX  | theatre code from *The London Stage* | `dl` |
| Season  | varchar(9)   | NOT NULL  | theatrical season | `1799-1800`  |
| Volume | varchar(1)   | NOT NULL  | associated volume of *The London Stage* | `5` |
| Hathi  | varchar(5)   | NOT NULL  | indicates whether the entry was extracted from the HathiTrust scans of the *London Stage* books | `hathi` |
| CommentC | text  | NOT NULL   |  |`By Desire of His Excellency The <i>Turkish Ambassador</i> [$Ismail Ferrouh Effendi=].  Benefit for $Miss Leak=.  ["His Excellency never made his appearance during the whole evening" (<i>Dramatic Censor</i>, II, 238).]  Afterpiece: By permission of the Proprietor of the Theatre Royal, <i>Covent Garden</i>.  <i>Morning Chronicle</i>, 22 May: Tickets to be had of Miss Leak, <i>Upper Mews-gate</i>, <i>Castle-street</i>.  Receipts: #445 9s. (101.11; 64.1; 2.14; tickets: 277.3) (charge: #212 3s. 5d.)` |
| TheatreId  | int(6) | NOT NULL, INDEX | TheatreId |`95`|
| Phase2 | text | NOT NULL  | annotated text in the second phase of textual extraction | `*p1800 06 03 dl She Wou'd and She Wou'd Not.  ^As18000515^, but Rosara (with a new <i>song</i>, composed by $deLanza=)-Miss Leak (1st appearance in that character); Diego-_.*a1800 06 03 dl Robin Hood.  Robin Hood-Sedgwick; Little John (with <i>All in Preparation</i>, from <i>The Haunted Tower</i>)-Bannister Jun.; Ruttekin-Wathen; Edwin (1st time)-Dignum; Annette (with <i>Little Taffline; or, The Silken Sash</i>)-Mrs Bland; Clarinda-Miss Leak; Angelina-Miss DeCamp.*s1800 06 03 dl End: a new <i>song</i> (composed by $Dr Arnold=,)-Miss Leak; accompanied on the Tamborine-Miss Leak.*b1800 06 03 dl After Singing: <i>The Scotch Ghost</i>.  ^As17991202^.*c1800 06 03 dl By Desire of His Excellency The <i>Turkish Ambassador</i> [$Ismail Ferrouh Effendi=].  Benefit for $Miss Leak=.  ["His Excellency never made his appearance during the whole evening" (<i>Dramatic Censor</i>, II, 238).]  Afterpiece: By permission of the Proprietor of the Theatre Royal, <i>Covent Garden</i>.  <i>Morning Chronicle</i>, 22 May: Tickets to be had of Miss Leak, <i>Upper Mews-gate</i>, <i>Castle-street</i>.  Receipts: #445 9s. (101.11; 64.1; 2.14; tickets: 277.3) (charge: #212 3s. 5d.).`  |
| Phase1 | text | NOT NULL  | annotated text in the first phase of textual extraction | `*p  dl She Wou'd and She Wou'd Not.  As 15 May, but Rosara (with a new <i>song</i>, composed by $deLanza=)-Miss Leak (1st appearance in that character); Diego-_.  *aRobin Hood.  Robin Hood-Sedgwick; Little John (with <i>All in Preparation</i>, from <i>The Haunted Tower</i>)-Bannister Jun.; Ruttekin-Wathen; Edwin (1st time)-Dignum; Annette (with <i>Little Taffline; or, The Silken Sash</i>)-Mrs Bland; Clarinda-Miss Leak; Angelina-Miss DeCamp.  *sEnd: [a new% <i>song</i> (composed by $Dr Arnold=,)-Miss Leak; accompanied on the Tamborine-Miss Leak.  *bAfter Singing: <i>The Scotch Ghost</i>.  As 2 Dec. 1799.  *cBy Desire of His Excellency The <i>Turkish Ambassador</i> [$Ismail Ferrouh Effendi=].  Benefit for $Miss Leak=.  ["His Excellency never made his appearance during the whole evening" (<i>Dramatic Censor</i>, II, 238).]  Afterpiece: By permission of the Proprietor of the Theatre Royal, <i>Covent Garden</i>.  <i>Morning Chronicle</i>, 22 May: Tickets to be had of Miss Leak, <i>Upper Mews-gate</i>, <i>Castle-street</i>.  Receipts: #445 9s. (101.11; 64.1; 2.14; tickets: 277.3) (charge: #212 3s.5d.).` |
| CommentCClean | text  | NULL, FULLTEXT INDEX  | cleaned comments, indexed for faceted search | `By Desire of His Excellency The Turkish Ambassador Ismail Ferrouh Effendi  Benefit for Miss Leak  His Excellency never made his appearance during the whole evening Dramatic Censor II 238  Afterpiece By permission of the Proprietor of the Theatre Royal Covent Garden  Morning Chronicle 22 May Tickets to be had of Miss Leak Upper Mews gate Castle street  Receipts 445 9s 10111 641 214 tickets 2773 charge 212 3s 5d` |
| BookPDF | varchar(30)  | NOT NULL | associated page from *The London Stage* | `vol5-3/840.pdf` |

## Performances
Stores information about individual performances within nightly events from *The London Stage*.

| Column | Type | Constraints | Description | Example |
|-----------|-------------|-------------------------|-------------|----------------------|
| PerformanceId | int(6) | UNIQUE, NOT NULL | unique identifier | `117000` |
| EventId |int(6)| NOT NULL, INDEX | corresponding EventId |`52436` |
| PerformanceOrder | int(1) | NOT NULL | order within event, zero-based | `0`|
| PType|varchar(2) | NOT NULL | Performance type: `a` afterpiece, `b` ballet, `d` dance, `e` entertainment, `i` instrumental, `m` music, `o` opera, `p` mainpiece, `s` song, `u` monologue | `p` |
| PerformanceTitle| text | NOT NUL | title | `De Montfort` |
| CommentP | text | NOT NULL | annotated comment from *The London Stage* |` As18000503, but <i>Epilogue</i>-Mrs Siddons.`|
| CastAsListed | text | NOT NULL | cast list (or ladder) as it appears | ` but <i>Epilogue</i>-Mrs Siddons.` |
| DetailedComment | text | NOT NULL | full performance comment from the *London Stage* | `De Montfort.  As18000503, but <i>Epilogue</i>-Mrs Siddons` |
| WorkId |int(6)|NULL, INDEX | WorkId |`3541`|
| PerfTitleClean | text | NULL, FULLTEXT INDEX | cleaned title, indexed for faceted search | `De Montfort` |
| CommentPClean | text | NULL, FULLTEXT INDEX | cleaned comment, indexed for keyword search | ` As18000503 but Epilogue Mrs Siddons` |

## Theatre
Stores information about theatres mentioned in each volume of *The London Stage*.

| Column | Type | Constraints | Description | Example |
|-----------|-------------|------------|-------------|----------------------|
| TheatreId | int(6)| UNIQUE, AUTO_INCREMENT | unique identifier | `50` |
| Volume | int(1) | NOT NULL, INDEX | volume of *The London Stage* in which this theatre occurs | `1` |
| TheatreCode |char(15)| NOT NULL, INDEX | theatre code from *The London Stage*  | `CG` |
| TheatreName |char(100)| NOT NULL, FULLTEXT INDEX | full theatre name from *The London Stage* | `Covent Garden` |

## WorkAuthMaster
Stores mappings between works, authors, and the source of those authorship inferences.

| Column | Type | Constraints | Description |Example |
|-----------------------|---------------|-------------|-------------|----------------|
| WorkId | int(6) | NOT NULL, INDEX | WorkId | `87` |
| Title | text | NOT NULL | title of linked work | `The Earl of Essex` |
| AuthId | int(6) | NOT NULL, INDEX | AuthId | `198` |
| AuthType | varchar(15)| NOT NULL | authorship inference type `Primary`, `Researched`, `Source1`, `Source2` | `Researched` |
| TitleClean | text | NULL, FULLTEXT INDEX | cleaned title, indexed for searching | `The Earl of Essex` |

## Works
Stores information about works mentioned in *The London Stage* along with notes about where that information came from. Compiled by Emma Hallock.

| Column Name | Data Type | Constraints | Description |Example Value |
|---------------|---------------|-------------|-------------------------------|----------------|
| WorkId | int(6) | PRIMARY KEY, NOT NULL | unique identifier | `84` |
| Title | text | NOT NULL | work title | `Cinna's Conspiracy` |
| Type1 | varchar(20) | NOT NULL | primary peformance type | `mainpiece` |
| Type2 | varchar(20) | NOT NULL | secondary performance type, if any | `mainpiece` |
| Source1 | varchar(100) |NOT NULL | source work, if any | `Cinna ou La Clemence D'Auguste` |
| Source2 | varchar(100) | NOT NULL | secondary source work, if any | `The Non-Juror` |
| SourceResearched | varchar(100)| NOT NULL | | `Love in a Riddle` |
| PubDate | varchar(20) | NOT NULL | publication date | `1713` |
| PubDateSource | varchar(100) | NOT NULL | source for date: `ESTC` *English Short Title Catalogue* , `checklist` Burling's *A Checklist of New Plays and Entertainments* or `TLS` *The London Stage* | `checklist` |
| Notes | text | NOT NULL | notes from Emma Hallock | `A burlesque of Lee's The Rival Queens` |
| TitleClean | text | NULL, FULLTEXT INDEX | cleaned title, indexed for search | `Cinnas Conspiracy` |


## WorksTCP
Stores matches between LSDB works, keyed by WorkId, and TCP files, keyed by TCPId. 
Organized as one match perrow. Manually curated by Michele Pflug.

| Column | Type | Constraints  | Description | Example |
|-----------------------|---------------|-------------|-------------|----------------|
| TCPId | varchar(11) | NOT NULL, PRIMARY KEY (composite) | TCP project identifier  | `K044879.000` |
| WorkId  | int(4)  | NOT NULL, PRIMARY KEY (composite) | LSDB WorkId | `13` |
| MatchType | varchar(10) | NULL  | Type of match, `collection` indicates a match to a part of a collection  | `match` |


## TCP
Stores metadata for the EEBO-TCP XML files linked to peformances in the database, one file per row. All fields except the ShortTitle and ShortTitleClean columns are derived from the P4 XML headers of each file. 

The ShortTitle and ShortTitleClean columns were extracted from the [English Short Title Catalogue (ESTC)](https://datb.cerl.org/estc) for purposes of providing an accepted short title for web interfaces.

| Column Name | Type  | Constraints  | Description | Example |
|------------|-------|-------------|--------------------------|----------------|
| TCPId | varchar(11)   | PRIMARY KEY, NOT NULL | TCP project identifier | `K131816.000` |
| Phase  | varchar(16)   | NULL | TCP project phase (EEBO Phase 1, EEBO Phase 2, or ECCO) | `ECCO` |
| File | varchar(18)   | NOT NULL  | P4 XML filepath | `K131816.000.P4.xml`|
| Title | varchar(493)  | NULL | full title |`Three weeks after marriage: a comedy, in two acts, as performed at the Theatre-Royal in Covent Garden.` |
| AltTitle  | varchar(270)  | NULL | alternative title (if any) |`What we must all come to` |
| Author | varchar(344)  | NULL | author(s) and dates flourished semicolon-separated | `Murphy, Arthur, 1727-1805.` |
| CleanDate            | int(4)        | NULL | RawDate in YYYY form | `1775` |
| RawDate              | varchar(29)   | NULL | Publication date, sometimes attributed | `[1775?]` |
| Publisher            | varchar(198)  | NULL | Publisher's name, from PublicationStatement |  `printed for E. Johnson,`|
| PublicationStatement | varchar(225)  | NULL  | The full publication statement of the printed work   | `London :printed for E. Johnson,[1775?]`              |
| PublicationPlace     | varchar(23)   | NULL                  | City or country of publication, from PublicationStatement  | `London :` |
| XMLNotes | varchar(1805) | NULL | Miscellaneous notes on the source text and its microfilm counterpart | `Anonymous. By Arthur Murphy.; Originally performed and published in 1764 as 'What we must all come to'.; Reproduction of original from the British Library.; English Short Title Catalog, ESTC T224568.; Electronic data. Farmington Hills, Mich. : Thomson Gale, 2003. Page image (PNG). Digitized image of the microfilm version produced in Woodbridge, CT by Research Publications, 1982-2002 (later known as Primary Source Microfilm, an imprint of the Gale Group).`  |
| ESTC   | varchar(7)    | NULL   |  *English Short Title Catalogue* (1473-1800) identifier | `T224568` |
| STC  | varchar(11)   | NULL  | *Short Title Catalogue* (1475-1640) identifier  | `10854`  |
| Wing   | varchar(20)   | NULL  | Wing's *Short-Title Catalogue* (1641-1700) identifier  |  `B1581` |
| EEBOMarc | varchar(8) | NULL | Proquest [MARC identifier](https://proquest.libguides.com/eebopqp) (EEBO only) | `12491932` |
| GaleDocNo | varchar(12)   | NULL  | Gale identifier (ECCO only)  | `CW3307696075`|
| DocNo | varchar(11)   | NULL  | Gale document identifier (ECCO only) | `CW107696075` |
| ShortTitle | varchar(389)  | NOT NULL | ESTC short title | `Three weeks after marriage;` |
| ShortTitleClean | varchar(388)  | NOT NULL | ShortTitle with end punctuation stripped | `Three weeks after marriage` |

## WorksVariant
Stores mappings between works and their variant titles.s

| Column | Type | Constraints | Description | Example |
|------------|-------|-------------|--------------------------|----------------|
| WorkId |int(6)| NOT NULL, INDEX | WorkId | `521` |
| VariantName |varchar(50)| NOT NULL, FULLTEXT INDEX | alternative title | `Harlequin Restor'd, or The Country Revels` |
| NameClean | varchar(50) | NULL | cleaned alternative title | `Harlequin Restord or The Country Revels` |
