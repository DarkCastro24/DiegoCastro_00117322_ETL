-- CONSULTA UTILIZADA EN EL ETL 
SELECT
    c.CustomerID AS CustomerKey,
    c.TerritoryID AS GeographyKey,
    p.Title,
    p.FirstName,
    p.MiddleName,
    p.LastName,
    p.NameStyle,
    e.BirthDate AS BirthDate,
    e.MaritalStatus AS MaritalStatus,
    p.Suffix,
    e.Gender,
    ea.EmailAddress,
    NULL AS YearlyIncome,
    NULL AS TotalChildren,
    NULL AS NumberChildrenAtHome,
    NULL AS EnglishEducation,
    NULL AS SpanishEducation,
    NULL AS FrenchEducation,
    NULL AS EnglishOccupation,
    NULL AS SpanishOccupation,
    NULL AS FrenchOccupation,
    NULL AS HouseOwnerFlag,
    NULL AS NumberCarsOwned,
    a.AddressLine1,
    a.AddressLine2,
    ph.PhoneNumber AS Phone,
    NULL AS DateFirstPurchase,
    NULL AS CommuteDistance
FROM 
    Sales.Customer c
LEFT JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
LEFT JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN Person.EmailAddress ea ON ea.BusinessEntityID = p.BusinessEntityID
LEFT JOIN Person.BusinessEntityAddress bea ON bea.BusinessEntityID = p.BusinessEntityID
LEFT JOIN Person.Address a ON bea.AddressID = a.AddressID
LEFT JOIN Person.PersonPhone ph ON ph.BusinessEntityID = p.BusinessEntityID

-- Tabla utilizada para probar el ETL en DW
CREATE TABLE dbo.DimCustomerETL(
    CustomerKey INT,
    GeographyKey INT NULL,
    Title NVARCHAR(8) NULL,
    FirstName NVARCHAR(50) NULL,
    MiddleName NVARCHAR(50) NULL,
    LastName NVARCHAR(50) NULL,
    NameStyle BIT NULL,
    BirthDate DATE NULL,
    MaritalStatus NCHAR(1) NULL,
    Suffix NVARCHAR(10) NULL,
    Gender NCHAR(1) NULL,
    EmailAddress NVARCHAR(50) NULL,
    YearlyIncome MONEY NULL,
    TotalChildren TINYINT NULL,
    NumberChildrenAtHome TINYINT NULL,
    EnglishEducation NVARCHAR(40) NULL,
    SpanishEducation NVARCHAR(40) NULL,
    FrenchEducation NVARCHAR(40) NULL,
    EnglishOccupation NVARCHAR(100) NULL,
    SpanishOccupation NVARCHAR(100) NULL,
    FrenchOccupation NVARCHAR(100) NULL,
    HouseOwnerFlag BIT NULL,
    NumberCarsOwned TINYINT NULL,
    AddressLine1 NVARCHAR(60) NULL,
    AddressLine2 NVARCHAR(60) NULL,
    Phone NVARCHAR(25) NULL,
    DateFirstPurchase DATE NULL,
    CommuteDistance NVARCHAR(15) NULL
);
