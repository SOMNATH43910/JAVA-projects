CREATE DATABASE librarydb;
USE librarydb;
CREATE TABLE UserCredentials (
    UserType VARCHAR(20),          
    UserID VARCHAR(50) PRIMARY KEY,  
    Password VARCHAR(100),
    LoginStatus VARCHAR(20)       
);

CREATE TABLE AdminProfile (
    UserID VARCHAR(50),
    Name VARCHAR(100),
    EmployeeID VARCHAR(20),
    EmailID VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES UserCredentials(UserID)
);

CREATE TABLE StudentProfile (
    UserID VARCHAR(50),
    Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    PresentAddress VARCHAR(255),
    PermanentAddress VARCHAR(255),
    PhoneNumber VARCHAR(15),
    EmailID VARCHAR(100),
    LibraryCardNum VARCHAR(20) PRIMARY KEY,
    BorrowingSts VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (UserID) REFERENCES UserCredentials(UserID)
);

CREATE TABLE PublisherDetails (
    PublisherId VARCHAR(20) PRIMARY KEY,
    PName VARCHAR(100),
    PAddress VARCHAR(255),
    PEmailID VARCHAR(100),
    ContactNum VARCHAR(15)
);
CREATE TABLE  AuthorDetails (
    AuthorId VARCHAR(20) PRIMARY KEY,
    AuthorName VARCHAR(100),
    AuthAddress VARCHAR(255),
    AuthEmailID VARCHAR(100),
    ContactNum VARCHAR(15)
);
CREATE TABLE BookDetails (
    BookId VARCHAR(20) PRIMARY KEY,
    BName VARCHAR(100),
    Price DECIMAL(10,2),
    AuthorId VARCHAR(20),
    PublisherId VARCHAR(20),
    Genre VARCHAR(50),    
    Qty INT,
    FOREIGN KEY (AuthorId) REFERENCES AuthorDetails(AuthorId),
    FOREIGN KEY (PublisherId) REFERENCES PublisherDetails(PublisherId)
);
CREATE TABLE  LibraryDetails (
    LibId VARCHAR(20) PRIMARY KEY,
    LibraryName VARCHAR(100),
    LibAddress VARCHAR(255),
    ManagementName VARCHAR(100),
    LibEstablishedDate DATE
);
CREATE TABLE BookIssueDetails (
    BookIssueId VARCHAR(20) PRIMARY KEY,
    StudentId VARCHAR(20),
    BookId VARCHAR(20),
    IssueDate DATE,
    ReturnDate DATE,
    OverdueFee DECIMAL(10,2),
    BookStatus VARCHAR(20) DEFAULT 'Good',
    FOREIGN KEY (StudentId) REFERENCES StudentProfile(LibraryCardNum),
    FOREIGN KEY (BookId) REFERENCES BookDetails(BookId)
);

DROP TABLE IF EXISTS BookIssueDetails;
DROP TABLE IF EXISTS StudentProfile;

CREATE TABLE StudentProfile (
    UserID VARCHAR(50),
    Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    PresentAddress VARCHAR(255),
    PermanentAddress VARCHAR(255),
    PhoneNumber VARCHAR(15),
    EmailID VARCHAR(100),
    LibraryCardNum VARCHAR(20) PRIMARY KEY,
    BorrowingSts VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (UserID) REFERENCES UserCredentials(UserID)
);
CREATE TABLE BookIssueDetails (
    BookIssueId VARCHAR(20) PRIMARY KEY,
    StudentId VARCHAR(20),
    BookId VARCHAR(20),
    IssueDate DATE,
    ReturnDate DATE,
    OverdueFee DECIMAL(10,2),
    BookStatus VARCHAR(20) DEFAULT 'Good',
    FOREIGN KEY (StudentId) REFERENCES StudentProile(LibraryCardNum),
    FOREIGN KEY (BookId) REFERENCES BookDetails(BookId)
);
SHOW CREATE TABLE StudentProfile;
describe StudentProfile;
describe UserCredentials;

-- Author details 
INSERT INTO AuthorDetails VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001'),
('A102', 'Sukumar Ray', 'Kolkata', 'sukumar@email.com', '9000000002');

