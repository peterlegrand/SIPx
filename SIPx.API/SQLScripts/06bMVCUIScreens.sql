﻿DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT MVCUIScreens ON;
INSERT INTO [dbo].[MVCUIScreens](MVCUIScreenId, [Controller],[Action])VALUES 

 (1, 'Classification', 'Index')
, (2, 'Classification', 'Create')
, (3, 'Classification', 'Edit')
, (4, 'Classification', 'Delete')
, (5, 'Classification', 'LanguageIndex')
, (6, 'Classification', 'LanguageCreate')
, (7, 'Classification', 'LanguageEdit')
, (8, 'Classification', 'LanguageDelete')
, (9, 'ClassificationLevel', 'Index')
, (10, 'ClassificationLevel', 'Create')
, (11, 'ClassificationLevel', 'Edit')
, (12, 'ClassificationLevel', 'Delete')
, (13, 'ClassificationLevel', 'LanguageIndex')
, (14, 'ClassificationLevel', 'LanguageCreate')
, (15, 'ClassificationLevel', 'LanguageEdit')
, (16, 'ClassificationLevel', 'LanguageDelete')
, (17, 'ClassificationPage', 'Index')
, (18, 'ClassificationPage', 'Create')
, (19, 'ClassificationPage', 'Edit')
, (20, 'ClassificationPage', 'Delete')
, (21, 'ClassificationPage', 'LanguageIndex')
, (22, 'ClassificationPage', 'LanguageCreate')
, (23, 'ClassificationPage', 'LanguageEdit')
, (24, 'ClassificationPage', 'LanguageDelete')
, (25, 'ClassificationPageSection', 'Index')
, (26, 'ClassificationPageSection', 'Create')
, (27, 'ClassificationPageSection', 'Edit')
, (28, 'ClassificationPageSection', 'Delete')
, (29, 'ClassificationPageSection', 'LanguageIndex')
, (30, 'ClassificationPageSection', 'LanguageCreate')
, (31, 'ClassificationPageSection', 'LanguageEdit')
, (32, 'ClassificationPageSection', 'LanguageDelete')
, (33, 'ClassificationRelationType', 'Index')
, (34, 'ClassificationRelationType', 'Create')
, (35, 'ClassificationRelationType', 'Edit')
, (36, 'ClassificationRelationType', 'Delete')
, (37, 'ClassificationRelationType', 'LanguageIndex')
, (38, 'ClassificationRelationType', 'LanguageCreate')
, (39, 'ClassificationRelationType', 'LanguageEdit')
, (40, 'ClassificationRelationType', 'LanguageDelete')
, (41, 'ClassificationRole', 'Index')
, (42, 'ClassificationRole', 'Create')
, (43, 'ClassificationRole', 'Edit')
, (44, 'ClassificationRole', 'Delete')
, (45, 'ClassificationRole', 'LanguageIndex')
, (46, 'ClassificationRole', 'LanguageCreate')
, (47, 'ClassificationRole', 'LanguageEdit')
, (48, 'ClassificationRole', 'LanguageDelete')
, (49, 'ClassificationUser', 'Index')
, (50, 'ClassificationUser', 'Create')
, (51, 'ClassificationUser', 'Edit')
, (52, 'ClassificationUser', 'Delete')
, (53, 'ClassificationUser', 'LanguageIndex')
, (54, 'ClassificationUser', 'LanguageCreate')
, (55, 'ClassificationUser', 'LanguageEdit')
, (56, 'ClassificationUser', 'LanguageDelete')
, (57, 'ClassificationValue', 'Index')
, (58, 'ClassificationValue', 'Create')
, (59, 'ClassificationValue', 'Edit')
, (60, 'ClassificationValue', 'Delete')
, (61, 'ClassificationValue', 'LanguageIndex')
, (62, 'ClassificationValue', 'LanguageCreate')
, (63, 'ClassificationValue', 'LanguageEdit')
, (64, 'ClassificationValue', 'LanguageDelete')
, (65, 'ClassificationValueRole', 'Index')
, (66, 'ClassificationValueRole', 'Create')
, (67, 'ClassificationValueRole', 'Edit')
, (68, 'ClassificationValueRole', 'Delete')
, (69, 'ClassificationValueRole', 'LanguageIndex')
, (70, 'ClassificationValueRole', 'LanguageCreate')
, (71, 'ClassificationValueRole', 'LanguageEdit')
, (72, 'ClassificationValueRole', 'LanguageDelete')
, (73, 'ClassificationValueUser', 'Index')
, (74, 'ClassificationValueUser', 'Create')
, (75, 'ClassificationValueUser', 'Edit')
, (76, 'ClassificationValueUser', 'Delete')
, (77, 'ClassificationValueUser', 'LanguageIndex')
, (78, 'ClassificationValueUser', 'LanguageCreate')
, (79, 'ClassificationValueUser', 'LanguageEdit')
, (80, 'ClassificationValueUser', 'LanguageDelete')
, (81, 'Organization', 'Index')
, (82, 'Organization', 'Create')
, (83, 'Organization', 'Edit')
, (84, 'Organization', 'Delete')
, (85, 'Organization', 'LanguageIndex')
, (86, 'Organization', 'LanguageCreate')
, (87, 'Organization', 'LanguageEdit')
, (88, 'Organization', 'LanguageDelete')
, (89, 'OrganizationAddress', 'Index')
, (90, 'OrganizationAddress', 'Create')
, (91, 'OrganizationAddress', 'Edit')
, (92, 'OrganizationAddress', 'Delete')
, (93, 'OrganizationAddress', 'LanguageIndex')
, (94, 'OrganizationAddress', 'LanguageCreate')
, (95, 'OrganizationAddress', 'LanguageEdit')
, (96, 'OrganizationAddress', 'LanguageDelete')
, (97, 'OrganizationTelecom', 'Index')
, (98, 'OrganizationTelecom', 'Create')
, (99, 'OrganizationTelecom', 'Edit')
, (100, 'OrganizationTelecom', 'Delete')
, (101, 'OrganizationTelecom', 'LanguageIndex')
, (102, 'OrganizationTelecom', 'LanguageCreate')
, (103, 'OrganizationTelecom', 'LanguageEdit')
, (104, 'OrganizationTelecom', 'LanguageDelete')
, (105, 'OrganizationType', 'Index')
, (106, 'OrganizationType', 'Create')
, (107, 'OrganizationType', 'Edit')
, (108, 'OrganizationType', 'Delete')
, (109, 'OrganizationType', 'LanguageIndex')
, (110, 'OrganizationType', 'LanguageCreate')
, (111, 'OrganizationType', 'LanguageEdit')
, (112, 'OrganizationType', 'LanguageDelete')
, (113, 'Page', 'Index')
, (114, 'Page', 'Create')
, (115, 'Page', 'Edit')
, (116, 'Page', 'Delete')
, (117, 'Page', 'LanguageIndex')
, (118, 'Page', 'LanguageCreate')
, (119, 'Page', 'LanguageEdit')
, (120, 'Page', 'LanguageDelete')
, (121, 'PageSection', 'Index')
, (122, 'PageSection', 'Create')
, (123, 'PageSection', 'Edit')
, (124, 'PageSection', 'Delete')
, (125, 'PageSection', 'LanguageIndex')
, (126, 'PageSection', 'LanguageCreate')
, (127, 'PageSection', 'LanguageEdit')
, (128, 'PageSection', 'LanguageDelete')
, (129, 'Person', 'Index')
, (130, 'Person', 'Create')
, (131, 'Person', 'Edit')
, (132, 'Person', 'Delete')
, (133, 'Person', 'LanguageIndex')
, (134, 'Person', 'LanguageCreate')
, (135, 'Person', 'LanguageEdit')
, (136, 'Person', 'LanguageDelete')
, (137, 'PersonAddress', 'Index')
, (138, 'PersonAddress', 'Create')
, (139, 'PersonAddress', 'Edit')
, (140, 'PersonAddress', 'Delete')
, (141, 'PersonAddress', 'LanguageIndex')
, (142, 'PersonAddress', 'LanguageCreate')
, (143, 'PersonAddress', 'LanguageEdit')
, (144, 'PersonAddress', 'LanguageDelete')
, (145, 'PersonTelecom', 'Index')
, (146, 'PersonTelecom', 'Create')
, (147, 'PersonTelecom', 'Edit')
, (148, 'PersonTelecom', 'Delete')
, (149, 'PersonTelecom', 'LanguageIndex')
, (150, 'PersonTelecom', 'LanguageCreate')
, (151, 'PersonTelecom', 'LanguageEdit')
, (152, 'PersonTelecom', 'LanguageDelete')
, (153, 'PersonRelation', 'Index')
, (154, 'PersonRelation', 'Create')
, (155, 'PersonRelation', 'Edit')
, (156, 'PersonRelation', 'Delete')
, (157, 'PersonRelation', 'LanguageIndex')
, (158, 'PersonRelation', 'LanguageCreate')
, (159, 'PersonRelation', 'LanguageEdit')
, (160, 'PersonRelation', 'LanguageDelete')
, (161, 'ProcessTemplate', 'Index')
, (162, 'ProcessTemplate', 'Create')
, (163, 'ProcessTemplate', 'Edit')
, (164, 'ProcessTemplate', 'Delete')
, (165, 'ProcessTemplate', 'LanguageIndex')
, (166, 'ProcessTemplate', 'LanguageCreate')
, (167, 'ProcessTemplate', 'LanguageEdit')
, (168, 'ProcessTemplate', 'LanguageDelete')
, (169, 'ProcessTemplateField', 'Index')
, (170, 'ProcessTemplateField', 'Create')
, (171, 'ProcessTemplateField', 'Edit')
, (172, 'ProcessTemplateField', 'Delete')
, (173, 'ProcessTemplateField', 'LanguageIndex')
, (174, 'ProcessTemplateField', 'LanguageCreate')
, (175, 'ProcessTemplateField', 'LanguageEdit')
, (176, 'ProcessTemplateField', 'LanguageDelete')
, (177, 'ProcessTemplateFieldStage', 'Index')
, (178, 'ProcessTemplateFieldStage', 'Create')
, (179, 'ProcessTemplateFieldStage', 'Edit')
, (180, 'ProcessTemplateFieldStage', 'Delete')
, (181, 'ProcessTemplateFieldStage', 'LanguageIndex')
, (182, 'ProcessTemplateFieldStage', 'LanguageCreate')
, (183, 'ProcessTemplateFieldStage', 'LanguageEdit')
, (184, 'ProcessTemplateFieldStage', 'LanguageDelete')
, (185, 'ProcessTemplateFlow', 'Index')
, (186, 'ProcessTemplateFlow', 'Create')
, (187, 'ProcessTemplateFlow', 'Edit')
, (188, 'ProcessTemplateFlow', 'Delete')
, (189, 'ProcessTemplateFlow', 'LanguageIndex')
, (190, 'ProcessTemplateFlow', 'LanguageCreate')
, (191, 'ProcessTemplateFlow', 'LanguageEdit')
, (192, 'ProcessTemplateFlow', 'LanguageDelete')
, (193, 'ProcessTemplateFlowCondition', 'Index')
, (194, 'ProcessTemplateFlowCondition', 'Create')
, (195, 'ProcessTemplateFlowCondition', 'Edit')
, (196, 'ProcessTemplateFlowCondition', 'Delete')
, (197, 'ProcessTemplateFlowCondition', 'LanguageIndex')
, (198, 'ProcessTemplateFlowCondition', 'LanguageCreate')
, (199, 'ProcessTemplateFlowCondition', 'LanguageEdit')
, (200, 'ProcessTemplateFlowCondition', 'LanguageDelete')
, (201, 'ProcessTemplateGroup', 'Index')
, (202, 'ProcessTemplateGroup', 'Create')
, (203, 'ProcessTemplateGroup', 'Edit')
, (204, 'ProcessTemplateGroup', 'Delete')
, (205, 'ProcessTemplateGroup', 'LanguageIndex')
, (206, 'ProcessTemplateGroup', 'LanguageCreate')
, (207, 'ProcessTemplateGroup', 'LanguageEdit')
, (208, 'ProcessTemplateGroup', 'LanguageDelete')
, (209, 'ProcessTemplateStage', 'Index')
, (210, 'ProcessTemplateStage', 'Create')
, (211, 'ProcessTemplateStage', 'Edit')
, (212, 'ProcessTemplateStage', 'Delete')
, (213, 'ProcessTemplateStage', 'LanguageIndex')
, (214, 'ProcessTemplateStage', 'LanguageCreate')
, (215, 'ProcessTemplateStage', 'LanguageEdit')
, (216, 'ProcessTemplateStage', 'LanguageDelete')
, (217, 'ProcessTemplateStageField', 'Index')
, (218, 'ProcessTemplateStageField', 'Create')
, (219, 'ProcessTemplateStageField', 'Edit')
, (220, 'ProcessTemplateStageField', 'Delete')
, (221, 'ProcessTemplateStageField', 'LanguageIndex')
, (222, 'ProcessTemplateStageField', 'LanguageCreate')
, (223, 'ProcessTemplateStageField', 'LanguageEdit')
, (224, 'ProcessTemplateStageField', 'LanguageDelete')
, (225, 'Project', 'Index')
, (226, 'Project', 'Create')
, (227, 'Project', 'Edit')
, (228, 'Project', 'Delete')
, (229, 'Project', 'LanguageIndex')
, (230, 'Project', 'LanguageCreate')
, (231, 'Project', 'LanguageEdit')
, (232, 'Project', 'LanguageDelete')
, (233, 'RoleGroup', 'Index')
, (234, 'RoleGroup', 'Create')
, (235, 'RoleGroup', 'Edit')
, (236, 'RoleGroup', 'Delete')
, (237, 'RoleGroup', 'LanguageIndex')
, (238, 'RoleGroup', 'LanguageCreate')
, (239, 'RoleGroup', 'LanguageEdit')
, (240, 'RoleGroup', 'LanguageDelete')
, (241, 'Setting', 'Index')
, (242, 'Setting', 'Create')
, (243, 'Setting', 'Edit')
, (244, 'Setting', 'Delete')
, (245, 'Setting', 'LanguageIndex')
, (246, 'Setting', 'LanguageCreate')
, (247, 'Setting', 'LanguageEdit')
, (248, 'Setting', 'LanguageDelete')
, (249, 'PersonRelationType', 'LanguageIndex')
, (250, 'PersonRelationType', 'LanguageEdit')
, (251, 'ContentType', 'LanguageEdit')
, (252, 'ContentType', 'LanguageIndex')
, (253, 'ContentTypeGroup', 'LanguageEdit')
, (254, 'ContentTypeGroup', 'LanguageIndex')
, (255, 'Role', 'LanguageEdit')
, (256, 'Role', 'LanguageIndex')
, (257, 'ProcessTemplateStageType', 'LanguageEdit')
, (258, 'ProcessTemplateStageType', 'LanguageIndex')
, (259, 'UserMenuTemplate', 'Index')
, (260, 'UserMenuTemplate', 'Create')
, (261, 'UserMenuTemplate', 'Delete')
, (262, 'UserMenuTemplate', 'Edit')
, (263, 'UserMenuTemplate', 'LanguageIndex')
, (264, 'UserMenuTemplate', 'LanguageCreate')
, (265, 'UserMenuTemplate', 'LanguageEdit')
, (266, 'UserMenuTemplate', 'LanguageDelete')
, (267, 'UserMenuTemplateOptions', 'Index')
, (268, 'UserMenuTemplateOptions', 'Create')
, (269, 'UserMenuTemplateOptions', 'Delete')
, (270, 'UserMenuTemplateOptions', 'Edit')
, (271, 'UserMenuTemplateOptions', 'LanguageIndex')
, (272, 'UserMenuTemplateOptions', 'LanguageCreate')
, (273, 'UserMenuTemplateOptions', 'LanguageEdit')
, (274, 'UserMenuTemplateOptions', 'LanguageDelete')
, (275, 'UserMenu', 'Index')
, (276, 'UserMenu', 'Create')
, (277, 'UserMenu', 'Delete')
, (278, 'UserMenu', 'Edit')
SET IDENTITY_INSERT MVCUIScreens OFF;
