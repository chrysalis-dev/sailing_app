class Competition
{
    Name: string;
    StartDate: Date;
    EndDate: Date;
    Races: Array<Race> = new Array<Race>();

    constructor(name: string, start: Date, end: Date)
    {
        this.Name = name;
        this.StartDate = start;
        this.EndDate = end;
    }
}

class Race
{
    RaceID: number;
    RaceDate: Date;
    Results: Array<RaceResult> = new Array<RaceResult>();

    constructor(id: number, date: Date)
    {
        this.RaceID = id;
        this.RaceDate = date;
    }
}

class RaceResult
{
    BoatID: number;
    Rank: number;
    ElapsedTime: number;
    Laps: number;
    CorrectedTime: number;
    Points: number;
    SpecialMentions: string;

    constructor(id: number, rank: number, elapsed: number, laps: number, corrected: number, points: number, mentions: string)
    {
        this.BoatID = id;
        this.Rank = rank;
        this.ElapsedTime = elapsed;
        this.Laps = laps;
        this.CorrectedTime = corrected;
        this.Points = points;
        this.SpecialMentions = mentions;
    }
}

class Boat
{
    BoatID: number;
    HelmName: string;
    CrewName: string;
    PY: number;
    BoatClass: string;

    constructor(id: number, helmName: string, crewName: string, py: number, boatClass: string)
    {
        this.BoatID = id;
        this.BoatClass = boatClass;
        this.HelmName = helmName;
        this.CrewName = crewName;
        this.PY = py;
    }
}
