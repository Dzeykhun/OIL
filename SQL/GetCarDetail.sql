
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Джейхун>
-- Create date: <2020-05-22>
-- Description:	<Получение информация по автомобилю>
-- =============================================
CREATE PROCEDURE O_GetCarDetail
@UID INT = 0
AS
	IF @UID = 0 
	BEGIN
		SELECT D.UID_CARS,
			   D.PASSPORT_NUM,
			   D.PASSPORT_SERIAL,
			   D.MASS_MAX,
			   D.MASS_LOADOUT,
			   D.INS_NUM,
			   D.INS_SERIAL,
			   D.BEG_DATE,
			   D.END_DATE,
			   D.CHASSIS,
			   D.WORKSTATE,
			   D.PRIMECH
		FROM CARS_DETAIL D WITH(NOLOCK)
		WHERE D.UID_CARS = @UID
	END
GO
