use sip
DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT ClassificationLanguages ON;
INSERT INTO ClassificationLanguages(ClassificationLanguageId, ClassificationId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(4, 1, 39, 'Klimaat', 'Klimaat', 'Klimaat', 'Klimaat', @User, @User, GETDATE(), GETDATE())
, (5, 2, 39, 'Grond', 'Grond', 'Grond', 'Grond', @User, @User, GETDATE(), GETDATE())
, (6, 3, 39, 'Gewas', 'Gewas', 'Gewas', 'Gewas', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLanguages OFF;

SET IDENTITY_INSERT ClassificationRelationTypeLanguages ON;
INSERT INTO ClassificationRelationTypeLanguages(ClassificationRelationTypeLanguageId, ClassificationRelationTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(2, 1, 39, 'Eigenaar', 'Eigenaar', 'Eigenaar', 'Eigenaar', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationRelationTypeLanguages OFF;


SET IDENTITY_INSERT ClassificationLevelLanguages ON;
INSERT INTO ClassificationLevelLanguages(ClassificationLevelLanguageId, ClassificationId, ClassificationLevelId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(5, 1, 1, 39, 'Köppen hoofd groep', 'Köppen hoofd groep', 'Köppen hoofd groep', 'Köppen hoofd groep', @User, @User, GETDATE(), GETDATE())
, (6, 1, 2, 39, 'Köppen subgroep', 'Köppen subgroep', 'Köppen subgroep', 'Köppen subgroep', @User, @User, GETDATE(), GETDATE())
, (7, 2, 3, 39, 'Hoofd grond soort', 'Hoofd grond soort', 'Hoofd grond soort', 'Hoofd grond soort', @User, @User, GETDATE(), GETDATE())
, (8, 3, 4, 39, 'Hoofd gewas soort', 'Hoofd gewas soort', 'Hoofd gewas soort', 'Hoofd gewas soort', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationLevelLanguages OFF;


SET IDENTITY_INSERT ClassificationValueLanguages ON;
INSERT INTO ClassificationValueLanguages(ClassificationValueLanguageId, ClassificationId, ClassificationValueId, LanguageId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(52, 1, 1, 39, 'Groep A', 'Tropisch Klimaat', 'Groep A', 'Groep A', 'Groep A', 'Groep A', 'Tropisch Klimaat', 'Groep A', 'Tropisch Klimaat', 'Groep A', @User, @User, GETDATE(), GETDATE())
, (53, 1, 2, 39, 'Groep B', 'Droog Klimaat', 'Groep B', 'Groep B', 'Groep B', 'Groep B', 'Droog Klimaat', 'Groep B', 'Droog Klimaat', 'Groep B', @User, @User, GETDATE(), GETDATE())
, (54, 1, 3, 39, 'Groep C', 'Gematigd Klimaat', 'Groep C', 'Groep C', 'Groep C', 'Groep C', 'Gematigd Klimaat', 'Groep C', 'Gematigd Klimaat', 'Groep C', @User, @User, GETDATE(), GETDATE())
, (55, 1, 4, 39, 'Groep D', 'Landklimaat', 'Groep D', 'Groep D', 'Groep D', 'Groep D', 'Landklimaat', 'Groep D', 'Landklimaat', 'Groep D', @User, @User, GETDATE(), GETDATE())
, (56, 1, 5, 39, 'Groep E', 'Poolklimaat', 'Groep E', 'Groep E', 'Groep E', 'Groep E', 'Poolklimaat', 'Groep E', 'Poolklimaat', 'Groep E', @User, @User, GETDATE(), GETDATE())
, (57, 2, 6, 39, 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', 'Alfisols', @User, @User, GETDATE(), GETDATE())
, (58, 2, 7, 39, 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', 'Andisols', @User, @User, GETDATE(), GETDATE())
, (59, 2, 8, 39, 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', 'Aridisols', @User, @User, GETDATE(), GETDATE())
, (60, 2, 9, 39, 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', 'Entisols', @User, @User, GETDATE(), GETDATE())
, (61, 2, 10, 39, 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', 'Gelisols', @User, @User, GETDATE(), GETDATE())
, (62, 2, 11, 39, 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', 'Histosols', @User, @User, GETDATE(), GETDATE())
, (63, 2, 12, 39, 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', 'Inceptisols', @User, @User, GETDATE(), GETDATE())
, (64, 2, 13, 39, 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', 'Mollisols', @User, @User, GETDATE(), GETDATE())
, (65, 2, 14, 39, 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', 'Oxisols', @User, @User, GETDATE(), GETDATE())
, (66, 2, 15, 39, 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', 'Spodosols', @User, @User, GETDATE(), GETDATE())
, (67, 2, 16, 39, 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', 'Ultisols', @User, @User, GETDATE(), GETDATE())
, (68, 2, 17, 39, 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', 'Vertisols', @User, @User, GETDATE(), GETDATE())
, (69, 2, 18, 39, 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', 'Potatos', @User, @User, GETDATE(), GETDATE())
, (70, 2, 19, 39, 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', 'Oranges', @User, @User, GETDATE(), GETDATE())
, (71, 2, 20, 39, 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', 'Beans', @User, @User, GETDATE(), GETDATE())
, (72, 1, 21, 39, 'Af', 'Regenwoud', 'Af', 'Af', 'Af', 'Af', 'Regenwoud', 'Af', 'Regenwoud', 'Af', @User, @User, GETDATE(), GETDATE())
, (73, 1, 22, 39, 'Am', 'Moesson', 'Am', 'Am', 'Am', 'Am', 'Moesson', 'Am', 'Moesson', 'Am', @User, @User, GETDATE(), GETDATE())
, (74, 1, 23, 39, 'Aw', 'Natte savanne', 'Aw', 'Aw', 'Aw', 'Aw', 'Natte savanne', 'Aw', 'Natte savanne', 'Aw', @User, @User, GETDATE(), GETDATE())
, (75, 1, 24, 39, 'As', 'Droge avanne', 'As', 'As', 'As', 'As', 'Droge avanne', 'As', 'Droge avanne', 'As', @User, @User, GETDATE(), GETDATE())
, (76, 1, 25, 39, 'BWh', 'Hete woestijn', 'BWh', 'BWh', 'BWh', 'BWh', 'Hete woestijn', 'BWh', 'Hete woestijn', 'BWh', @User, @User, GETDATE(), GETDATE())
, (77, 1, 26, 39, 'BWk', 'Koude woestijn', 'BWk', 'BWk', 'BWk', 'BWk', 'Koude woestijn', 'BWk', 'Koude woestijn', 'BWk', @User, @User, GETDATE(), GETDATE())
, (78, 1, 27, 39, 'BSh', 'Hete steppe', 'BSh', 'BSh', 'BSh', 'BSh', 'Hete steppe', 'BSh', 'Hete steppe', 'BSh', @User, @User, GETDATE(), GETDATE())
, (79, 1, 28, 39, 'BSk', 'Koude steppe', 'BSk', 'BSk', 'BSk', 'BSk', 'Koude steppe', 'BSk', 'Koude steppe', 'BSk', @User, @User, GETDATE(), GETDATE())
, (80, 1, 29, 39, 'Cfa', 'Gematigd zonder droog seizoen warme zomer', 'Cfa', 'Cfa', 'Cfa', 'Cfa', 'Gematigd zonder droog seizoen warme zomer', 'Cfa', 'Gematigd zonder droog seizoen warme zomer', 'Cfa', @User, @User, GETDATE(), GETDATE())
, (81, 1, 30, 39, 'Cfb', 'Gematigd zonder droog seizoen gematigde zomer', 'Cfb', 'Cfb', 'Cfb', 'Cfb', 'Gematigd zonder droog seizoen gematigde zomer', 'Cfb', 'Gematigd zonder droog seizoen gematigde zomer', 'Cfb', @User, @User, GETDATE(), GETDATE())
, (82, 1, 31, 39, 'Cfc', 'Gematigd zonder droog seizoen koele zomer', 'Cfc', 'Cfc', 'Cfc', 'Cfc', 'Gematigd zonder droog seizoen koele zomer', 'Cfc', 'Gematigd zonder droog seizoen koele zomer', 'Cfc', @User, @User, GETDATE(), GETDATE())
, (83, 1, 32, 39, 'Cwa', 'Gematigd droge winter warme zomer', 'Cwa', 'Cwa', 'Cwa', 'Cwa', 'Gematigd droge winter warme zomer', 'Cwa', 'Gematigd droge winter warme zomer', 'Cwa', @User, @User, GETDATE(), GETDATE())
, (84, 1, 33, 39, 'Cwb', 'Gematigd droge winter gematigde zomer', 'Cwb', 'Cwb', 'Cwb', 'Cwb', 'Gematigd droge winter gematigde zomer', 'Cwb', 'Gematigd droge winter gematigde zomer', 'Cwb', @User, @User, GETDATE(), GETDATE())
, (85, 1, 34, 39, 'Cwc', 'Gematigd droge winter koele zomer', 'Cwc', 'Cwc', 'Cwc', 'Cwc', 'Gematigd droge winter koele zomer', 'Cwc', 'Gematigd droge winter koele zomer', 'Cwc', @User, @User, GETDATE(), GETDATE())
, (86, 1, 35, 39, 'Csa', 'Gematigd droge zomer koele zomer', 'Csa','Csa','Csa','Csa', 'Gematigd droge zomer koele zomer', 'Csa', 'Gematigd droge zomer koele zomer', 'Csa', @User, @User, GETDATE(), GETDATE())
, (87, 1, 36, 39, 'Csb', 'Gematigd droge zomer gematigde zomer', 'Csb', 'Csb', 'Csb', 'Csb', 'Gematigd droge zomer gematigde zomer', 'Csb', 'Gematigd droge zomer gematigde zomer', 'Csb', @User, @User, GETDATE(), GETDATE())
, (88, 1, 37, 39, 'Csc', 'Gematigd droge zomer koele zomer', 'Csc', 'Csc', 'Csc', 'Csc', 'Gematigd droge zomer koele zomer', 'Csc', 'Gematigd droge zomer koele zomer', 'Csc', @User, @User, GETDATE(), GETDATE())
, (89, 1, 38, 39, 'Dfa', 'Landklimaat zonder droog seizoen hete zomer', 'Dfa', 'Dfa', 'Dfa', 'Dfa', 'Landklimaat zonder droog seizoen hete zomer', 'Dfa', 'Landklimaat zonder droog seizoen hete zomer', 'Dfa', @User, @User, GETDATE(), GETDATE())
, (90, 1, 39, 39, 'Dfb', 'Landklimaat zonder droog seizoen warme zomer', 'Dfb', 'Dfb', 'Dfb', 'Dfb', 'Landklimaat zonder droog seizoen warme zomer', 'Dfb', 'Landklimaat zonder droog seizoen warme zomer', 'Dfb', @User, @User, GETDATE(), GETDATE())
, (91, 1, 40, 39, 'Dfc', 'Landklimaat zonder droog seizoen koele zomer', 'Dfc', 'Dfc', 'Dfc', 'Dfc', 'Landklimaat zonder droog seizoen koele zomer', 'Dfc', 'Landklimaat zonder droog seizoen koele zomer', 'Dfc', @User, @User, GETDATE(), GETDATE())
, (92, 1, 41, 39, 'Dfd', 'Landklimaat zonder droog seizoen erg koude winter', 'Dfd', 'Dfd', 'Dfd', 'Dfd', 'Landklimaat zonder droog seizoen erg koude winter', 'Dfd', 'Landklimaat zonder droog seizoen erg koude winter', 'Dfd', @User, @User, GETDATE(), GETDATE())
, (93, 1, 42, 39, 'Dsa', 'Landklimaat droge zomer hete zomer', 'Dsa', 'Dsa', 'Dsa', 'Dsa', 'Landklimaat droge zomer hete zomer', 'Dsa', 'Landklimaat droge zomer hete zomer',  'Dsa', @User, @User, GETDATE(), GETDATE())
, (94, 1, 43, 39, 'Dsb', 'Landklimaat droge zomer warme zomer',  'Dsb', 'Dsb', 'Dsb', 'Dsb', 'Landklimaat droge zomer warme zomer', 'Dsb', 'Landklimaat droge zomer warme zomer', 'Dsb', @User, @User, GETDATE(), GETDATE())
, (95, 1, 44, 39, 'Dsc', 'Landklimaat droge zomer koele zomer', 'Dsc', 'Dsc', 'Dsc', 'Dsc', 'Landklimaat droge zomer koele zomer', 'Dsc', 'Landklimaat droge zomer koele zomer', 'Dsc', @User, @User, GETDATE(), GETDATE())
, (96, 1, 45, 39, 'Dsd', 'Landklimaat droge zomer erg koude winter', 'Dsd', 'Dsd', 'Dsd', 'Dsd', 'Landklimaat droge zomer erg koude winter', 'Dsd', 'Landklimaat droge zomer erg koude winter', 'Dsd', @User, @User, GETDATE(), GETDATE())
, (97, 1, 46, 39, 'Dwa', 'Landklimaat droge winter hete zomer', 'Dwa', 'Dwa', 'Dwa', 'Dwa', 'Landklimaat droge winter hete zomer', 'Dwa', 'Landklimaat droge winter hete zomer', 'Dwa', @User, @User, GETDATE(), GETDATE())
, (98, 1, 47, 39, 'Dwb', 'Landklimaat droge winter warme zomer', 'Dwb', 'Dwb', 'Dwb', 'Dwb', 'Landklimaat droge winter warme zomer', 'Dwb', 'Landklimaat droge winter warme zomer', 'Dwb', @User, @User, GETDATE(), GETDATE())
, (99, 1, 48, 39, 'Dwc', 'Landklimaat droge winter koele zomer', 'Dwc', 'Dwc', 'Dwc', 'Dwc', 'Landklimaat droge winter koele zomer', 'Dwc', 'Landklimaat droge winter koele zomer', 'Dwc', @User, @User, GETDATE(), GETDATE())
, (100, 1, 49, 39, 'Dwd', 'Landklimaat droge winter erg koude winter', 'Dwd', 'Dwd', 'Dwd', 'Dwd', 'Landklimaat droge winter erg koude winter', 'Dwd', 'Landklimaat droge winter erg koude winter', 'Dwd', @User, @User, GETDATE(), GETDATE())
, (101, 1, 50, 39, 'EF', 'IJskap', 'EF', 'EF', 'EF', 'EF', 'IJskap', 'EF', 'IJskap', 'EF', @User, @User, GETDATE(), GETDATE())
, (102, 1, 51, 39, 'ET', 'Toendra', 'ET', 'ET', 'ET', 'ET', 'Toendra', 'ET', 'Toendra', 'ET', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationValueLanguages OFF;

SET IDENTITY_INSERT ClassificationPageLanguages ON;
INSERT INTO ClassificationPageLanguages(ClassificationPageLanguageId, ClassificationId, ClassificationPageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(4, 1, 1, 39, 'Klimaat pagina', 'Standard klimaat pagina', 'Standard klimaat pagina', 'Standard klimaat pagina',  'Standard klimaat pagina', 'Standard klimaat pagina', @User, @User, GETDATE(), GETDATE())
, (5, 2, 2, 39, 'Grond pagina', 'Standard grond pagina', 'Standard grond pagina', 'Standard grond pagina', 'Standard grond pagina', 'Standard grond pagina', @User, @User, GETDATE(), GETDATE())
, (6, 3, 3, 39, 'Gewas pagina', 'Standard gewas pagina', 'Standard gewas pagina', 'Standard gewas pagina', 'Standard gewas pagina', 'Standard gewas pagina', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageLanguages OFF;

SET IDENTITY_INSERT ClassificationPageLanguages ON;
INSERT INTO ClassificationPageLanguages(ClassificationPageLanguageId, ClassificationId, ClassificationPageId, ClassificationPageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(7, 1, 1, 1, 39, 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate', 'Newest climate title name', 'Newest climate title description', @User, @User, GETDATE(), GETDATE())
, (8, 1, 1, 2, 39, 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate', 'Most visited climate title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
, (9, 2, 2, 1, 39, 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil', 'Newest Soil title name', 'Newest Soil title description', @User, @User, GETDATE(), GETDATE())
, (10, 2, 2, 2, 39, 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most visited Soil', 'Most Soil Soil title name', 'Most visited climate title description', @User, @User, GETDATE(), GETDATE())
, (11, 3, 3, 1, 39, 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop', 'Newest Crop title name', 'Newest Crop title description', @User, @User, GETDATE(), GETDATE())
, (12, 3, 3, 2, 39, 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop', 'Most visited Crop title name', 'Most visited Crop title description', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ClassificationPageLanguages OFF;

SET IDENTITY_INSERT ContentTypeGroupLanguages ON;
INSERT INTO ContentTypeGroupLanguages(ContentTypeGroupLanguageId, ContentTypeGroupId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(3, 1, 39, 'Kennis', 'Kennis', 'Kennis', 'Kennis', @User, @User, GETDATE(), GETDATE())
, (4, 2, 39, 'Opdracht', 'Opdracht', 'Opdracht', 'Opdracht', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeGroupLanguages OFF;

SET IDENTITY_INSERT ContentTypeLanguages ON;
INSERT INTO ContentTypeLanguages(ContentTypeLanguageId, ContentTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(4, 1, 39, 'Klimaat kennis', 'Klimaat kennis', 'Klimaat kennis', 'Klimaat kennis', @User, @User, GETDATE(), GETDATE())
, (5, 2, 39, 'Grond kennis', 'Grond kennis', 'Grond kennis', 'Grond kennis', @User, @User, GETDATE(), GETDATE())
, (6, 3, 39, 'Algemene opdracht', 'Algemene opdracht', 'Algemene opdracht', 'Algemene opdracht', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT ContentTypeLanguages OFF;

SET IDENTITY_INSERT OrganizationTypeLanguages ON;
INSERT INTO OrganizationTypeLanguages(OrganizationTypeLanguageId, OrganizationTypeId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(3, 1, 41, 'Rechtspersoon', 'Rechtspersoon', 'Rechtspersoon', 'Rechtspersoon', @User, @User, GETDATE(), GETDATE())
, (4, 2, 41, 'Interne entiteit', 'Interne entiteit', 'Interne entiteit', 'Interne entiteit', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationTypeLanguages OFF;

SET IDENTITY_INSERT OrganizationLanguages ON;
INSERT INTO OrganizationLanguages(OrganizationLanguageId, OrganizationId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
(3, 1, 41, 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', 'Chulalongkorn University', @User, @User, GETDATE(), GETDATE())
, (4, 2, 41, 'Medische faculteit', 'Medische faculteit', 'Medische faculteit', 'Medische faculteit', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT OrganizationLanguages OFF;

