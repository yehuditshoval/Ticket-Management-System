------------------ בניית טבלאות ------------------

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL
);

CREATE TABLE Hole (
    Id INT PRIMARY KEY IDENTITY(1,1),
    numOfLine INT NOT NULL,
    numOfSeatLine INT NOT NULL
);

CREATE TABLE Event (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(200) NOT NULL,
    Date DATETIME NOT NULL,
    Location NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    HoleId INT NOT NULL,
    NumTicket INT NOT NULL,
    NumTicketExist INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (HoleId) REFERENCES Hole(Id)
);

CREATE TABLE Seat (
    Id INT PRIMARY KEY IDENTITY(1,1),
    EventId INT NOT NULL,
    numLine INT NOT NULL,
    SeatNumber INT NOT NULL,
    IsAvailable BIT NOT NULL DEFAULT 1,
    IsAccessible BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (EventId) REFERENCES Event(Id)
);

CREATE TABLE SeatAssignments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    EventId INT NOT NULL,
    UserId INT NOT NULL,
    SeatId INT NOT NULL,

    FOREIGN KEY (EventId) REFERENCES Event(Id),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (SeatId) REFERENCES Seat(Id)
);

CREATE TABLE Tickets (
    Id INT PRIMARY KEY IDENTITY(1,1),
    EventId INT NOT NULL,
    UserId INT NOT NULL,
    NumOfTickets INT NOT NULL,

    NeedsAccessibleSeat BIT NOT NULL DEFAULT 0,
    PrefersCloserToStage BIT NOT NULL DEFAULT 0,
    PrefersCenter BIT NOT NULL DEFAULT 0,
    PrefersAisleSeat BIT NOT NULL DEFAULT 0,
    PreferredRow INT NULL,

    FOREIGN KEY (EventId) REFERENCES Event(Id),
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);

---------------------הכנסת משתמשים---------------------------
INSERT INTO Users (Name, Email, Password)
VALUES 
('יהודית', 'yehudit.shoval@gmail.com', 'AAAaaa111'),
('תמר', 'tamars0583210294@gmail.com', 'Password123!'),
('נאוה', 'navash1818@gmail.com', 'SecureP@ss2025'),
('אלאסף', 'elasafshoval@gmail.com', 'MySuperSecure123!'),
('אלקנה', 'e0504127688@gmail.com', 'P@ssw0rd2024'),
('ידידיה', 'a0556789833@gmail.com', 'P@ssw0rd2024'),
('הודיה', 'h0556792025@gmail.com', 'P@ssw0rd2067'),
('בת שבע', 'bsadan95@gmail.com', 'P@ssw0rd4467'),
('אליעזר', 'eliezer@gmail.com', 'asdASD123');
------------------הכנסת סוגי אולמות-------------------------

INSERT INTO Hole (numOfLine, numOfSeatLine)
VALUES 
(10, 20),  -- אולם עם 10 שורות ו-20 מושבים בכל שורה
(2, 5),  -- אולם עם 15 שורות ו-25 מושבים בכל שורה
(12, 18),  -- אולם עם 12 שורות ו-18 מושבים בכל שורה
(8, 30),   -- אולם עם 8 שורות ו-30 מושבים בכל שורה
(20, 15);  -- אולם עם 20 שורות ו-15 מושבים בכל שורה


-------------------הכנסת ארועים עם הכנסה איזה אולם------------------------------
INSERT INTO Event (Name, Date, Location, Description, HoleId, NumTicket, NumTicketExist, Price)
VALUES 
('הופעה באArena', '2025-04-15 20:00:00', 'היכל ארנה, תל אביב', 'הופעה מדהימה עם ביצועים מרהיבים', 1, 5, 5, 150),
('ערב קומדיה סטנד-אפ', '2025-05-20 21:00:00', 'תיאטרון ירושלים', 'ערב של צחוק עם קומיקאים מהשורה הראשונה', 2, 10, 10, 120),
('פסטיבל רוק', '2025-06-10 18:00:00', 'אצטדיון חיפה', 'פסטיבל עם להקות רוק פופולריות', 3, 5, 5, 100),
('מחזה: המלט', '2025-07-01 19:30:00', 'תיאטרון באר שבע', 'מחזה קלאסי של שייקספיר', 4, 9, 9, 80),
('ליל ג׳אז', '2025-08-05 22:00:00', 'מועדון ג׳אז תל אביב', 'ליל ג׳אז בלתי נשכח עם מוזיקה חלקה', 5, 20, 20, 100);
------------------הכנסת מקומות ישיבה של ארוע---------------

INSERT INTO Seat (EventId, numLine, SeatNumber, IsAvailable, IsAccessible)
VALUES
(2, 1, 1, 1, 0), (2, 1, 2, 1, 0), (2, 1, 3, 1, 1), (2, 1, 3, 1, 0), (2, 1, 4, 1, 1),
(2, 2, 1, 1, 0), (2, 2, 2, 1, 0), (2, 2, 3, 1, 1), (2, 2, 4, 1, 0), (2, 2, 5, 1, 1);
