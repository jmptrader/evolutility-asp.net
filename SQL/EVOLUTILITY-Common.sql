/*** www.evolutility.com - (c) 2008 Olivier Giulieri  ***/
/*    SQL script for generic pagin with Evolutility     */


CREATE PROCEDURE EvoSP_PagedItem
	(
	@Select  varchar(1000),
	@Table varchar(200),
	@TableS varchar(300),
	@WhereClause  varchar(2000),
	@OrderBy  varchar(200),
	@Page int,
	@RecsPerPage int	
	)
AS

SET NOCOUNT ON
CREATE TABLE #TempItems ( IDt int IDENTITY, IDo int)
IF (@WhereClause='')
  	INSERT INTO #TempItems (IDo) EXEC('SELECT T.ID FROM '+@TableS+'  ORDER BY ' +@OrderBy)
ELSE
	EXEC( 'INSERT INTO #TempItems (IDo) SELECT T.ID FROM '+@TableS+'  WHERE ' + @WhereClause+ ' ORDER BY '+@OrderBy)
DECLARE @FirstRec int, @LastRec int
SELECT @FirstRec = (@Page - 1) * @RecsPerPage
SELECT @LastRec = (@Page * @RecsPerPage + 1)
IF (@WhereClause='')
	EXEC( 'SELECT    '+@Select + ', MoreRecords = ( SELECT COUNT(*)  FROM #TempItems Temp  WHERE Temp.IDt >= ' 
+ @LastRec + ')  FROM #TempItems Temp,  ' + @TableS  
	+ ' WHERE T.ID = Temp.IDo AND Temp.IDt > '+ @FirstRec + ' AND Temp.IDt < '+ @LastRec + '  ORDER BY '+  @OrderBy)
ELSE
	EXEC( 'SELECT    '+@Select + ', MoreRecords = ( SELECT COUNT(*)  FROM #TempItems Temp  WHERE Temp.IDt >= ' 
+ @LastRec + ')  FROM #TempItems Temp,  ' + @TableS  
	+ ' WHERE T.ID = Temp.IDo AND Temp.IDt > '+ @FirstRec + ' AND Temp.IDt < '+ @LastRec + ' AND ' + @WhereClause+ ' ORDER BY '+  @OrderBy)
SET NOCOUNT OFF

GO