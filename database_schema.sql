-- 1. Laender (Ülkeler)
CREATE TABLE Laender (
    IsoCode CHAR(2) PRIMARY KEY, -- Örn: DE, PL, TR
    CountryName VARCHAR(100) NOT NULL
);

-- 2. Hubs (Operasyon Merkezleri)
CREATE TABLE Hubs (
    HubID INT IDENTITY(1,1) PRIMARY KEY,
    HubName VARCHAR(100) NOT NULL,
    IsoCode CHAR(2) NOT NULL FOREIGN KEY REFERENCES Laender(IsoCode) -- FK alt tabloda
);

-- 3. Kunden (Müşteriler - Gönderici/Alıcı)
CREATE TABLE Kunden (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    IsoCode CHAR(2) FOREIGN KEY REFERENCES Laender(IsoCode) -- FK alt tabloda
);

-- 4. Sendungsarten (Kargo Türleri)
CREATE TABLE Sendungsarten (
    TypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL -- Document, Parcel vb.
);

-- 5. Statuscodes (Durum Kodları)
CREATE TABLE Statuscodes (
    StatusCodeID INT PRIMARY KEY,
    Description VARCHAR(100) NOT NULL -- Gümrükte, Hub'a Ulaştı, Dağıtımda
);

-- 6. Kuriere (Kuryeler)
CREATE TABLE Kuriere (
    CourierID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    VehiclePlate VARCHAR(20),
    Phone VARCHAR(20)
);

-- 7. Sendungen (Ana Kargo Operasyonları)
CREATE TABLE Sendungen (
    ShipmentID INT IDENTITY(1,1) PRIMARY KEY,
    TrackingNumber VARCHAR(50) UNIQUE NOT NULL,
    SenderID INT NOT NULL FOREIGN KEY REFERENCES Kunden(CustomerID), -- FK alt tabloda
    ReceiverID INT NOT NULL FOREIGN KEY REFERENCES Kunden(CustomerID), -- FK alt tabloda
    TypeID INT NOT NULL FOREIGN KEY REFERENCES Sendungsarten(TypeID), -- FK alt tabloda
    Weight DECIMAL(5,2),
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- 8. Tracking_Logs (Zaman Damgalı Hareket Geçmişi)
CREATE TABLE Tracking_Logs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    ShipmentID INT NOT NULL FOREIGN KEY REFERENCES Sendungen(ShipmentID), -- FK alt tabloda
    HubID INT FOREIGN KEY REFERENCES Hubs(HubID), -- Kuryedeyse NULL geçilebilir
    CourierID INT FOREIGN KEY REFERENCES Kuriere(CourierID), -- Merkezdeyse NULL geçilebilir
    StatusCodeID INT NOT NULL FOREIGN KEY REFERENCES Statuscodes(StatusCodeID), -- FK alt tabloda
    LogTime DATETIME DEFAULT GETDATE()
);