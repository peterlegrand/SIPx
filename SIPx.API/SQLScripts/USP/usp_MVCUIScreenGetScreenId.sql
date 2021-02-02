CREATE PROCEDURE usp_MVCUIScreenGetScreenId (@Controller varchar(50),  @Action varchar(50))
AS

SELECT MVCUIScreenId FROM MVCUIScreens WHERE Controller = @Controller AND Action = @Action