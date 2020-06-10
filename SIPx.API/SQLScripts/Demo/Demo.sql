use sip
DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers
DECLARE @Role as nvarchar(450);
Select @Role = Id from AspNetRoles

SET IDENTITY_INSERT Classifications ON;
INSERT INTO Classifications (ClassificationID, StatusID, HasDropDown, DropDownSequence, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 1, 2, @User, @User, GETDATE(), GETDATE())
, (3, 1, 1, 3, @User, @User, GETDATE(), GETDATE()) 
SET IDENTITY_INSERT Classifications OFF;

SET IDENTITY_INSERT ClassificationLanguages ON;
INSERT INTO ClassificationLanguages(ClassificationLanguageID, ClassificationID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Climate', 'Climate', 'Climate', 'Climate', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Soil', 'Soil', 'Soil', 'Soil', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Crop', 'Crop', 'Crop', 'Crop', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLanguages OFF;

SET IDENTITY_INSERT ClassificationRelationTypes ON;
INSERT INTO ClassificationRelationTypes (ClassificationRelationTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES (1, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ClassificationRelationTypes OFF;

SET IDENTITY_INSERT ClassificationRelationTypeLanguages ON;
INSERT INTO ClassificationRelationTypeLanguages(ClassificationRelationTypeLanguageID, ClassificationRelationTypeID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Owner', 'Owner', 'Owner', 'Owner', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationRelationTypeLanguages OFF;


SET IDENTITY_INSERT ClassificationUsers ON;
INSERT INTO ClassificationUsers (ClassificationUserID,ClassificationID,UserID, ClassificationRelationTypeID ,CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES (1, 1, @User, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationUsers (ClassificationUserID,ClassificationID,UserID, ClassificationRelationTypeID ,CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES (2, 2, @User, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationUsers (ClassificationUserID,ClassificationID,UserID, ClassificationRelationTypeID ,CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES (3, 3, @User, 1, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ClassificationUsers OFF;

SET IDENTITY_INSERT ClassificationRoles ON;
INSERT INTO ClassificationRoles (ClassificationRoleID, ClassificationID, RoleID, ClassificationRelationTypeID ,CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES (1, 1, @Role, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationRoles (ClassificationRoleID, ClassificationID, RoleID, ClassificationRelationTypeID ,CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES (2, 2, @Role, 1, @User, @User, GETDATE(), GETDATE());
INSERT INTO ClassificationRoles (ClassificationRoleID, ClassificationID, RoleID, ClassificationRelationTypeID ,CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES (3, 3, @Role, 1, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ClassificationRoles OFF;


SET IDENTITY_INSERT ClassificationLevels ON;
INSERT INTO ClassificationLevels (ClassificationLevelID, ClassificationID, Sequence, DateLevelID, OnTheFly, Alphabetically, CanLink, InDropDown, InMenu, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 2, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (4, 3, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevels OFF;

SET IDENTITY_INSERT ClassificationLevelLanguages ON;
INSERT INTO ClassificationLevelLanguages(ClassificationLevelLanguageID, ClassificationID, ClassificationLevelID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 41, 'Köppen main group', 'Köppen main group', 'Köppen main group', 'Köppen main group', @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 41, 'Köppen subgroup', 'Köppen subgroup', 'Köppen subgroup', 'Köppen subgroup', @User, @User, GETDATE(), GETDATE())
, (3, 2, 3, 41, 'Soil Taxonomy', 'Soil Taxonomy', 'Soil Taxonomy', 'Soil Taxonomy', @User, @User, GETDATE(), GETDATE())
, (4, 3, 4, 41, 'Main crop type', 'Main crop type', 'Main crop type', 'Main crop type', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevelLanguages OFF;

SET IDENTITY_INSERT ClassificationValues ON;
INSERT INTO ClassificationValues (ClassificationValueID, ClassificationID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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

INSERT INTO ClassificationValues (ClassificationValueID, ClassificationID, ParentValueID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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
INSERT INTO ClassificationValueLanguages(ClassificationValueLanguageID, ClassificationID, ClassificationValueID, LanguageID, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
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
INSERT INTO ClassificationValueRoles (ClassificationValueRoleID, ClassificationID, ClassificationValueID, RoleID, ClassificationRelationTypeID, CreatorID, ModifierID,CreatedDate, ModifiedDate) VALUES 
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
INSERT INTO ClassificationValueUsers (ClassificationValueUserID, ClassificationID, ClassificationValueID, UserID, ClassificationRelationTypeID, CreatorID, ModifierID,CreatedDate, ModifiedDate) VALUES 
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
INSERT INTO ClassificationPages (ClassificationPageID, ClassificationID, StatusID, ShowtitleName, ShowTitleDescription, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 2, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 3, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPages OFF;

SET IDENTITY_INSERT ClassificationPageLanguages ON;
INSERT INTO ClassificationPageLanguages(ClassificationPageLanguageID, ClassificationID, ClassificationPageID, LanguageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 41, 'Default climate', 'Default climate page', 'Default climate page', 'Default climate page', 'Default climate page', 'Default climate page', @User, @User, GETDATE(), GETDATE())
, (2, 2, 2, 41, 'Default soil', 'Default soil page', 'Default soil page', 'Default soil page', 'Default soil page', 'Default soil page', @User, @User, GETDATE(), GETDATE())
, (3, 3, 3, 41, 'Default crop', 'Default crop page', 'Default crop page', 'Default crop page', 'Default crop page', 'Default crop page', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageLanguages OFF;

SET IDENTITY_INSERT ClassificationPageSections ON;
INSERT INTO ClassificationPageSections (ClassificationPageSectionID, ClassificationID, ClassificationPageID, Sequence, PageSectionTypeID, PageSectionDataTypeID, ShowSectionTitleName, ShowSectionTitleDescription, ShowContentTypeTitleName, ShowContentTypeTitleDescription, OneTwoColumns, SortByID, MaxContent, HasPaging, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 1, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (3, 2, 2, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (4, 2, 2, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (5, 3, 3, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (6, 3, 3, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageSections OFF;

SET IDENTITY_INSERT ClassificationPageSectionLanguages ON;
INSERT INTO ClassificationPageSectionLanguages(ClassificationPageSectionLanguageID, ClassificationID, ClassificationPageID, ClassificationPageSectionID, LanguageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 1, 41, 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate title name', 'Newest climate title description', @User, @User, GETDATE(), GETDATE())
, (2, 1, 1, 2, 41, 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
, (3, 2, 2, 3, 41, 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil title name', 'Newest Soil title description', @User, @User, GETDATE(), GETDATE())
, (4, 2, 2, 4, 41, 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most Soil Soil title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
, (5, 3, 3, 5, 41, 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop title name', 'Newest Crop title description', @User, @User, GETDATE(), GETDATE())
, (6, 3, 3, 6, 41, 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop title name', 'Most visited Crop title description', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageSectionLanguages OFF;


SET IDENTITY_INSERT ContentTypeGroups ON;
INSERT INTO ContentTypeGroups (ContentTypeGroupID, Sequence, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, @User, @User, GETDATE(), GETDATE())
 , (2, 2, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeGroups OFF;


SET IDENTITY_INSERT ContentTypeGroupLanguages ON;
INSERT INTO ContentTypeGroupLanguages(ContentTypeGroupLanguageID, ContentTypeGroupID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Knowledge', 'Knowledge', 'Knowledge', 'Knowledge', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Assignments', 'Assignments', 'Assignments', 'Assignments', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeGroupLanguages OFF;

SET IDENTITY_INSERT ContentTypes ON;
INSERT INTO ContentTypes (ContentTypeID, ContentTypeGroupID, SecurityLevelID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, @User, @User, GETDATE(), GETDATE())
 , (2, 1, 1, @User, @User, GETDATE(), GETDATE())
 , (3, 2, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypes OFF;

SET IDENTITY_INSERT ContentTypeLanguages ON;
INSERT INTO ContentTypeLanguages(ContentTypeLanguageID, ContentTypeID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Climate knowledge', 'Climate knowledge', 'Climate knowledge', 'Climate knowledge', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Soil knowledge', 'Soil knowledge', 'Soil knowledge', 'Soil knowledge', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'General assignment', 'General assignment', 'General assignment', 'General assignment', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeLanguages OFF;

SET IDENTITY_INSERT ContentTypeClassifications ON;
INSERT INTO ContentTypeClassifications ( ContentTypeClassificationID, ContentTypeID, ClassificationID, ContentTypeClassificationStatusID, ModifierID, ModifiedDate) VALUES 
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
INSERT INTO OrganizationTypes (OrganizationTypeID, Internal, LegalEntity) VALUES 
  (1,1,1)
, (2,1,0)
SET IDENTITY_INSERT OrganizationTypes OFF;

SET IDENTITY_INSERT OrganizationTypeLanguages ON;
INSERT INTO OrganizationTypeLanguages(OrganizationTypeLanguageID, OrganizationTypeID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1, 1, 41, 'Legal entity', 'Legal entity', 'Legal entity', 'Legal entity')
, (2, 2, 41, 'Internal entity', 'Internal entity', 'Internal entity', 'Internal entity')
SET IDENTITY_INSERT OrganizationTypeLanguages OFF;


SET IDENTITY_INSERT Organizations ON;
INSERT INTO Organizations (OrganizationID, StatusID, OrganizationTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, @User, @User, GETDATE(), GETDATE())
INSERT INTO Organizations (OrganizationID, ParentOrganizationID, StatusID, OrganizationTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (2, 1, 1, 2, @User, @User, GETDATE(), GETDATE())
 SET IDENTITY_INSERT Organizations OFF;

SET IDENTITY_INSERT OrganizationLanguages ON;
INSERT INTO OrganizationLanguages(OrganizationLanguageID, OrganizationID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Medical faculty', 'Medical faculty', 'Medical faculty', 'Medical faculty', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationLanguages OFF;



SET IDENTITY_INSERT OrganizationAddresses ON;
INSERT INTO OrganizationAddresses (OrganizationAddressID,OrganizationID,AddressTypeID,Address1,Address2,HouseNumber,HouseNumberExt,Location, City, PostalCode,PostalCodeExt, CountryID, ProvinceState,County,CreatorID,ModifierID,CreatedDate,ModifiedDate) 
VALUES (1, 1, 1, 'Rama 4','Lumpini','110','a',geography::STGeomFromText('POINT(51.477805 -0.0025417)' , 4326),'Bangkok','12000','',221,'Bangkok','',@User, @User, getdate(),getdate());
SET IDENTITY_INSERT OrganizationAddresses OFF;

SET IDENTITY_INSERT UserPreferences ON;
INSERT INTO UserPreferences (UserPreferenceID,PreferenceTypeID,UserID,IntPreference, ModifierID, ModifiedDate) 
VALUES (1, 1, @user, 41, @User, getdate());
SET IDENTITY_INSERT UserPreferences OFF;

SET IDENTITY_INSERT OrganizationTelecoms ON;
INSERT INTO OrganizationTelecoms(OrganizationTelecomID, OrganizationID, TelecomTypeID, TelecomValue, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 2, 'MegaDodo', @User, @User, GETDATE(), GETDATE()), (2, 1, 1, '11234', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTelecoms OFF;

INSERT INTO OrganizationTelecomPhones(OrganizationTelecomID, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES 
(2, '+66', '2', '42', 'Ford')

SET IDENTITY_INSERT Pages ON;
INSERT INTO Pages (PageID, StatusID, ShowtitleName, ShowTitleDescription, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT Pages OFF;

SET IDENTITY_INSERT PageLanguages ON;
INSERT INTO PageLanguages(PageLanguageID, PageID, LanguageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Top stories', 'Top stories', 'Top stories', 'Top stories', 'Top stories', 'Top stories', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', 'Reaserch stories', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Project stories', 'Project stories', 'Project stories', 'Project stories', 'Project stories', 'Project stories', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageLanguages OFF;

SET IDENTITY_INSERT PageSections ON;
INSERT INTO PageSections (PageSectionID, PageID, Sequence, PageSectionTypeID, PageSectionDataTypeID, ShowSectionTitleName, ShowSectionTitleDescription, ShowContentTypeTitleName, ShowContentTypeTitleDescription, OneTwoColumns, SortByID, MaxContent, HasPaging, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (3, 2, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (4, 2, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (5, 3, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (6, 3, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageSections OFF;

SET IDENTITY_INSERT PageSectionLanguages ON;
INSERT INTO PageSectionLanguages(PageSectionLanguageID,  PageID, PageSectionID, LanguageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 1, 41, 'New stories', 'New stories', 'New stories', 'New stories', 'New stories', 'New stories', @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 41, 'Most visited', 'Most visited', 'Most visited', 'Most visited', 'Most visited', 'Most visited', @User, @User, GETDATE(), GETDATE())
, (3, 2, 3, 41, 'Approved research', 'Approved research', 'Approved research', 'Approved research', 'Approved research', 'Approved research', @User, @User, GETDATE(), GETDATE())
, (4, 2, 4, 41, 'Pending research', 'Pending research', 'Pending research', 'Pending research', 'Pending research', 'Pending research', @User, @User, GETDATE(), GETDATE())
, (5, 3, 5, 41, 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', 'Newest completed projects', @User, @User, GETDATE(), GETDATE())
, (6, 3, 6, 41, 'Projects in Process', 'Projects in Process', 'Projects in Process', 'Projects in Process', 'Projects in Process', 'Projects in Process', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageSectionLanguages OFF;

SET IDENTITY_INSERT Persons ON;
INSERT INTO Persons( PersonID, Salutation, FirstName, MiddleName, LastName, PersonalTitle, Suffix, NickName
, FirstNameLocal, MiddleNameLocal, LastNameLocal, GenderID, BirthDate, DefaultOrganizationID
, CreatorID, ModifierID, CreatedDate, ModifiedDate)
VALUES(1,'Mr', 'Dirk','', 'Gently','','','Dirk', 'Dirk','', 'Gently',1,'1942-01-01',1, @User, @User, GETDATE(), GETDATE()),
(2,'Mr', 'Ford','', 'Prefect','','','Ford', 'Ford','', 'Prefect',1,'2050-01-01',1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT Persons OFF;

SET IDENTITY_INSERT PersonAddresses ON;
INSERT INTO PersonAddresses( PersonAddressID, PersonID, AddressTypeID, AttnName, Address1, Address2, HouseNumber, HouseNumberExt
	, Location, City, PostalCode, PostalCodeExt, CountryID, County 
	, CreatorID, ModifierID, CreatedDate, ModifiedDate)
VALUES(1,1,1,'Dirk','Downingstreet', '','0','',geography::STGeomFromText('POINT(51.477805 -0.0025417)' , 4326), 'London','1', '',1,'', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT PersonAddresses OFF;

SET IDENTITY_INSERT PersonTelecoms ON;
INSERT INTO PersonTelecoms(PersonTelecomID, PersonID, TelecomTypeID, TelecomValue, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 2, 'Frogstar', @User, @User, GETDATE(), GETDATE()), (2, 1, 1, '121212', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PersonTelecoms OFF;

INSERT INTO PersonTelecomPhones(PersonTelecomID, CountryCode, AreaCode, ExtensionCode, AskForName) VALUES 
(2, '+2', '2', '42', 'Ford')

SET IDENTITY_INSERT ProcessTemplateGroups ON;
INSERT INTO ProcessTemplateGroups (ProcessTemplateGroupID, Sequence, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1,1, @User, @User, GETDATE(), GETDATE())
,(2,2, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplateGroups OFF;

SET IDENTITY_INSERT ProcessTemplateGroupLanguages ON;
INSERT INTO ProcessTemplateGroupLanguages (ProcessTemplateGroupLanguageID, ProcessTemplateGroupID,LanguageID, Name, Description, MenuName, MouseOver, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1,1, 41, 'Assignments', 'Assignments', 'Assignments', 'Assignments', @User, @User, GETDATE(), GETDATE())
,(2,2, 41, 'Knowledge', 'Knowledge', 'Knowledge', 'Knowledge', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplateGroupLanguages OFF;

SET IDENTITY_INSERT ProcessTemplates ON;
INSERT INTO ProcessTemplates (ProcessTemplateID, ProcessTemplateGroupID, ShowInPersonalCalendar, ShowInEventCalendar
, ProcessMultiMax, Sequence, IsPersonal, ShowInNew, ShowInSearch, ShowInReports, HideEverywhere
, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1,1,0,0
,10,1,0,1,1,1,0
, @User, @User, GETDATE(), GETDATE())
,(2,1,0,0
,15,2,0,1,1,1,0
, @User, @User, GETDATE(), GETDATE())
,(3,2,0,0
,15,1,0,1,1,1,0
, @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplates OFF;

SET IDENTITY_INSERT ProcessTemplateLanguages ON;
INSERT INTO ProcessTemplateLanguages (ProcessTemplateLanguageID, ProcessTemplateID, LanguageID , Name, Description, MenuName, MouseOver
, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1,1,41, 'Game assignment', 'Game assignment', 'Game assignment', 'Game assignment', @User, @User, GETDATE(), GETDATE())
,(2,2,41, 'Research assignment', 'Research assignment', 'Research assignment', 'Research assignment', @User, @User, GETDATE(), GETDATE())
,(3,3,41, 'Proof reading', 'Proof reading', 'Proof reading', 'Proof reading', @User, @User, GETDATE(), GETDATE());
SET IDENTITY_INSERT ProcessTemplateLanguages OFF;




SET IDENTITY_INSERT ProcessTemplateFields ON;
INSERT INTO ProcessTemplateFields (ProcessTemplateFieldID, ProcessTemplateID, ProcessTemplateFieldTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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
;
SET IDENTITY_INSERT ProcessTemplateFields OFF;

SET IDENTITY_INSERT ProcessTemplateFieldLanguages ON;
INSERT INTO ProcessTemplateFieldLanguages (ProcessTemplateFieldLanguageID, ProcessTemplateID, ProcessTemplateFieldID, LanguageID , Name, Description, MenuName, MouseOver
, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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
;
SET IDENTITY_INSERT ProcessTemplateFieldLanguages OFF;

SET IDENTITY_INSERT ProcessTemplateStageTypes ON;
INSERT INTO ProcessTemplateStageTypes (ProcessTemplateStageTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1, @User, @User, GETDATE(), GETDATE())
, (2, @User, @User, GETDATE(), GETDATE())
, (3, @User, @User, GETDATE(), GETDATE())
, (4, @User, @User, GETDATE(), GETDATE())
, (5, @User, @User, GETDATE(), GETDATE())
, (6, @User, @User, GETDATE(), GETDATE())
, (7, @User, @User, GETDATE(), GETDATE())
, (8, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateStageTypes OFF;

SET IDENTITY_INSERT ProcessTemplateStageTypeLanguages ON;
INSERT INTO ProcessTemplateStageTypeLanguages (ProcessTemplateStageTypeLanguageID, ProcessTemplateStageTypeID, LanguageID , Name, Description, MenuName, MouseOver
, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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
INSERT INTO ProcessTemplateStages (ProcessTemplateStageID, ProcessTemplateID, ProcessTemplateStageTypeID, IsEndStageID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1,1,4,0, @User, @User, GETDATE(), GETDATE())
, (2,1,3,0, @User, @User, GETDATE(), GETDATE())
, (3,1,5,1, @User, @User, GETDATE(), GETDATE())
, (4,1,6,1, @User, @User, GETDATE(), GETDATE())
, (5,2,4,0, @User, @User, GETDATE(), GETDATE())
, (6,2,3,0, @User, @User, GETDATE(), GETDATE())
, (7,2,5,1, @User, @User, GETDATE(), GETDATE())
, (8,2,6,1, @User, @User, GETDATE(), GETDATE())
, (9,3,3,0, @User, @User, GETDATE(), GETDATE())
, (10,3,5,1, @User, @User, GETDATE(), GETDATE())
, (11,3,6,1, @User, @User, GETDATE(), GETDATE())
, (12,1,7,0, @User, @User, GETDATE(), GETDATE())
, (13,2,7,0, @User, @User, GETDATE(), GETDATE())
, (14,3,7,0, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateStages OFF;


SET IDENTITY_INSERT ProcessTemplateStageLanguages ON;
INSERT INTO ProcessTemplateStageLanguages (ProcessTemplateStageLanguageID,ProcessTemplateID, ProcessTemplateStageID, LanguageID , Name, Description, MenuName, MouseOver
, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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
;
SET IDENTITY_INSERT ProcessTemplateStageLanguages OFF;



SET IDENTITY_INSERT ProcessTemplateStageFields ON;
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (1,1,12,1,4, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (14,1,1,1,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (27,1,2,1,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (40,1,3,1,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (53,1,4,1,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (2,1,12,2,3, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (15,1,1,2,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (28,1,2,2,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (41,1,3,2,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (54,1,4,2,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (3,1,12,32,4, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (16,1,1,32,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (29,1,2,32,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (42,1,3,32,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (55,1,4,32,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (4,1,12,3,4, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (17,1,1,3,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (30,1,2,3,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (43,1,3,3,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (56,1,4,3,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (5,1,12,4,4, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (18,1,1,4,2, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (31,1,2,4,2, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (44,1,3,4,2, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (57,1,4,4,2, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (6,1,12,5,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (19,1,1,5,4, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (32,1,2,5,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (45,1,3,5,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (58,1,4,5,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (7,1,12,6,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (20,1,1,6,3, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (33,1,2,6,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (46,1,3,6,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (59,1,4,6,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (8,1,12,7,1, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (21,1,1,7,1, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (34,1,2,7,4, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (47,1,3,7,2, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (60,1,4,7,2, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (9,1,12,8,1, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (22,1,1,8,1, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (35,1,2,8,3, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (48,1,3,8,2, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (61,1,4,8,2, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (10,1,12,9,1, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (23,1,1,9,1, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (36,1,2,9,3, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (49,1,3,9,2, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (62,1,4,9,2, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (11,1,12,10,4, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (24,1,1,10,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (37,1,2,10,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (50,1,3,10,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (63,1,4,10,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (12,1,12,11,1, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (25,1,1,11,4, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (38,1,2,11,2, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (51,1,3,11,2, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (64,1,4,11,2, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (13,1,12,12,1, 13, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (26,1,1,12,1, 13, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (39,1,2,12,4, 13, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (52,1,3,12,2, 13, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (65,1,4,12,1, 13, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (66,2,13,13,4, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (78,2,5,13,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (90,2,6,13,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (102,2,7,13,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (114,2,8,13,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (67,2,13,14,3, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (79,2,5,14,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (91,2,6,14,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (103,2,7,14,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (115,2,8,14,1, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (68,2,13,33,4, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (80,2,5,33,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (92,2,6,33,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (104,2,7,33,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (116,2,8,33,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (69,2,13,15,4, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (81,2,5,15,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (93,2,6,15,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (105,2,7,15,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (117,2,8,15,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (70,2,13,16,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (82,2,5,16,4, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (94,2,6,16,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (106,2,7,16,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (118,2,8,16,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (71,2,13,17,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (83,2,5,17,3, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (95,2,6,17,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (107,2,7,17,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (119,2,8,17,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (72,2,13,18,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (84,2,5,18,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (96,2,6,18,4, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (108,2,7,18,2, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (120,2,8,18,2, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (73,2,13,19,1, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (85,2,5,19,1, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (97,2,6,19,3, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (109,2,7,19,2, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (121,2,8,19,2, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (74,2,13,20,1, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (86,2,5,20,1, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (98,2,6,20,3, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (110,2,7,20,2, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (122,2,8,20,2, 9, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (75,2,13,21,4, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (87,2,5,21,2, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (99,2,6,21,2, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (111,2,7,21,2, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (123,2,8,21,2, 10, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (76,2,13,22,1, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (88,2,5,22,4, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (100,2,6,22,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (112,2,7,22,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (124,2,8,22,2, 11, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (77,2,13,23,1, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (89,2,5,23,1, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (101,2,6,23,4, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (113,2,7,23,2, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (125,2,8,23,1, 12, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (126,3,14,24,4, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (134,3,9,24,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (142,3,10,24,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (150,3,11,24,2, 1, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (127,3,14,25,3, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (135,3,9,25,2, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (143,3,10,25,2, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (151,3,11,25,2, 2, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (128,3,14,26,4, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (136,3,9,26,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (144,3,10,26,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (152,3,11,26,2, 3, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (129,3,14,27,4, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (137,3,9,27,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (145,3,10,27,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (153,3,11,27,2, 4, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (130,3,14,28,3, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (138,3,9,28,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (146,3,10,28,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (154,3,11,28,1, 5, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (131,3,14,29,1, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (139,3,9,29,3, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (147,3,10,29,2, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (155,3,11,29,2, 6, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (132,3,14,30,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (140,3,9,30,3, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (148,3,10,30,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (156,3,11,30,1, 7, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (133,3,14,31,1, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (141,3,9,31,3, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (149,3,10,31,1, 8, @user,getdate());
INSERT INTO ProcessTemplateStageFields (ProcessTemplateStageFieldID,ProcessTemplateID,ProcessTemplateStageID,ProcessTemplateFieldID,ProcessTemplateStageFieldStatusID,Sequence,ModifierID, ModifiedDate) VALUES (157,3,11,31,1, 8, @user,getdate());

SET IDENTITY_INSERT ProcessTemplateStageFields OFF;


SET IDENTITY_INSERT ProcessTemplateFlows ON;
INSERT INTO ProcessTemplateFlows (ProcessTemplateFlowID, ProcessTemplateID, ProcessTemplateFromStageID, ProcessTemplateToStageID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
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
;
SET IDENTITY_INSERT ProcessTemplateFlows OFF;

SET IDENTITY_INSERT ProcessTemplateFlowConditions ON;
INSERT INTO ProcessTemplateFlowConditions (ProcessTemplateFlowConditionID, ProcessTemplateID, ProcessTemplateFlowID
, ProcessTemplateFlowConditionTypeID , ComparisonOperatorID, ProcessTemplateFlowConditionInt, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1, 1, 1, 3, 5, 3, @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateFlowConditions OFF;

SET IDENTITY_INSERT ProcessTemplateFlowConditionLanguages ON;
INSERT INTO ProcessTemplateFlowConditionLanguages (ProcessTemplateFlowConditionLanguageID,ProcessTemplateID, ProcessTemplateFlowID, ProcessTemplateFlowConditionID, LanguageID , Name, Description, MenuName, MouseOver
, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1,1,1,1,41, 'Minimum security level 3', 'Minimum security level 3', 'Minimum security level 3', 'Minimum security level 3', @User, @User, GETDATE(), GETDATE())
;
SET IDENTITY_INSERT ProcessTemplateFlowConditionLanguages OFF;
