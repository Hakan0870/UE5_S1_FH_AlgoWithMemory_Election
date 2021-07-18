PROGRAM Election;

CONST
    maxBallot = 538;

TYPE
    usStates = (AL, AK, AZ, AR, CA, CO, CT, DE, DC, FL, GA, HI, ID, IL, IA, KS, KY, LA, ME, MD, MA, MI, MN, MS, MO, MT, NE, NV, NH, NJ, NM, NY, NC, ND, OH, OK, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY, PR);
    candidates = (A, B, C, D);

    Ballot = RECORD
        name: STRING;
        state: usStates;
        vote: candidates;
    END;
    
    ballotBox = ARRAY[1..maxBallot] OF Ballot;

PROCEDURE Voting(VAR z: ballotBox; VAR count: INTEGER);
VAR
    i, j, k: INTEGER;
    l: STRING;
    m: usStates;
    n: candidates;
    check: BOOLEAN;
BEGIN
    count := 0;
    i := 1;
    WHILE i <= maxBallot DO BEGIN
        WriteLn('Enter 1 for new entry, 0 for end voting: ');
        ReadLn(j);
        IF j = 1 THEN BEGIN
            WriteLn('Enter your Surname: ');
            ReadLn(l);
            k := 1;
            check := FALSE;
            WHILE k <= maxBallot DO BEGIN
                IF l = z[k].name THEN BEGIN
                    check := TRUE;
                    k := maxBallot + 1;
                END
                ELSE BEGIN
                    k := k + 1;
                END
            END;
            IF check = FALSE THEN BEGIN
                z[i].name := l;
                WriteLn('Enter your state postal abbrevation:');
                ReadLn(m);
                z[i].state := m;
                WriteLn('Enter your voting');
                WriteLn('A = Trump, B = Biden, C = Hawkins, D = Jorgensen');
                ReadLn(n);
                z[i].vote := n;
                i := i + 1;
                count := count + 1;
            WriteLn('Vote accepted!');
            WriteLn();
            END
            ELSE IF check = TRUE THEN
                WriteLn('Name already entered!');
        END
        ELSE 
            i := maxBallot + 1;
    END;
    IF i = maxBallot THEN
        WriteLn('Ballotbox full!');
END;

PROCEDURE CandidateVote(VAR z: ballotBox; count: INTEGER);
VAR
    a, b, c, d, i: INTEGER;
BEGIN
    a := 0;
    b := 0;
    c := 0;
    d := 0;
    FOR i := 1 TO count DO BEGIN
        IF z[i].vote = candidates(0) THEN
            a := a + 1
        ELSE IF z[i].vote = candidates(1) THEN
            b := b + 1
        ELSE IF z[i].vote = candidates(2) THEN
            c := c + 1
        ELSE IF z[i].vote = candidates(3) THEN
            c := c + 1
    END;
    WriteLn();
    WriteLn();
    WriteLn();
    WriteLn('Vote for each candidate:');
    WriteLn('Trump: ', a);
    WriteLn('Biden: ', b);
    WriteLn('Hawkins: ', c);
    WriteLn('Jorgensen: ', d);
    WriteLn();
END;


PROCEDURE Winner(VAR z: ballotBox; count: INTEGER);
VAR
    a, b, c, d, i: INTEGER;
    win: INTEGER;
BEGIN
    a := 0;
    b := 0;
    c := 0;
    d := 0;
    FOR i := 1 TO count DO BEGIN
        IF z[i].vote = candidates(0) THEN
            a := a + 1
        ELSE IF z[i].vote = candidates(1) THEN
            b := b + 1
        ELSE IF z[i].vote = candidates(2) THEN
            c := c + 1
        ELSE IF z[i].vote = candidates(3) THEN
            c := c + 1
    END;
    IF (a >= b) AND (a >= c) AND (a >= d) THEN 
		win := a
	ELSE IF (b >= a) AND (b >= c) AND (b >= d) THEN
		win := b
    ELSE IF (c >= a) AND (c >= b) AND (c >= d) THEN
		win := c
	ELSE
		win := d;
    IF win = a THEN 
        WriteLn('Trump is the winner!')
    ELSE IF win = b THEN 
        WriteLn('Biden is the winner!')
    ELSE IF win = c THEN 
        WriteLn('Hawkins is the winner!')
    ELSE IF win = d THEN 
        WriteLn('Jorgensen is the winner!');
    WriteLn();
END;

PROCEDURE ShowVoters(VAR z:ballotBox; count: INTEGER);
VAR
    i: INTEGER;
BEGIN
    WriteLn('Voterslist:');
    FOR i := 1 TO count DO BEGIN
        WriteLn(z[i].name, ', ', z[i].state, ', ', z[i].vote);
    END;
END;






VAR
    z: ballotBox;
    count: INTEGER;
BEGIN
    Voting(z, count);
    CandidateVote(z, count);
    Winner(z, count);
    ShowVoters(z, count);
END.