CREATE PROCEDURE usp_UserDeletePostCheck (
	@UserId nvarchar(450), @RoleId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @SelectedUserID nvarchar(450);
SELECT @SelectedUserID = UserId FROM Persons WHERE PersonID = @SelectedUserID;
BEGIN 

DECLARE @ErrorIdsTable TABLE (id int)

IF  (SELECT COUNT(*) FROM Menu1Languages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(131) END
IF  (SELECT COUNT(*) FROM ProcessTypeFlowPassLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(184) END
IF  (SELECT COUNT(*) FROM Menu2 WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(132) END
IF  (SELECT COUNT(*) FROM Menu2Languages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(132) END
IF  (SELECT COUNT(*) FROM ProcessTypeFlows WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(182) END
IF  (SELECT COUNT(*) FROM Menu3 WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(133) END
IF  (SELECT COUNT(*) FROM ProcessTypeGroupLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(134) END
IF  (SELECT COUNT(*) FROM Menu3Languages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(133) END
IF  (SELECT COUNT(*) FROM ProcessTypeGroups WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(134) END
IF  (SELECT COUNT(*) FROM ProcessTypeLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(135) END
IF  (SELECT COUNT(*) FROM ProcessTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(135) END
IF  (SELECT COUNT(*) FROM ProcessTypeStageFields WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(131) END
IF  (SELECT COUNT(*) FROM OrganizationAddresses WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(136) END
IF  (SELECT COUNT(*) FROM ProcessTypeStageLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(137) END
IF  (SELECT COUNT(*) FROM OrganizationLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(138) END
IF  (SELECT COUNT(*) FROM ProcessTypeStages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(137) END
IF  (SELECT COUNT(*) FROM Organizations WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(138) END
IF  (SELECT COUNT(*) FROM ProcessTypeStageTypeLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(139) END
IF  (SELECT COUNT(*) FROM OrganizationSettings WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(133) END
IF  (SELECT COUNT(*) FROM ProcessTypeStageTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(139) END
IF  (SELECT COUNT(*) FROM ProjectLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(140) END
IF  (SELECT COUNT(*) FROM Projects WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(140) END
IF  (SELECT COUNT(*) FROM ProjectTypeLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(142) END
IF  (SELECT COUNT(*) FROM OrganizationTelecoms WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(141) END
IF  (SELECT COUNT(*) FROM ProjectTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(142) END
IF  (SELECT COUNT(*) FROM OrganizationTypeLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(143) END
IF  (SELECT COUNT(*) FROM Properties WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(144) END
IF  (SELECT COUNT(*) FROM OrganizationTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(143) END
IF  (SELECT COUNT(*) FROM AddressTypes WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(139) END
IF  (SELECT COUNT(*) FROM PropertyLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(144) END
IF  (SELECT COUNT(*) FROM PageLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(145) END
IF  (SELECT COUNT(*) FROM Pages WHERE (ModifierId = @SelectedUserId OR CreatorId = @SelectedUserId ) AND UserId <> @SelectedUserId  ) >0 BEGIN insert into @ErrorIdsTable values(140) END
IF  (SELECT COUNT(*) FROM PropertyValueLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(146) END
IF  (SELECT COUNT(*) FROM PageSectionClassificationValueConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(147) END
IF  (SELECT COUNT(*) FROM PropertyValues WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(146) END
IF  (SELECT COUNT(*) FROM PageSectionClassificationValueConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(147) END
IF  (SELECT COUNT(*) FROM RoleGroupLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(148) END
IF  (SELECT COUNT(*) FROM PageSectionContentConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(149) END

IF  (SELECT COUNT(*) FROM RoleGroups WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(148) END
IF  (SELECT COUNT(*) FROM PageSectionContentConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(149) END
IF  (SELECT COUNT(*) FROM RoleLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(150) END
IF  (SELECT COUNT(*) FROM Settings WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(145) END
IF  (SELECT COUNT(*) FROM PageSectionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(161) END
IF  (SELECT COUNT(*) FROM ClassificationLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(160) END
IF  (SELECT COUNT(*) FROM PageSectionOrganizationConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(151) END
IF  (SELECT COUNT(*) FROM ClassificationLevelLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(152) END
IF  (SELECT COUNT(*) FROM PageSectionOrganizationConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(151) END
IF  (SELECT COUNT(*) FROM ClassificationLevelProperties WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(189) END

IF  (SELECT COUNT(*) FROM PageSectionPersonConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(153) END
IF  (SELECT COUNT(*) FROM ClassificationLevels WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(152) END
IF  (SELECT COUNT(*) FROM PageSectionPersonConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(153) END


IF  (SELECT COUNT(*) FROM PageSectionProcessConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(154) END

IF  (SELECT COUNT(*) FROM UserMenus WHERE (ModifierId = @SelectedUserId OR CreatorId = @SelectedUserId ) AND UserId <> @SelectedUserId  ) >0 BEGIN insert into @ErrorIdsTable values(152) END
IF  (SELECT COUNT(*) FROM PageSectionProcessConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(154) END

IF  (SELECT COUNT(*) FROM UserMenuTemplateLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(159) END

IF  (SELECT COUNT(*) FROM UserMenuTemplateOptionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(156) END
IF  (SELECT COUNT(*) FROM PageSectionProjectConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(157) END
IF  (SELECT COUNT(*) FROM ClassificationRelationTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(155) END
IF  (SELECT COUNT(*) FROM UserMenuTemplateOptions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(156) END
IF  (SELECT COUNT(*) FROM PageSectionProjectConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(157) END
IF  (SELECT COUNT(*) FROM ClassificationRoles WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(158) END
IF  (SELECT COUNT(*) FROM UserMenuTemplates WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(159) END
IF  (SELECT COUNT(*) FROM Classifications WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(160) END
IF  (SELECT COUNT(*) FROM PageSections WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(161) END
IF  (SELECT COUNT(*) FROM ClassificationUsers WHERE (ModifierId = @SelectedUserId OR CreatorId = @SelectedUserId ) AND UserId <> @SelectedUserId  ) >0 BEGIN insert into @ErrorIdsTable values(159) END
IF  (SELECT COUNT(*) FROM ClassificationValueLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM PersonAddresses WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ClassificationValueProperties WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM PersonRelations WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ClassificationValuePropertyLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM PersonRelationTypeLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ClassificationValueRoles WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM PersonRelationTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ClassificationValues WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM Persons WHERE (ModifierId = @SelectedUserId OR CreatorId = @SelectedUserId ) AND UserId <> @SelectedUserId  ) >0 BEGIN insert into @ErrorIdsTable values(162) END
IF  (SELECT COUNT(*) FROM ClassificationValueUsers WHERE (ModifierId = @SelectedUserId OR CreatorId = @SelectedUserId ) AND UserId <> @SelectedUserId  ) >0 BEGIN insert into @ErrorIdsTable values(193) END
IF  (SELECT COUNT(*) FROM ContentClassificationValues WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM PersonTelecoms WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM Contents WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM Processes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ContentTypeClassifications WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(165) END
IF  (SELECT COUNT(*) FROM ProcessFields WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessMultis WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ContentTypeGroupLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ContentTypeGroups WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFieldConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ContentTypeLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFieldConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ContentTypes WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFieldLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFields WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFlowConditionLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM Genders WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(175) END
IF  (SELECT COUNT(*) FROM ProcessTypeFlowConditions WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFlowLanguages WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM Languages WHERE ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(177) END
IF  (SELECT COUNT(*) FROM Menu1 WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ProcessTypeFlowPasses WHERE CreatorId = @SelectedUserId OR ModifierId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(130) END
IF  (SELECT COUNT(*) FROM ContentUserEdit WHERE CreatorId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(197) END

IF  (SELECT COUNT(*) FROM ContentUserRead WHERE CreatorId = @SelectedUserId ) >0 BEGIN insert into @ErrorIdsTable values(198) END



SELECT ErrorMessages.ErrorMessageID
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
FROM @ErrorIdsTable Errors 
JOIN ErrorMessages 
	ON Errors.id = ErrorMessages.ErrorMessageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ErrorMessages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ErrorMessages.NameTermID
WHERE UIName.LanguageId = @LanguageID

END