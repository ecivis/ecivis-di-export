SELECT transID, projectID, projectName, grantID, grantName, transName,
	CONVERT(VARCHAR(10), transPostDate, 126) AS transPostDate,
	CONVERT(VARCHAR(10), transPerfPeriodStartDate, 126) AS transPerfPeriodStartDate,
	CONVERT(VARCHAR(10), transPerfPeriodEndDate, 126) AS transPerfPeriodEndDate,
	accountNumber, dollarAmount, dollarClass, ISNULL(dollarTransNumber, '') AS dollarTransNumber
FROM dbo.SampleTransactions
ORDER BY transPostDate
