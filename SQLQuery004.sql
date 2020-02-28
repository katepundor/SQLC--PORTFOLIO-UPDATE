CREATE VIEW dbo.vw_ProductSalesForecast
		AS
		SELECT P.ProductID, P.ProductName, X.ColorName,
		P.LengthMetres, C.CustomerName, C.City, F.Quantity, F.Amount
		FROM dbo.Product AS P
			INNER JOIN dbo.Color AS X 
				ON P.ColorID = X.ColorID 
			LEFT OUTER JOIN dbo.Forescast AS F
				ON  ProductID = F.ProductID
			LEFT OUTER JOIN dbo.Customer AS C 
			    ON F.CustomerID = C.CustomerID; 

GO

    --Displays the view showing the state of the table before nore forecasts were added--

	SELECT * 
	   FROM dbo.vw_ProductSalesForecast
	FOR SYSTEM_TIME AS OF '2017-10-07 13:00:00'

	ORDER BY ProductID;
