PROGRAM Election;

USES Election1b;

VAR
    z: ballotBox;
    count: INTEGER;
BEGIN
    Voting(z, count);
    CandidateVote(z, count);
    Winner(z, count);
    ShowVoters(z, count);
END.