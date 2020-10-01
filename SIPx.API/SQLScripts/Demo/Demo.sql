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
INSERT INTO ClassificationLevels (ClassificationLevelId, ClassificationId, Sequence, DateLevelId, OnTheFly, Alphabetically, CanLink, InDropDown, InMenu, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 2, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (4, 3, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
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

SET IDENTITY_INSERT ContentTypes ON;
INSERT INTO ContentTypes (ContentTypeId, ContentTypeGroupId, SecurityLevelId, Color, IconID, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, '#008000ff',1, @User, @User, GETDATE(), GETDATE())
 , (2, 1, 1, '#008000ff',1,@User, @User, GETDATE(), GETDATE())
 , (3, 2, 1, '#008000ff',1,@User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypes OFF;

SET IDENTITY_INSERT ContentTypeLanguages ON;
INSERT INTO ContentTypeLanguages(ContentTypeLanguageId, ContentTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Climate knowledge', 'Climate knowledge', 'Climate knowledge', 'Climate knowledge', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Soil knowledge', 'Soil knowledge', 'Soil knowledge', 'Soil knowledge', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'General assignment', 'General assignment', 'General assignment', 'General assignment', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeLanguages OFF;

SET IDENTITY_INSERT ContentTypeClassifications ON;
INSERT INTO ContentTypeClassifications ( ContentTypeClassificationId, ContentTypeId, ClassificationId, ContentTypeClassificationStatusId, ModifierId, ModifiedDate) VALUES 
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

SET IDENTITY_INSERT OrganizationTypes ON;
INSERT INTO OrganizationTypes (OrganizationTypeId, Internal, LegalEntity, Color,IconId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1,1,1,'#008000ff', 1,@User, @User, GETDATE(), GETDATE())
, (2,1,0, '#008000ff',1,@User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTypes OFF;

SET IDENTITY_INSERT OrganizationTypeLanguages ON;
INSERT INTO OrganizationTypeLanguages(OrganizationTypeLanguageId, OrganizationTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1, 41, 'Legal entity', 'Legal entity', 'Legal entity', 'Legal entity', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Internal entity', 'Internal entity', 'Internal entity', 'Internal entity', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTypeLanguages OFF;


SET IDENTITY_INSERT Organizations ON;
INSERT INTO Organizations (OrganizationId, StatusId, OrganizationTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, @User, @User, GETDATE(), GETDATE())
INSERT INTO Organizations (OrganizationId, ParentOrganizationId, StatusId, OrganizationTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
  (2, 1, 1, 2, @User, @User, GETDATE(), GETDATE())
 SET IDENTITY_INSERT Organizations OFF;

SET IDENTITY_INSERT OrganizationLanguages ON;
INSERT INTO OrganizationLanguages(OrganizationLanguageId, OrganizationId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Medical faculty', 'Medical faculty', 'Medical faculty', 'Medical faculty', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationLanguages OFF;



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
  (2, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
, (3, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
, (4, 1, 1, 1, NULL, @User, @User, GETDATE(), GETDATE())
, (5, 1, 1, 1, @User,  @User, @User, GETDATE(), GETDATE())
, (6, 1, 1, 1, @User,  @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT Pages OFF;

SET IDENTITY_INSERT PageLanguages ON;
INSERT INTO PageLanguages(PageLanguageId, PageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
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

SET IDENTITY_INSERT Persons ON;
INSERT INTO Persons( PersonId, Salutation, FirstName, MiddleName, LastName, PersonalTitle, Suffix, NickName
, FirstNameLocal, MiddleNameLocal, LastNameLocal, GenderId, BirthDate, DefaultOrganizationID
, CreatorId, ModifierId, CreatedDate, ModifiedDate)
VALUES
(1,'Mr', 'Dirk','', 'Gently','','','Dirk', 'Dirk','', 'Gently',1,'1942-01-01',1, @User, @User, GETDATE(), GETDATE())
INSERT INTO Persons( PersonId, Salutation, FirstName, MiddleName, LastName, PersonalTitle, Suffix, NickName
, FirstNameLocal, MiddleNameLocal, LastNameLocal, GenderId, BirthDate, DefaultOrganizationID
, CreatorId, ModifierId, CreatedDate, ModifiedDate, UserID)
VALUES
(2,'Mr', 'Peter','', 'le Grand','','','Peter', 'Peter','', 'le Grand',1,'1942-01-01',1, @User, @User, GETDATE(), GETDATE(), @User)
, (3,'Mr', 'Ford','', 'Prefect','','','Ford', 'Ford','', 'Prefect',1,'2050-01-01',1, @User, @User, GETDATE(), GETDATE(), @User2)
SET IDENTITY_INSERT Persons OFF;

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

SET IDENTITY_INSERT ProcessTemplateGroups ON;
INSERT INTO ProcessTemplateGroups (ProcessTemplateGroupId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1, @User, @User, GETDATE(), GETDATE())
,(2,2, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplateGroups OFF;

SET IDENTITY_INSERT ProcessTemplateGroupLanguages ON;
INSERT INTO ProcessTemplateGroupLanguages (ProcessTemplateGroupLanguageId, ProcessTemplateGroupId,LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1, 41, 'Assignments', 'Assignments', 'Assignments', 'Assignments', @User, @User, GETDATE(), GETDATE())
,(2,2, 41, 'Knowledge', 'Knowledge', 'Knowledge', 'Knowledge', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplateGroupLanguages OFF;

SET IDENTITY_INSERT ProcessTemplates ON;
INSERT INTO ProcessTemplates (ProcessTemplateId, ProcessTemplateGroupId, ShowInPersonalCalendar, ShowInOrganizationCalendar, ShowInProjectCalendar, ShowInEventCalendar
, ProcessMultiMax, Sequence, IsPersonal, ShowInNew, ShowInSearch, ShowInReports, HideEverywhere, Color, IconID
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,0,0,0,0
,10,1,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE())
,(2,1,0,0,0,0
,15,2,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE())
,(3,2,0,0,0,0
,15,1,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE())
,(4,2,1,0,0,0
,15,1,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE())
,(5,2,0,1,0,0
,15,1,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE())
,(6,2,0,0,1,0
,15,1,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE())
,(7,2,0,0,0,1
,15,1,0,1,1,1,0, '#008000ff',1
, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplates OFF;

SET IDENTITY_INSERT ProcessTemplateLanguages ON;
INSERT INTO ProcessTemplateLanguages (ProcessTemplateLanguageId, ProcessTemplateId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,41, 'Game assignment', 'Game assignment', 'Game assignment', 'Game assignment', @User, @User, GETDATE(), GETDATE())
,(2,2,41, 'Research assignment', 'Research assignment', 'Research assignment', 'Research assignment', @User, @User, GETDATE(), GETDATE())
,(3,3,41, 'Proof reading', 'Proof reading', 'Proof reading', 'Proof reading', @User, @User, GETDATE(), GETDATE())
,(4,4,41, 'Personal appointment', 'Personal appointment', 'Personal appointment', 'Personal appointment', @User, @User, GETDATE(), GETDATE())
,(5,5,41, 'School event', 'School event', 'School event', 'School event', @User, @User, GETDATE(), GETDATE())
,(6,6,41, 'Project event', 'Project event', 'Project event', 'Project event', @User, @User, GETDATE(), GETDATE())
,(7,7,41, 'General event', 'General event', 'General event', 'General event', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplateLanguages OFF;




SET IDENTITY_INSERT ProcessTemplateFields ON;
INSERT INTO ProcessTemplateFields (ProcessTemplateFieldId, ProcessTemplateId, ProcessTemplateFieldTypeId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
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
SET IDENTITY_INSERT ProcessTemplateFields OFF;

SET IDENTITY_INSERT ProcessTemplateFieldLanguages ON;
INSERT INTO ProcessTemplateFieldLanguages (ProcessTemplateFieldLanguageId, ProcessTemplateId, ProcessTemplateFieldId, LanguageId , Name, Description, MenuName, MouseOver
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,1,41, 'Subject', 'Game assignment', 'Game assignment', 'Game assignment', @User, @User, GETDATE(), GETDATE())
,(2,1,2,41, 'Assign', 'Research assignment', 'Research assignment', 'Research assignment', @User, @User, GETDATE(), GETDATE())
,(3,1,3,41, 'Assignment', 'Assignment', 'Assignment', 'Assignment', @User, @User, GETDATE(), GETDATE())
,(4,1,4,41, 'Game', 'Game', 'Game', 'Game', @User, @User, GETDATE(), GETDATE())
,(5,1,5,41, 'Student text', 'Student text', 'Student text', 'Student text', @User, @User, GETDATE(), GETDATE())
,(6,1,6,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(7,1,7,41, 'Result', 'Result', 'Result', 'Result', @User, @User, GETDATE(), GETDATE())
,(8,1,8,41, 'Passed', 'Passed', 'Passed', 'Passed', @User, @User, GETDATE(), GETDATE())
,(9,1,9,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
,(10,1,10,41, 'Date assigned', 'Date assigned', 'Date assigned', 'Date assigned', @User, @User, GETDATE(), GETDATE())
,(11,1,11,41, 'Date sumitted', 'Date sumitted', 'Date sumitted', 'Date sumitted', @User, @User, GETDATE(), GETDATE())
,(12,1,12,41, 'Date passed', 'Date passed', 'Date passed', 'Date passed', @User, @User, GETDATE(), GETDATE())
,(13,2,13,41, 'Subject', 'Game assignment', 'Game assignment', 'Game assignment', @User, @User, GETDATE(), GETDATE())
,(14,2,14,41, 'Assign', 'Research assignment', 'Research assignment', 'Research assignment', @User, @User, GETDATE(), GETDATE())
,(15,2,15,41, 'Assignment', 'Assignment', 'Assignment', 'Assignment', @User, @User, GETDATE(), GETDATE())
,(16,2,16,41, 'Student text', 'Student text', 'Student text', 'Student text', @User, @User, GETDATE(), GETDATE())
,(17,2,17,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(18,2,18,41, 'Result', 'Result', 'Result', 'Result', @User, @User, GETDATE(), GETDATE())
,(19,2,19,41, 'Passed', 'Passed', 'Passed', 'Passed', @User, @User, GETDATE(), GETDATE())
,(20,2,20,41, 'Rejected', 'Rejected', 'Rejected', 'Rejected', @User, @User, GETDATE(), GETDATE())
,(21,2,21,41, 'Date assigned', 'Date assigned', 'Date assigned', 'Date assigned', @User, @User, GETDATE(), GETDATE())
,(22,2,22,41, 'Date sumitted', 'Date sumitted', 'Date sumitted', 'Date sumitted', @User, @User, GETDATE(), GETDATE())
,(23,2,23,41, 'Date passed', 'Date passed', 'Date passed', 'Date passed', @User, @User, GETDATE(), GETDATE())
,(24,3,24,41, 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(25,3,25,41, 'Student comment', 'Student comment', 'Student comment', 'Student comment', @User, @User, GETDATE(), GETDATE())
,(26,3,26,41, 'Content', 'Content', 'Content', 'Content', @User, @User, GETDATE(), GETDATE())
,(27,3,27,41, 'Area', 'Area', 'Area', 'Area', @User, @User, GETDATE(), GETDATE())
,(28,3,28,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(29,3,29,41, 'Approver comment', 'Approver comment', 'Approver comment', 'Approver comment', @User, @User, GETDATE(), GETDATE())
,(30,3,30,41, 'Approve', 'Approve', 'Approve', 'Approve', @User, @User, GETDATE(), GETDATE())
,(31,3,31,41, 'Reject', 'Reject', 'Reject', 'Reject', @User, @User, GETDATE(), GETDATE())
,(32,1,32,41, 'Player', 'Player', 'Player', 'Player', @User, @User, GETDATE(), GETDATE())
,(33,2,33,41, 'Student', 'Student', 'Student', 'Student', @User, @User, GETDATE(), GETDATE())
,(34,1,34,41, 'Minimum security level', 'Minimum security level', 'Minimum security level', 'Minimum security level', @User, @User, GETDATE(), GETDATE())
,(35,1,35,41, 'Role of approver', 'Role of approver', 'Role of approver', 'Role of approver', @User, @User, GETDATE(), GETDATE())
,(36,2,36,41, 'Role of approver', 'Role of approver', 'Role of approver', 'Role of approver', @User, @User, GETDATE(), GETDATE())
,(37,2,37,41, 'Minimum security level', 'Minimum security level', 'Minimum security level', 'Minimum security level', @User, @User, GETDATE(), GETDATE())
,(38,3,38,41, 'Minimum security level', 'Minimum security level', 'Minimum security level', 'Minimum security level', @User, @User, GETDATE(), GETDATE())
,(39,4,39,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(40,4,40,41, 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(41,4,41,41, 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(42,4,42,41, 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(43,4,43,41, 'User', 'User', 'User', 'User', @User, @User, GETDATE(), GETDATE())
,(44,5,44,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(45,5,45,41, 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(46,5,46,41, 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(47,5,47,41, 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(48,5,48,41, 'Organization', 'Organization', 'Organization', 'Organization', @User, @User, GETDATE(), GETDATE())
,(49,6,49,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(50,6,50,41, 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(51,6,51,41, 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(52,6,52,41, 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
,(53,6,53,41, 'Project', 'Project', 'Project', 'Project', @User, @User, GETDATE(), GETDATE())
,(54,7,54,41, 'Submit', 'Submit', 'Submit', 'Submit', @User, @User, GETDATE(), GETDATE())
,(55,7,55,41, 'From date time', 'From date time', 'From date time', 'From date time', @User, @User, GETDATE(), GETDATE())
,(56,7,56,41, 'To date time', 'To date time', 'To date time', 'To date time', @User, @User, GETDATE(), GETDATE())
,(57,7,57,41, 'Subject', 'Subject', 'Subject', 'Subject', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateFieldLanguages OFF;

SET IDENTITY_INSERT ProcessTemplateStageTypes ON;
INSERT INTO ProcessTemplateStageTypes (ProcessTemplateStageTypeId, IconID, Color, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (2, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (3, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (4, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (5, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (6, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (7, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
, (8, 1,'#008000ff',@User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateStageTypes OFF;

SET IDENTITY_INSERT ProcessTemplateStageTypeLanguages ON;
INSERT INTO ProcessTemplateStageTypeLanguages (ProcessTemplateStageTypeLanguageId, ProcessTemplateStageTypeId, LanguageId , Name, Description, MenuName, MouseOver
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
SET IDENTITY_INSERT ProcessTemplateStageTypeLanguages OFF;


SET IDENTITY_INSERT ProcessTemplateStages ON;
INSERT INTO ProcessTemplateStages (ProcessTemplateStageId, ProcessTemplateId, ProcessTemplateStageTypeId, InToDo, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
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
SET IDENTITY_INSERT ProcessTemplateStages OFF;


SET IDENTITY_INSERT ProcessTemplateStageLanguages ON;
INSERT INTO ProcessTemplateStageLanguages (ProcessTemplateStageLanguageId,ProcessTemplateId, ProcessTemplateStageId, LanguageId , Name, Description, MenuName, MouseOver
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
SET IDENTITY_INSERT ProcessTemplateStageLanguages OFF;



SET IDENTITY_INSERT ProcessTemplateStageFields ON;

INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (1,1,12,1,4, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (2,1,12,2,3, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (3,1,12,32,4, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (4,1,12,3,4, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (5,1,12,4,4, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (6,1,12,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (7,1,12,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (8,1,12,34,1, 8, 2, 2, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (9,1,12,35,1, 9, 2, 2, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (10,1,12,7,1, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (11,1,12,8,1, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (12,1,12,9,1, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (13,1,12,10,4, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (14,1,12,11,1, 14, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (15,1,12,12,1, 15, 1, @user,getdate());																							
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (16,1,1,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (17,1,1,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (18,1,1,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (19,1,1,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (20,1,1,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (21,1,1,5,4, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (22,1,1,6,3, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (23,1,1,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (24,1,1,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (25,1,1,7,1, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (26,1,1,8,1, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (27,1,1,9,1, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (28,1,1,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (29,1,1,11,4, 14, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (30,1,1,12,1, 15, 1, @user,getdate());																							
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (31,1,2,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (32,1,2,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (33,1,2,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (34,1,2,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (35,1,2,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (36,1,2,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (37,1,2,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (38,1,2,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (39,1,2,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (40,1,2,7,4, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (41,1,2,8,3, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (42,1,2,9,3, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (43,1,2,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (44,1,2,11,2, 14, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (45,1,2,12,4, 15, 1, @user,getdate());																							
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (46,1,3,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (47,1,3,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (48,1,3,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (49,1,3,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (50,1,3,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (51,1,3,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (52,1,3,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (53,1,3,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (54,1,3,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (55,1,3,7,2, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (56,1,3,8,2, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (57,1,3,9,2, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (58,1,3,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (59,1,3,11,2, 14, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (60,1,3,12,2, 15, 1, @user,getdate());																							
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (61,1,4,1,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (62,1,4,2,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (63,1,4,32,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (64,1,4,3,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (65,1,4,4,2, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (66,1,4,5,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (67,1,4,6,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (68,1,4,34,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (69,1,4,35,1, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (70,1,4,7,2, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (71,1,4,8,2, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (72,1,4,9,2, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (73,1,4,10,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (74,1,4,11,2, 14, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (75,1,4,12,1, 15, 1, @user,getdate());																							
															INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (76,2,13,13,4, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (77,2,13,14,3, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (78,2,13,33,4, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (79,2,13,15,4, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (80,2,13,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (81,2,13,36,1, 6, 2, 2, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,IntValue,ModifierId, ModifiedDate) VALUES (82,2,13,37,1, 7, 2, 2, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (83,2,13,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (84,2,13,18,1, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (85,2,13,19,1, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (86,2,13,20,1, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (87,2,13,21,4, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (88,2,13,22,1, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (89,2,13,23,1, 14, 1, @user,getdate());									
															INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (90,2,5,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (91,2,5,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (92,2,5,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (93,2,5,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (94,2,5,16,4, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (95,2,5,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (96,2,5,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (97,2,5,17,3, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (98,2,5,18,1, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (99,2,5,19,1, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (100,2,5,20,1, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (101,2,5,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (102,2,5,22,4, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (103,2,5,23,1, 14, 1, @user,getdate());									
															INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (104,2,6,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (105,2,6,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (106,2,6,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (107,2,6,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (108,2,6,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (109,2,6,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (110,2,6,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (111,2,6,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (112,2,6,18,4, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (113,2,6,19,3, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (114,2,6,20,3, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (115,2,6,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (116,2,6,22,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (117,2,6,23,4, 14, 1, @user,getdate());									
															INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (118,2,7,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (119,2,7,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (120,2,7,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (121,2,7,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (122,2,7,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (123,2,7,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (124,2,7,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (125,2,7,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (126,2,7,18,2, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (127,2,7,19,2, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (128,2,7,20,2, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (129,2,7,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (130,2,7,22,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (131,2,7,23,2, 14, 1, @user,getdate());									
															INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (132,2,8,13,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (133,2,8,14,1, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (134,2,8,33,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (135,2,8,15,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (136,2,8,16,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (137,2,8,36,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (138,2,8,37,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (139,2,8,17,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (140,2,8,18,2, 9, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (141,2,8,19,2, 10, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (142,2,8,20,2, 11, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (143,2,8,21,2, 12, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (144,2,8,22,2, 13, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (145,2,8,23,1, 14, 1, @user,getdate());									
																													INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (146,3,14,24,4, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (147,3,14,25,3, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (148,3,14,26,4, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (149,3,14,27,4, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (150,3,14,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (151,3,14,28,3, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (152,3,14,29,1, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (153,3,14,30,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (154,3,14,31,1, 9, 1, @user,getdate());
																													INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (155,3,9,24,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (156,3,9,25,2, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (157,3,9,26,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (158,3,9,27,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (159,3,9,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (160,3,9,28,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (161,3,9,29,3, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (162,3,9,30,3, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (163,3,9,31,3, 9, 1, @user,getdate());
																													INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (164,3,10,24,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (165,3,10,25,2, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (166,3,10,26,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (167,3,10,27,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (168,3,10,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (169,3,10,28,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (170,3,10,29,2, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (171,3,10,30,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (172,3,10,31,1, 9, 1, @user,getdate());
																													INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (173,3,11,24,2, 1, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (174,3,11,25,2, 2, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (175,3,11,26,2, 3, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (176,3,11,27,2, 4, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (177,3,11,38,1, 5, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (178,3,11,28,1, 6, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (179,3,11,29,2, 7, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (180,3,11,30,1, 8, 1, @user,getdate());	INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,ProcessTemplateFieldId,ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) VALUES (181,3,11,31,1, 9, 1, @user,getdate());

INSERT INTO ProcessTemplateStageFields (
ProcessTemplateStageFieldId,ProcessTemplateId,ProcessTemplateStageId,
ProcessTemplateFieldId,
ProcessTemplateStageFieldStatusId,Sequence, ValueUpdateTypeId,ModifierId, ModifiedDate) 
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
SET IDENTITY_INSERT ProcessTemplateStageFields OFF;


SET IDENTITY_INSERT ProcessTemplateFlows ON;
INSERT INTO ProcessTemplateFlows (ProcessTemplateFlowId, ProcessTemplateId, ProcessTemplateFromStageId, ProcessTemplateToStageId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
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
SET IDENTITY_INSERT ProcessTemplateFlows OFF;

SET IDENTITY_INSERT ProcessTemplateFlowLanguages ON;
INSERT INTO ProcessTemplateFlowLanguages  (
ProcessTemplateFlowLanguageId,ProcessTemplateId, ProcessTemplateFlowId, LanguageId , Name, Description, MenuName, MouseOver
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
SET IDENTITY_INSERT  ProcessTemplateFlowLanguages  OFF;

SET IDENTITY_INSERT [dbo].[ProjectTypes] ON 
INSERT [dbo].[ProjectTypes] ([ProjectTypeID], Color,IconID, [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (1,'#008000ff',1, @User, @User, Getdate(), Getdate())
INSERT [dbo].[ProjectTypes] ([ProjectTypeID], Color,IconID, [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) VALUES (2,'#008000ff',1, @User, @User, Getdate(), Getdate())
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

SET IDENTITY_INSERT ProcessTemplateFlowConditions ON;
INSERT INTO ProcessTemplateFlowConditions (ProcessTemplateFlowConditionId, ProcessTemplateId, ProcessTemplateFlowID
, ProcessTemplateFlowConditionTypeId , ComparisonOperatorId, ProcessTemplateFlowConditionInt, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1, 1, 1, 3, 5, 3, 1, @User, @User, GETDATE(), GETDATE())
,(2, 2, 5, 3, 5, 6, 2, @User, @User, GETDATE(), GETDATE())
,(3, 3, 9, 3, 6, 5 , 3, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessTemplateFlowConditions (ProcessTemplateFlowConditionId, ProcessTemplateId, ProcessTemplateFlowID
, ProcessTemplateFlowConditionTypeId , ComparisonOperatorId, ProcessTemplateFieldId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(4, 1, 2, 19, 2, 32,4, @User, @User, GETDATE(), GETDATE())
,(5, 2, 6, 19, 2, 32,5, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessTemplateFlowConditions (ProcessTemplateFlowConditionId, ProcessTemplateId, ProcessTemplateFlowID
, ProcessTemplateFlowConditionTypeId , ComparisonOperatorID
,ProcessTemplateFieldId,ProcessTemplateFieldIDRole, Sequence
, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(6, 1, 3, 19, 2, 32,35,6, @User, @User, GETDATE(), GETDATE())
,(7, 1, 4, 19, 2, 32,35,7, @User, @User, GETDATE(), GETDATE())
,(8, 2, 7, 19, 2, 32,35,8, @User, @User, GETDATE(), GETDATE())
,(9, 2, 8, 19, 2, 32,35,9, @User, @User, GETDATE(), GETDATE())
;
INSERT INTO ProcessTemplateFlowConditions (ProcessTemplateFlowConditionId, ProcessTemplateId, ProcessTemplateFlowID
, ProcessTemplateFlowConditionTypeId , ComparisonOperatorId, ProcessTemplateFieldId, Sequence, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(10, 3, 10, 22, 2, 27,10, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateFlowConditions OFF;


SET IDENTITY_INSERT ProcessTemplateFlowConditionLanguages ON;
INSERT INTO ProcessTemplateFlowConditionLanguages (ProcessTemplateFlowConditionLanguageId,ProcessTemplateId, ProcessTemplateFlowId, ProcessTemplateFlowConditionId, LanguageId , Name, Description, MenuName, MouseOver
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
SET IDENTITY_INSERT ProcessTemplateFlowConditionLanguages OFF;

SET IDENTITY_INSERT PersonRelationTypes ON;
INSERT INTO PersonRelationTypes (PersonRelationTypeId, SeePersonal, Color,IconID, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
( 1,0,'#008000ff', 1,@User, @User, GETDATE(), GETDATE())
,( 2,0, '#008000ff',1,@User, @User, GETDATE(), GETDATE())
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


SET IDENTITY_INSERT Processes ON;
INSERT INTO Processes (ProcessId, ProcessTemplateId, ProcessTemplateStageId, CreatorId, ModifierId, ModifiedDate, CreatedDate) VALUES 
(1,1,1, @User, @User, GETDATE(), GETDATE())
, (2,1,2, @User, @User, GETDATE(), GETDATE())
, (3,1,3, @User, @User, GETDATE(), GETDATE())
, (4,1,4, @User, @User, GETDATE(), GETDATE())
, (5,2,5, @User, @User, GETDATE(), GETDATE())
, (6,2,6, @User, @User, GETDATE(), GETDATE())
, (7,2,7, @User, @User, GETDATE(), GETDATE())
, (8,2,8, @User, @User, GETDATE(), GETDATE())
, (9,3,9, @User, @User, GETDATE(), GETDATE())
, (10,3,10, @User, @User, GETDATE(), GETDATE())
, (11,3,11, @User, @User, GETDATE(), GETDATE())
, (12,4,16, @User, @User, GETDATE(), GETDATE())
, (13,5,18, @User, @User, GETDATE(), GETDATE())
, (14,6,20, @User, @User, GETDATE(), GETDATE())
, (15,7,22, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT Processes OFF;

SET IDENTITY_INSERT ProcessFields ON;
INSERT INTO ProcessFields (
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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
ProcessFieldId, ProcessTemplateId, ProcessId, ProcessTemplateFieldID
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

SET IDENTITY_INSERT Contents ON;
INSERT INTO Contents (
ContentId, ContentTypeId, ContentStatusId, LanguageId, Title, Description, SecurityLevelId, OrganizationId, CreatorId, ModifierId, ModifiedDate, CreatedDate, ProcessID) 
VALUES 
  (1,1,2,41,'Research of Tropics on butterflies','This is a story about butterflies in my backgarden', 1,1, @User, @User, GETDATE(), GETDATE(),9)
, (2,2,4,41,'Growing passion fruits in Silt soil','They are the most delicious passion fruits', 1,1, @User, @User, GETDATE(), GETDATE(),10)
, (3,1,3,41,'Arctic and strawberries','They really grow well especially if you keep the lights on', 1,1, @User, @User, GETDATE(), GETDATE(),11)

SET IDENTITY_INSERT Contents OFF;

SET IDENTITY_INSERT ContentClassificationValues ON;
INSERT INTO ContentClassificationValues (
ContentClassificationValueId, ContentId, ClassificationValueId, ClassificationId, CreatorId, ModifierId, ModifiedDate, CreatedDate) 
VALUES 
  (1,1,1,1, @User, @User, GETDATE(), GETDATE())
, (2,2,6,2, @User, @User, GETDATE(), GETDATE())
, (3,3,5,1, @User, @User, GETDATE(), GETDATE())

SET IDENTITY_INSERT ContentClassificationValues OFF;

UPDATE ContentTypes SET ProcessTemplateId = 2 WHERE ContentTypeId IN (1,2);

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
SET IDENTITY_INSERT [dbo].[UserMenus] OFF


SET IDENTITY_INSERT [dbo].[ProcessTemplateFlowPasses] ON 
INSERT [dbo].[ProcessTemplateFlowPasses] ([ProcessTemplateFlowPassID], [ProcessTemplateID], [ProcessTemplateFlowID], [Sequence], [ProcessTemplateFlowPassTypeID], [ProcessTemplateFieldID], [ProcessTemplateFieldIDRole], [ComparisonOperatorID], [ProcessTemplateFlowPassString], [ProcessTemplateFlowPassInt], [ProcessTemplateFlowPassDate], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (1, 1, 1, 1, 3, NULL, NULL, 5, NULL, NULL, NULL, @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[ProcessTemplateFlowPasses] OFF

SET IDENTITY_INSERT [dbo].[ProcessTemplateFlowPassLanguages] ON 
INSERT [dbo].[ProcessTemplateFlowPassLanguages] ([ProcessTemplateFlowPassLanguageID], [ProcessTemplateID], [ProcessTemplateFlowID], [ProcessTemplateFlowPassID], [LanguageID], [Name], [Description], [MouseOver], [MenuName], [CreatorID], [ModifierID], [ModifiedDate], [CreatedDate]) 
VALUES (1, 1, 1, 1, 41, N'Security level', N'Security level', N'Security level', N'Security level', @User, @User, getdate(), getdate())
SET IDENTITY_INSERT [dbo].[ProcessTemplateFlowPassLanguages] OFF
