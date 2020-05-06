use sip
DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

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

SET IDENTITY_INSERT ClassificationLevels ON;
INSERT INTO ClassificationLevels (ClassificationLevelID, ClassificationID, Sequence, DateLevel, OnTheFly, Alphabetically, CanLink, InDropDown, InMenu, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 2, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (4, 3, 1, 1, 0, 0, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevels OFF;

SET IDENTITY_INSERT ClassificationLevelLanguages ON;
INSERT INTO ClassificationLevelLanguages(ClassificationLevelLanguageID, ClassificationLevelID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'K�ppen main group', 'K�ppen main group', 'K�ppen main group', 'K�ppen main group', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'K�ppen subgroup', 'K�ppen subgroup', 'K�ppen subgroup', 'K�ppen subgroup', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Soil Taxonomy', 'Soil Taxonomy', 'Soil Taxonomy', 'Soil Taxonomy', @User, @User, GETDATE(), GETDATE())
, (4, 4, 41, 'Main crop type', 'Main crop type', 'Main crop type', 'Main crop type', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevelLanguages OFF;

SET IDENTITY_INSERT ClassificationValues ON;
INSERT INTO ClassificationValues (ClassificationValueID, ClassificationID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
(1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, @User, @User, GETDATE(), GETDATE())
, (3, 1, @User, @User, GETDATE(), GETDATE())
, (4, 1, @User, @User, GETDATE(), GETDATE())
, (5, 1, @User, @User, GETDATE(), GETDATE())
, (6, 1, @User, @User, GETDATE(), GETDATE())
, (7, 1, @User, @User, GETDATE(), GETDATE())
, (8, 1, @User, @User, GETDATE(), GETDATE())
, (9, 1, @User, @User, GETDATE(), GETDATE())
, (10, 1, @User, @User, GETDATE(), GETDATE())
, (11, 1, @User, @User, GETDATE(), GETDATE())
, (12, 1, @User, @User, GETDATE(), GETDATE())
, (13, 1, @User, @User, GETDATE(), GETDATE())
, (14, 1, @User, @User, GETDATE(), GETDATE())
, (15, 1, @User, @User, GETDATE(), GETDATE())
, (16, 1, @User, @User, GETDATE(), GETDATE())
, (17, 1, @User, @User, GETDATE(), GETDATE())
, (18, 1, @User, @User, GETDATE(), GETDATE())
, (19, 1, @User, @User, GETDATE(), GETDATE())
, (20, 1, @User, @User, GETDATE(), GETDATE())

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
INSERT INTO ClassificationValueLanguages(ClassificationValueLanguageID, ClassificationValueID, LanguageID, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Group A', 'Tropical climates', 'Tropical climates', 'Tropical climates','Tropical climates', 'Tropical climates', 'Tropical climates','Tropical climates', 'Tropical climates', 'Tropical climates', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Group B', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', 'Dry climates', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Group C', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', 'Temperate climates', @User, @User, GETDATE(), GETDATE())
, (4, 4, 41, 'Group D', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', 'Continental climates', @User, @User, GETDATE(), GETDATE())
, (5, 5, 41, 'Group E', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', 'Polar and alpine climates', @User, @User, GETDATE(), GETDATE())
, (6, 6, 41, 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', @User, @User, GETDATE(), GETDATE())
, (7, 7, 41, 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', @User, @User, GETDATE(), GETDATE())
, (8, 8, 41, 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', @User, @User, GETDATE(), GETDATE())
, (9, 9, 41, 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', @User, @User, GETDATE(), GETDATE())
, (10, 10, 41, 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', @User, @User, GETDATE(), GETDATE())
, (11, 11, 41, 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', @User, @User, GETDATE(), GETDATE())
, (12, 12, 41, 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', @User, @User, GETDATE(), GETDATE())
, (13, 13, 41, 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', @User, @User, GETDATE(), GETDATE())
, (14, 14, 41, 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', @User, @User, GETDATE(), GETDATE())
, (15, 15, 41, 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', @User, @User, GETDATE(), GETDATE())
, (16, 16, 41, 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', @User, @User, GETDATE(), GETDATE())
, (17, 17, 41, 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', @User, @User, GETDATE(), GETDATE())
, (18, 18, 41, 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', @User, @User, GETDATE(), GETDATE())
, (19, 19, 41, 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', @User, @User, GETDATE(), GETDATE())
, (20, 20, 41, 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', @User, @User, GETDATE(), GETDATE())
, (21, 21, 41, 'Af', 'Tropical rainforest climate', 'Af', 'Af', 'Af', 'Af', 'Tropical rainforest climate', 'Af', 'Tropical rainforest climate', 'Af', @User, @User, GETDATE(), GETDATE())
, (22, 22, 41, 'Am', 'Tropical monsoon climate', 'Am', 'Am', 'Am', 'Am', 'Tropical monsoon climate', 'Am', 'Tropical monsoon climate', 'Am', @User, @User, GETDATE(), GETDATE())
, (23, 23, 41, 'Aw', 'Tropical wet savanna climate', 'Aw', 'Aw', 'Aw', 'Aw', 'Tropical wet savanna climate', 'Aw', 'Tropical wet savanna climate', 'Aw', @User, @User, GETDATE(), GETDATE())
, (24, 24, 41, 'As', 'Tropical dry savanna climate', 'As', 'As', 'As', 'As', 'Tropical dry savanna climate', 'As', 'Tropical dry savanna climate', 'As', @User, @User, GETDATE(), GETDATE())
, (25, 25, 41, 'BWh', 'Hot desert climate', 'BWh', 'BWh', 'BWh', 'BWh', 'Hot desert climate', 'BWh', 'Hot desert climate', 'BWh', @User, @User, GETDATE(), GETDATE())
, (26, 26, 41, 'BWk', 'Cold desert climate', 'BWk', 'BWk', 'BWk', 'BWk', 'Cold desert climate', 'BWk', 'Cold desert climate', 'BWk', @User, @User, GETDATE(), GETDATE())
, (27, 27, 41, 'BSh', 'Hot semi-arid climate', 'BSh', 'BSh', 'BSh', 'BSh', 'Hot semi-arid climate', 'BSh', 'Hot semi-arid climate', 'BSh', @User, @User, GETDATE(), GETDATE())
, (28, 28, 41, 'BSk', 'Cold semi-arid climate', 'BSk', 'BSk', 'BSk', 'BSk', 'Cold semi-arid climate', 'BSk', 'Cold semi-arid climate', 'BSk', @User, @User, GETDATE(), GETDATE())
, (29, 29, 41, 'Cfa', 'Humid subtropical climate', 'Cfa', 'Cfa', 'Cfa', 'Cfa', 'Humid subtropical climate', 'Cfa', 'Humid subtropical climate', 'Cfa', @User, @User, GETDATE(), GETDATE())
, (30, 30, 41, 'Cfb', 'Temperate oceanic climate', 'Cfb', 'Cfb', 'Cfb', 'Cfb', 'Temperate oceanic climate', 'Cfb', 'Temperate oceanic climate', 'Cfb', @User, @User, GETDATE(), GETDATE())
, (31, 31, 41, 'Cfc', 'Subpolar oceanic climate', 'Cfc', 'Cfc', 'Cfc', 'Cfc', 'Subpolar oceanic climate', 'Cfc', 'Subpolar oceanic climate', 'Cfc', @User, @User, GETDATE(), GETDATE())
, (32, 32, 41, 'Cwa', 'Monsoon-influenced humid subtropical climate', 'Cwa', 'Cwa', 'Cwa', 'Cwa', 'Monsoon-influenced humid subtropical climate', 'Cwa', 'Monsoon-influenced humid subtropical climate', 'Cwa', @User, @User, GETDATE(), GETDATE())
, (33, 33, 41, 'Cwb', 'Subtropical highland climate or temperate oceanic climate with dry winters', 'Cwb', 'Cwb', 'Cwb', 'Cwb', 'Subtropical highland climate or temperate oceanic climate with dry winters', 'Cwb', 'Subtropical highland climate or temperate oceanic climate with dry winters', 'Cwb', @User, @User, GETDATE(), GETDATE())
, (34, 34, 41, 'Cwc', 'Cold subtropical highland climate or subpolar oceanic climate with dry winters', 'Cwc', 'Cwc', 'Cwc', 'Cwc', 'Cold subtropical highland climate or subpolar oceanic climate with dry winters', 'Cwc', 'Cold subtropical highland climate or subpolar oceanic climate with dry winters', 'Cwc', @User, @User, GETDATE(), GETDATE())
, (35, 35, 41, 'Csa', 'Hot-summer Mediterranean climate', 'Csa', 'Csa', 'Csa', 'Csa', 'Hot-summer Mediterranean climate', 'Csa', 'Hot-summer Mediterranean climate', 'Csa', @User, @User, GETDATE(), GETDATE())
, (36, 36, 41, 'Csb', 'Warm-summer Mediterranean climate', 'Csb', 'Csb', 'Csb', 'Csb', 'Warm-summer Mediterranean climate', 'Csb', 'Warm-summer Mediterranean climate', 'Csb', @User, @User, GETDATE(), GETDATE())
, (37, 37, 41, 'Csc', 'Cool-summer Mediterranean climate', 'Csc', 'Csc', 'Csc', 'Csc', 'Cool-summer Mediterranean climate', 'Csc', 'Cool-summer Mediterranean climate', 'Csc', @User, @User, GETDATE(), GETDATE())
, (38, 38, 41, 'Dfa', 'Hot-summer humid continental climate', 'Dfa', 'Dfa', 'Dfa', 'Dfa', 'Hot-summer humid continental climate', 'Dfa', 'Hot-summer humid continental climate', 'Dfa', @User, @User, GETDATE(), GETDATE())
, (39, 39, 41, 'Dfb', 'Warm-summer humid continental climate', 'Dfb', 'Dfb', 'Dfb', 'Dfb', 'Warm-summer humid continental climate', 'Dfb', 'Warm-summer humid continental climate', 'Dfb', @User, @User, GETDATE(), GETDATE())
, (40, 40, 41, 'Dfc', 'Subarctic climate', 'Dfc', 'Dfc', 'Dfc', 'Dfc', 'Subarctic climate', 'Dfc', 'Subarctic climate', 'Dfc', @User, @User, GETDATE(), GETDATE())
, (41, 41, 41, 'Dfd', 'Extremely cold subarctic climate', 'Dfd', 'Dfd', 'Dfd', 'Dfd', 'Extremely cold subarctic climate', 'Dfd', 'Extremely cold subarctic climate', 'Dfd', @User, @User, GETDATE(), GETDATE())
, (42, 42, 41, 'Dsa', 'Hot, dry-summer continental climate', 'Dsa', 'Dsa', 'Dsa', 'Dsa', 'Hot, dry-summer continental climate', 'Dsa', 'Hot, dry-summer continental climate', 'Dsa', @User, @User, GETDATE(), GETDATE())
, (43, 43, 41, 'Dsb', 'Warm, dry-summer continental climate', 'Dsb', 'Dsb', 'Dsb', 'Dsb', 'Warm, dry-summer continental climate', 'Dsb', 'Warm, dry-summer continental climate', 'Dsb', @User, @User, GETDATE(), GETDATE())
, (44, 44, 41, 'Dsc', 'Dry-summer subarctic climate', 'Dsc', 'Dsc', 'Dsc', 'Dsc', 'Dry-summer subarctic climate', 'Dsc', 'Dry-summer subarctic climate', 'Dsc', @User, @User, GETDATE(), GETDATE())
, (45, 45, 41, 'Dsd', 'Subarctic climate', 'Dsd', 'Dsd', 'Dsd', 'Dsd', 'Subarctic climate', 'Dsd', 'Subarctic climate', 'Dsd', @User, @User, GETDATE(), GETDATE())
, (46, 46, 41, 'Dwa', 'Monsoon-influenced hot-summer humid continental climate', 'Dwa', 'Dwa', 'Dwa', 'Dwa', 'Monsoon-influenced hot-summer humid continental climate', 'Dwa', 'Monsoon-influenced hot-summer humid continental climate', 'Dwa', @User, @User, GETDATE(), GETDATE())
, (47, 47, 41, 'Dwb', 'Monsoon-influenced warm-summer humid continental climate', 'Dwb', 'Dwb', 'Dwb', 'Dwb', 'Monsoon-influenced warm-summer humid continental climate', 'Dwb', 'Monsoon-influenced warm-summer humid continental climate', 'Dwb', @User, @User, GETDATE(), GETDATE())
, (48, 48, 41, 'Dwc', 'Monsoon-influenced subarctic climate', 'Dwc', 'Dwc', 'Dwc', 'Dwc', 'Monsoon-influenced subarctic climate', 'Dwc', 'Monsoon-influenced subarctic climate', 'Dwc', @User, @User, GETDATE(), GETDATE())
, (49, 49, 41, 'Dwd', 'Monsoon-influenced extremely cold subarctic climate', 'Dwd', 'Dwd', 'Dwd', 'Dwd', 'Monsoon-influenced extremely cold subarctic climate', 'Dwd', 'Monsoon-influenced extremely cold subarctic climate', 'Dwd', @User, @User, GETDATE(), GETDATE())
, (50, 50, 41, 'EF', 'Ice cap climate', 'EF', 'EF', 'EF', 'EF', 'Ice cap climate', 'EF', 'Ice cap climate', 'EF', @User, @User, GETDATE(), GETDATE())
, (51, 51, 41, 'ET', 'Tundra', 'ET', 'ET', 'ET', 'ET', 'Tundra', 'ET', 'Tundra', 'ET', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationValueLanguages OFF;

SET IDENTITY_INSERT ClassificationPages ON;
INSERT INTO ClassificationPages (ClassificationPageID, ClassificationID, StatusID, ShowtitleName, ShowTitleDescription, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (2, 2, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
, (3, 3, 1, 1, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPages OFF;

SET IDENTITY_INSERT ClassificationPageLanguages ON;
INSERT INTO ClassificationPageLanguages(ClassificationPageLanguageID, ClassificationPageID, LanguageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Default climate', 'Default climate page', 'Default climate page', 'Default climate page', 'Default climate page', 'Default climate page', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Default soil', 'Default soil page', 'Default soil page', 'Default soil page', 'Default soil page', 'Default soil page', @User, @User, GETDATE(), GETDATE())
, (3, 3, 41, 'Default crop', 'Default crop page', 'Default crop page', 'Default crop page', 'Default crop page', 'Default crop page', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageLanguages OFF;


SET IDENTITY_INSERT ClassificationPageSections ON;
INSERT INTO ClassificationPageSections (ClassificationPageSectionID, ClassificationPageID, Sequence, PageSectionTypeID, ShowSectionTitleName, ShowSectionTitleDescription, ShowContentTypeTitleName, ShowContentTypeTitleDescription, OneTwoColumns, SortByID, MaxContent, HasPaging, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (3, 2, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (4, 2, 2, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (5, 3, 1, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
, (6, 3, 2, 1, 1, 1, 1, 0, 1, 1, 5, 1, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageSections OFF;

SET IDENTITY_INSERT ClassificationPageSectionLanguages ON;
INSERT INTO ClassificationPageSectionLanguages(ClassificationPageSectionLanguageID, ClassificationPageSectionID, LanguageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate title name', 'Newest climate title description', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
, (3, 1, 41, 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil title name', 'Newest Soil title description', @User, @User, GETDATE(), GETDATE())
, (4, 2, 41, 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most Soil Soil title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
, (5, 1, 41, 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop title name', 'Newest Crop title description', @User, @User, GETDATE(), GETDATE())
, (6, 2, 41, 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop title name', 'Most visited Crop title description', @User, @User, GETDATE(), GETDATE())
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
INSERT INTO OrganizationTypes (OrganizationTypeID, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
  (1, @User, @User, GETDATE(), GETDATE())
, (2, @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTypes OFF;

SET IDENTITY_INSERT OrganizationTypeLanguages ON;
INSERT INTO OrganizationTypeLanguages(OrganizationTypeLanguageID, OrganizationTypeID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Legal entity', 'Legal entity', 'Legal entity', 'Legal entity', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Internal entity', 'Internal entity', 'Internal entity', 'Internal entity', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTypeLanguages OFF;


SET IDENTITY_INSERT Organizations ON;
INSERT INTO Organizations (OrganizationID, StatusID, OrganizationTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, @User, @User, GETDATE(), GETDATE())
INSERT INTO Organizations (OrganizationID, ParentOrganizationID, StatusID, OrganizationTypeID, CreatorId, ModifierID, ModifiedDate, CreatedDate) VALUES 
  (1, 1, 1, 2, @User, @User, GETDATE(), GETDATE())
 SET IDENTITY_INSERT Organizations OFF;

SET IDENTITY_INSERT OrganizationLanguages ON;
INSERT INTO OrganizationLanguages(OrganizationLanguageID, OrganizationID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) VALUES 
(1, 1, 41, 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', @User, @User, GETDATE(), GETDATE())
, (2, 2, 41, 'Medical faculty', 'Medical faculty', 'Medical faculty', 'Medical faculty', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationLanguages OFF;



SELECT * FROM OrganizationLanguages


use master