CREATE TABLE dbo.SampleTransactions (
	transID UNIQUEIDENTIFIER NOT NULL,
	projectID VARCHAR(255) NOT NULL,
	projectName VARCHAR(255) NOT NULL,
	grantID VARCHAR(255) NOT NULL,
	grantName VARCHAR(255) NOT NULL,
	transName VARCHAR(255) NOT NULL,
	transPostDate DATETIME NOT NULL,
	transPerfPeriodStartDate DATETIME,
	transPerfPeriodEndDate DATETIME,
	accountNumber VARCHAR(255) NOT NULL,
	dollarAmount MONEY NOT NULL,
	dollarClass SMALLINT NOT NULL,
	dollarTransNumber VARCHAR(100)
);

ALTER TABLE dbo.SampleTransactions
ADD CONSTRAINT PK_dbo_SampleTransactions PRIMARY KEY (transID);



INSERT INTO dbo.SampleTransactions (transID, projectID, projectName, grantID, grantName, transName, transPostDate, transPerfPeriodStartDate, transPerfPeriodEndDate, accountNumber, dollarAmount, dollarClass, dollarTransNumber)
VALUES (NEWID(), 'p1001', 'Great, Example Project, Name', 'n/a', 'n/a', 'Salary', '2018-01-16', '2018-01-01', '2018-12-31', '70000', 6000.00, 101, NULL);

INSERT INTO dbo.SampleTransactions (transID, projectID, projectName, grantID, grantName, transName, transPostDate, transPerfPeriodStartDate, transPerfPeriodEndDate, accountNumber, dollarAmount, dollarClass, dollarTransNumber)
VALUES (NEWID(), 'p1002', 'The "Big" Project', 'n/a', 'n/a', 'Payment to Vendor', '2018-01-18', '2018-01-01', '2018-12-31', '60000.A', 15000.00, 104, NULL);

INSERT INTO dbo.SampleTransactions (transID, projectID, projectName, grantID, grantName, transName, transPostDate, transPerfPeriodStartDate, transPerfPeriodEndDate, accountNumber, dollarAmount, dollarClass, dollarTransNumber)
VALUES (NEWID(), 'p1003', '1003', 'n/a', 'n/a', 'Ticket Sales', '2018-01-20', '2018-01-01', '2018-12-31', '20000', 100000.00, 203, 'Prime Tickets');
