use sip
DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers WHERE UserName = 'eplegrand@gmail.com'
DECLARE @User2 as nvarchar(450);
Select @User2 = Id from AspNetUsers WHERE UserName = 'FordPrefect@gmail.com'
DECLARE @Role as nvarchar(450);
Select @Role = Id from AspNetRoles 

SET IDENTITY_INSERT Classifications ON;
INSERT INTO Classifications (ClassificationId, StatusId, HasDropDown, DropDownSequence, Color, IconID, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1, 1, 1, '#008000ff',1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 1, 2, '#008000ff',1, @User, @User, GETDATE(), GETDATE())
, (3, 1, 1, 3, '#008000ff', 1,@User, @User, GETDATE(), GETDATE()) 
SET IDENTITY_INSERT Classifications OFF;

SET IDENTITY_INSERT ClassificationLanguages ON;
INSERT INTO ClassificationLanguages(ClassificationLanguageId, ClassificationId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Climate', 'Climate', 'Climate', 'Climate', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Soil', 'Soil', 'Soil', 'Soil', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Crop', 'Crop', 'Crop', 'Crop', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLanguages OFF;

SET IDENTITY_INSERT ClassificationRelationTypes ON;
INSERT INTO ClassificationRelationTypes (ClassificationRelationTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES (1, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ClassificationRelationTypes OFF;

SET IDENTITY_INSERT ClassificationRelationTypeLanguages ON;
INSERT INTO ClassificationRelationTypeLanguages(ClassificationRelationTypeLanguageId, ClassificationRelationTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Owner', 'Owner', 'Owner', 'Owner', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationRelationTypeLanguages OFF;


SET IDENTITY_INSERT ClassificationUsers ON;
INSERT INTO ClassificationUsers (ClassificationUserId,ClassificationId,UserId, ClassificationRelationTypeId ,CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES (1, 1, @User, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationUsers (ClassificationUserId,ClassificationId,UserId, ClassificationRelationTypeId ,CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES (2, 2, @User, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationUsers (ClassificationUserId,ClassificationId,UserId, ClassificationRelationTypeId ,CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES (3, 3, @User, 1, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ClassificationUsers OFF;

SET IDENTITY_INSERT ClassificationRoles ON;
INSERT INTO ClassificationRoles (ClassificationRoleId, ClassificationId, RoleId, ClassificationRelationTypeId ,CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES (1, 1, @Role, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationRoles (ClassificationRoleId, ClassificationId, RoleId, ClassificationRelationTypeId ,CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES (2, 2, @Role, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationRoles (ClassificationRoleId, ClassificationId, RoleId, ClassificationRelationTypeId ,CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES (3, 3, @Role, 1, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ClassificationRoles OFF;


SET IDENTITY_INSERT ClassificationLevels ON;
INSERT INTO ClassificationLevels (ClassificationLevelId, ClassificationId, Sequence, DateLevelId, OnTheFly, Alphabetically, CanLink, InDropDown, InMenu, CodeTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 0, 0, 1, 1, 1,2, @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 1, 0, 0, 1, 1, 1,2, @User, @User, GETDATE(), GETDATE())
, (3, 2, 1, 1, 0, 0, 1, 1, 1,2, @User, @User, GETDATE(), GETDATE())
, (4, 3, 1, 1, 0, 0, 1, 1, 1,2, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevels OFF;

SET IDENTITY_INSERT ClassificationLevelLanguages ON;
INSERT INTO ClassificationLevelLanguages(ClassificationLevelLanguageId, ClassificationId, ClassificationLevelId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 41, 'Köppen main group', 'Köppen main group', 'Köppen main group', 'Köppen main group', @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 41, 'Köppen subgroup', 'Köppen subgroup', 'Köppen subgroup', 'Köppen subgroup', @User, @User, GETDATE(), GETDATE())
, (3, 2, 3, 41, 'Soil Taxonomy', 'Soil Taxonomy', 'Soil Taxonomy', 'Soil Taxonomy', @User, @User, GETDATE(), GETDATE())
, (4, 3, 4, 41, 'Main crop type', 'Main crop type', 'Main crop type', 'Main crop type', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevelLanguages OFF;

SET IDENTITY_INSERT ClassificationValues ON;
INSERT INTO ClassificationValues (ClassificationValueId, ClassificationId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, @User, @User, GETDATE(), GETDATE())
, (3, 1, @User, @User, GETDATE(), GETDATE())
, (4, 1, @User, @User, GETDATE(), GETDATE())
, (5, 1, @User, @User, GETDATE(), GETDATE())
, (6, 2, @User, @User, GETDATE(), GETDATE())
, (7, 2, @User, @User, GETDATE(), GETDATE())
, (8, 2, @User, @User, GETDATE(), GETDATE())
, (9, 2, @User, @User, GETDATE(), GETDATE())
, (10, 2, @User, @User, GETDATE(), GETDATE())
, (11, 2, @User, @User, GETDATE(), GETDATE())
, (12, 2, @User, @User, GETDATE(), GETDATE())
, (13, 2, @User, @User, GETDATE(), GETDATE())
, (14, 2, @User, @User, GETDATE(), GETDATE())
, (15, 2, @User, @User, GETDATE(), GETDATE())
, (16, 2, @User, @User, GETDATE(), GETDATE())
, (17, 2, @User, @User, GETDATE(), GETDATE())
, (18, 2, @User, @User, GETDATE(), GETDATE())
, (19, 2, @User, @User, GETDATE(), GETDATE())
, (20, 2, @User, @User, GETDATE(), GETDATE())

INSERT INTO ClassificationValues (ClassificationValueId, ClassificationId, ParentValueId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(21, 1, 1, @User, @User, GETDATE(), GETDATE())
, (22, 1, 1, @User, @User, GETDATE(), GETDATE())
, (23, 1, 1, @User, @User, GETDATE(), GETDATE())
, (24, 1, 1, @User, @User, GETDATE(), GETDATE())
, (25, 1, 2, @User, @User, GETDATE(), GETDATE())
, (26, 1, 2, @User, @User, GETDATE(), GETDATE())
, (27, 1, 2, @User, @User, GETDATE(), GETDATE())
, (28, 1, 2, @User, @User, GETDATE(), GETDATE())
, (29, 1, 3, @User, @User, GETDATE(), GETDATE())
, (30, 1, 3, @User, @User, GETDATE(), GETDATE())
, (31, 1, 3, @User, @User, GETDATE(), GETDATE())
, (32, 1, 3, @User, @User, GETDATE(), GETDATE())
, (33, 1, 3, @User, @User, GETDATE(), GETDATE())
, (34, 1, 3, @User, @User, GETDATE(), GETDATE())
, (35, 1, 3, @User, @User, GETDATE(), GETDATE())
, (36, 1, 3, @User, @User, GETDATE(), GETDATE())
, (37, 1, 3, @User, @User, GETDATE(), GETDATE())
, (38, 1, 4, @User, @User, GETDATE(), GETDATE())
, (39, 1, 4, @User, @User, GETDATE(), GETDATE())
, (40, 1, 4, @User, @User, GETDATE(), GETDATE())
, (41, 1, 4, @User, @User, GETDATE(), GETDATE())
, (42, 1, 4, @User, @User, GETDATE(), GETDATE())
, (43, 1, 4, @User, @User, GETDATE(), GETDATE())
, (44, 1, 4, @User, @User, GETDATE(), GETDATE())
, (45, 1, 4, @User, @User, GETDATE(), GETDATE())
, (46, 1, 4, @User, @User, GETDATE(), GETDATE())
, (47, 1, 4, @User, @User, GETDATE(), GETDATE())
, (48, 1, 4, @User, @User, GETDATE(), GETDATE())
, (49, 1, 4, @User, @User, GETDATE(), GETDATE())
, (50, 1, 5, @User, @User, GETDATE(), GETDATE())
, (51, 1, 5, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationValues OFF;
SET IDENTITY_INSERT ClassificationValueLanguages ON;
INSERT INTO ClassificationValueLanguages(ClassificationValueLanguageId, ClassificationId, ClassificationValueId, LanguageId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 41, 'Group A', 'Tropical climates', 'Tropical climates', 'Tropical climates','Tropical climates', 'Tropical climates', 'Tropical climates','Tropical climates', 'Tropical climates', 'Tropical climates', @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 41, 'Group B', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', @User, @User, GETDATE(), GETDATE())
, (3, 1, 3, 41, 'Group C', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', @User, @User, GETDATE(), GETDATE())
, (4, 1, 4, 41, 'Group D', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', @User, @User, GETDATE(), GETDATE())
, (5, 1, 5, 41, 'Group E', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', @User, @User, GETDATE(), GETDATE())
, (6, 2, 6, 41, 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', @User, @User, GETDATE(), GETDATE())
, (7, 2, 7, 41, 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', @User, @User, GETDATE(), GETDATE())
, (8, 2, 8, 41, 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', @User, @User, GETDATE(), GETDATE())
, (9, 2, 9, 41, 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', @User, @User, GETDATE(), GETDATE())
, (10, 2, 10, 41, 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', @User, @User, GETDATE(), GETDATE())
, (11, 2, 11, 41, 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', @User, @User, GETDATE(), GETDATE())
, (12, 2, 12, 41, 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', @User, @User, GETDATE(), GETDATE())
, (13, 2, 13, 41, 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', @User, @User, GETDATE(), GETDATE())
, (14, 2, 14, 41, 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', @User, @User, GETDATE(), GETDATE())
, (15, 2, 15, 41, 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', @User, @User, GETDATE(), GETDATE())
, (16, 2, 16, 41, 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', @User, @User, GETDATE(), GETDATE())
, (17, 2, 17, 41, 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', @User, @User, GETDATE(), GETDATE())
, (18, 2, 18, 41, 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', @User, @User, GETDATE(), GETDATE())
, (19, 2, 19, 41, 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', @User, @User, GETDATE(), GETDATE())
, (20, 2, 20, 41, 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', @User, @User, GETDATE(), GETDATE())
, (21, 1, 21, 41, 'Af', 'Tropical rainforest climate', 'Af', 'Af', 'Af', 'Af', 'Tropical rainforest climate', 'Af', 'Tropical rainforest climate', 'Af', @User, @User, GETDATE(), GETDATE())
, (22, 1, 22, 41, 'Am', 'Tropical monsoon climate', 'Am', 'Am', 'Am', 'Am', 'Tropical monsoon climate', 'Am', 'Tropical monsoon climate', 'Am', @User, @User, GETDATE(), GETDATE())
, (23, 1, 23, 41, 'Aw', 'Tropical wet savanna climate', 'Aw', 'Aw', 'Aw', 'Aw', 'Tropical wet savanna climate', 'Aw', 'Tropical wet savanna climate', 'Aw', @User, @User, GETDATE(), GETDATE())
, (24, 1, 24, 41, 'As', 'Tropical dry savanna climate', 'As', 'As', 'As', 'As', 'Tropical dry savanna climate', 'As', 'Tropical dry savanna climate', 'As', @User, @User, GETDATE(), GETDATE())
, (25, 1, 25, 41, 'BWh', 'Hot desert climate', 'BWh', 'BWh', 'BWh', 'BWh', 'Hot desert climate', 'BWh', 'Hot desert climate', 'BWh', @User, @User, GETDATE(), GETDATE())
, (26, 1, 26, 41, 'BWk', 'Cold desert climate', 'BWk', 'BWk', 'BWk', 'BWk', 'Cold desert climate', 'BWk', 'Cold desert climate', 'BWk', @User, @User, GETDATE(), GETDATE())
, (27, 1, 27, 41, 'BSh', 'Hot semi-arid climate', 'BSh', 'BSh', 'BSh', 'BSh', 'Hot semi-arid climate', 'BSh', 'Hot semi-arid climate', 'BSh', @User, @User, GETDATE(), GETDATE())
, (28, 1, 28, 41, 'BSk', 'Cold semi-arid climate', 'BSk', 'BSk', 'BSk', 'BSk', 'Cold semi-arid climate', 'BSk', 'Cold semi-arid climate', 'BSk', @User, @User, GETDATE(), GETDATE())
, (29, 1, 29, 41, 'Cfa', 'Humid subtropical climate', 'Cfa', 'Cfa', 'Cfa', 'Cfa', 'Humid subtropical climate', 'Cfa', 'Humid subtropical climate', 'Cfa', @User, @User, GETDATE(), GETDATE())
, (30, 1, 30, 41, 'Cfb', 'Temperate oceanic climate', 'Cfb', 'Cfb', 'Cfb', 'Cfb', 'Temperate oceanic climate', 'Cfb', 'Temperate oceanic climate', 'Cfb', @User, @User, GETDATE(), GETDATE())
, (31, 1, 31, 41, 'Cfc', 'Subpolar oceanic climate', 'Cfc', 'Cfc', 'Cfc', 'Cfc', 'Subpolar oceanic climate', 'Cfc', 'Subpolar oceanic climate', 'Cfc', @User, @User, GETDATE(), GETDATE())
, (32, 1, 32, 41, 'Cwa', 'Monsoon-influenced humid subtropical climate', 'Cwa', 'Cwa', 'Cwa', 'Cwa', 'Monsoon-influenced humid subtropical climate', 'Cwa', 'Monsoon-influenced humid subtropical climate', 'Cwa', @User, @User, GETDATE(), GETDATE())
, (33, 1, 33, 41, 'Cwb', 'Subtropical highland climate or temperate oceanic climate with dry winters', 'Cwb', 'Cwb', 'Cwb', 'Cwb', 'Subtropical highland climate or temperate oceanic climate with dry winters', 'Cwb', 'Subtropical highland climate or temperate oceanic climate with dry winters', 'Cwb', @User, @User, GETDATE(), GETDATE())
, (34, 1, 34, 41, 'Cwc', 'Cold subtropical highland climate or subpolar oceanic climate with dry winters', 'Cwc', 'Cwc', 'Cwc', 'Cwc', 'Cold subtropical highland climate or subpolar oceanic climate with dry winters', 'Cwc', 'Cold subtropical highland climate or subpolar oceanic climate with dry winters', 'Cwc', @User, @User, GETDATE(), GETDATE())
, (35, 1, 35, 41, 'Csa', 'Hot-summer Mediterranean climate', 'Csa', 'Csa', 'Csa', 'Csa', 'Hot-summer Mediterranean climate', 'Csa', 'Hot-summer Mediterranean climate', 'Csa', @User, @User, GETDATE(), GETDATE())
, (36, 1, 36, 41, 'Csb', 'Warm-summer Mediterranean climate', 'Csb', 'Csb', 'Csb', 'Csb', 'Warm-summer Mediterranean climate', 'Csb', 'Warm-summer Mediterranean climate', 'Csb', @User, @User, GETDATE(), GETDATE())
, (37, 1, 37, 41, 'Csc', 'Cool-summer Mediterranean climate', 'Csc', 'Csc', 'Csc', 'Csc', 'Cool-summer Mediterranean climate', 'Csc', 'Cool-summer Mediterranean climate', 'Csc', @User, @User, GETDATE(), GETDATE())
, (38, 1, 38, 41, 'Dfa', 'Hot-summer humid continental climate', 'Dfa', 'Dfa', 'Dfa', 'Dfa', 'Hot-summer humid continental climate', 'Dfa', 'Hot-summer humid continental climate', 'Dfa', @User, @User, GETDATE(), GETDATE())
, (39, 1, 39, 41, 'Dfb', 'Warm-summer humid continental climate', 'Dfb', 'Dfb', 'Dfb', 'Dfb', 'Warm-summer humid continental climate', 'Dfb', 'Warm-summer humid continental climate', 'Dfb', @User, @User, GETDATE(), GETDATE())
, (40, 1, 40, 41, 'Dfc', 'Subarctic climate', 'Dfc', 'Dfc', 'Dfc', 'Dfc', 'Subarctic climate', 'Dfc', 'Subarctic climate', 'Dfc', @User, @User, GETDATE(), GETDATE())
, (41, 1, 41, 41, 'Dfd', 'Extremely cold subarctic climate', 'Dfd', 'Dfd', 'Dfd', 'Dfd', 'Extremely cold subarctic climate', 'Dfd', 'Extremely cold subarctic climate', 'Dfd', @User, @User, GETDATE(), GETDATE())
, (42, 1, 42, 41, 'Dsa', 'Hot, dry-summer continental climate', 'Dsa', 'Dsa', 'Dsa', 'Dsa', 'Hot, dry-summer continental climate', 'Dsa', 'Hot, dry-summer continental climate', 'Dsa', @User, @User, GETDATE(), GETDATE())
, (43, 1, 43, 41, 'Dsb', 'Warm, dry-summer continental climate', 'Dsb', 'Dsb', 'Dsb', 'Dsb', 'Warm, dry-summer continental climate', 'Dsb', 'Warm, dry-summer continental climate', 'Dsb', @User, @User, GETDATE(), GETDATE())
, (44, 1, 44, 41, 'Dsc', 'Dry-summer subarctic climate', 'Dsc', 'Dsc', 'Dsc', 'Dsc', 'Dry-summer subarctic climate', 'Dsc', 'Dry-summer subarctic climate', 'Dsc', @User, @User, GETDATE(), GETDATE())
, (45, 1, 45, 41, 'Dsd', 'Subarctic climate', 'Dsd', 'Dsd', 'Dsd', 'Dsd', 'Subarctic climate', 'Dsd', 'Subarctic climate', 'Dsd', @User, @User, GETDATE(), GETDATE())
, (46, 1, 46, 41, 'Dwa', 'Monsoon-influenced hot-summer humid continental climate', 'Dwa', 'Dwa', 'Dwa', 'Dwa', 'Monsoon-influenced hot-summer humid continental climate', 'Dwa', 'Monsoon-influenced hot-summer humid continental climate', 'Dwa', @User, @User, GETDATE(), GETDATE())
, (47, 1, 47, 41, 'Dwb', 'Monsoon-influenced warm-summer humid continental climate', 'Dwb', 'Dwb', 'Dwb', 'Dwb', 'Monsoon-influenced warm-summer humid continental climate', 'Dwb', 'Monsoon-influenced warm-summer humid continental climate', 'Dwb', @User, @User, GETDATE(), GETDATE())
, (48, 1, 48, 41, 'Dwc', 'Monsoon-influenced subarctic climate', 'Dwc', 'Dwc', 'Dwc', 'Dwc', 'Monsoon-influenced subarctic climate', 'Dwc', 'Monsoon-influenced subarctic climate', 'Dwc', @User, @User, GETDATE(), GETDATE())
, (49, 1, 49, 41, 'Dwd', 'Monsoon-influenced extremely cold subarctic climate', 'Dwd', 'Dwd', 'Dwd', 'Dwd', 'Monsoon-influenced extremely cold subarctic climate', 'Dwd', 'Monsoon-influenced extremely cold subarctic climate', 'Dwd', @User, @User, GETDATE(), GETDATE())
, (50, 1, 50, 41, 'EF', 'Ice cap climate', 'EF', 'EF', 'EF', 'EF', 'Ice cap climate', 'EF', 'Ice cap climate', 'EF', @User, @User, GETDATE(), GETDATE())
, (51, 1, 51, 41, 'ET', 'Tundra', 'ET', 'ET', 'ET', 'ET', 'Tundra', 'ET', 'Tundra', 'ET', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationValueLanguages OFF;

SET IDENTITY_INSERT ClassificationValueRoles ON;
INSERT INTO ClassificationValueRoles (ClassificationValueRoleId, ClassificationId, ClassificationValueId, RoleId, ClassificationRelationTypeId, CreatorId, ModifierId,CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, @Role, 1, @User, @User, getdate(), getdate())
, (2, 1, 2, @Role, 1, @User, @User, getdate(), getdate())
, (3, 1, 3, @Role, 1, @User, @User, getdate(), getdate())
, (4, 1, 4, @Role, 1, @User, @User, getdate(), getdate())
, (5, 1, 5, @Role, 1, @User, @User, getdate(), getdate())
, (6, 2, 6, @Role, 1, @User, @User, getdate(), getdate())
, (7, 2, 7, @Role, 1, @User, @User, getdate(), getdate())
, (8, 2, 8, @Role, 1, @User, @User, getdate(), getdate())
, (9, 2, 9, @Role, 1, @User, @User, getdate(), getdate())
, (10, 2, 10, @Role,1, @User, @User, getdate(), getdate());
SET IDENTITY_INSERT ClassificationValueRoles OFF;

SET IDENTITY_INSERT ClassificationValueUsers ON;
INSERT INTO ClassificationValueUsers (ClassificationValueUserId, ClassificationId, ClassificationValueId, UserId, ClassificationRelationTypeId, CreatorId, ModifierId,CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, @User, 1, @User, @User, getdate(), getdate())
, (2, 1, 2, @User, 1, @User, @User, getdate(), getdate())
, (3, 1, 3, @User, 1, @User, @User, getdate(), getdate())
, (4, 1, 4, @User, 1, @User, @User, getdate(), getdate())
, (5, 1, 5, @User, 1, @User, @User, getdate(), getdate())
, (6, 2, 6, @User, 1, @User, @User, getdate(), getdate())
, (7, 2, 7, @User, 1, @User, @User, getdate(), getdate())
, (8, 2, 8, @User, 1, @User, @User, getdate(), getdate())
, (9, 2, 9, @User, 1, @User, @User, getdate(), getdate())
, (10, 2, 10, @User, 1, @User, @User, getdate(), getdate());
SET IDENTITY_INSERT ClassificationValueUsers OFF;


SET IDENTITY_INSERT ClassificationPages ON;
INSERT INTO ClassificationPages (ClassificationPageId, ClassificationId, StatusId, ShowtitleName, ShowTitleDescription, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 2, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 3, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPages OFF;

SET IDENTITY_INSERT ClassificationPageLanguages ON;
INSERT INTO ClassificationPageLanguages(ClassificationPageLanguageId, ClassificationId, ClassificationPageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 41, 'Default climate', 'Default climate page', 'Default climate page', 'Default climate page', 'Default climate page', 'Default climate page', @User, @User, GETDATE(), GETDATE())
, (2, 2, 2, 41, 'Default soil', 'Default soil page', 'Default soil page', 'Default soil page', 'Default soil page', 'Default soil page', @User, @User, GETDATE(), GETDATE())
, (3, 3, 3, 41, 'Default crop', 'Default crop page', 'Default crop page', 'Default crop page', 'Default crop page', 'Default crop page', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageLanguages OFF;


--SET IDENTITY_INSERT [dbo].[PageSections] ON 
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 1, 1, 1, 1, 1, 0, N'', 4, 4, 0, 0, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (2, 1, 1, 1, 1, 1, 1, 0, N'', 4, 4, 0, 4, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (3, 2, 1, 1, 1, 1, 1, 0, N'', 1, 1, 1, 1, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (4, 2, 1, 1, 1, 1, 1, 0, N'', 1, 1, 1, 2, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (5, 3, 1, 1, 1, 1, 1, 0, N'', 1, 1, 1, 1, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (6, 3, 1, 1, 1, 1, 1, 0, N'', 1, 1, 1, 2, NULL, 1, 5, 1, @user, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (7, 1, 4, 2, 1, 1, 1, 0, CONCAT(N'UserId =''',@User,''''), 4, 4, 4, 0, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (8, 1, 5, 2, 1, 1, 1, 0, N'OrganizationId = 1', 4, 4, 4, 4, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (9, 1, 6, 2, 1, 1, 1, 0, N'ProjectId = 1', 4, 4, 8, 0, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--INSERT [dbo].[PageSections] ([PageSectionID], [PageID], [PageSectionTypeID], [PageSectionDataTypeID], [ShowSectionTitleName], [ShowSectionTitleDescription], [ShowContentTypeTitleName], [ShowContentTypeTitleDescription], [QueryBuilderRule], [SizeX], [SizeY], [DashboardRow], [DashboardColumn], [ContentTypeID], [SortByID], [MaxContent], [HasPaging], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (10, 1, 7, 2, 1, 1, 1, 0, N'', 4, 4, 8, 4, NULL, 1, 5, 1, @User, @User, getdate(), getdate())
--SET IDENTITY_INSERT [dbo].[PageSections] OFF



--SET IDENTITY_INSERT ClassificationPageSectionLanguages ON;
--INSERT INTO ClassificationPageSectionLanguages(ClassificationPageSectionLanguageId, ClassificationId, ClassificationPageId, ClassificationPageSectionId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
--(1, 1, 1, 1, 41, 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate title name', 'Newest climate title description', @User, @User, GETDATE(), GETDATE())
--, (2, 1, 1, 2, 41, 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
--, (3, 2, 2, 3, 41, 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil title name', 'Newest Soil title description', @User, @User, GETDATE(), GETDATE())
--, (4, 2, 2, 4, 41, 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most Soil Soil title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
--, (5, 3, 3, 5, 41, 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop title name', 'Newest Crop title description', @User, @User, GETDATE(), GETDATE())
--, (6, 3, 3, 6, 41, 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop title name', 'Most visited Crop title description', @User, @User, GETDATE(), GETDATE())
--SET IDENTITY_INSERT ClassificationPageSectionLanguages OFF;


SET IDENTITY_INSERT ContentTypeGroups ON;
INSERT INTO ContentTypeGroups (ContentTypeGroupId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1, 1, @User, @User, GETDATE(), GETDATE())
 , (2, 2, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeGroups OFF;


SET IDENTITY_INSERT ContentTypeGroupLanguages ON;
INSERT INTO ContentTypeGroupLanguages(ContentTypeGroupLanguageId, ContentTypeGroupId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Knowledge', 'Knowledge', 'Knowledge', 'Knowledge', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Assignments', 'Assignments', 'Assignments', 'Assignments', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeGroupLanguages OFF;

SET IDENTITY_INSERT [dbo].[ContentTypes] ON 
INSERT [dbo].[ContentTypes] ([ContentTypeID], [ContentTypeGroupID], [SecurityLevelID], [CodePrefix], [CodeSuffix], [CodeTypeId], [VersionTypeId], [AttachmentVersionTypeId], [AttachmentTypeId], [ObjectTypeStatusId], [IsClaimOwnership], [IsRelationBasedOwnership], [IsProjectBasedOwnership], [IsOrganizationBasedOwnership], [IsFreeOwnership], [IsRelationBasedEdit], [IsRelationBasedEditSelectable], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSelectable], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationRoleBasedAllRoles], [IsOrganizationRoleBasedOwner], [IsOrganizationRoleBasedRead], [IsOrganizationRoleBasedEdit], [IsOrganizationRoleBasedReadSelectable], [IsOrganizationRoleBasedEditSelectable], [IsProjectBasedEdit], [IsProjectBasedEditSelectable], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsFreeEdit], [IsProjectRoleBasedAllRoles], [IsProjectRoleBasedOwner], [IsProjectRoleBasedRead], [IsProjectRoleBasedEdit], [IsProjectRoleBasedReadSelectable], [IsProjectRoleBasedEditSelectable], [IsFreeEditSelectable], [IsRelationBasedRead], [IsRelationBasedReadSelectable], [IsOrganizationBasedRead], [IsOrganizationBasedReadSelectable], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedRead], [IsProjectBasedReadSelectable], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [IsFreeRead], [IsFreeReadSelectable], [CanRate], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1,  1, N'a', N'A', 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'#008000ff', 1, @User, @User, getdate(), getdate())
INSERT [dbo].[ContentTypes] ([ContentTypeID], [ContentTypeGroupID], [SecurityLevelID], [CodePrefix], [CodeSuffix], [CodeTypeId], [VersionTypeId], [AttachmentVersionTypeId], [AttachmentTypeId], [ObjectTypeStatusId], [IsClaimOwnership], [IsRelationBasedOwnership], [IsProjectBasedOwnership], [IsOrganizationBasedOwnership], [IsFreeOwnership], [IsRelationBasedEdit], [IsRelationBasedEditSelectable], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSelectable], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationRoleBasedAllRoles], [IsOrganizationRoleBasedOwner], [IsOrganizationRoleBasedRead], [IsOrganizationRoleBasedEdit], [IsOrganizationRoleBasedReadSelectable], [IsOrganizationRoleBasedEditSelectable], [IsProjectBasedEdit], [IsProjectBasedEditSelectable], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsFreeEdit], [IsProjectRoleBasedAllRoles], [IsProjectRoleBasedOwner], [IsProjectRoleBasedRead], [IsProjectRoleBasedEdit], [IsProjectRoleBasedReadSelectable], [IsProjectRoleBasedEditSelectable], [IsFreeEditSelectable], [IsRelationBasedRead], [IsRelationBasedReadSelectable], [IsOrganizationBasedRead], [IsOrganizationBasedReadSelectable], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedRead], [IsProjectBasedReadSelectable], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [IsFreeRead], [IsFreeReadSelectable], [CanRate], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 1, 1, N'b', N'B', 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'#008000ff', 1, @User, @User, getdate(), getdate())
INSERT [dbo].[ContentTypes] ([ContentTypeID], [ContentTypeGroupID], [SecurityLevelID], [CodePrefix], [CodeSuffix], [CodeTypeId], [VersionTypeId], [AttachmentVersionTypeId], [AttachmentTypeId], [ObjectTypeStatusId], [IsClaimOwnership], [IsRelationBasedOwnership], [IsProjectBasedOwnership], [IsOrganizationBasedOwnership], [IsFreeOwnership], [IsRelationBasedEdit], [IsRelationBasedEditSelectable], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSelectable], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationRoleBasedAllRoles], [IsOrganizationRoleBasedOwner], [IsOrganizationRoleBasedRead], [IsOrganizationRoleBasedEdit], [IsOrganizationRoleBasedReadSelectable], [IsOrganizationRoleBasedEditSelectable], [IsProjectBasedEdit], [IsProjectBasedEditSelectable], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsFreeEdit], [IsProjectRoleBasedAllRoles], [IsProjectRoleBasedOwner], [IsProjectRoleBasedRead], [IsProjectRoleBasedEdit], [IsProjectRoleBasedReadSelectable], [IsProjectRoleBasedEditSelectable], [IsFreeEditSelectable], [IsRelationBasedRead], [IsRelationBasedReadSelectable], [IsOrganizationBasedRead], [IsOrganizationBasedReadSelectable], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedRead], [IsProjectBasedReadSelectable], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [IsFreeRead], [IsFreeReadSelectable], [CanRate], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 2, 1, N'c', N'C', 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'#008000ff', 1, @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[ContentTypes] OFF


SET IDENTITY_INSERT ContentTypeLanguages ON;
INSERT INTO ContentTypeLanguages(ContentTypeLanguageId, ContentTypeId, LanguageId, Name, Description, MenuName, MouseOver, RatingLabel, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Climate knowledge', 'Climate knowledge', 'Climate knowledge', 'Climate knowledge','Rate research', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Soil knowledge', 'Soil knowledge', 'Soil knowledge', 'Soil knowledge', 'Rate knowledge contribution', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'General assignment', 'General assignment', 'General assignment', 'General assignment', 'Rate assignment', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeLanguages OFF;

SET IDENTITY_INSERT ContentTypeClassifications ON;
INSERT INTO ContentTypeClassifications ( ContentTypeClassificationId, ContentTypeId, ClassificationId, ObjectTypeClassificationStatusId, ModifierId, ModifiedDate) VALUES 
 (1, 1, 1, 3, @User, GETDATE())
, (2, 1, 2, 2, @User, GETDATE())
, (3, 1, 3, 2, @User, GETDATE())
, (4, 2, 1, 2, @User, GETDATE())
, (5, 2, 2, 3, @User, GETDATE())
, (6, 2, 3, 2, @User, GETDATE())
, (7, 3, 1, 2, @User, GETDATE())
, (8, 3, 2, 2, @User, GETDATE())
, (9, 3, 3, 2, @User, GETDATE())
SET IDENTITY_INSERT ContentTypeClassifications OFF;


SET IDENTITY_INSERT [dbo].[OrganizationTypes] ON 

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 1, 1, 0, N'b', N'b', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (6, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (7, 1, 1, 0, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (8, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (9, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (10, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (11, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (12, 1, 0, 0, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (13, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (14, 1, 1, 0, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (15, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (16, 1, 0, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (17, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (18, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (19, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (20, 1, 1, 1, N'a', N'a', 1, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (21, 1, 1, 1, N'a', N'a', 1, 1, N'a        ', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypes] ([OrganizationTypeID], [HasAnyChildOrganization], [Internal], [LegalEntity], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (22, 1, 1, 1, N'a', N'a', 1, 1, N'a        ', 1, @User, @User, GETDATE(), GETDATE())

SET IDENTITY_INSERT [dbo].[OrganizationTypes] OFF

SET IDENTITY_INSERT [dbo].[OrganizationTypeLanguages] ON 

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 41, N'Legal entity', N'Legal entity', N'Legal entity', N'Legal entity', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 41, N'Internal entity', N'Internal entity', N'Internal entity', N'Internal entity', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 3, 41, N'Primary School', N'Primary School', N'Primary School', N'Primary School', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 4, 41, N'Publication', N'Publication', N'Publication', N'Publication', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 5, 41, N'School District', N'School District', N'School District', N'School District', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (6, 6, 41, N'State Jurisdiction', N'State Jurisdiction', N'State Jurisdiction', N'State Jurisdiction', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (7, 7, 41, N'Library', N'Library', N'Library', N'Library', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (8, 8, 41, N'Archive', N'Archive', N'Archive', N'Archive', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (9, 9, 41, N'Museum', N'Museum', N'Museum', N'Museum', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (10, 10, 41, N'TV Network', N'TV Network', N'TV Network', N'TV Network', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (11, 11, 41, N'Forensics Lab', N'Forensics Lab', N'Forensics Lab', N'Forensics Lab', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (12, 12, 41, N'Agricultural Division', N'Agricultural Division', N'Agricultural Division', N'Agricultural Division', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (13, 13, 41, N'Publisher', N'Publisher', N'Publisher', N'Publisher', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (14, 14, 41, N'Facilities Management Team', N'Facilities Management Team', N'Facilities Management Team', N'Facilities Management Team', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (15, 15, 41, N'State Department of Education', N'State Department of Education', N'State Department of Education', N'State Department of Education', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (16, 16, 41, N'Federal Department of Education', N'Federal Department of Education', N'Federal Department of Education', N'Federal Department of Education', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (17, 17, 41, N'pre-kindergarten', N'pre-kindergarten', N'pre-kindergarten', N'pre-kindergarten', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (18, 18, 41, N'Kindergarten', N'Kindergarten', N'Kindergarten', N'Kindergarten', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (19, 19, 41, N'Elementary school', N'Elementary school', N'Elementary school', N'Elementary school', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (23, 20, 41, N'Middle school', N'Middle school', N'Middle school', N'Middle school', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (24, 21, 41, N'High school', N'High school', N'High school', N'High school', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[OrganizationTypeLanguages] ([OrganizationTypeLanguageID], [OrganizationTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (25, 22, 41, N'Preschools', N'Preschools', N'Preschools', N'Preschools', @User, @User, GETDATE(), GETDATE())

SET IDENTITY_INSERT [dbo].[OrganizationTypeLanguages] OFF

SET IDENTITY_INSERT [dbo].[Organizations] ON 

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, NULL, 1, 16, NULL, NULL, NULL, NULL, @User, @User, getdate(), getdate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 1, 1, 15, NULL, NULL, NULL, NULL, @User, @User, getdate(), getdate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 1, 1, 15, N'', NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 2, 1, 5, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 2, 1, 5, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (6, 4, 1, 22, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (7, 4, 1, 19, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (8, 4, 1, 19, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (10, 4, 1, 21, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Organizations] ([OrganizationID], [ParentOrganizationID], [StatusID], [OrganizationTypeID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (11, 4, 1, 21, NULL, NULL, NULL, NULL, @User, @User, GetDate(), GetDate())

SET IDENTITY_INSERT [dbo].[Organizations] OFF

SET IDENTITY_INSERT [dbo].[OrganizationLanguages] ON 

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 41, N'US Department of Education', N'US Department of Education', N'US Department of Education', N'US Department of Education', @User, @User, getdate(), getdate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 41, N'New Jersey Department of Education', N'New Jersey Department of Education', N'New Jersey Department of Education', N'New Jersey Department of Education', @User, @User, getdate(), getdate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (3, 3, 41, N'New York State Education Department', N'New York State Education Department', N'New York State Education Department', N'New York State Education Department', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (4, 4, 41, N'Newark Public Schools', N'Newark Public Schools', N'Newark Public Schools', N'Newark Public Schools', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (5, 5, 41, N'Absecon Public School District', N'Absecon Public School District', N'Absecon Public School District', N'Absecon Public School District', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (6, 6, 41, N'Early Childhood Center - Centra', N'Early Childhood Center - Centra', N'Early Childhood Center - Centra', N'Early Childhood Center - Centra', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (7, 7, 41, N'Abington Avenue School', N'Abington Avenue School', N'Abington Avenue School', N'Abington Avenue School', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (8, 8, 41, N'Alexander Street School', N'Alexander Street School', N'Alexander Street School', N'Alexander Street School', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (9, 10, 41, N'Newark Arts High School', N'Newark Arts High School', N'Newark Arts High School', N'Newark Arts High School', @User, @User, GetDate(), GetDate())

INSERT [dbo].[OrganizationLanguages] ([OrganizationLanguageID], [OrganizationID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorId], [ModifierId], [ModifiedDate], [CreatedDate]) VALUES (10, 11, 41, N'American History High School', N'American History High School', N'American History High School', N'American History High School', @User, @User, GetDate(), GetDate())

SET IDENTITY_INSERT [dbo].[OrganizationLanguages] OFF




SET IDENTITY_INSERT OrganizationAddresses ON;
INSERT INTO OrganizationAddresses (OrganizationAddressId,OrganizationId,AddressTypeId,Address1,Address2,HouseNumber,HouseNumberExt,Location, City, PostalCode,PostalCodeExt, CountryId, ProvinceState,County,CreatorId,ModifierId,CreatedDate,ModifiedDate) 
VALUES (1, 1, 1, 'Rama 4','Lumpini','110','a',geography::STGeomFromText('POINT(51.477805 -0.0025417)' , 4326),'Bangkok','12000','',221,'Bangkok','',@User, @User, getdate(),getdate());
SET IDENTITY_INSERT OrganizationAddresses OFF;


SET IDENTITY_INSERT OrganizationTelecoms ON;
INSERT INTO OrganizationTelecoms(OrganizationTelecomId, OrganizationId, TelecomTypeId, TelecomValue, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 2, 'MegaDodo', @User, @User, GETDATE(), GETDATE()), (2, 1, 1, '11234', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTelecoms OFF;

INSERT INTO OrganizationTelecomPhones(OrganizationTelecomId, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES 
(2, '+66', '2', '42', 'Ford')

SET IDENTITY_INSERT Pages ON;
INSERT INTO Pages (PageId, StatusId, ShowtitleName,  ShowTitleDescription, UserID,CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
--  (1, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
  (2, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
, (3, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
, (4, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
, (5, 1, 1, 1, @User,  @User, @User, GETDATE(), GETDATE())
, (6, 1, 1, 1, @User,  @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT Pages OFF;

SET IDENTITY_INSERT PageLanguages ON;
INSERT INTO PageLanguages(PageLanguageId, PageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
--  (1, 1, 41, 'Search result', 'Search result', 'Search result', 'Search result', 'Search result', 'Search result', @User, @User, GETDATE(), GETDATE())
 (2, 2, 41, 'Top stories', 'Top stories', 'Top stories', 'Top stories', 'Top stories', 'Top stories', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', @User, @User, GETDATE(), GETDATE())
, (4, 4, 41, 'Project stories', 'Project stories', 'Project stories', 'Project stories', 'Project stories', 'Project stories', @User, @User, GETDATE(), GETDATE())
, (5, 5, 41, 'To do', 'To do', 'To do', 'To do', 'To do', 'To do', @User, @User, GETDATE(), GETDATE())
, (6, 6, 41, 'Calendar', 'Calendar', 'Calendar', 'Calendar', 'Calendar', 'Calendar', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageLanguages OFF;

SET IDENTITY_INSERT PageSections ON;
INSERT INTO PageSections (PageSectionId, PageId, 
PageSectionTypeId, PageSectionDataTypeId,
ShowSectionTitleName, ShowSectionTitleDescription, 
ShowContentTypeTitleName, ShowContentTypeTitleDescription,
SizeX,SizeY,DashboardRow, DashboardColumn,  SortById, MaxContent, HasPaging, [QueryBuilderRule], CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (7, 2, 1, 1, 1, 1, 1, 0, 4,4,0,0, 1, 5, 1, '', @User, @User, GETDATE(), GETDATE())
, (8, 2, 1, 1, 1, 1, 1, 0, 4,4,0,4, 1, 5, 1, '', @User, @User, GETDATE(), GETDATE())
, (9, 3, 1, 1, 1, 1, 1, 0, 4,4,0,0, 1, 5, 1, '', @User, @User, GETDATE(), GETDATE())
, (10, 3, 1, 1, 1, 1, 1, 0, 0,4,0,4, 1, 5, 1, '', @User, @User, GETDATE(), GETDATE())
, (11, 4, 1, 1, 1, 1, 1, 0, 0,0,0,0, 1, 5, 1, '', @User, @User, GETDATE(), GETDATE())
, (12, 4, 1, 1, 1, 1, 1, 0, 0,4,0,4, 1, 5, 1, '', @User, @User, GETDATE(), GETDATE())
, (13, 2, 4, 2, 1, 1, 1, 0, 4,4,4,0, 1, 5, 1, 'UserId =' + @User + '''', @User, @User, GETDATE(), GETDATE())
, (14, 2, 5, 2, 1, 1, 1, 0, 4,4,4,4, 1, 5, 1, 'OrganizationId = 1', @User, @User, GETDATE(), GETDATE())
, (15, 2, 6, 2, 1, 1, 1, 0, 4,4,8,0, 1, 5, 1, 'ProjectId = 1',@User, @User, GETDATE(), GETDATE())
, (16, 2, 7, 2, 1, 1, 1, 0, 4,4,8,4, 1, 5, 1, '',@User, @User, GETDATE(), GETDATE())
, (17, 5, 1, 2, 1, 1, 1, 0, 10,10,0,0, 1, 5, 1, '',@User, @User, GETDATE(), GETDATE())
, (18, 6, 4, 2, 1, 1, 1, 0, 10,10,0,0, 1, 5, 1, '',@User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageSections OFF;


SET IDENTITY_INSERT PageSectionLanguages ON;
INSERT INTO PageSectionLanguages(PageSectionLanguageId,  PageId, PageSectionId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
   (7, 2, 7, 41, 'New stories', 'New stories', 'New stories', 'New stories', 'New stories', 'New stories', @User, @User, GETDATE(), GETDATE())
 , (8, 2, 8, 41, 'Most visited', 'Most visited', 'Most visited', 'Most visited', 'Most visited', 'Most visited', @User, @User, GETDATE(), GETDATE())
 , (9, 3, 9, 41, 'Approved research', 'Approved research', 'Approved research', 'Approved research', 'Approved research', 'Approved research', @User, @User, GETDATE(), GETDATE())
 , (10, 3, 10, 41, 'Pending research', 'Pending research', 'Pending research', 'Pending research', 'Pending research', 'Pending research', @User, @User, GETDATE(), GETDATE())
, (11, 4, 11, 41, 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', @User, @User, GETDATE(), GETDATE())
, (12, 4, 12, 41, 'Content', 'Content', 'Content', 'Content', 'Content', 'Content', @User, @User, GETDATE(), GETDATE())
, (13, 4, 13, 41, 'Personal calendar', 'Personal calendar', 'Personal calendar', 'Personal calendar', 'Personal calendar', 'Personal calendar', @User, @User, GETDATE(), GETDATE())
, (14, 4, 14, 41, 'Organization calendar', 'Organization calendar', 'Organization calendar', 'Organization calendar', 'Organization calendar', 'Organization calendar', @User, @User, GETDATE(), GETDATE())
, (15, 4, 15, 41, 'Project calendar', 'Project calendar', 'Project calendar', 'Project calendar', 'Project calendar', 'Project calendar', @User, @User, GETDATE(), GETDATE())
, (16, 4, 16, 41, 'General calendar', 'General calendar', 'General calendar', 'General calendar', 'General calendar', 'General calendar', @User, @User, GETDATE(), GETDATE())
, (17, 5, 17, 41, 'To do', 'To do', 'To do', 'To do', 'To do', 'To do', @User, @User, GETDATE(), GETDATE())
, (18, 6, 18, 41, 'Personal calendar', 'Personal calendar', 'Personal calendar', 'Personal calendar', 'Personal calendar', 'Personal calendar', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageSectionLanguages OFF;

SET IDENTITY_INSERT [dbo].[PersonTypes] ON 

INSERT [dbo].[PersonTypes] ([PersonTypeID], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, N'a', N'a', 2, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[PersonTypes] ([PersonTypeID], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, N'b', N'b', 2, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[PersonTypes] ([PersonTypeID], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, N'c', N'c', 2, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[PersonTypes] ([PersonTypeID], [CodePrefix], [CodeSuffix], [CodeTypeId], [ObjectTypeStatusId], [Color], [IconID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, N'd', N'd', 2, 1, N'#008000ff', 1, @User, @User, GETDATE(), GETDATE())

SET IDENTITY_INSERT [dbo].[PersonTypes] OFF

SET IDENTITY_INSERT [dbo].[PersonTypeLanguages] ON 

INSERT [dbo].[PersonTypeLanguages] ([PersonTypeLanguageID], [PersonTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 41, N'School staff', N'School staff', N'School staff', N'School staff', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[PersonTypeLanguages] ([PersonTypeLanguageID], [PersonTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 41, N'Student', N'Student', N'Student', N'Student', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[PersonTypeLanguages] ([PersonTypeLanguageID], [PersonTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 3, 41, N'Parent', N'Parent', N'Parent', N'Parent', @User, @User, GETDATE(), GETDATE())

INSERT [dbo].[PersonTypeLanguages] ([PersonTypeLanguageID], [PersonTypeID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 4, 41, N'Admin', N'Admin', N'Admin', N'Admin', @User, @User, GETDATE(), GETDATE())

SET IDENTITY_INSERT [dbo].[PersonTypeLanguages] OFF



SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (1, 1, N'a', 1, N'a', N'a1a', N'Mr', N'Dirk', N'', N'Gently', N'', N'', N'Dirk', N'Dirk', N'', N'Gently', 1, CAST(N'1942-01-01' AS Date), NULL, 1, NULL, @User, @User, getdate(), getdate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (2, 4, N'd', 1, N'd', N'd1d', N'Mr', N'Peter', N'', N'le Grand', N'', N'', N'Peter', N'Peter', N'', N'le Grand', 1, CAST(N'1942-01-01' AS Date), NULL, 1, @User, @User, @User, getdate(), getdate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (3, 2, N'b', 1, N'b', N'b1b', N'Mr', N'Ford', N'', N'Prefect', N'', N'', N'Ford', N'Ford', N'', N'Prefect', 1, CAST(N'2050-01-01' AS Date), NULL, 1, @User2, @User, @User, getdate(), getdate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (4, 2, N'b', 2, N'b', N'b2b', N'Mr', N'Scott', N' ', N'Mayo', N' ', N' ', N'Scott', N'Scott', N' ', N'Mayo', 1, CAST(N'2014-04-04' AS Date), NULL, 10, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (5, 2, N'b', 3, N'b', N'b3b', N'Mr', N'Efrain', N' ', N'Rodriguez', N' ', N' ', N'Efrain', N'Efrain', N' ', N'Rodriguez', 1, CAST(N'2016-03-04' AS Date), NULL, 8, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (6, 2, N'b', 4, N'b', N'b4b', N'Mr', N'Canelo', N'Hernandez', N'de la Hoya', N' ', N'II', N'Canelo', N'Canelo', N'Hernandez', N'de la Hoya', 1, CAST(N'2017-08-05' AS Date), NULL, 6, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (7, 2, N'b', 5, N'b', N'b5b', N'Ms', N'Lourdes', N'Ellen', N'Anzalone', N' ', N' ', N'Lourdes', N'Lourdes', N'Ellen', N'Anzalone', 2, CAST(N'2005-11-08' AS Date), NULL, 7, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (8, 2, N'b', 6, N'b', N'b6b', N'Ms', N'Helena', N'Teresa', N'Smith', N' ', N' ', N'Helena', N'Helena', N'Teresa', N'Smith', 2, CAST(N'2011-04-06' AS Date), NULL, 7, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (9, 3, N'c', 1, N'c', N'c1c', N'Mrs', N'Melody', N' ', N'Suarez', N' ', N' ', N'Melody', N'Melody', N' ', N'Suarez', 2, CAST(N'1980-01-04' AS Date), NULL, 8, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (10, 3, N'c', 2, N'c', N'c2c', N'Mr', N'Henry', N' ', N'Smith', N' ', N' ', N'Henry', N'Henry', N' ', N'Smith', 1, CAST(N'1983-01-01' AS Date), NULL, 7, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (11, 3, N'c', 3, N'c', N'c3c', N'Mrs', N'Ethel', N' ', N'Miram', N'Doctor', N' ', N'Ethel', N'Ethel', N' ', N'Miram', 2, CAST(N'1982-04-05' AS Date), NULL, 8, NULL, @User, @User, GetDate(), GetDate())

INSERT [dbo].[Persons] ([PersonID], [PersonTypeId], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Salutation], [FirstName], [MiddleName], [LastName], [PersonalTitle], [Suffix], [NickName], [FirstNameLocal], [MiddleNameLocal], [LastNameLocal], [GenderID], [BirthDate], [DeceasedDate], [DefaultOrganizationID], [UserID], [CreatorID], [ModifierID], [CreatedDate], [ModifiedDate]) VALUES (12, 2, N'b', 7, N'b', N'b7b', N'Mr', N'Charlie', N'Edward', N'Champles', N' ', N' ', N'Charlie', N'Charlie', N'Edward', N'Champles', 1, CAST(N'2009-01-21' AS Date), NULL, 9, NULL, @User, @User, GetDate(), GetDate())

SET IDENTITY_INSERT [dbo].[Persons] OFF

SET IDENTITY_INSERT PersonAddresses ON;
INSERT INTO PersonAddresses( PersonAddressId, PersonId, AddressTypeId, AttnName, Address1, Address2, HouseNumber, HouseNumberExt
	, Location, City, PostalCode, PostalCodeExt, CountryId, County 
	, CreatorId, ModifierId, CreatedDate, ModifiedDate)
VALUES(1,1,1,'Dirk','Downingstreet', '','0','',geography::STGeomFromText('POINT(51.477805 -0.0025417)' , 4326), 'London','1', '',1,'', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT PersonAddresses OFF;

SET IDENTITY_INSERT PersonTelecoms ON;
INSERT INTO PersonTelecoms(PersonTelecomId, PersonId, TelecomTypeId, TelecomValue, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 2, 'Frogstar', @User, @User, GETDATE(), GETDATE()), (2, 1, 1, '121212', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PersonTelecoms OFF;

INSERT INTO PersonTelecomPhones(PersonTelecomId, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES 
(2, '+2', '2', '42', 'Ford')

SET IDENTITY_INSERT ProcessTypeGroups ON;
INSERT INTO ProcessTypeGroups (ProcessTypeGroupId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1, @User, @User, GETDATE(), GETDATE())
,(2,2, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTypeGroups OFF;

SET IDENTITY_INSERT ProcessTypeGroupLanguages ON;
INSERT INTO ProcessTypeGroupLanguages (ProcessTypeGroupLanguageId, ProcessTypeGroupId,LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1, 41, 'Assignments', 'Assignments', 'Assignments', 'Assignments', @User, @User, GETDATE(), GETDATE())
,(2,2, 41, 'Knowledge', 'Knowledge', 'Knowledge', 'Knowledge', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTypeGroupLanguages OFF;

SET IDENTITY_INSERT ProcessTypes ON;
INSERT INTO ProcessTypes (ProcessTypeId, ProcessTypeGroupId, ShowInPersonalCalendar, ShowInOrganizationCalendar, ShowInProjectCalendar, ShowInEventCalendar
, ProcessMultiMax, Sequence, IsPersonal, ObjectTypeStatusId, Color, IconID
, CodeTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,0,0,0,0
,10,1,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE())
,(2,1,0,0,0,0
,15,2,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE())
,(3,2,0,0,0,0
,15,1,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE())
,(4,2,1,0,0,0
,15,1,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE())
,(5,2,0,1,0,0
,15,1,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE())
,(6,2,0,0,1,0
,15,1,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE())
,(7,2,0,0,0,1
,15,1,0,1, '#008000ff',1
,2, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTypes OFF;

SET IDENTITY_INSERT ProcessTypeLanguages ON;
INSERT INTO ProcessTypeLanguages (ProcessTypeLanguageId, ProcessTypeId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,41, 'Game assignment', 'Game assignment', 'Game assignment', 'Game assignment', @User, @User, GETDATE(), GETDATE())
,(2,2,41, 'Research assignment', 'Research assignment', 'Research assignment', 'Research assignment', @User, @User, GETDATE(), GETDATE())
,(3,3,41, 'Proof reading', 'Proof reading', 'Proof reading', 'Proof reading', @User, @User, GETDATE(), GETDATE())
,(4,4,41, 'Personal appointment', 'Personal appointment', 'Personal appointment', 'Personal appointment', @User, @User, GETDATE(), GETDATE())
,(5,5,41, 'School event', 'School event', 'School event', 'School event', @User, @User, GETDATE(), GETDATE())
,(6,6,41, 'Project event', 'Project event', 'Project event', 'Project event', @User, @User, GETDATE(), GETDATE())
,(7,7,41, 'General event', 'General event', 'General event', 'General event', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTypeLanguages OFF;




SET IDENTITY_INSERT ProcessTypeFields ON;
INSERT INTO ProcessTypeFields (ProcessTypeFieldId, ProcessTypeId, ProcessTypeFieldTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,1, @User, @User, GETDATE(), GETDATE())
, (2,1,10, @User, @User, GETDATE(), GETDATE())
, (3,1,32, @User, @User, GETDATE(), GETDATE())
, (4,1,16, @User, @User, GETDATE(), GETDATE())
, (5,1,32, @User, @User, GETDATE(), GETDATE())
, (6,1,10, @User, @User, GETDATE(), GETDATE())
, (7,1,3, @User, @User, GETDATE(), GETDATE())
, (8,1,10, @User, @User, GETDATE(), GETDATE())
, (9,1,10, @User, @User, GETDATE(), GETDATE())
, (10,1,4, @User, @User, GETDATE(), GETDATE())
, (11,1,4, @User, @User, GETDATE(), GETDATE())
, (12,1,4, @User, @User, GETDATE(), GETDATE())
, (13,2,1, @User, @User, GETDATE(), GETDATE())
, (14,2,10, @User, @User, GETDATE(), GETDATE())
, (15,2,32, @User, @User, GETDATE(), GETDATE())
, (16,2,32, @User, @User, GETDATE(), GETDATE())
, (17,2,10, @User, @User, GETDATE(), GETDATE())
, (18,2,3, @User, @User, GETDATE(), GETDATE())
, (19,2,10, @User, @User, GETDATE(), GETDATE())
, (20,2,10, @User, @User, GETDATE(), GETDATE())
, (21,2,4, @User, @User, GETDATE(), GETDATE())
, (22,2,4, @User, @User, GETDATE(), GETDATE())
, (23,2,4, @User, @User, GETDATE(), GETDATE())
, (24,3,1, @User, @User, GETDATE(), GETDATE())
, (25,3,32, @User, @User, GETDATE(), GETDATE())
, (26,3,24, @User, @User, GETDATE(), GETDATE())
, (27,3,22, @User, @User, GETDATE(), GETDATE())
, (28,3,10, @User, @User, GETDATE(), GETDATE())
, (29,3,32, @User, @User, GETDATE(), GETDATE())
, (30,3,10, @User, @User, GETDATE(), GETDATE())
, (31,3,10, @User, @User, GETDATE(), GETDATE())
, (32,1,12, @User, @User, GETDATE(), GETDATE())
, (33,2,12, @User, @User, GETDATE(), GETDATE())
, (34,1,28, @User, @User, GETDATE(), GETDATE())
, (35,1,33, @User, @User, GETDATE(), GETDATE())
, (36,2,33, @User, @User, GETDATE(), GETDATE())
, (37,2,28, @User, @User, GETDATE(), GETDATE())
, (38,3,28, @User, @User, GETDATE(), GETDATE())
, (39,4,10, @User, @User, GETDATE(), GETDATE())
, (40,4,8, @User, @User, GETDATE(), GETDATE())
, (41,4,9, @User, @User, GETDATE(), GETDATE())
, (42,4,1, @User, @User, GETDATE(), GETDATE())
, (43,4,12, @User, @User, GETDATE(), GETDATE())
, (44,5,10, @User, @User, GETDATE(), GETDATE())
, (45,5,8, @User, @User, GETDATE(), GETDATE())
, (46,5,9, @User, @User, GETDATE(), GETDATE())
, (47,5,1, @User, @User, GETDATE(), GETDATE())
, (48,5,14, @User, @User, GETDATE(), GETDATE())
, (49,6,10, @User, @User, GETDATE(), GETDATE())
, (50,6,8, @User, @User, GETDATE(), GETDATE())
, (51,6,9, @User, @User, GETDATE(), GETDATE())
, (52,6,1, @User, @User, GETDATE(), GETDATE())
, (53,6,16, @User, @User, GETDATE(), GETDATE())
, (54,7,10, @User, @User, GETDATE(), GETDATE())
, (55,7,8, @User, @User, GETDATE(), GETDATE())
, (56,7,9, @User, @User, GETDATE(), GETDATE())
, (57,7,1, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeFields OFF;

SET IDENTITY_INSERT ProcessTypeFieldLanguages ON;
INSERT INTO ProcessTypeFieldLanguages (ProcessTypeFieldLanguageId, ProcessTypeId, ProcessTypeFieldId, LanguageId , Name, Description, MenuName, MouseOver, MissingValueText
, CreatorId, ModifierId, ModifiedDate, CreatedDate ) VALUES 
(1,1,1,41, 'Subject', 'Game assignment', 'Game assignment', 'Game assignment', 'Game assignment missing', @User, @User, GETDATE(), GETDATE())
,(2,1,2,41, 'Assign', 'Research assignment', 'Research assignment', 'Research assignment', 'Research assignment missing', @User, @User, GETDATE(), GETDATE())
,(3,1,3,41, 'Assignment', 'Assignment', 'Assignment', 'Assignment', 'Assignment missing', @User, @User, GETDATE(), GETDATE())
,(4,1,4,41, 'Game', 'Game', 'Game', 'Game','Game', @User, @User, GETDATE(), GETDATE())
,(5,1,5,41, 'Student text', 'Student text', 'Student text', 'Student text','Student text', @User, @User, GETDATE(), GETDATE())
,(6,1,6,41, 'Submit', 'Submit', 'Submit', 'Submit','Submit', @User, @User, GETDATE(), GETDATE())
,(7,1,7,41, 'Result', 'Result', 'Result', 'Result','Result', @User, @User, GETDATE(), GETDATE())
,(8,1,8,41, 'Passed', 'Passed', 'Passed', 'Passed','Passed', @User, @User, GETDATE(), GETDATE())
,(9,1,9,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
,(10,1,10,41, 'Date assigned', 'Date assigned', 'Date assigned', 'Date assigned', 'Date assigned', @User, @User, GETDATE(), GETDATE())
,(11,1,11,41, 'Date sumitted', 'Date sumitted', 'Date sumitted', 'Date sumitted', 'Date sumitted', @User, @User, GETDATE(), GETDATE())
,(12,1,12,41, 'Date passed', 'Date passed', 'Date passed', 'Date passed', 'Date passed', @User, @User, GETDATE(), GETDATE())
,(13,2,13,41, 'Subject', 'Game assignment', 'Game assignment', 'Game assignment','Game assignment', @User, @User, GETDATE(), GETDATE())
,(14,2,14,41, 'Assign', 'Research assignment', 'Research assignment', 'Research assignment', 'Research assignment', @User, @User, GETDATE(), GETDATE())
,(15,2,15,41, 'Assignment', 'Assignment', 'Assignment', 'Assignment', 'Assignment', @User, @User, GETDATE(), GETDATE())
,(16,2,16,41, 'Student text', 'Student text', 'Student text', 'Student text', 'Student text', @User, @User, GETDATE(), GETDATE())
,(17,2,17,41, 'Submit', 'Submit', 'Submit', 'Submit','Submit', @User, @User, GETDATE(), GETDATE())
,(18,2,18,41, 'Result', 'Result', 'Result', 'Result','Result', @User, @User, GETDATE(), GETDATE())
,(19,2,19,41, 'Passed', 'Passed', 'Passed', 'Passed', 'Passed', @User, @User, GETDATE(), GETDATE())
,(20,2,20,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
,(21,2,21,41, 'Date assigned', 'Date assigned', 'Date assigned', 'Date assigned','Date assigned', @User, @User, GETDATE(), GETDATE())
,(22,2,22,41, 'Date sumitted', 'Date sumitted', 'Date sumitted', 'Date sumitted','Date sumitted', @User, @User, GETDATE(), GETDATE())
,(23,2,23,41, 'Date passed', 'Date passed', 'Date passed', 'Date passed', 'Date passed', @User, @User, GETDATE(), GETDATE())
,(24,3,24,41, 'Subject', 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(25,3,25,41, 'Student comment', 'Student comment', 'Student comment', 'Student comment',  'Student comment', @User, @User, GETDATE(), GETDATE())
,(26,3,26,41, 'Content', 'Content', 'Content', 'Content','Content', @User, @User, GETDATE(), GETDATE())
,(27,3,27,41, 'Area', 'Area', 'Area', 'Area','Area', @User, @User, GETDATE(), GETDATE())
,(28,3,28,41, 'Submit', 'Submit', 'Submit', 'Submit','Submit', @User, @User, GETDATE(), GETDATE())
,(29,3,29,41, 'Approver comment', 'Approver comment', 'Approver comment', 'Approver comment','Approver comment', @User, @User, GETDATE(), GETDATE())
,(30,3,30,41, 'Approve', 'Approve', 'Approve', 'Approve','Approve', @User, @User, GETDATE(), GETDATE())
,(31,3,31,41, 'Reject', 'Reject', 'Reject', 'Reject','Reject', @User, @User, GETDATE(), GETDATE())
,(32,1,32,41, 'Player', 'Player', 'Player', 'Player', 'Player', @User, @User, GETDATE(), GETDATE())
,(33,2,33,41, 'Student', 'Student', 'Student', 'Student','Student', @User, @User, GETDATE(), GETDATE())
,(34,1,34,41, 'Minimum security level', 'Minimum security level', 'Minimum security level', 'Minimum security level','Minimum security level', @User, @User, GETDATE(), GETDATE())
,(35,1,35,41, 'Role of approver', 'Role of approver', 'Role of approver', 'Role of approver','Role of approver', @User, @User, GETDATE(), GETDATE())
,(36,2,36,41, 'Role of approver', 'Role of approver', 'Role of approver', 'Role of approver','Role of approver', @User, @User, GETDATE(), GETDATE())
,(37,2,37,41, 'Minimum security level', 'Minimum security level', 'Minimum security level', 'Minimum security level','Minimum security level', @User, @User, GETDATE(), GETDATE())
,(38,3,38,41, 'Minimum security level', 'Minimum security level', 'Minimum security level', 'Minimum security level','Minimum security level', @User, @User, GETDATE(), GETDATE())
,(39,4,39,41, 'Submit', 'Submit', 'Submit', 'Submit','Submit', @User, @User, GETDATE(), GETDATE())
,(40,4,40,41, 'From date time', 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(41,4,41,41, 'To date time', 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(42,4,42,41, 'Subject', 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(43,4,43,41, 'User', 'User', 'User', 'User', 'User', @User, @User, GETDATE(), GETDATE())
,(44,5,44,41, 'Submit', 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(45,5,45,41, 'From date time', 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(46,5,46,41, 'To date time', 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(47,5,47,41, 'Subject', 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(48,5,48,41, 'Organization', 'Organization', 'Organization', 'Organization', 'Organization', @User, @User, GETDATE(), GETDATE())
,(49,6,49,41, 'Submit', 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(50,6,50,41, 'From date time', 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(51,6,51,41, 'To date time', 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(52,6,52,41, 'Subject', 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(53,6,53,41, 'Project', 'Project', 'Project', 'Project', 'Project', @User, @User, GETDATE(), GETDATE())
,(54,7,54,41, 'Submit', 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(55,7,55,41, 'From date time', 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(56,7,56,41, 'To date time', 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(57,7,57,41, 'Subject', 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeFieldLanguages OFF;

SET IDENTITY_INSERT ProcessTypeStageTypes ON;
INSERT INTO ProcessTypeStageTypes (ProcessTypeStageTypeId, IconID, Color, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (2, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (3, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (4, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (5, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (6, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (7, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (8, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeStageTypes OFF;

SET IDENTITY_INSERT ProcessTypeStageTypeLanguages ON;
INSERT INTO ProcessTypeStageTypeLanguages (ProcessTypeStageTypeLanguageId, ProcessTypeStageTypeId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,41, 'Initiated', 'Initiated', 'Initiated', 'Initiated', @User, @User, GETDATE(), GETDATE())
,(2,2,41, 'Draft', 'Draft', 'Draft', 'Draft', @User, @User, GETDATE(), GETDATE())
,(3,3,41, 'Submitted', 'Submitted', 'Submitted', 'Submitted', @User, @User, GETDATE(), GETDATE())
,(4,4,41, 'Assigned', 'Assigned', 'Assigned', 'Assigned', @User, @User, GETDATE(), GETDATE())
,(5,5,41, 'Approved', 'Approved', 'Approved', 'Approved', @User, @User, GETDATE(), GETDATE())
,(6,6,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
,(7,7,41, 'Completed', 'Completed', 'Completed', 'Completed', @User, @User, GETDATE(), GETDATE())
,(8,8,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeStageTypeLanguages OFF;


SET IDENTITY_INSERT ProcessTypeStages ON;
INSERT INTO ProcessTypeStages (ProcessTypeStageId, ProcessTypeId, ProcessTypeStageTypeId, InToDo, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,4,1, @User, @User, GETDATE(), GETDATE())
, (2,1,3,1, @User, @User, GETDATE(), GETDATE())
, (3,1,5,0, @User, @User, GETDATE(), GETDATE())
, (4,1,6,0, @User, @User, GETDATE(), GETDATE())
, (5,2,4,1, @User, @User, GETDATE(), GETDATE())
, (6,2,3,1, @User, @User, GETDATE(), GETDATE())
, (7,2,5,0, @User, @User, GETDATE(), GETDATE())
, (8,2,6,0, @User, @User, GETDATE(), GETDATE())
, (9,3,3,1, @User, @User, GETDATE(), GETDATE())
, (10,3,5,0, @User, @User, GETDATE(), GETDATE())
, (11,3,6,0, @User, @User, GETDATE(), GETDATE())
, (12,1,7,1, @User, @User, GETDATE(), GETDATE())
, (13,2,7,1, @User, @User, GETDATE(), GETDATE())
, (14,3,7,1, @User, @User, GETDATE(), GETDATE())
, (15,4,8,1, @User, @User, GETDATE(), GETDATE())
, (16,4,7,0, @User, @User, GETDATE(), GETDATE())
, (17,5,8,1, @User, @User, GETDATE(), GETDATE())
, (18,5,7,0, @User, @User, GETDATE(), GETDATE())
, (19,6,8,1, @User, @User, GETDATE(), GETDATE())
, (20,6,7,0, @User, @User, GETDATE(), GETDATE())
, (21,7,8,1, @User, @User, GETDATE(), GETDATE())
, (22,7,7,0, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeStages OFF;


SET IDENTITY_INSERT ProcessTypeStageLanguages ON;
INSERT INTO ProcessTypeStageLanguages (ProcessTypeStageLanguageId,ProcessTypeId, ProcessTypeStageId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,1,41, 'Assigned', 'Assigned', 'Assigned', 'Assigned', @User, @User, GETDATE(), GETDATE())
, (2,1,2,41, 'Submitted', 'Submitted', 'Submitted', 'Submitted', @User, @User, GETDATE(), GETDATE())
, (3,1,3,41, 'Approved / completed', 'Approved / completed', 'Approved / completed', 'Approved / completed', @User, @User, GETDATE(), GETDATE())
, (4,1,4,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
, (5,2,5,41, 'Assigned', 'Assigned', 'Assigned', 'Assigned', @User, @User, GETDATE(), GETDATE())
, (6,2,6,41, 'Submitted', 'Submitted', 'Submitted', 'Submitted', @User, @User, GETDATE(), GETDATE())
, (7,2,7,41, 'Approved / completed', 'Approved / completed', 'Approved / completed', 'Approved / completed', @User, @User, GETDATE(), GETDATE())
, (8,2,8,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
, (9,3,9,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
, (10,3,10,41, 'Approved', 'Approved', 'Approved', 'Approved', @User, @User, GETDATE(), GETDATE())
, (11,3,11,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
, (12,1,12,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (13,2,13,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (14,3,14,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (15,4,15,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (16,4,16,41, 'Booked', 'Booked', 'Booked', 'Booked', @User, @User, GETDATE(), GETDATE())
, (17,5,17,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (18,5,18,41, 'Booked', 'Booked', 'Booked', 'Booked', @User, @User, GETDATE(), GETDATE())
, (19,6,19,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (20,6,20,41, 'Booked', 'Booked', 'Booked', 'Booked', @User, @User, GETDATE(), GETDATE())
, (21,7,21,41, 'New', 'New', 'New', 'New', @User, @User, GETDATE(), GETDATE())
, (22,7,22,41, 'Booked', 'Booked', 'Booked', 'Booked', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeStageLanguages OFF;



SET IDENTITY_INSERT ProcessTypeStageFields ON;

INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (1,1,12,1,4, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (2,1,12,2,3, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (3,1,12,32,4, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (4,1,12,3,4, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (5,1,12,4,4, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (6,1,12,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (7,1,12,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (8,1,12,34,1, 8, 2, 2, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (9,1,12,35,1, 9, 2, 2, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (10,1,12,7,1, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (11,1,12,8,1, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (12,1,12,9,1, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (13,1,12,10,4, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (14,1,12,11,1, 14, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (15,1,12,12,1, 15, 1, @user,getdate());																							
INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (16,1,1,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (17,1,1,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (18,1,1,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (19,1,1,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (20,1,1,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (21,1,1,5,4, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (22,1,1,6,3, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (23,1,1,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (24,1,1,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (25,1,1,7,1, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (26,1,1,8,1, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (27,1,1,9,1, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (28,1,1,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (29,1,1,11,4, 14, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (30,1,1,12,1, 15, 1, @user,getdate());																							
INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (31,1,2,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (32,1,2,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (33,1,2,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (34,1,2,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (35,1,2,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (36,1,2,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (37,1,2,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (38,1,2,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (39,1,2,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (40,1,2,7,4, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (41,1,2,8,3, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (42,1,2,9,3, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (43,1,2,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (44,1,2,11,2, 14, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (45,1,2,12,4, 15, 1, @user,getdate());																							
INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (46,1,3,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (47,1,3,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (48,1,3,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (49,1,3,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (50,1,3,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (51,1,3,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (52,1,3,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (53,1,3,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (54,1,3,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (55,1,3,7,2, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (56,1,3,8,2, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (57,1,3,9,2, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (58,1,3,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (59,1,3,11,2, 14, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (60,1,3,12,2, 15, 1, @user,getdate());																							
INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (61,1,4,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (62,1,4,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (63,1,4,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (64,1,4,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (65,1,4,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (66,1,4,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (67,1,4,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (68,1,4,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (69,1,4,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (70,1,4,7,2, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (71,1,4,8,2, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (72,1,4,9,2, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (73,1,4,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (74,1,4,11,2, 14, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (75,1,4,12,1, 15, 1, @user,getdate());																							
															INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (76,2,13,13,4, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (77,2,13,14,3, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (78,2,13,33,4, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (79,2,13,15,4, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (80,2,13,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (81,2,13,36,1, 6, 2, 2, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (82,2,13,37,1, 7, 2, 2, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (83,2,13,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (84,2,13,18,1, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (85,2,13,19,1, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (86,2,13,20,1, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (87,2,13,21,4, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (88,2,13,22,1, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (89,2,13,23,1, 14, 1, @user,getdate());									
															INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (90,2,5,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (91,2,5,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (92,2,5,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (93,2,5,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (94,2,5,16,4, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (95,2,5,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (96,2,5,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (97,2,5,17,3, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (98,2,5,18,1, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (99,2,5,19,1, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (100,2,5,20,1, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (101,2,5,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (102,2,5,22,4, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (103,2,5,23,1, 14, 1, @user,getdate());									
															INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (104,2,6,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (105,2,6,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (106,2,6,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (107,2,6,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (108,2,6,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (109,2,6,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (110,2,6,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (111,2,6,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (112,2,6,18,4, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (113,2,6,19,3, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (114,2,6,20,3, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (115,2,6,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (116,2,6,22,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (117,2,6,23,4, 14, 1, @user,getdate());									
															INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (118,2,7,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (119,2,7,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (120,2,7,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (121,2,7,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (122,2,7,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (123,2,7,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (124,2,7,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (125,2,7,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (126,2,7,18,2, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (127,2,7,19,2, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (128,2,7,20,2, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (129,2,7,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (130,2,7,22,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (131,2,7,23,2, 14, 1, @user,getdate());									
															INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (132,2,8,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (133,2,8,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (134,2,8,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (135,2,8,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (136,2,8,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (137,2,8,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (138,2,8,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (139,2,8,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (140,2,8,18,2, 9, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (141,2,8,19,2, 10, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (142,2,8,20,2, 11, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (143,2,8,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (144,2,8,22,2, 13, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (145,2,8,23,1, 14, 1, @user,getdate());									
																													INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (146,3,14,24,4, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (147,3,14,25,3, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (148,3,14,26,4, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (149,3,14,27,4, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (150,3,14,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (151,3,14,28,3, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (152,3,14,29,1, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (153,3,14,30,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (154,3,14,31,1, 9, 1, @user,getdate());
																													INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (155,3,9,24,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (156,3,9,25,2, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (157,3,9,26,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (158,3,9,27,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (159,3,9,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (160,3,9,28,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (161,3,9,29,3, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (162,3,9,30,3, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (163,3,9,31,3, 9, 1, @user,getdate());
																													INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (164,3,10,24,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (165,3,10,25,2, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (166,3,10,26,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (167,3,10,27,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (168,3,10,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (169,3,10,28,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (170,3,10,29,2, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (171,3,10,30,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (172,3,10,31,1, 9, 1, @user,getdate());
																													INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (173,3,11,24,2, 1, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (174,3,11,25,2, 2, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (175,3,11,26,2, 3, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (176,3,11,27,2, 4, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (177,3,11,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (178,3,11,28,1, 6, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (179,3,11,29,2, 7, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (180,3,11,30,1, 8, 1, @user,getdate());	INSERT INTO ProcessTypeStageFields (ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,ProcessTypeFieldId,ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (181,3,11,31,1, 9, 1, @user,getdate());

INSERT INTO ProcessTypeStageFields (
ProcessTypeStageFieldId,ProcessTypeId,ProcessTypeStageId,
ProcessTypeFieldId,
ProcessTypeStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) 
VALUES 
(182,4,15,39,3, 1, 1, @user,getdate())
, (183,4,15,40,3, 2, 1, @user,getdate())
, (184,4,15,41,3, 3, 1, @user,getdate())
, (185,4,15,42,3, 4, 1, @user,getdate())
, (186,4,15,43,3, 5, 1, @user,getdate())
, (187,4,16,39,2, 1, 1, @user,getdate())
, (188,4,16,40,2, 2, 1, @user,getdate())
, (189,4,16,41,2, 3, 1, @user,getdate())
, (190,4,16,42,2, 4, 1, @user,getdate())
, (191,4,16,43,2, 5, 1, @user,getdate())

, (192,5,17,44,3, 1, 1, @user,getdate())
, (193,5,17,45,3, 2, 1, @user,getdate())
, (194,5,17,46,3, 3, 1, @user,getdate())
, (195,5,17,47,3, 4, 1, @user,getdate())
, (196,5,17,48,3, 5, 1, @user,getdate())
, (197,5,18,44,2, 1, 1, @user,getdate())
, (198,5,18,45,2, 2, 1, @user,getdate())
, (199,5,18,46,2, 3, 1, @user,getdate())
, (200,5,18,47,2, 4, 1, @user,getdate())
, (201,5,18,48,2, 5, 1, @user,getdate())

, (202,6,19,49,3, 1, 1, @user,getdate())
, (203,6,19,50,3, 2, 1, @user,getdate())
, (204,6,19,51,3, 3, 1, @user,getdate())
, (205,6,19,52,3, 4, 1, @user,getdate())
, (206,6,19,53,3, 5, 1, @user,getdate())
, (207,6,20,49,2, 1, 1, @user,getdate())
, (208,6,20,50,2, 2, 1, @user,getdate())
, (209,6,20,51,2, 3, 1, @user,getdate())
, (210,6,20,52,2, 4, 1, @user,getdate())
, (211,6,20,53,2, 5, 1, @user,getdate())

, (212,7,21,54,3, 1, 1, @user,getdate())
, (213,7,21,55,3, 2, 1, @user,getdate())
, (214,7,21,56,3, 3, 1, @user,getdate())
, (215,7,21,57,3, 4, 1, @user,getdate())
, (216,7,22,54,2, 1, 1, @user,getdate())
, (217,7,22,55,2, 2, 1, @user,getdate())
, (218,7,22,56,2, 3, 1, @user,getdate())
, (219,7,22,57,2, 4, 1, @user,getdate())
;		
SET IDENTITY_INSERT ProcessTypeStageFields OFF;


SET IDENTITY_INSERT ProcessTypeFlows ON;
INSERT INTO ProcessTypeFlows (ProcessTypeFlowId, ProcessTypeId, ProcessTypeFromStageId, ProcessTypeToStageId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,12,1, @User, @User, GETDATE(), GETDATE())
, (2,1,1,2, @User, @User, GETDATE(), GETDATE())
, (3,1,2,3, @User, @User, GETDATE(), GETDATE())
, (4,1,2,4, @User, @User, GETDATE(), GETDATE())
, (5,2,13,5, @User, @User, GETDATE(), GETDATE())
, (6,2,5,6, @User, @User, GETDATE(), GETDATE())
, (7,2,6,7, @User, @User, GETDATE(), GETDATE())
, (8,2,6,8, @User, @User, GETDATE(), GETDATE())
, (9,3,14,9, @User, @User, GETDATE(), GETDATE())
, (10,3,9,10, @User, @User, GETDATE(), GETDATE())
, (11,3,9,11, @User, @User, GETDATE(), GETDATE())
, (12,4,15,16, @User, @User, GETDATE(), GETDATE())
, (13,5,17,18, @User, @User, GETDATE(), GETDATE())
, (14,6,19,20, @User, @User, GETDATE(), GETDATE())
, (15,7,21,22, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeFlows OFF;

SET IDENTITY_INSERT ProcessTypeFlowLanguages ON;
INSERT INTO ProcessTypeFlowLanguages  (
ProcessTypeFlowLanguageId,ProcessTypeId, ProcessTypeFlowId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,1,41, 'Assinging assignment', 'Assinging assignment', 'Assinging assignment', 'Assinging assignment', @User, @User, GETDATE(), GETDATE())
,(2,1,2,41, 'Submitting assignment', 'Submitting assignment', 'Submitting assignment', 'Submitting assignment', @User, @User, GETDATE(), GETDATE())
,(3,1,3,41, 'Approving assignment', 'Approving assignment', 'Approving assignment', 'Approving assignment', @User, @User, GETDATE(), GETDATE())
,(4,1,4,41, 'Rejecting assignment', 'Rejecting assignment', 'Rejecting assignment', 'Rejecting assignment', @User, @User, GETDATE(), GETDATE())
,(5,2,5,41, 'Assinging assignment', 'Assinging assignment', 'Assinging assignment', 'Assinging assignment', @User, @User, GETDATE(), GETDATE())
,(6,2,6,41, 'Submitting assignment', 'Submitting assignment', 'Submitting assignment', 'Submitting assignment', @User, @User, GETDATE(), GETDATE())
,(7,2,7,41, 'Approving assignment', 'Approving assignment', 'Approving assignment', 'Approving assignment', @User, @User, GETDATE(), GETDATE())
,(8,2,8,41, 'Rejecting assignment', 'Rejecting assignment', 'Rejecting assignment', 'Rejecting assignment', @User, @User, GETDATE(), GETDATE())
,(9,3,9,41, 'Submitting assignment', 'Submitting assignment', 'Submitting assignment', 'Submitting assignment', @User, @User, GETDATE(), GETDATE())
,(10,3,10,41, 'Approving assignment', 'Approving assignment', 'Approving assignment', 'Approving assignment', @User, @User, GETDATE(), GETDATE())
,(11,3,11,41, 'Rejecting assignment', 'Rejecting assignment', 'Rejecting assignment', 'Rejecting assignment', @User, @User, GETDATE(), GETDATE())
,(12,4,12,41, 'Create personal event', 'Create personal event', 'Create personal event', 'Create personal event', @User, @User, GETDATE(), GETDATE())
,(13,5,13,41, 'Create organization event', 'Create organization event', 'Create organization event', 'Create organization event', @User, @User, GETDATE(), GETDATE())
,(14,6,14,41, 'Create project event', 'Create project event', 'Create project event', 'Create project event', @User, @User, GETDATE(), GETDATE())
,(15,7,15,41, 'Create general event', 'Create general event', 'Create general event', 'Create general event', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT  ProcessTypeFlowLanguages  OFF;

SET IDENTITY_INSERT [dbo].[ProjectTypes] ON 
INSERT [dbo].[ProjectTypes] ([ProjectTypeID], HasAnyChildProject, HasAnyMatrixProject, Color,IconID, CodeTypeId,ObjectTypeStatusId,  [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (1,1,1,'#008000ff',1,2,1, @User, @User, Getdate(), Getdate())
INSERT [dbo].[ProjectTypes] ([ProjectTypeID], HasAnyChildProject, HasAnyMatrixProject, Color,IconID, CodeTypeId,ObjectTypeStatusId, [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (2,1,1,'#008000ff',1,2,1, @User, @User, Getdate(), Getdate())
SET IDENTITY_INSERT [dbo].[ProjectTypes] OFF

SET IDENTITY_INSERT [dbo].[Projects] ON 
INSERT [dbo].[Projects] (
[ProjectID], [ParentProjectID], [SecurityLevelId], [ProjectTypeID], [StatusID], 
[CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (1, NULL,1, 1, 1, @User, @User, Getdate(), Getdate()),
(2, 1 ,1, 1, 1, @User, @User, Getdate(), Getdate())
SET IDENTITY_INSERT [dbo].[Projects] OFF

SET IDENTITY_INSERT [dbo].[ProjectTypeLanguages] ON 
INSERT [dbo].[ProjectTypeLanguages] ([ProjectTypeLanguageID], [ProjectTypeID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 41, N'General', N'General', N'General', N'General', @User, @User, Getdate(), Getdate())
INSERT [dbo].[ProjectTypeLanguages] ([ProjectTypeLanguageID], [ProjectTypeID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 41, N'Game', N'Game', N'Game', N'Game', @User, @User, Getdate(), Getdate())
SET IDENTITY_INSERT [dbo].[ProjectTypeLanguages] OFF


SET IDENTITY_INSERT ProjectLanguages ON;
INSERT INTO ProjectLanguages (ProjectLanguageId, ProjectId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,41, 'Zero Waste', 'Zero Waste', 'Zero Waste', 'Zero Waste', @User, @User, GETDATE(), GETDATE())
,(2,2,41, 'Clean the beach 2020', 'Clean the beach 2020', 'Clean the beach 2020', 'Clean the beach 2020', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProjectLanguages OFF;

SET IDENTITY_INSERT ProcessTypeFlowConditions ON;
INSERT INTO ProcessTypeFlowConditions (ProcessTypeFlowConditionId, ProcessTypeId, ProcessTypeFlowID
, ProcessTypeFlowConditionTypeId , ComparisonOperatorId, ProcessTypeFlowConditionInt, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1, 1, 3, 5, 3, 1, @User, @User, GETDATE(), GETDATE())
,(2, 2, 5, 3, 5, 6, 2, @User, @User, GETDATE(), GETDATE())
,(3, 3, 9, 3, 6, 5 , 3, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessTypeFlowConditions (ProcessTypeFlowConditionId, ProcessTypeId, ProcessTypeFlowID
, ProcessTypeFlowConditionTypeId , ComparisonOperatorId, ProcessTypeFieldId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(4, 1, 2, 19, 2, 32,4, @User, @User, GETDATE(), GETDATE())
,(5, 2, 6, 19, 2, 32,5, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessTypeFlowConditions (ProcessTypeFlowConditionId, ProcessTypeId, ProcessTypeFlowID
, ProcessTypeFlowConditionTypeId , ComparisonOperatorID
,ProcessTypeFieldId,ProcessTypeFieldIDRole, Sequence
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(6, 1, 3, 19, 2, 32,35,6, @User, @User, GETDATE(), GETDATE())
,(7, 1, 4, 19, 2, 32,35,7, @User, @User, GETDATE(), GETDATE())
,(8, 2, 7, 19, 2, 32,35,8, @User, @User, GETDATE(), GETDATE())
,(9, 2, 8, 19, 2, 32,35,9, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessTypeFlowConditions (ProcessTypeFlowConditionId, ProcessTypeId, ProcessTypeFlowID
, ProcessTypeFlowConditionTypeId , ComparisonOperatorId, ProcessTypeFieldId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(10, 3, 10, 22, 2, 27,10, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeFlowConditions OFF;


SET IDENTITY_INSERT ProcessTypeFlowConditionLanguages ON;
INSERT INTO ProcessTypeFlowConditionLanguages (ProcessTypeFlowConditionLanguageId,ProcessTypeId, ProcessTypeFlowId, ProcessTypeFlowConditionId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,1,1,41, 'Minimum security level 3', 'Minimum security level 3', 'Minimum security level 3', 'Minimum security level 3', @User, @User, GETDATE(), GETDATE())
, (2,2,5,2,41, 'Minimum security level 6', 'Minimum security level 6', 'Minimum security level 6', 'Minimum security level 6', @User, @User, GETDATE(), GETDATE())
, (3,3,9,3,41, 'Minimum security level 5', 'Minimum security level 5', 'Minimum security level 5', 'Minimum security level 5', @User, @User, GETDATE(), GETDATE())
, (4,1,2,4,41, 'Assigned user', 'Assigned user', 'Assigned user', 'Assigned user', @User, @User, GETDATE(), GETDATE())
, (5,2,6,5,41, 'Assigned user', 'Assigned user', 'Assigned user', 'Assigned user', @User, @User, GETDATE(), GETDATE())
, (6,1,3,6,41, 'Teacher', 'Teacher', 'Teacher', 'Teacher', @User, @User, GETDATE(), GETDATE())
, (7,1,4,7,41, 'Teacher', 'Teacher', 'Teacher', 'Teacher', @User, @User, GETDATE(), GETDATE())
, (8,2,7,8,41, 'Teacher', 'Teacher', 'Teacher', 'Teacher', @User, @User, GETDATE(), GETDATE())
, (9,2,8,9,41, 'Teacher', 'Teacher', 'Teacher', 'Teacher', @User, @User, GETDATE(), GETDATE())
, (10,3,10,10,41, 'Subject matter expert', 'Subject matter expert', 'Subject matter expert', 'Subject matter expert', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTypeFlowConditionLanguages OFF;

SET IDENTITY_INSERT PersonRelationTypes ON;
INSERT INTO PersonRelationTypes (PersonRelationTypeId, SeePersonal, CanAssignOwnershipFromTo, CanAssignOwnershipToFrom,CanAssignEditFromTo, CanAssignEditToFrom, CanAssignReadFromTo, CanAssignReadToFrom, Color,IconID, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
( 1,0,1,1,1,1,1,1,'#008000ff', 1,@User, @User, GETDATE(), GETDATE())
,( 2,0,1,1,1,1,1,1, '#008000ff',1,@User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT PersonRelationTypes OFF;

SET IDENTITY_INSERT PersonRelationTypeLanguages ON;
INSERT INTO PersonRelationTypeLanguages (PersonRelationTypeLanguageId, PersonRelationTypeId, LanguageId , Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,41, 'Manager', 'Manager', 'Manager', 'Manager', 'Manager', 'Staff', @User, @User, GETDATE(), GETDATE())
,(2,2,41, 'Teacher', 'Teacher', 'Teacher', 'Teacher', 'Teacher', 'Staff', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT PersonRelationTypeLanguages OFF;

SET IDENTITY_INSERT PersonRelations ON;
INSERT INTO PersonRelations (PersonRelationId, FromPersonId, ToPersonId, ValidFrom, PersonRelationTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
( 1, 2, 3, getdate(), 2, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT PersonRelations OFF;

SET IDENTITY_INSERT RoleLanguages ON;
INSERT INTO RoleLanguages (RoleLanguageId, RoleId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, @Role, 41, 'Admin', 'Admin', 'Admin', 'Admin', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT RoleLanguages OFF;

SET IDENTITY_INSERT [dbo].[Processes] ON 

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) 
VALUES (1, 1, 1, N'a', 1, N'b', N'a1b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (2, 1, 2, N'a', 2, N'b', N'a2b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (3, 1, 3, N'a', 3, N'b', N'a3b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (4, 1, 4, N'a', 4, N'b', N'a4b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (5, 2, 5, N'a', 5, N'b', N'a5b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (6, 2, 6, N'a', 6, N'b', N'a6b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (7, 2, 7, N'a', 7, N'b', N'a7b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (8, 2, 8, N'a', 8, N'b', N'a8b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (9, 3, 9, N'a', 9, N'b', N'a9b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (10, 3, 10, N'a', 0, N'b', N'a10b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (11, 3, 11, N'a', 10, N'b', N'a11b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (12, 4, 16, N'a', 11, N'b', N'a12b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (13, 5, 18, N'a', 12, N'b', N'a13b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (14, 6, 20, N'a', 13, N'b', N'a14b',@User, @User, GETDATE(), GETDATE(),NULL)

INSERT [dbo].[Processes] ([ProcessID], [ProcessTypeID], [ProcessTypeStageID], [CodePrefix], [CodeInt], [CodeSuffix], [Code], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessMultiID]) VALUES (15, 7, 22, N'a', 14, N'b', N'a15b',@User, @User, GETDATE(), GETDATE(),NULL)

SET IDENTITY_INSERT [dbo].[Processes] OFF

SET IDENTITY_INSERT ProcessFields ON;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, StringValue, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1,1,1,1,'Impact of wave energy', @User, @User, GETDATE(), GETDATE())
, (2,1,1,3,'What is the impact of wave energy on community acceptance', @User, @User, GETDATE(), GETDATE())
, (3,1,1,5,'', @User, @User, GETDATE(), GETDATE())
, (4,1,2,1,'Circular', @User, @User, GETDATE(), GETDATE())
, (5,1,2,3,'How would a circular economy fit in the game', @User, @User, GETDATE(), GETDATE())
, (6,1,2,5,'Maybe there should be a KPI on cycles', @User, @User, GETDATE(), GETDATE())
, (7,1,3,1,'Inequality', @User, @User, GETDATE(), GETDATE())
, (8,1,3,3,'How would a Inequality fit in the game', @User, @User, GETDATE(), GETDATE())
, (9,1,3,5,'This should be seen in 2 points, 1 the general positive impact and 2 in relation with resource usage.', @User, @User, GETDATE(), GETDATE())
, (10,1,4,1,'Climate', @User, @User, GETDATE(), GETDATE())
, (11,1,4,3,'How does climate change effect your game', @User, @User, GETDATE(), GETDATE())
, (12,1,4,5,'We will not get any flooding as we are in the mountains', @User, @User, GETDATE(), GETDATE())
, (147,4,12,42,'Personal appointment', @User, @User, GETDATE(), GETDATE())
, (148,5,13,47,'organization appointment', @User, @User, GETDATE(), GETDATE())
, (149,6,14,52,'project appointment', @User, @User, GETDATE(), GETDATE())
, (150,7,15,57,'general appointment', @User, @User, GETDATE(), GETDATE())

, (151,4,12,43,@User, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, IntValue , CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (13,1,1,4,1, @User, @User, GETDATE(), GETDATE())
, (14,1,1,32,3, @User, @User, GETDATE(), GETDATE())
, (15,1,1,34,2, @User, @User, GETDATE(), GETDATE())
, (16,1,1,35,2, @User, @User, GETDATE(), GETDATE())
, (17,1,2,4,1, @User, @User, GETDATE(), GETDATE())
, (18,1,2,32,3, @User, @User, GETDATE(), GETDATE())
, (19,1,2,34,2, @User, @User, GETDATE(), GETDATE())
, (20,1,2,35,2, @User, @User, GETDATE(), GETDATE())
, (21,1,3,4,1, @User, @User, GETDATE(), GETDATE())
, (22,1,3,7,10, @User, @User, GETDATE(), GETDATE())
, (23,1,3,32,3, @User, @User, GETDATE(), GETDATE())
, (24,1,3,34,2, @User, @User, GETDATE(), GETDATE())
, (25,1,3,35,2, @User, @User, GETDATE(), GETDATE())
, (26,1,4,4,1, @User, @User, GETDATE(), GETDATE())
, (27,1,4,7,2, @User, @User, GETDATE(), GETDATE())
, (28,1,4,32,3, @User, @User, GETDATE(), GETDATE())
, (29,1,4,34,2, @User, @User, GETDATE(), GETDATE())
, (30,1,4,35,2, @User, @User, GETDATE(), GETDATE())
, (152,5,13,48,1, @User, @User, GETDATE(), GETDATE())
, (153,6,14,53,1, @User, @User, GETDATE(), GETDATE())
;
--Buttons
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (31,1,1,2, @User, @User, GETDATE(), GETDATE())
, (32,1,1,6, @User, @User, GETDATE(), GETDATE())
, (33,1,1,7, @User, @User, GETDATE(), GETDATE())
, (34,1,1,8, @User, @User, GETDATE(), GETDATE())
, (35,1,1,9, @User, @User, GETDATE(), GETDATE())
, (36,1,1,11, @User, @User, GETDATE(), GETDATE())
, (37,1,1,12, @User, @User, GETDATE(), GETDATE())
, (38,1,2,2, @User, @User, GETDATE(), GETDATE())
, (39,1,2,6, @User, @User, GETDATE(), GETDATE())
, (40,1,2,7, @User, @User, GETDATE(), GETDATE())
, (41,1,2,8, @User, @User, GETDATE(), GETDATE())
, (42,1,2,9, @User, @User, GETDATE(), GETDATE())
, (43,1,2,12, @User, @User, GETDATE(), GETDATE())
, (44,1,3,2, @User, @User, GETDATE(), GETDATE())
, (45,1,3,6, @User, @User, GETDATE(), GETDATE())
, (46,1,3,7, @User, @User, GETDATE(), GETDATE())
, (47,1,3,8, @User, @User, GETDATE(), GETDATE())
, (48,1,3,9, @User, @User, GETDATE(), GETDATE())
, (49,1,4,2, @User, @User, GETDATE(), GETDATE())
, (50,1,4,6, @User, @User, GETDATE(), GETDATE())
, (51,1,4,7, @User, @User, GETDATE(), GETDATE())
, (52,1,4,8, @User, @User, GETDATE(), GETDATE())
, (53,1,4,9, @User, @User, GETDATE(), GETDATE())
, (54,1,4,12, @User, @User, GETDATE(), GETDATE())
, (154,4,12,39, @User, @User, GETDATE(), GETDATE())
, (155,4,13,44, @User, @User, GETDATE(), GETDATE())
, (156,4,14,45, @User, @User, GETDATE(), GETDATE())
, (157,4,15,46, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
,DateTimeValue, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (55,1,1,10, getdate(), @User, @User, GETDATE(), GETDATE())
, (56,1,2,10, getdate(), @User, @User, GETDATE(), GETDATE())
, (57,1,2,11, getdate(), @User, @User, GETDATE(), GETDATE())
, (58,1,3,10, getdate(), @User, @User, GETDATE(), GETDATE())
, (59,1,3,11, getdate(), @User, @User, GETDATE(), GETDATE())
, (60,1,3,12, getdate(), @User, @User, GETDATE(), GETDATE())
, (61,1,4,10, getdate(), @User, @User, GETDATE(), GETDATE())
, (62,1,4,11, getdate(), @User, @User, GETDATE(), GETDATE())
, (158,4,12,40, getdate(), @User, @User, GETDATE(), GETDATE())
, (159,4,12,41, getdate(), @User, @User, GETDATE(), GETDATE())
, (160,5,13,45, getdate(), @User, @User, GETDATE(), GETDATE())
, (161,5,13,46, getdate(), @User, @User, GETDATE(), GETDATE())
, (162,6,14,50, getdate(), @User, @User, GETDATE(), GETDATE())
, (163,6,14,51, getdate(), @User, @User, GETDATE(), GETDATE())
, (164,7,15,55, getdate(), @User, @User, GETDATE(), GETDATE())
, (165,7,15,56, getdate(), @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, StringValue, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (109,2,5,1,'Environmental cummunity work', @User, @User, GETDATE(), GETDATE())
, (110,2,5,3,'What are the community activities in your community related to the environment', @User, @User, GETDATE(), GETDATE())
, (111,2,5,5,'', @User, @User, GETDATE(), GETDATE())
, (112,2,5,1,'Climate Weather and the US', @User, @User, GETDATE(), GETDATE())
, (113,2,6,3,'What will be the weather effects of climate in the US', @User, @User, GETDATE(), GETDATE())
, (114,2,6,5,'This very much depends on the region. Central and West will be dryer, while east will be wetter. Further, more extreme weather is expected', @User, @User, GETDATE(), GETDATE())
, (115,2,7,1,'Coal VS renewable', @User, @User, GETDATE(), GETDATE())
, (116,2,7,3,'How does new energy invenstment in the US compare between renewable and coal', @User, @User, GETDATE(), GETDATE())
, (117,2,7,5,'In 2018, renewable energy investment was in USD higher than coal investment', @User, @User, GETDATE(), GETDATE())
, (118,2,8,1,'Coal advantage', @User, @User, GETDATE(), GETDATE())
, (119,2,8,3,'What are the coal advantages', @User, @User, GETDATE(), GETDATE())
, (120,2,8,5,'Smog will block the sun and will reduce the temperature', @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, IntValue , CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (63,2,5,33,3, @User, @User, GETDATE(), GETDATE())
, (64,2,5,36,2, @User, @User, GETDATE(), GETDATE())
, (65,2,5,37,2, @User, @User, GETDATE(), GETDATE())
, (66,2,6,33,3, @User, @User, GETDATE(), GETDATE())
, (67,2,6,36,2, @User, @User, GETDATE(), GETDATE())
, (68,2,6,37,2, @User, @User, GETDATE(), GETDATE())
, (69,2,7,18,10, @User, @User, GETDATE(), GETDATE())
, (70,2,7,33,3, @User, @User, GETDATE(), GETDATE())
, (71,2,7,36,2, @User, @User, GETDATE(), GETDATE())
, (72,2,7,37,2, @User, @User, GETDATE(), GETDATE())
, (73,2,8,18,2, @User, @User, GETDATE(), GETDATE())
, (74,2,8,33,3, @User, @User, GETDATE(), GETDATE())
, (75,2,8,36,2, @User, @User, GETDATE(), GETDATE())
, (76,2,8,37,2, @User, @User, GETDATE(), GETDATE())
;
--Buttons
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (77,2,5,14, @User, @User, GETDATE(), GETDATE())
, (78,2,5,17, @User, @User, GETDATE(), GETDATE())
, (79,2,5,18, @User, @User, GETDATE(), GETDATE())
, (80,2,5,19, @User, @User, GETDATE(), GETDATE())
, (81,2,5,20, @User, @User, GETDATE(), GETDATE())
, (82,2,5,22, @User, @User, GETDATE(), GETDATE())
, (83,2,5,23, @User, @User, GETDATE(), GETDATE())
, (84,2,6,14, @User, @User, GETDATE(), GETDATE())
, (85,2,6,17, @User, @User, GETDATE(), GETDATE())
, (86,2,6,18, @User, @User, GETDATE(), GETDATE())
, (87,2,6,19, @User, @User, GETDATE(), GETDATE())
, (88,2,6,20, @User, @User, GETDATE(), GETDATE())
, (89,2,6,23, @User, @User, GETDATE(), GETDATE())
, (90,2,7,14, @User, @User, GETDATE(), GETDATE())
, (91,2,7,17, @User, @User, GETDATE(), GETDATE())
, (92,2,7,18, @User, @User, GETDATE(), GETDATE())
, (93,2,7,19, @User, @User, GETDATE(), GETDATE())
, (94,2,7,20, @User, @User, GETDATE(), GETDATE())
, (95,2,8,14, @User, @User, GETDATE(), GETDATE())
, (96,2,8,17, @User, @User, GETDATE(), GETDATE())
, (97,2,8,18, @User, @User, GETDATE(), GETDATE())
, (98,2,8,19, @User, @User, GETDATE(), GETDATE())
, (99,2,8,20, @User, @User, GETDATE(), GETDATE())
, (100,2,8,23, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
,DateTimeValue, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (101,2,5,21, getdate(), @User, @User, GETDATE(), GETDATE())
, (102,2,5,21, getdate(), @User, @User, GETDATE(), GETDATE())
, (103,2,5,22, getdate(), @User, @User, GETDATE(), GETDATE())
, (104,2,6,21, getdate(), @User, @User, GETDATE(), GETDATE())
, (105,2,6,22, getdate(), @User, @User, GETDATE(), GETDATE())
, (106,2,6,23, getdate(), @User, @User, GETDATE(), GETDATE())
, (107,2,7,21, getdate(), @User, @User, GETDATE(), GETDATE())
, (108,2,7,22, getdate(), @User, @User, GETDATE(), GETDATE())
;

INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, StringValue, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (121,3,9,24,'Research of Tropics on butterflies', @User, @User, GETDATE(), GETDATE())
, (122,3,9,25,'Did this research on our community', @User, @User, GETDATE(), GETDATE())
, (123,3,10,24,'Growing passion fruits in Silt soil', @User, @User, GETDATE(), GETDATE())
, (124,3,10,25,'Just want to share this. We have a lot of success', @User, @User, GETDATE(), GETDATE())
, (125,3,10,29,'Was really good to read and other should also have the opportunity to read', @User, @User, GETDATE(), GETDATE())
, (126,3,11,24,'Arctic and strawberries', @User, @User, GETDATE(), GETDATE())
, (127,3,11,25,'I think there is a lot of potential for growing strawberries in the arctic', @User, @User, GETDATE(), GETDATE())
, (128,3,11,29,'If you grow strawberries indoors, then the outside climate doesn''t matter', @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, IntValue , CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (129,3,9,26,1, @User, @User, GETDATE(), GETDATE())
, (130,3,9,27,1, @User, @User, GETDATE(), GETDATE())
, (131,3,9,38,1, @User, @User, GETDATE(), GETDATE())
, (132,3,10,26,2, @User, @User, GETDATE(), GETDATE())
, (133,3,10,27,6, @User, @User, GETDATE(), GETDATE())
, (134,3,10,38,1, @User, @User, GETDATE(), GETDATE())
, (135,3,11,26,3, @User, @User, GETDATE(), GETDATE())
, (136,3,11,27,5, @User, @User, GETDATE(), GETDATE())
, (137,3,11,38,1, @User, @User, GETDATE(), GETDATE())
;
--Buttons
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTypeId, ProcessId, ProcessTypeFieldID
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (138,3,9,28, @User, @User, GETDATE(), GETDATE())
, (139,2,9,30, @User, @User, GETDATE(), GETDATE())
, (140,2,9,31, @User, @User, GETDATE(), GETDATE())
, (141,3,10,28, @User, @User, GETDATE(), GETDATE())
, (142,2,10,30, @User, @User, GETDATE(), GETDATE())
, (143,2,10,31, @User, @User, GETDATE(), GETDATE())
, (144,3,11,28, @User, @User, GETDATE(), GETDATE())
, (145,2,11,30, @User, @User, GETDATE(), GETDATE())
, (146,2,11,31, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessFields OFF;

USE [sip]
USE [sip]

SET IDENTITY_INSERT [dbo].[Contents] ON 

INSERT [dbo].[Contents] ([ContentID], [ParentContentID], [ContentTypeID], [ContentStatusID], [LanguageID], activeversionid, [CodePrefix], [CodeInt], [CodeSuffix], [Code], [Title], [SecurityLevelID], [OrganizationID], [ProjectID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessID], [ProcessTypeId], [IsFreeEdit], [IsFreeRead], [IsRelationBasedEdit], [IsRelationBasedRead], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationBasedRead], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedEdit], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsProjectBasedRead], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [OwnerId]) VALUES (1, NULL, 1, 2, 41,1, N'a', 1, N'A', N'a1A',N'Research of Tropics on butterflies', 1, 1, NULL, @User, @User, getdate(), getdate(), 9, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, @User)

INSERT [dbo].[Contents] ([ContentID], [ParentContentID], [ContentTypeID], [ContentStatusID], [LanguageID], activeversionid,[CodePrefix], [CodeInt], [CodeSuffix], [Code], [Title],[SecurityLevelID], [OrganizationID], [ProjectID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessID], [ProcessTypeId], [IsFreeEdit], [IsFreeRead], [IsRelationBasedEdit], [IsRelationBasedRead], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationBasedRead], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedEdit], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsProjectBasedRead], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [OwnerId]) VALUES (2, NULL, 2, 4, 41,2, N'b', 1, N'B', N'b1B',N'Growing passion fruits in Silt soil', 1, 1, NULL, @User, @User, getdate(), getdate(), 10, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, @User)

INSERT [dbo].[Contents] ([ContentID], [ParentContentID], [ContentTypeID], [ContentStatusID], [LanguageID], activeversionid,[CodePrefix], [CodeInt], [CodeSuffix], [Code], [Title],[SecurityLevelID], [OrganizationID], [ProjectID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessID], [ProcessTypeId], [IsFreeEdit], [IsFreeRead], [IsRelationBasedEdit], [IsRelationBasedRead], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationBasedRead], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedEdit], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsProjectBasedRead], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [OwnerId]) VALUES (3, NULL, 1, 3, 41,3, N'a', 2, N'A', N'a2A', N'Arctic and strawberries',1, 1, NULL, @User, @User, getdate(), getdate(), 11, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, @User)

INSERT [dbo].[Contents] ([ContentID], [ParentContentID], [ContentTypeID], [ContentStatusID], [LanguageID], activeversionid,[CodePrefix], [CodeInt], [CodeSuffix], [Code], [Title],[SecurityLevelID], [OrganizationID], [ProjectID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessID], [ProcessTypeId], [IsFreeEdit], [IsFreeRead], [IsRelationBasedEdit], [IsRelationBasedRead], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationBasedRead], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedEdit], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsProjectBasedRead], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [OwnerId]) VALUES (4, NULL, 3, 2, 41,4, N'c', 1, N'C', N'c1C',N'Habits of a Systems Thinker', 1, 1, NULL, @User, @User, getdate(), getdate(), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, @User)

INSERT [dbo].[Contents] ([ContentID], [ParentContentID], [ContentTypeID], [ContentStatusID], [LanguageID], activeversionid,[CodePrefix], [CodeInt], [CodeSuffix], [Code], [Title],[SecurityLevelID], [OrganizationID], [ProjectID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate], [ProcessID], [ProcessTypeId], [IsFreeEdit], [IsFreeRead], [IsRelationBasedEdit], [IsRelationBasedRead], [IsOrganizationBasedEdit], [IsOrganizationBasedEditSub], [IsOrganizationBasedEditParent], [IsOrganizationBasedRead], [IsOrganizationBasedReadSub], [IsOrganizationBasedReadParent], [IsProjectBasedEdit], [IsProjectBasedEditSub], [IsProjectBasedEditParent], [IsProjectBasedRead], [IsProjectBasedReadSub], [IsProjectBasedReadParent], [OwnerId]) VALUES (5, NULL, 3, 4, 41,5, N'c', 2, N'C', N'c2C',N'Habits of a Systems Thinker', 1, 1, NULL, @User, @User, getdate(), getdate(), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, @User)

SET IDENTITY_INSERT [dbo].[Contents] OFF

SET IDENTITY_INSERT [dbo].[VersionStatuses] ON 
INSERT [dbo].[VersionStatuses] ([VersionStatusId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, @User, @User, getdate(), getdate())
INSERT [dbo].[VersionStatuses] ([VersionStatusId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, @User, @User, getdate(), getdate())
INSERT [dbo].[VersionStatuses] ([VersionStatusId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[VersionStatuses] OFF

SET IDENTITY_INSERT [dbo].[VersionStatusLanguages] ON 
INSERT [dbo].[VersionStatusLanguages] ([VersionStatusLanguageId], [VersionStatusId], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 41, N'Pending', N'Pending', N'Pending', N'Pending', @User, @User, getdate(), getdate())
INSERT [dbo].[VersionStatusLanguages] ([VersionStatusLanguageId], [VersionStatusId], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 41, N'Active', N'Active', N'Active', N'Active', @User, @User, getdate(), getdate())
INSERT [dbo].[VersionStatusLanguages] ([VersionStatusLanguageId], [VersionStatusId], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 3, 41, N'Obsolete', N'Obsolete', N'Obsolete', N'Obsolete', @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[VersionStatusLanguages] OFF


SET IDENTITY_INSERT [dbo].[ContentVersions] ON 

INSERT [dbo].[ContentVersions] ([ContentVersionId], [ContentId], [Sequence], [VersionStatusId],  [Description], [ProcessID], [ProcessTypeId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 1, 2,  N'This is a story about butterflies in my backgarden', 1, 1, @User, @User, getdate(), getdate())

INSERT [dbo].[ContentVersions] ([ContentVersionId], [ContentId], [Sequence], [VersionStatusId], [Description], [ProcessID], [ProcessTypeId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 1, 2,  N'They are the most delicious passion fruits', 1, 1, @User, @User, getdate(), getdate())

INSERT [dbo].[ContentVersions] ([ContentVersionId], [ContentId], [Sequence], [VersionStatusId], [Description], [ProcessID], [ProcessTypeId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 3, 1, 2,  N'They really grow well especially if you keep the lights on', 1, 1, @User, @User, getdate(), getdate())

INSERT [dbo].[ContentVersions] ([ContentVersionId], [ContentId], [Sequence], [VersionStatusId], [Description], [ProcessID], [ProcessTypeId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 4, 1, 2,  N'<p><span class="TextRun SCXW66835828 BCX9" lang="EN-US" style="animation: 0s ease 0s 1 normal none running none; background-image: none; background-position: 0% 0%; background-size: auto; background-repeat: repeat; background-attachment: scroll; background-origin: padding-box; background-clip: border-box; background-blend-mode: normal; border: 0px none #000000; border-radius: 0px; border-collapse: separate; inset: auto; box-shadow: none; box-sizing: content-box; break-after: auto; break-before: auto; break-inside: auto; caption-side: top; clear: none; clip: auto; content: normal; cursor: text; direction: ltr; display: inline; empty-cells: show; float: none; font-family: Helvetica, Helvetica_EmbeddedFont, sans-serif; font-kerning: auto; font-optical-sizing: auto; font-size: 21.3333px; font-stretch: 100%; font-variant-ligatures: no-common-ligatures no-discretionary-ligatures no-historical-ligatures no-contextual; font-variant-numeric: normal; font-variant-east-asian: normal; height: auto; image-rendering: auto; isolation: auto; place-items: normal; place-self: auto; line-height: 26.9792px; list-style: outside none disc; margin: 0px; max-height: none; max-width: none; min-height: 0px; min-width: 0px; mix-blend-mode: normal; object-fit: fill; object-position: 50% 50%; 
offset: none 0px auto 0deg; opacity: 1; outline: #000000 none 0px; outline-offset: 0px; overflow-anchor: auto; overflow-wrap: break-word; overflow: visible; padding: 0px; pointer-events: auto; position: static; resize: 
none; scroll-behavior: auto; speak: normal; table-layout: auto; tab-size: 8; text-align-last: auto; text-decoration-style: solid; text-decoration-color: #000000; text-decoration-skip-ink: auto; text-underline-position: 
auto; text-rendering: auto; text-shadow: none; text-size-adjust: auto; text-overflow: clip; touch-action: auto; transition: all 0s ease 0s; unicode-bidi: normal; vertical-align: baseline; visibility: visible; width: auto; 
will-change: auto; word-break: normal; z-index: auto; zoom: 1; appearance: none; backface-visibility: visible; border-spacing: 0px; -webkit-border-image: none; -webkit-box-align: stretch; -webkit-box-decoration-break: 
slice; -webkit-box-direction: normal; -webkit-box-flex: 0; -webkit-box-ordinal-group: 1; -webkit-box-orient: horizontal; -webkit-box-pack: start; columns: auto auto; gap: normal; column-rule: 0px none #000000; column-span: 
none; backdrop-filter: none; place-content: normal; flex: 0 1 auto; flex-flow: row nowrap; -webkit-font-smoothing: auto; grid-auto-columns: auto; grid-auto-flow: row; grid-auto-rows: auto; grid-area: auto / auto / auto / 
auto; grid-template-areas: none; grid-template-columns: none; grid-template-rows: none; -webkit-highlight: none; hyphens: manual; -webkit-hyphenate-character: auto; -webkit-line-break: after-white-space; -webkit-locale: 
''en-US''; -webkit-mask-box-image-outset: 0px; -webkit-mask-box-image-repeat: stretch; -webkit-mask-box-image-slice: 0 fill; -webkit-mask-box-image-source: none; -webkit-mask-box-image-width: auto; -webkit-mask: none 0% 0% 
/ auto repeat border-box border-box; -webkit-mask-composite: source-over; order: 0; perspective: none; perspective-origin: 0px 0px; -webkit-print-color-adjust: economy; -webkit-rtl-ordering: logical; shape-outside: none; shape-image-threshold: 0; shape-margin: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-text-combine: none; -webkit-text-emphasis: none #000000; -webkit-text-emphasis-position: over right; -webkit-text-fill-color: #000000; -webkit-text-orientation: vertical-right; -webkit-text-security: none; -webkit-text-stroke-color: #000000; transform: none; transform-origin: 0px 0px; transform-style: flat; -webkit-user-drag: none; -webkit-user-modify: read-write; user-select: text; -webkit-writing-mode: horizontal-tb; -webkit-app-region: none; buffered-rendering: auto; clip-path: none; clip-rule: nonzero; mask: none; filter: none; flood-color: #000000; flood-opacity: 1; lighting-color: #ffffff; stop-color: #000000; stop-opacity: 1; color-interpolation: srgb; color-interpolation-filters: linearrgb; color-rendering: auto; fill: #000000; fill-opacity: 1; fill-rule: nonzero; marker: none; mask-type: luminance; shape-rendering: auto; stroke: none; stroke-dasharray: none; stroke-dashoffset: 0px; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 4; stroke-opacity: 1; stroke-width: 1px; alignment-baseline: auto; baseline-shift: 0px; dominant-baseline: auto; text-anchor: start; writing-mode: horizontal-tb; vector-effect: none; paint-order: normal; d: none; cx: 0px; cy: 0px; x: 0px; y: 0px; r: 0px; rx: auto; ry: auto; caret-color: #000000;" xml:lang="EN-US" data-contrast="auto"><span class="NormalTextRun SCXW66835828 BCX9">Habits of a Systems Thinker</span></span></p>', 1, 1, @User, @User, getdate(), getdate())

INSERT [dbo].[ContentVersions] ([ContentVersionId], [ContentId], [Sequence], [VersionStatusId], [Description], [ProcessID], [ProcessTypeId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 5, 1, 2,  N'<p><img src="../../images/20210203153931567.png" alt="" width="756" height="1082" /></p>', 1, 1, @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[ContentVersions] OFF

SET IDENTITY_INSERT [dbo].[ContentVersionAttachments] ON 
INSERT [dbo].[ContentVersionAttachments] ([ContentVersionAttachmentId], [ContentVersionId], [ContentId],activeversionid, [Name], [FileTypeId], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 5, 5,1, N'Planning sheet', 35, @User, @User, getdate(), getdate())

SET IDENTITY_INSERT [dbo].[ContentVersionAttachments] OFF

SET IDENTITY_INSERT [dbo].[ContentVersionAttachmentVersions] ON 

INSERT [dbo].[ContentVersionAttachmentVersions] ([ContentVersionAttachmentVersionId], [ContentVersionAttachmentId], [ContentVersionId], [ContentId], [Sequence], [VersionStatusId], [FileName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 5, 5, 1, 2, N'Planning.xlsx', @User, @User, getdate(), getdate())

SET IDENTITY_INSERT [dbo].[ContentVersionAttachmentVersions] OFF



SET IDENTITY_INSERT ContentClassificationValues ON;
INSERT INTO ContentClassificationValues (
ContentClassificationValueId, ContentId, ClassificationValueId, ClassificationId, CreatorId, ModifierId, ModifiedDate, CreatedDate) 
VALUES 
  (1,1,1,1, @User, @User, GETDATE(), GETDATE())
, (2,2,6,2, @User, @User, GETDATE(), GETDATE())
, (3,3,5,1, @User, @User, GETDATE(), GETDATE())

SET IDENTITY_INSERT ContentClassificationValues OFF;

UPDATE ContentTypes SET ContentProcessTypeId = 2, ContentVersionProcessTypeId = 2  --WHERE ContentTypeId IN (1,2);

SET IDENTITY_INSERT [dbo].[OrganizationSettings] ON 
INSERT [dbo].[OrganizationSettings] ([OrganizationSettingID], [OrganizationSettingTypeID], [OrganizationID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [LocationValue], [ModifierID], [ModifiedDate]) VALUES (1, 1, 1, 1, NULL, NULL, NULL, NULL, @User, getdate())
INSERT [dbo].[OrganizationSettings] ([OrganizationSettingID], [OrganizationSettingTypeID], [OrganizationID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [LocationValue], [ModifierID], [ModifiedDate]) VALUES (2, 1, 2, 1, NULL, NULL, NULL, NULL, @User, getdate())
SET IDENTITY_INSERT [dbo].[OrganizationSettings] OFF
 
SET IDENTITY_INSERT [dbo].[UserPreferences] ON 
INSERT [dbo].[UserPreferences] ([UserPreferenceID], [PreferenceTypeID], [UserID], [IntPreference], [StringPreference], [DateTimePreference], [GuidPreference], [LocationPreference], [ModifierID], [ModifiedDate]) VALUES (1, 1, @User, 41, NULL, NULL, NULL, NULL, @User, getdate())
INSERT [dbo].[UserPreferences] ([UserPreferenceID], [PreferenceTypeID], [UserID], [IntPreference], [StringPreference], [DateTimePreference], [GuidPreference], [LocationPreference], [ModifierID], [ModifiedDate]) VALUES (2, 2, @User, 2, NULL, NULL, NULL, NULL, @User, getdate())
INSERT [dbo].[UserPreferences] ([UserPreferenceID], [PreferenceTypeID], [UserID], [IntPreference], [StringPreference], [DateTimePreference], [GuidPreference], [LocationPreference], [ModifierID], [ModifiedDate]) VALUES (3, 1, @User2, 41, NULL, NULL, NULL, NULL, @User, getdate())
INSERT [dbo].[UserPreferences] ([UserPreferenceID], [PreferenceTypeID], [UserID], [IntPreference], [StringPreference], [DateTimePreference], [GuidPreference], [LocationPreference], [ModifierID], [ModifiedDate]) VALUES (4, 2, @User2, 2, NULL, NULL, NULL, NULL, @User, getdate())
SET IDENTITY_INSERT [dbo].[UserPreferences] OFF


SET IDENTITY_INSERT [dbo].[UserMenus] ON 
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconId], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 1, @User, N'Home', N'Home', 11, 1, 1, 1, @User, @User, Getdate(), Getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconId], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 1, 2, @User, N'To do', N'To do',1 , 4,4, 2, @User, @User, Getdate(), Getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconId], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 13, 13, @User, N'Search', N'Search process', 11, 11, 11, 3, @User, @User, Getdate(), Getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 3, 3, @User, N'add content', N'add content', 1, 6, 6, 12, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (6, 2, 2, @User, N'add process', N'add process', 1, 6, 4, 15, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (7, 8, 8, @User, N'Add organization', N'Add organization', 1, 4, 4, 9, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (8, 4, 4, @User, N'add person', N'add person', 1, 6, 4, 14, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (9, 6, 6, @User, N'add project', N'add project', 2, 6, 3, 7, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (10, 7, 7, @User, N'add relation', N'add relation', 1, 1, 1, 13, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (11, 21, 21, @User, N'advanced search content', N'advanced search content', 16, 6, 6, 5, @User, @User, getdate(), getdate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (12, 22, 22, @User, N'advanced search process', N'advanced search process', 25, 4, 4, 11, @User, @User, GetDate(), GetDate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (13, 19, 19, @User, N'advanced search organization', N'advanced search organization', 37, 4, 3, 8, @User, @User, GetDate(), GetDate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (14, 18, 18, @User, N'advanced search person', N'advanced search person', 40, 6, 6, 4, @User, @User, GetDate(), GetDate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (15, 20, 20, @User, N'advanced search project', N'advanced search project', 41, 6, 6, 3, @User, @User, GetDate(), GetDate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (16, 23, 23, @User, N'advanced search classification values', N'advanced search classification values', 52, 6, 6, 2, @User, @User, GetDate(), GetDate())
INSERT [dbo].[UserMenus] ([UserMenuID], [UserMenuTypeIDLeft], [UserMenuTypeIDRight], [UserID], [Name], [MouseOver], [IconID], [UserPageIdLeft], [UserPageIdRight], [Sequence], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (17, 1, 1, @User, N'To do new', N'To do new', 11, 5, 5, 1, @User, @User, GetDate(), GetDate())
SET IDENTITY_INSERT [dbo].[UserMenus] OFF


SET IDENTITY_INSERT [dbo].[ProcessTypeFlowPasses] ON 
INSERT [dbo].[ProcessTypeFlowPasses] ([ProcessTypeFlowPassID], [ProcessTypeID], [ProcessTypeFlowID], [Sequence], [ProcessTypeFlowPassTypeID], [ProcessTypeFieldID], [ProcessTypeFieldIDRole], [ComparisonOperatorID], [ProcessTypeFlowPassString], [ProcessTypeFlowPassInt], [ProcessTypeFlowPassDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (1, 1, 1, 1, 3, NULL, NULL, 5, NULL, NULL, NULL, @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[ProcessTypeFlowPasses] OFF

SET IDENTITY_INSERT [dbo].[ProcessTypeFlowPassLanguages] ON 
INSERT [dbo].[ProcessTypeFlowPassLanguages] ([ProcessTypeFlowPassLanguageID], [ProcessTypeID], [ProcessTypeFlowID], [ProcessTypeFlowPassID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (1, 1, 1, 1, 41, N'Security level', N'Security level', N'Security level', N'Security level', @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[ProcessTypeFlowPassLanguages] OFF



SET IDENTITY_INSERT [dbo].[Properties] ON 
INSERT [dbo].[Properties] ([PropertyID], [PropertyTypeID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 10, @User, @User, getdate(), getdate())
INSERT [dbo].[Properties] ([PropertyID], [PropertyTypeID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 10, @User, @User, getdate(), getdate())
INSERT [dbo].[Properties] ([PropertyID], [PropertyTypeID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 10, @User, @User, getdate(), getdate())
INSERT [dbo].[Properties] ([PropertyID], [PropertyTypeID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 10, @User, @User, getdate(), getdate())
INSERT [dbo].[Properties] ([PropertyID], [PropertyTypeID], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 10, @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[Properties] OFF

SET IDENTITY_INSERT [dbo].[PropertyLanguages] ON 
INSERT [dbo].[PropertyLanguages] ([PropertyLanguageID], [PropertyID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 41, N'Grade', N'<p>Grade</p>', N'Grade', N'Grade', @User, @User, getdate(), getdate())
INSERT [dbo].[PropertyLanguages] ([PropertyLanguageID], [PropertyID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 2, 41, N'Practice', N'<p>Practice</p>', N'Practice', N'Practice', @User, @User, getdate(), getdate())
INSERT [dbo].[PropertyLanguages] ([PropertyLanguageID], [PropertyID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 3, 41, N'Disciplinary Core Idea', N'<p>Disciplinary Core Idea</p>', N'Disciplinary Core Idea', N'Disciplinary Core Idea', @User, @User, getdate(), getdate())
INSERT [dbo].[PropertyLanguages] ([PropertyLanguageID], [PropertyID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 4, 41, N'Discipline', N'<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Discipline</span><br></p>', N'Discipline', N'Discipline', @User, @User, getdate(), getdate())
INSERT [dbo].[PropertyLanguages] ([PropertyLanguageID], [PropertyID], [LanguageID], [Name], [Description], [MenuName], [MouseOver], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 5, 41, N'Crosscutting Concept', N'<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &quot;Lucida Console&quot;, &quot;Courier New&quot;, monospace; font-size: 12px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Crosscutting Concept</span><br></p>', N'Crosscutting Concept', N'Crosscutting Concept', @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[PropertyLanguages] OFF

SET IDENTITY_INSERT [dbo].[PropertyValues] ON 
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1, 1, 1, 0, 0, N'K 2', GETDATE() , @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2, 1, 2, 0, 0, N'K', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (3, 1, 3, 0, 0, N'1', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (4, 1, 4, 0, 0, N'2', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (5, 1, 5, 0, 0, N'3-5', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (6, 1, 6, 0, 0, N'3', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (7, 1, 7, 0, 0, N'4', GETDATE(), @User, @User, GETDATE(), GETDATE()) 
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (8, 1, 8, 0, 0, N'5', GETDATE(), @User, @User, GETDATE(), GETDATE()) 
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (9, 1, 9, 0, 0, N'Middle school (6-8)', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (10, 1, 10, 0, 0, N'High school (9-12)', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (11, 2, 1, 0, 0, N' Asking Questions and Defining Problems', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (12, 2, 2, 0, 0, N' Developing and Using Models', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (13, 2, 3, 0, 0, N' Planning and Carrying Out Investigations', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (14, 2, 4, 0, 0, N' Analyzing and Interpreting Data', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (15, 2, 5, 0, 0, N' Using Mathematics and Computational Thinking', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (16, 2, 6, 0, 0, N' Constructing Explanations and Designing Solutions', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (17, 2, 7, 0, 0, N' Engaging in Argument from Evidence', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (18, 2, 8, 0, 0, N' Obtaining, Evaluating, and Communicating Information', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (19, 3, 1, 0, 0, N'PS1A: Structure and Properties of Matter', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (20, 3, 2, 0, 0, N'PS1B: Chemical Reactions', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (21, 3, 3, 0, 0, N'PS1C: Nuclear Processes', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (22, 3, 4, 0, 0, N'PS2A: Forces and Motion', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (23, 3, 5, 0, 0, N'PS2B: Types of Interactions', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (24, 3, 6, 0, 0, N'PS3A: Definitions of Energy', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (25, 3, 7, 0, 0, N'PS3B: Conservation of Energy and Energy Transfer', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (26, 3, 8, 0, 0, N'PS3C: Relationship Between Energy and Forces', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (27, 3, 9, 0, 0, N'PS3D: Energy in Chemical Processes and Everyday Life', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (28, 3, 10, 0, 0, N'PS4A: Wave Properties', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (29, 3, 11, 0, 0, N'PS4B: Electromagnetic Radiation', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (30, 3, 12, 0, 0, N'PS4C: Information Technologies and Instrumentation', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (31, 3, 13, 0, 0, N'LS1A: Structure and Function', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (32, 3, 14, 0, 0, N'LS1B: Growth and Development of Organisms', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (33, 3, 15, 0, 0, N'LS1C: Organization for Matter and Energy Flow in Organisms', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (34, 3, 16, 0, 0, N'LS1D: Information Processing', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (35, 3, 17, 0, 0, N'LS2A: Interdependent Relationships in Ecosystems', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (36, 3, 18, 0, 0, N'LS2B: Cycles of Matter and Energy Transfer in Ecosystems', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (37, 3, 19, 0, 0, N'LS2C: Ecosystems Dynamics, Functioning and Resilience', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (38, 3, 20, 0, 0, N'LS2D: Social Interactions and Group Behavior', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (39, 3, 21, 0, 0, N'LS3A: Inheritance of Traits', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (40, 3, 22, 0, 0, N'LS3B: Variation of Traits', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (41, 3, 23, 0, 0, N'LS4A: Evidence of Common Ancestry and Diversity', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (42, 3, 24, 0, 0, N'LS4B: Natural Selection', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (43, 3, 25, 0, 0, N'LS4C: Adaptation', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (44, 3, 26, 0, 0, N'LS4D: Biodiversity and Humans', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (45, 3, 27, 0, 0, N'ESS1A: The Universe and its Stars', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (46, 3, 28, 0, 0, N'ESS1B: Earth and the Solar System', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (47, 3, 29, 0, 0, N'ESS1C: The History of Planet Earth', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (48, 3, 30, 0, 0, N'ESS2A: Earth Materials and Systems', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (49, 3, 31, 0, 0, N'ESS2B: Plate Tectonics and Large-Scale Systems', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (50, 3, 32, 0, 0, N'ESS2C: The Role of Water in Earth’s Surface Processes', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (51, 3, 33, 0, 0, N'ESS2D: Weather and Climate', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (52, 3, 34, 0, 0, N'ESS2E: Biogeology', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (53, 3, 35, 0, 0, N'ESS3A: Natural Resources', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (54, 3, 36, 0, 0, N'ESS3B: Natural Hazards', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (55, 3, 37, 0, 0, N'ESS3C: Human Impacts on Earth Systems', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (56, 3, 38, 0, 0, N'ESS3D: Global Climate Change', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (57, 3, 39, 0, 0, N'ETS1A: Defining and Delimiting and Engineering Problem', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (58, 3, 40, 0, 0, N'ETS1B: Developing Possible Solutions', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (59, 3, 41, 0, 0, N'ETS1C: Optimizing the Design Solution', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (60, 4, 1, 0, 0, N'Physical Sciences', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (61, 4, 2, 0, 0, N'Life Sciences', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (62, 4, 3, 0, 0, N'Earth and Space Sciences', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (63, 4, 4, 0, 0, N'Engineering, Technology, and Applications of Science', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (64, 5, 1, 0, 0, N'Patterns', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (65, 5, 2, 0, 0, N'Cause and Effect', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (66, 5, 3, 0, 0, N'Scale, Proportion, and Quantity', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (67, 5, 4, 0, 0, N'Systems and System Models', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (68, 5, 5, 0, 0, N'Energy and Matter', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (69, 5, 6, 0, 0, N'Structure and Function', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (70, 5, 7, 0, 0, N'Stability and Change', GETDATE(), @User, @User, GETDATE(), GETDATE())
INSERT [dbo].[PropertyValues] ([PropertyValueID], [PropertyID], [Sequence], [PropertyValueBool], [PropertyValueInt], [PropertyValueString], [PropertyValueDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (71, 5, 8, 0, 0, N'Interdependence of Science, Engineering, and Technology', GETDATE(), @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT [dbo].[PropertyValues] OFF

