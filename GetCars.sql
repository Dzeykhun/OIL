
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Джейхун>
-- Create date: <2020-05-22>
-- Description:	<получение списка автомобилей>
-- =============================================
CREATE PROCEDURE O_GetCars
@Reserve bit = 0
AS
if ISNULL(@Reserve, 0) = 0
	BEGIN
		SELECT H.UID,
			   H.REG_SYBMOL,
			   H.VIN,
			   H.MODEL,
			   H.TYPE_TC,
			   H.CATEGORY,
			   H.MADEYEAR,
			   H.CARCASS,
			   H.COLOR,
			   H.MOTOR_POWER,
			   H.ECOLOGY,
			   ISNULL (H.RESERVE , 0) AS 'RESERVE',
			   H.RESERVE,
			   H.DOC_NUM,
			   H.DOC_SERIAL,
			   H.CREATE_DATE
		FROM OIL..CARS H WITH(NOLOCK)
		WHERE ISNULL(H.RESERVE, 0) = ISNULL(@Reserve, 0)
	END
	ELSE
		SELECT H.UID,
			   H.REG_SYBMOL,
			   H.VIN,
			   H.MODEL,
			   H.TYPE_TC,
			   H.CATEGORY,
			   H.MADEYEAR,
			   H.CARCASS,
			   H.COLOR,
			   H.MOTOR_POWER,
			   H.ECOLOGY,
			   ISNULL (H.RESERVE , 0) AS 'RESERVE',
			   H.RESERVE,
			   H.DOC_NUM,
			   H.DOC_SERIAL,
			   H.CREATE_DATE
		FROM OIL..CARS H WITH(NOLOCK)
GO
