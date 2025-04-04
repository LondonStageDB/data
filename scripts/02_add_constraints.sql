-- @wintere, March 2025
-- Applies foreign key constraints defined but never implemented in 2018

-- Every PerformanceID referenced in AsSeeDate must reference a PerformanceId in Performances
ALTER TABLE AsSeeDate
    ADD FOREIGN KEY (PerformanceId)
    REFERENCES Performances (PerformanceId);

-- Every TheatreCode referenced in AsSeeDate must refer to a TheatreCode in Theatre
ALTER TABLE AsSeeDate
    ADD FOREIGN KEY (TheatreCode)
    REFERENCES Theatre (TheatreCode);

-- Every AuthID in AuthorVariant must reference an AuthId in Author
ALTER TABLE AuthorVariant
    ADD FOREIGN KEY  (AuthId)
    REFERENCES Author (AuthId);

-- Every PerformanceID in Cast must reference a PerformanceID in Performances
ALTER TABLE Cast
    ADD FOREIGN KEY (PerformanceId)
    REFERENCES Performances (PerformanceId);

-- Every TheatreCode referenced in Events must refer to a TheatreCode in Theatre
ALTER TABLE Events
    ADD FOREIGN KEY (TheatreCode)
    REFERENCES Theatre (TheatreCode);

-- Every TheatreID referenced in Events must refer to a TheatreId in Theatre
ALTER TABLE Events
    ADD FOREIGN KEY (TheatreId)
    REFERENCES Theatre (TheatreId);

-- Every EventId referenced in Performances must refer to an EventId in Events
ALTER TABLE Performances
    ADD FOREIGN KEY (EventId)
    REFERENCES Events (EventId);

-- Every WorkId referenced in Performances must refer to a WorkId in Works
ALTER TABLE Performances
    ADD FOREIGN KEY (WorkId)
    REFERENCES Works (WorkId);

-- Every WorkId referenced in WorkAuthMaster must refer to a WorkId in Works
ALTER TABLE WorkAuthMaster
    ADD FOREIGN KEY (WorkId)
    REFERENCES Works (WorkId);

-- Every AuthId referenced in WorkAuthMaster must refer to a WorkId in Works
ALTER TABLE WorkAuthMaster
    ADD FOREIGN KEY (AuthId)
    REFERENCES Author (AuthId);

-- Every WorkId referenced in WorksVariant must refer to a WorkId in Works
ALTER TABLE WorksVariant
    ADD FOREIGN KEY (WorkId)
    REFERENCES Works (WorkId);