-- Publisher details 
INSERT INTO PublisherDetails VALUES
('P101', 'Ananda Publishers', 'Kolkata', 'ananda@email.com', '9000000003'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000004');

-- Book details
INSERT INTO BookDetails VALUES
('B101', 'Gitanjali', 200.00, 'A101', 'P101', 'Poetry', 5),
('B102', 'Abol Tabol', 150.00, 'A102', 'P101', 'Poetry', 3),
('B103', 'Sahityamala Class 10', 100.00, 'A101', 'P102', 'Bengali', 7);

describe BookDetails;
Describe libraryDetails;
Describe librarydb;
SHOW TABLES FROM librarydb;
Select * FROM librarydb.BookDetails;
Select * FROM librarydb.PublisherDetails;
Select * FROM librarydb.LibraryDetails;
Select * FROM librarydb.UserCredentials;

Select * FROM librarydb.StudentProfile;

Select * FROM librarydb.UserCredentials,Password;


Select * FROM librarydb.UserCredentials; -- show the user id and password 

ALTER TABLE AuthorDetails
ADD COLUMN Biography TEXT;

ALTER TABLE AuthorDetails
CHANGE COLUMN ContactNum PhoneNumber VARCHAR(15);
ALTER TABLE AuthorDetails
MODIFY COLUMN AuthEmailID VARCHAR(150);

ALTER TABLE AuthorDetails
DROP COLUMN Biography;

DROP TABLE IF EXISTS Book;

SHOW TABLES FROM librarydb;

DESCRIBE BookDetails;


DESCRIBE AuthorDetails;
INSERT INTO BookDetai (col1, col2, ...) VALUES (...);

-- Author Details
INSERT INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001'),
('A102', 'Sukumar Ray', 'Kolkata', 'sukumar@email.com', '9000000002'),
('A121', 'Bibhutibhushan Bandopadhyay', 'North 24 Parganas', 'bibhuti@email.com', '9000000005');

-- Publisher Details
INSERT INTO PublisherDetails (PublisherId, PName, PAddress, PEmailID, ContactNum) VALUES
('P101', 'Ananda Publishers', 'Kolkata', 'ananda@email.com', '9000000003'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000004'),
('P103', 'Amar Jibon Publications', 'Motlek', 'amar@email.com', '9000000006');

-- Book Details
INSERT INTO BookDetails (BookId, BName, Price, AuthorId, PublisherId, Genre, Qty) VALUES
('B101', 'Gitanjali', 200.00, 'A101', 'P101', 'Poetry', 5),
('B102', 'Abol Tabol', 150.00, 'A102', 'P101', 'Poetry', 3),
('B103', 'Sahityamala Class 10', 100.00, 'A101', 'P102', 'Bengali', 7),
('T121', 'Taranath Tantrik', 120.00, 'A121', 'P103', 'Bengali', 4);

DROP DATABASE IF EXISTS librarydb;

-- Create Fresh Database
CREATE DATABASE librarydb;
USE librarydb;

-- 1. UserCredentials Table (Login info for Admin & Student)
CREATE TABLE UserCredentials (
    UserType VARCHAR(20), -- 'Admin' or 'Student'
    UserID VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(100),
    LoginStatus VARCHAR(20)
);

-- 2. AdminProfile Table
CREATE TABLE AdminProfile (
    UserID VARCHAR(50),
    Name VARCHAR(100),
    EmployeeID VARCHAR(20),
    EmailID VARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES UserCredentials(UserID)
);

--  3. StudentProfile Table
CREATE TABLE StudentProfile (
    UserID VARCHAR(50),
    Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    PresentAddress VARCHAR(255),
    PermanentAddress VARCHAR(255),
    PhoneNumber VARCHAR(15),
    EmailID VARCHAR(100),
    LibraryCardNum VARCHAR(20) PRIMARY KEY,
    BorrowingSts VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (UserID) REFERENCES UserCredentials(UserID)
);

--  4. AuthorDetails Table (AD-013)
CREATE TABLE AuthorDetails (
    AuthorId VARCHAR(20) PRIMARY KEY,
    AuthorName VARCHAR(100),
    AuthAddress VARCHAR(255),
    AuthEmailID VARCHAR(150),
    ContactNum VARCHAR(15)
);

-- 5. PublisherDetails Table
CREATE TABLE PublisherDetails (
    PublisherId VARCHAR(20) PRIMARY KEY,
    PName VARCHAR(100),
    PAddress VARCHAR(255),
    PEmailID VARCHAR(100),
    ContactNum VARCHAR(15)
);

-- 6. BookDetails Table (AD-018)
CREATE TABLE BookDetails (
    BookId VARCHAR(20) PRIMARY KEY,
    BName VARCHAR(100),
    Price DECIMAL(10,2),
    AuthorId VARCHAR(20),
    PublisherId VARCHAR(20),
    Genre VARCHAR(50),
    Qty INT,
    FOREIGN KEY (AuthorId) REFERENCES AuthorDetails(AuthorId),
    FOREIGN KEY (PublisherId) REFERENCES PublisherDetails(PublisherId)
);

-- 7. BookIssueDetails Table
CREATE TABLE BookIssueDetails (
    BookIssueId VARCHAR(20) PRIMARY KEY,
    StudentId VARCHAR(20),
    BookId VARCHAR(20),
    IssueDate DATE,
    ReturnDate DATE,
    OverdueFee DECIMAL(10,2),
    BookStatus VARCHAR(20) DEFAULT 'Good',
    FOREIGN KEY (StudentId) REFERENCES StudentProfile(LibraryCardNum),
    FOREIGN KEY (BookId) REFERENCES BookDetails(BookId)
);

-- 8. LibraryDetails Table
CREATE TABLE LibraryDetails (
    LibId VARCHAR(20) PRIMARY KEY,
    LibraryName VARCHAR(100),
    LibAddress VARCHAR(255),
    ManagementName VARCHAR(100),
    LibEstablishedDate DATE
);

INSERT INTO UserCredentials VALUES ('Admin', 'SR123', '1234', 'Active');
INSERT INTO AdminProfile VALUES ('SR123', 'Somnath Rana', '1234567', 'somnath123@gm.com');

-- ✍️ Authors
INSERT INTO AuthorDetails VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001'),
('A102', 'Sukumar Ray', 'Kolkata', 'sukumar@email.com', '9000000002'),
('A121', 'Bibhutibhushan Bandopadhyay', 'North 24 Parganas', 'bibhuti@email.com', '9000000005');

-- 🏢 Publishers
INSERT INTO PublisherDetails VALUES
('P101', 'Ananda Publishers','Kolkata','ananda@email.com', '9000000003'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000004'),
('P103', 'Amar Jibon Publications', 'Motlek', 'amar@email.com', '9000000006');

-- 📚 Books
INSERT INTO BookDetails VALUES
('B101', 'Gitanjali', 200.00, 'A101', 'P101', 'Poetry', 5),
('B102', 'Abol Tabol', 150.00, 'A102', 'P101', 'Poetry', 3),
('B103', 'Sahityamala Class 10', 100.00, 'A101', 'P102', 'Bengali', 7),
('T121', 'Taranath Tantrik', 120.00, 'A121', 'P103', 'Bengali', 4);

Describe UserCredentials;
Describe librarydb;
Describe libraryDetails;

DESCRIBE BookDetails;
SELECT * FROM BookDetails;

DROP TABLE BookDetails;
DROP TABLE IF EXISTS BookIssueDetails;
CREATE TABLE BookDetails (
    BookId VARCHAR(20) PRIMARY KEY,
    BName VARCHAR(100),
    Price DECIMAL(10,2),
    AuthorId VARCHAR(20),
    PublisherId VARCHAR(20),
    Genre VARCHAR(50),
    Qty INT,
    FOREIGN KEY (AuthorId) REFERENCES AuthorDetails(AuthorId),
    FOREIGN KEY (PublisherId) REFERENCES PublisherDetails(PublisherId)
);
DROP TABLE IF EXISTS BookDetails;

CREATE TABLE BookDetails (
    BookId VARCHAR(20) PRIMARY KEY,
    BName VARCHAR(100),
    Price DECIMAL(10,2),
    AuthorId VARCHAR(20),
    PublisherId VARCHAR(20),
    Genre VARCHAR(50),
    Qty INT,
    FOREIGN KEY (AuthorId) REFERENCES AuthorDetails(AuthorId),
    FOREIGN KEY (PublisherId) REFERENCES PublisherDetails(PublisherId)
);
CREATE TABLE BookIssueDetails (
    BookIssueId VARCHAR(20) PRIMARY KEY,
    StudentId VARCHAR(20),
    BookId VARCHAR(20),
    IssueDate DATE,
    ReturnDate DATE,
    OverdueFee DECIMAL(10,2),
    BookStatus VARCHAR(20) DEFAULT 'Good',
    FOREIGN KEY (StudentId) REFERENCES StudentProfile(LibraryCardNum),
    FOREIGN KEY (BookId) REFERENCES BookDetails(BookId)
);
SHOW TABLES;
DESCRIBE BookDetails;
SELECT * FROM BookDetails;

INSERT INTO UserCredentials VALUES ('Admin', 'SR123', '1234', 'Active');
INSERT INTO AdminProfile VALUES ('SR123', 'Somnath Rana', '1234567', 'somnath123@gm.com');

-- ✍️ Authors
INSERT INTO AuthorDetails VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001'),
('A102', 'Sukumar Ray', 'Kolkata', 'sukumar@email.com', '9000000002'),
('A121', 'Bibhutibhushan Bandopadhyay', 'North 24 Parganas', 'bibhuti@email.com', '9000000005');

-- 🏢 Publishers
INSERT INTO PublisherDetails VALUES
('P101', 'Ananda Publishers', 'Kolkata', 'ananda@email.com', '9000000003'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000004'),
('P103', 'Amar Jibon Publications', 'Motlek', 'amar@email.com', '9000000006');

-- 📚 Books
INSERT INTO BookDetails VALUES
('B101', 'Gitanjali', 200.00, 'A101', 'P101', 'Poetry', 5),
('B102', 'Abol Tabol', 150.00, 'A102', 'P101', 'Poetry', 3),
('B103', 'Sahityamala Class 10', 100.00, 'A101', 'P102', 'Bengali', 7),
('T121', 'Taranath Tantrik', 120.00, 'A121', 'P103', 'Bengali', 4);
----- error ----

-- Author Details (only if not inserted)
INSERT INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001'),
('A102', 'Sukumar Ray', 'Kolkata', 'sukumar@email.com', '9000000002'),
('A121', 'Bibhutibhushan Bandopadhyay', 'North 24 Parganas', 'bibhuti@email.com', '9000000005');

-- Publisher Details (only if not inserted)
INSERT INTO PublisherDetails (PublisherId, PName, PAddress, PEmailID, ContactNum) VALUES
('P101', 'Ananda Publishers', 'Kolkata', 'ananda@email.com', '9000000003'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000004'),
('P103', 'Amar Jibon Publications', 'Motlek', 'amar@email.com', '9000000006');

-- Book Details ✅
INSERT INTO BookDetails (BookId, BName, Price, AuthorId, PublisherId, Genre, Qty) VALUES
('B101', 'Gitanjali', 200.00, 'A101', 'P101', 'Poetry', 5),
('B102', 'Abol Tabol', 150.00, 'A102', 'P101', 'Poetry', 3),
('B103', 'Sahityamala Class 10', 100.00, 'A101', 'P102', 'Bengali', 7),
('T121', 'Taranath Tantrik', 120.00, 'A121', 'P103', 'Bengali', 4);


SELECT * FROM AuthorDetails WHERE AuthorId = 'A101';

INSERT IGNORE INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001');

DELETE FROM AuthorDetails WHERE AuthorId = 'A101';

INSERT INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001');

DELETE FROM AuthorDetails WHERE AuthorId = 'A101';

INSERT INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001');

INSERT IGNORE INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001');

SELECT * FROM AuthorDetails WHERE AuthorId = 'A101';

DELETE FROM AuthorDetails WHERE AuthorId IN ('A101', 'A102', 'A121');

SELECT * FROM BookDetails;

-- Author Details 
INSERT IGNORE INTO AuthorDetails (AuthorId, AuthorName, AuthAddress, AuthEmailID, ContactNum) VALUES
('A101', 'Rabindranath Tagore', 'Kolkata', 'tagore@email.com', '9000000001'),
('A102', 'Sukumar Ray', 'Kolkata', 'sukumar@email.com', '9000000002'),
('A121', 'Bibhutibhushan Bandopadhyay', 'North 24 Parganas', 'bibhuti@email.com', '9000000005');

-- ✅ Publisher Details 
INSERT IGNORE INTO PublisherDetails (PublisherId, PName, PAddress, PEmailID, ContactNum) VALUES
('P101', 'Ananda Publishers', 'Kolkata', 'ananda@email.com', '9000000003'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000004'),
('P103', 'Amar Jibon Publications', 'Motlek', 'amar@email.com', '9000000006');

-- ✅ Book Details (Will skip if already inserted)
INSERT IGNORE INTO BookDetails (BookId, BName, Price, AuthorId, PublisherId, Genre, Qty) VALUES
('B101', 'Gitanjali', 200.00, 'A101', 'P101', 'Poetry', 5),
('B102', 'Abol Tabol', 150.00, 'A102', 'P101', 'Poetry', 3),
('B103', 'Sahityamala Class 10', 100.00, 'A101', 'P102', 'Bengali', 7),
('T121', 'Taranath Tantrik', 120.00, 'A121', 'P103', 'Bengali', 4);

SELECT * FROM BookDetails WHERE AuthorId = 'A101'; 

DELETE FROM BookDetails WHERE AuthorId = 'A101';

DELETE FROM BookDetails WHERE AuthorId = 'A102';
DELETE FROM AuthorDetails WHERE AuthorId = 'A101';

INSERT IGNORE INTO BookDetails (BookId, BName, Price, AuthorId, PublisherId, Genre, Qty) VALUES
('BC201', 'Batul the Great Vol. 1', 120.00, 'A116', 'P101', 'Cartoon', 5),
('BC202', 'Hada Bhoda Comics', 110.00, 'A116', 'P101', 'Cartoon', 4),
('BC203', 'Nonte Phonte Samagra', 130.00, 'A116', 'P101', 'Cartoon', 6),
('BC204', 'Tenida Adventures', 150.00, 'A111', 'P106', 'Cartoon', 3),
('BC205', 'Gopal Bhar Jok Samagra', 100.00, 'A120', 'P103', 'Cartoon', 7),
('BC206', 'Petuk Master and Co.', 125.00, 'A111', 'P104', 'Cartoon', 2),
('BC207', 'Rangberonger Golpo', 135.00, 'A117', 'P109', 'Cartoon', 4),
('BC208', 'Suktara Comics Digest', 140.00, 'A116', 'P110', 'Cartoon', 5),
('BC209', 'Bahadur Beral', 95.00, 'A116', 'P108', 'Cartoon', 3),
('BC210', 'Bengali Kids Toon Tales', 105.00, 'A117', 'P102', 'Cartoon', 6);


INSERT IGNORE INTO PublisherDetails (PublisherId, PName, PAddress, PEmailID, ContactNum) VALUES
('P101', 'Ananda Publishers', 'Kolkata', 'ananda@email.com', '9000000101'),
('P102', 'National Book Trust', 'Delhi', 'nbt@email.com', '9000000102'),
('P103', 'Amar Jibon Publications', 'Motlek', 'amar@email.com', '9000000103'),
('P104', 'Sahitya Sagar', 'Kolkata', 'sagar@email.com', '9000000104'),
('P105', 'Bengal Book House', 'Ballygunge', 'bbh@email.com', '9000000105'),
('P106', 'Pathak Samabesh', 'North Kolkata', 'pathak@email.com', '9000000106'),
('P107', 'Deys Publishing', 'College Street', 'deys@email.com', '9000000107'),
('P108', 'Chhaya Prakashani', 'Howrah', 'chhaya@email.com', '9000000108'),
('P109', 'Protibha Publishers', 'Shyambazar', 'protibha@email.com', '9000000109'),
('P110', 'Upahar Prakashan', 'Salt Lake', 'upahar@email.com', '9000000110'),
('P111', 'Classic Kolkata Books', 'Esplanade', 'classic@email.com', '9000000111'),
('P112', 'Sristi Publishers', 'Behala', 'sristi@email.com', '9000000112'),
('P113', 'Punascha Prakashan', 'Jadavpur', 'punascha@email.com', '9000000113'),
('P114', 'Bangiya Sahitya Sangha', 'Barasat', 'bss@email.com', '9000000114'),
('P115', 'Chhotoder Boi Ghar', 'Sealdah', 'chhoto@email.com', '9000000115'),
('P116', 'Gyan Mandir', 'Park Street', 'gyan@email.com', '9000000116'),
('P117', 'Kartick Publishers', 'Howrah Maidan', 'kartick@email.com', '9000000117'),
('P118', 'Tarun Sahitya', 'Lake Town', 'tarun@email.com', '9000000118'),
('P119', 'Nabaprabhat Publishers', 'Tollygunge', 'nabaprabhat@email.com', '9000000119'),
('P120', 'Chitralekha Publications', 'Baguihati', 'chitralekha@email.com', '9000000120'),
('P121', 'Moulik Prakashani', 'Kalighat', 'moulik@email.com', '9000000121'),
('P122', 'Modern Kolkata Press', 'Dumdum', 'modern@email.com', '9000000122'),
('P123', 'Nava Sahitya Bhavan', 'Serampore', 'nava@email.com', '9000000123'),
('P124', 'Kishore Publication', 'Barrackpore', 'kishore@email.com', '9000000124'),
('P125', 'Bhasha Prakashan', 'Jadavpur', 'bhasha@email.com', '9000000125');


SELECT * FROM PublisherDetails;
SELECT * FROM AuthorDetails;
SELECT * FROM BookDetails;
select * FROM PublisherDetails;

SHOW CREATE TABLE StudentProfile;
describe StudentProfile;
describe UserCredentials;
describe UserCredentials;











