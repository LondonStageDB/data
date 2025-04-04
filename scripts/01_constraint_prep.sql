-- @wintere, March 2025
-- Applies corrections to rows that break intended constraints

-- 1. Replace WorkID 0 with null in Performances where no mapping is known

-- Allow nulls
ALTER TABLE Performances
    MODIFY WorkId int(6) NULL;

-- Replace placeholder ID 0 with NULL
UPDATE Performances
    SET Performances.WorkId=NULL
    WHERE Performances.WorkId=0;

-- 2. Correct rows with invalid TheatreCodes with corrections from @mattieburkert

-- corrects transcription error: lordg -> dlordg
UPDATE Events
    SET Events.TheatreCode='dlordg', Events.TheatreId=102
    WHERE Events.EventId=1803;

-- amends theatre code missing from v1 used in v2: at court
-- there are no prior usages of TheatreId 14
UPDATE Theatre
    SET Theatre.TheatreCode='AtCourt', Theatre.Volume=2
    WHERE Theatre.TheatreId=14;

-- updates theatre id accordingly for atcourt events missing theatreid
UPDATE Events
    SET Events.TheatreCode='atcourt', Events.TheatreId=14
    WHERE Events.EventId in (2358, 2747, 2783, 2841, 3369, 3636);

-- corrects transcription error: cg -> gg
UPDATE Events
    SET Events.TheatreCode='gg', Events.TheatreId=125
    WHERE Events.EventId=8671;

-- inserts missing theatre id and code
INSERT INTO Theatre VALUES (341, 3, 'GR', 'Great Room at the Ship Tavern')
  ON DUPLICATE KEY UPDATE Theatre.TheatreCode = 'GR';

-- amend event referencing missing theatrecode
UPDATE Events
    SET Events.TheatreCode='gr', Events.TheatreId=341
    WHERE Events.EventId in (16672, 16676);

-- transcription correction: theatrecode lr -> lrrh
UPDATE Events
    SET Events.TheatreCode='lrrh', Events.TheatreId=188
    WHERE Events.EventId=27915;

-- theatre id, code, transcription correction (this event is from volume 5, not 4),
UPDATE Events
    SET Events.TheatreCode='chr', Events.TheatreId=61, Events.Volume=5
    WHERE Events.EventId=38863;

-- transcription correction: theatrecode ch -> cg
UPDATE Events
    SET Events.TheatreCode='cg', Events.TheatreId=53
    WHERE Events.EventId=41971;