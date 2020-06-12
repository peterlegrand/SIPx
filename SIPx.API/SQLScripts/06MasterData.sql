﻿DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT Statuses ON;
INSERT INTO Statuses (StatusId, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES (1,192,192,192,192), (2, 327, 327, 327, 327);
SET IDENTITY_INSERT Statuses OFF;

SET IDENTITY_INSERT Languages ON;
INSERT INTO Languages (LanguageID, ForeignName, ISO6391, ISO6392, StatusID, NameTermID, ModifierID, ModifiedDate) VALUES 
(1,N'аҧсуа бызшәа, аҧсшәа', 'ab', 'abk', 2, 693, @User, getdate())
, (2,N'Afaraf', 'aa', 'aar', 2, 694, @User, getdate())
, (3,N'Afrikaans', 'af', 'afr', 2, 695, @User, getdate())
, (4,N'Akan', 'ak', 'aka', 2, 696, @User, getdate())
, (5,N'Shqip', 'sq', 'sqi', 2, 697, @User, getdate())
, (6,N'አማርኛ', 'am', 'amh', 2, 698, @User, getdate())
, (7,N'العربية', 'ar', 'ara', 2, 699, @User, getdate())
, (8,N'aragonés', 'an', 'arg', 2, 700, @User, getdate())
, (9,N'Հայերեն', 'hy', 'hye', 2, 701, @User, getdate())
, (10,N'অসমীয়া', 'as', 'asm', 2, 702, @User, getdate())
, (11,N'авар мацӀ, магӀарул мацӀ', 'av', 'ava', 2, 703, @User, getdate())
, (12,N'avesta', 'ae', 'ave', 2, 704, @User, getdate())
, (13,N'aymar aru', 'ay', 'aym', 2, 705, @User, getdate())
, (14,N'azərbaycan dili', 'az', 'aze', 2, 706, @User, getdate())
, (15,N'bamanankan', 'bm', 'bam', 2, 707, @User, getdate())
, (16,N'башҡорт теле', 'ba', 'bak', 2, 708, @User, getdate())
, (17,N'euskara, euskera', 'eu', 'eus', 2, 709, @User, getdate())
, (18,N'беларуская мова', 'be', 'bel', 2, 710, @User, getdate())
, (19,N'বাংলা', 'bn', 'ben', 2, 711, @User, getdate())
, (20,N'भोजपुरी', 'bh', 'bih', 2, 712, @User, getdate())
, (21,N'Bislama', 'bi', 'bis', 2, 713, @User, getdate())
, (22,N'bosanski jezik', 'bs', 'bos', 2, 714, @User, getdate())
, (23,N'brezhoneg', 'br', 'bre', 2, 715, @User, getdate())
, (24,N'български език', 'bg', 'bul', 2, 716, @User, getdate())
, (25,N'ဗမာစာ', 'my', 'mya', 2, 717, @User, getdate())
, (26,N'català, valencià', 'ca', 'cat', 2, 718, @User, getdate())
, (27,N'Chamoru', 'ch', 'cha', 2, 719, @User, getdate())
, (28,N'нохчийн мотт', 'ce', 'che', 2, 720, @User, getdate())
, (29,N'chiCheŵa, chinyanja', 'ny', 'nya', 2, 721, @User, getdate())
, (30,N'中文 (Zhōngwén), 汉语, 漢語', 'zh', 'zho', 2, 722, @User, getdate())
, (31,N'чӑваш чӗлхи', 'cv', 'chv', 2, 723, @User, getdate())
, (32,N'Kernewek', 'kw', 'cor', 2, 724, @User, getdate())
, (33,N'corsu, lingua corsa', 'co', 'cos', 2, 725, @User, getdate())
, (34,N'ᓀᐦᐃᔭᐍᐏᐣ', 'cr', 'cre', 2, 726, @User, getdate())
, (35,N'hrvatski jezik', 'hr', 'hrv', 2, 727, @User, getdate())
, (36,N'čeština, český jazyk', 'cs', 'ces', 2, 728, @User, getdate())
, (37,N'dansk', 'da', 'dan', 2, 729, @User, getdate())
, (38,N'ދިވެހި', 'dv', 'div', 2, 730, @User, getdate())
, (39,N'Nederlands, Vlaams', 'nl', 'nld', 1, 731, @User, getdate())
, (40,N'རྫོང་ཁ', 'dz', 'dzo', 2, 732, @User, getdate())
, (41,N'English', 'en', 'eng', 1, 733, @User, getdate())
, (42,N'Esperanto', 'eo', 'epo', 2, 734, @User, getdate())
, (43,N'eesti, eesti keel', 'et', 'est', 2, 735, @User, getdate())
, (44,N'Eʋegbe', 'ee', 'ewe', 2, 736, @User, getdate())
, (45,N'føroyskt', 'fo', 'fao', 2, 737, @User, getdate())
, (46,N'vosa Vakaviti', 'fj', 'fij', 2, 738, @User, getdate())
, (47,N'suomi, suomen kieli', 'fi', 'fin', 2, 739, @User, getdate())
, (48,N'français, langue française', 'fr', 'fra', 2, 740, @User, getdate())
, (49,N'Fulfulde, Pulaar, Pular', 'ff', 'ful', 2, 741, @User, getdate())
, (50,N'Galego', 'gl', 'glg', 2, 742, @User, getdate())
, (51,N'ქართული', 'ka', 'kat', 2, 743, @User, getdate())
, (52,N'Deutsch', 'de', 'deu', 2, 744, @User, getdate())
, (53,N'ελληνικά', 'el', 'ell', 2, 745, @User, getdate())
, (54,N'Avañe''ẽ', 'gn', 'grn', 2, 746, @User, getdate())
, (55,N'ગુજરાતી', 'gu', 'guj', 2, 747, @User, getdate())
, (56,N'Kreyòl ayisyen', 'ht', 'hat', 2, 748, @User, getdate())
, (57,N'(Hausa) هَوُسَ', 'ha', 'hau', 2, 749, @User, getdate())
, (58,N'עברית', 'he', 'heb', 2, 750, @User, getdate())
, (59,N'Otjiherero', 'hz', 'her', 2, 751, @User, getdate())
, (60,N'हिन्दी, हिंदी', 'hi', 'hin', 2, 752, @User, getdate())
, (61,N'Hiri Motu', 'ho', 'hmo', 2, 753, @User, getdate())
, (62,N'magyar', 'hu', 'hun', 2, 754, @User, getdate())
, (63,N'Interlingua', 'ia', 'ina', 2, 755, @User, getdate())
, (64,N'Bahasa Indonesia', 'id', 'ind', 2, 756, @User, getdate())
, (65,N'(originally:) Occidental, (after WWII:) Interlingue','ie','ile',2, 757, @User, getdate())
, (66,N'Gaeilge', 'ga', 'gle', 2, 758, @User, getdate())
, (67,N'Asụsụ Igbo', 'ig', 'ibo', 2, 759, @User, getdate())
, (68,N'Iñupiaq, Iñupiatun', 'ik', 'ipk', 2, 760, @User, getdate())
, (69,N'Ido', 'io', 'ido', 2, 761, @User, getdate())
, (70,N'Íslenska', 'is', 'isl', 2, 762, @User, getdate())
, (71,N'Italiano', 'it', 'ita', 2, 763, @User, getdate())
, (72,N'ᐃᓄᒃᑎᑐᑦ', 'iu', 'iku', 2, 764, @User, getdate())
, (73,N'日本語 (にほんご)', 'ja', 'jpn', 2, 765, @User, getdate())
, (74,N'ꦧꦱꦗꦮ, Basa Jawa', 'jv', 'jav', 2, 766, @User, getdate())
, (75,N'kalaallisut, kalaallit oqaasii', 'kl', 'kal', 2, 767, @User, getdate())
, (76,N'ಕನ್ನಡ', 'kn', 'kan', 2, 768, @User, getdate())
, (77,N'Kanuri', 'kr', 'kau', 2, 769, @User, getdate())
, (78,N'कश्मीरी, كشميري‎', 'ks', 'kas', 2, 770, @User, getdate())
, (79,N'қазақ тілі', 'kk', 'kaz', 2, 771, @User, getdate())
, (80,N'ខ្មែរ, ខេមរភាសា, ភាសាខ្មែរ', 'km', 'khm', 2, 772, @User, getdate())
, (81,N'Gĩkũyũ', 'ki', 'kik', 2, 773, @User, getdate())
, (82,N'Ikinyarwanda', 'rw', 'kin', 2, 774, @User, getdate())
, (83,N'Кыргызча, Кыргыз тили', 'ky', 'kir', 2, 775, @User, getdate())
, (84,N'коми кыв', 'kv', 'kom', 2, 776, @User, getdate())
, (85,N'Kikongo', 'kg', 'kon', 2, 777, @User, getdate())
, (86,N'한국어', 'ko', 'kor', 2, 778, @User, getdate())
, (87,N'Kurdî, کوردی‎', 'ku', 'kur', 2, 779, @User, getdate())
, (88,N'Kuanyama', 'kj', 'kua', 2, 780, @User, getdate())
, (89,N'latine, lingua latina', 'la', 'lat', 2, 781, @User, getdate())
, (90,N'Lëtzebuergesch', 'lb', 'ltz', 2, 782, @User, getdate())
, (91,N'Luganda', 'lg', 'lug', 2, 783, @User, getdate())
, (92,N'Limburgs', 'li', 'lim', 2, 784, @User, getdate())
, (93,N'Lingála', 'ln', 'lin', 2, 785, @User, getdate())
, (94,N'ພາສາລາວ', 'lo', 'lao', 2, 786, @User, getdate())
, (95,N'lietuvių kalba', 'lt', 'lit', 2, 787, @User, getdate())
, (96,N'Kiluba', 'lu', 'lub', 2, 788, @User, getdate())
, (97,N'latviešu valoda', 'lv', 'lav', 2, 789, @User, getdate())
, (98,N'Gaelg, Gailck', 'gv', 'glv', 2, 790, @User, getdate())
, (99,N'македонски јазик', 'mk', 'mkd', 2, 791, @User, getdate())
, (100,N'fiteny malagasy', 'mg', 'mlg', 2, 792, @User, getdate())
, (101,N'Bahasa Melayu, بهاس ملايو‎', 'ms', 'msa', 2, 793, @User, getdate())
, (102,N'മലയാളം', 'ml', 'mal', 2, 794, @User, getdate())
, (103,N'Malti', 'mt', 'mlt', 2, 795, @User, getdate())
, (104,N'te reo Māori', 'mi', 'mri', 2, 796, @User, getdate())
, (105,N'मराठी', 'mr', 'mar', 2, 797, @User, getdate())
, (106,N'Kajin M̧ajeļ', 'mh', 'mah', 2, 798, @User, getdate())
, (107,N'Монгол хэл', 'mn', 'mon', 2, 799, @User, getdate())
, (108,N'Dorerin Naoero', 'na', 'nau', 2, 800, @User, getdate())
, (109,N'Diné bizaad', 'nv', 'nav', 2, 801, @User, getdate())
, (110,N'isiNdebele', 'nd', 'nde', 2, 802, @User, getdate())
, (111,N'नेपाली', 'ne', 'nep', 2, 803, @User, getdate())
, (112,N'Owambo', 'ng', 'ndo', 2, 804, @User, getdate())
, (113,N'Norsk Bokmål', 'nb', 'nob', 2, 805, @User, getdate())
, (114,N'Norsk Nynorsk', 'nn', 'nno', 2, 806, @User, getdate())
, (115,N'Norsk', 'no', 'nor', 2, 807, @User, getdate())
, (116,N'ꆈꌠ꒿ Nuosuhxop', 'ii', 'iii', 2, 808, @User, getdate())
, (117,N'isiNdebele', 'nr', 'nbl', 2, 809, @User, getdate())
, (118,N'occitan, lenga d''òc', 'oc', 'oci', 2, 810, @User, getdate())
, (119,N'ᐊᓂᔑᓈᐯᒧᐎᓐ', 'oj', 'oji', 2, 811, @User, getdate())
, (120,N'ѩзыкъ словѣньскъ', 'cu', 'chu', 2,812, @User, getdate())
, (121,N'Afaan Oromoo', 'om', 'orm', 2, 813, @User, getdate())
, (122,N'ଓଡ଼ିଆ', 'or', 'ori', 2, 814, @User, getdate())
, (123,N'ирон æвзаг', 'os', 'oss', 2, 815, @User, getdate())
, (124,N'ਪੰਜਾਬੀ, پنجابی‎', 'pa', 'pan', 2, 816, @User, getdate())
, (125,N'पालि, पाळि', 'pi', 'pli', 2, 817, @User, getdate())
, (126,N'فارسی', 'fa', 'fas', 2, 818, @User, getdate())
, (127,N'język polski, polszczyzna', 'pl', 'pol', 2, 819, @User, getdate())
, (128,N'پښتو', 'ps', 'pus', 2, 820, @User, getdate())
, (129,N'Português', 'pt', 'por', 2, 821, @User, getdate())
, (130,N'Runa Simi, Kichwa', 'qu', 'que', 2, 822, @User, getdate())
, (131,N'Rumantsch Grischun', 'rm', 'roh', 2, 823, @User, getdate())
, (132,N'Ikirundi', 'rn', 'run', 2, 824, @User, getdate())
, (133,N'Română', 'ro', 'ron', 2, 825, @User, getdate())
, (134,N'русский', 'ru', 'rus', 2, 826, @User, getdate())
, (135,N'संस्कृतम्', 'sa', 'san', 2, 827, @User, getdate())
, (136,N'sardu', 'sc', 'srd', 2, 828, @User, getdate())
, (137,N'सिन्धी, سنڌي، سندھی‎', 'sd', 'snd', 2, 829, @User, getdate())
, (138,N'Davvisámegiella', 'se', 'sme', 2, 830, @User, getdate())
, (139,N'gagana fa''a Samoa', 'sm', 'smo', 2, 831, @User, getdate())
, (140,N'yângâ tî sängö', 'sg', 'sag', 2, 832, @User, getdate())
, (141,N'српски језик', 'sr', 'srp', 2, 833, @User, getdate())
, (142,N'Gàidhlig', 'gd', 'gla', 2, 834, @User, getdate())
, (143,N'chiShona', 'sn', 'sna', 2, 835, @User, getdate())
, (144,N'සිංහල', 'si', 'sin', 2, 836, @User, getdate())
, (145,N'Slovenčina, Slovenský Jazyk', 'sk', 'slk', 2, 837, @User, getdate())
, (146,N'Slovenski Jezik, Slovenščina', 'sl', 'slv', 2, 838, @User, getdate())
, (147,N'Soomaaliga, af Soomaali', 'so', 'som', 2, 839, @User, getdate())
, (148,N'Sesotho', 'st', 'sot', 2, 840, @User, getdate())
, (149,N'Español', 'es', 'spa', 2, 841, @User, getdate())
, (150,N'Basa Sunda', 'su', 'sun', 2, 842, @User, getdate())
, (151,N'Kiswahili', 'sw', 'swa', 2, 843, @User, getdate())
, (152,N'SiSwati', 'ss', 'ssw', 2, 844, @User, getdate())
, (153,N'Svenska', 'sv', 'swe', 2, 845, @User, getdate())
, (154,N'தமிழ்', 'ta', 'tam', 2, 846, @User, getdate())
, (155,N'తెలుగు', 'te', 'tel', 2, 847, @User, getdate())
, (156,N'тоҷикӣ, toçikī, تاجیکی‎', 'tg', 'tgk', 2, 848, @User, getdate())
, (157,N'ไทย', 'th', 'tha', 2, 849, @User, getdate())
, (158,N'ትግርኛ', 'ti', 'tir', 2, 850, @User, getdate())
, (159,N'བོད་ཡིག', 'bo', 'bod', 2, 851, @User, getdate())
, (160,N'Türkmen, Түркмен', 'tk', 'tuk', 2, 852, @User, getdate())
, (161,N'Wikang Tagalog', 'tl', 'tgl', 2, 853, @User, getdate())
, (162,N'Setswana', 'tn', 'tsn', 2, 854, @User, getdate())
, (163,N'Faka Tonga', 'to', 'ton', 2, 855, @User, getdate())
, (164,N'Türkçe', 'tr', 'tur', 2, 856, @User, getdate())
, (165,N'Xitsonga', 'ts', 'tso', 2, 857, @User, getdate())
, (166,N'татар теле, tatar tele', 'tt', 'tat', 2, 858, @User, getdate())
, (167,N'Twi', 'tw', 'twi', 2, 859, @User, getdate())
, (168,N'Reo Tahiti', 'ty', 'tah', 2, 860, @User, getdate())
, (169,N'ئۇيغۇرچە‎, Uyghurche', 'ug', 'uig', 2, 861, @User, getdate())
, (170,N'Українська', 'uk', 'ukr', 2, 862, @User, getdate())
, (171,N'اردو', 'ur', 'urd', 2, 863, @User, getdate())
, (172,N'Oʻzbek, Ўзбек, أۇزبېك‎', 'uz', 'uzb', 2, 864, @User, getdate())
, (173,N'Tshivenḓa', 've', 'ven', 2, 865, @User, getdate())
, (174,N'Tiếng Việt', 'vi', 'vie', 2, 866, @User, getdate())
, (175,N'Volapük', 'vo', 'vol', 2, 867, @User, getdate())
, (176,N'Walon', 'wa', 'wln', 2, 868, @User, getdate())
, (177,N'Cymraeg', 'cy', 'cym', 2, 869, @User, getdate())
, (178,N'Wollof', 'wo', 'wol', 2, 870, @User, getdate())
, (179,N'Frysk', 'fy', 'fry', 2, 871, @User, getdate())
, (180,N'isiXhosa', 'xh', 'xho', 2, 872, @User, getdate())
, (181,N'ייִדיש', 'yi', 'yid', 2, 873, @User, getdate())
, (182,N'Yorùbá', 'yo', 'yor', 2, 874, @User, getdate())
, (183,N'Saɯ cueŋƅ, Saw cuengh', 'za', 'zha', 2, 875, @User, getdate())
, (184,N'isiZulu', 'zu', 'zul', 2, 876, @User, getdate())
SET IDENTITY_INSERT Languages OFF

SET IDENTITY_INSERT Settings ON
INSERT INTO Settings (SettingID, IntValue, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID, ModifierID, ModifiedDate) VALUES (1,41,120,120,120,120, @User, getdate());
SET IDENTITY_INSERT Settings OFF

SET IDENTITY_INSERT DateLevels ON
INSERT INTO DateLevels (DateLevelID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES (1, 328, 328, 328, 328),
(2,329,329,329,329), (3,330,330,330,330), (4,331,331,331,331), (5,332,332,332,332);
SET IDENTITY_INSERT DateLevels OFF

SET IDENTITY_INSERT PageSectionTypes ON;
INSERT INTO PageSectionTypes (PageSectionTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
  (1,333,333,333,333)
, (2,334,334,334,334)
SET IDENTITY_INSERT PageSectionTypes OFF;

SET IDENTITY_INSERT ContentStatuses ON;
INSERT INTO ContentStatuses (ContentStatusID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
  (1,335,335,335,335)
, (2,336,336,336,336)
, (3,337,337,337,337)
, (4,338,338,338,338)
SET IDENTITY_INSERT ContentStatuses OFF;

SET IDENTITY_INSERT ContentTypeClassificationStatuses ON;
INSERT INTO ContentTypeClassificationStatuses (ContentTypeClassificationStatusID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
  (1,339,339,339,339)
, (2,340,340,340,340)
, (3,341,341,341,341)
SET IDENTITY_INSERT ContentTypeClassificationStatuses OFF;

SET IDENTITY_INSERT SortBys ON;
INSERT INTO SortBys (SortByID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
  (1,342,342,342,342)
, (2,343,343,343,343)
SET IDENTITY_INSERT SortBys OFF;

SET IDENTITY_INSERT Regions ON;
INSERT INTO Regions (RegionID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES (1,344,344,344,344), (2,345,345,345,345), (3,346,346,346,346), (4,347,347,347,347), (5,348,348,348,348);
SET IDENTITY_INSERT Regions OFF;


SET IDENTITY_INSERT SubRegions ON;
INSERT INTO SubRegions (SubRegionID, RegionID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES (1, 3,349,349,349,349), (2, 1,350,350,350,350), (3, 4,351,351,351,351), (4, 1,352,352,352,352)
,(5, 4,353,353,353,353), (6, 1,354,354,354,354), (7, 1,355,355,355,355), (8, 2,356,356,356,356), (9, 3,357,357,357,357), (10, 4,358,358,358,358), (11, 3,359,359,359,359)
,(12, 4,360,360,360,360), (13, 2,361,361,361,361), (14, 3,362,362,362,362), (15, 5,363,363,363,363), (16, 4,364,364,364,364), (17, 5,365,365,365,365);
SET IDENTITY_INSERT SubRegions OFF;



SET IDENTITY_INSERT IntermediateRegions ON;
INSERT INTO IntermediateRegions (IntermediateRegionID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES (1,366,366,366,366), (2,367,367,367,367)
,(3, 368, 368, 368, 368), (4, 369, 369, 369, 369), (5,370,370,370,370), (6,371,371,371,371), (7,372,372,372,372), (8,373,373,373,373);
SET IDENTITY_INSERT IntermediateRegions OFF;



SET IDENTITY_INSERT Countries ON;
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (1,'Afghanistan', 'AF', 'AFG',4, 3, 374);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (2,'Åland Islands', 'AX', 'ALA',248, 7, 375);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (3,'Albania', 'AL', 'ALB',8, 2, 376);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (4,'Algeria', 'DZ', 'DZA',12, 15, 377);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (5,'American Samoa', 'AS', 'ASM',16, 14, 378);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (6,'Andorra', 'AD', 'AND',20, 2, 379);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (7,'Angola', 'AO', 'AGO',24, 17, 3, 380);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (8,'Anguilla', 'AI', 'AIA',660, 13, 7, 381);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num,NameTermID) VALUES (9,'Antarctica', 'AQ', 'ATA',10 , 382);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (10,'Antigua and Barbuda', 'AG', 'ATG',28, 13, 7, 383);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (11,'Argentina', 'AR', 'ARG',32, 13, 6, 384);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (12,'Armenia', 'AM', 'ARM',51, 16, 385);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (13,'Aruba', 'AW', 'ABW',533, 13, 7, 386);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (14,'Australia', 'AU', 'AUS',36, 1, 387);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (15,'Austria', 'AT', 'AUT',40, 4, 388);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (16,'Azerbaijan', 'AZ', 'AZE',31, 16, 389);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (17,'Bahamas', 'BS', 'BHS',44, 13, 7, 390);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (18,'Bahrain', 'BH', 'BHR',48, 16, 391);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (19,'Bangladesh', 'BD', 'BGD',50, 3, 392);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (20,'Barbados', 'BB', 'BRB',52, 13, 7, 393);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (21,'Belarus', 'BY', 'BLR',112, 6, 394);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (22,'Belgium', 'BE', 'BEL',56, 4, 395);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (23,'Belize', 'BZ', 'BLZ',84, 13, 2, 396);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (24,'Benin', 'BJ', 'BEN',204, 17, 5, 397);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (25,'Bermuda', 'BM', 'BMU',60, 8, 398);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (26,'Bhutan', 'BT', 'BTN',64, 3, 399);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (27,'Bolivia (Plurinational State of)', 'BO', 'BOL',68, 13, 6, 400);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (28,'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES',535, 13, 7, 401);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (29,'Bosnia and Herzegovina', 'BA', 'BIH',70, 2, 402);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (30,'Botswana', 'BW', 'BWA',72, 17, 4, 403);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (31,'Bouvet Island', 'BV', 'BVT',74, 13, 6, 404);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (32,'Brazil', 'BR', 'BRA',76, 13, 6, 405);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (33,'British Indian Ocean Territory', 'IO', 'IOT',86, 17, 8, 406);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (34,'Brunei Darussalam', 'BN', 'BRN',96, 12, 407);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (35,'Bulgaria', 'BG', 'BGR',100, 6, 408);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (36,'Burkina Faso', 'BF', 'BFA',854, 17, 5, 409);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (37,'Burundi', 'BI', 'BDI',108, 17, 8, 410);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (38,'Cabo Verde', 'CV', 'CPV',132, 17, 5, 411);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (39,'Cambodia', 'KH', 'KHM',116, 12, 412);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (40,'Cameroon', 'CM', 'CMR',120, 17, 3, 413);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (41,'Canada', 'CA', 'CAN',124, 8, 414);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (42,'Cayman Islands', 'KY', 'CYM',136, 13, 7, 415);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (43,'Central African Republic', 'CF', 'CAF',140, 17, 3, 416);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (44,'Chad', 'TD', 'TCD',148, 17, 3, 417);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (45,'Chile', 'CL', 'CHL',152, 13, 6, 418);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (46,'China', 'CN', 'CHN',156, 5, 419);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (47,'Christmas Island', 'CX', 'CXR',162, 1, 420);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (48,'Cocos (Keeling) Islands', 'CC', 'CCK',166, 1, 421);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (49,'Colombia', 'CO', 'COL',170, 13, 6, 422);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (50,'Comoros', 'KM', 'COM',174, 17, 8, 423);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (51,'Congo', 'CG', 'COG',178, 17, 3, 424);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (52,'Congo, Democratic Republic of the', 'CD', 'COD',180, 17, 3, 425);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (53,'Cook Islands', 'CK', 'COK',184, 14, 426);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (54,'Costa Rica', 'CR', 'CRI',188, 13, 2, 427);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (55,'Côte d''Ivoire', 'CI', 'CIV',384, 17, 5, 428);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (56,'Croatia', 'HR', 'HRV',191, 2, 429);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (57,'Cuba', 'CU', 'CUB',192, 13, 7, 430);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (58,'Curaçao', 'CW', 'CUW',531, 13, 7, 431);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (59,'Cyprus', 'CY', 'CYP',196, 16, 432);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (60,'Czechia', 'CZ', 'CZE',203, 6, 433);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (61,'Denmark', 'DK', 'DNK',208, 7, 434);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (62,'Djibouti', 'DJ', 'DJI',262, 17, 8, 435);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (63,'Dominica', 'DM', 'DMA',212, 13, 7, 436);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (64,'Dominican Republic', 'DO', 'DOM',214, 13, 7, 437);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (65,'Ecuador', 'EC', 'ECU',218, 13, 6, 438);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (66,'Egypt', 'EG', 'EGY',818, 15, 439);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (67,'El Salvador', 'SV', 'SLV',222, 13, 2, 440);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (68,'Equatorial Guinea', 'GQ', 'GNQ',226, 17, 3, 441);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (69,'Eritrea', 'ER', 'ERI',232, 17, 8, 442);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (70,'Estonia', 'EE', 'EST',233, 7, 443);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (71,'Eswatini', 'SZ', 'SWZ',748, 17, 4, 444);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (72,'Ethiopia', 'ET', 'ETH',231, 17, 8, 445);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (73,'Falkland Islands (Malvinas)', 'FK', 'FLK',238, 13, 6, 446);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (74,'Faroe Islands', 'FO', 'FRO',234, 7, 447);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (75,'Fiji', 'FJ', 'FJI',242, 11, 448);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (76,'Finland', 'FI', 'FIN',246, 7, 449);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (77,'France', 'FR', 'FRA',250, 4, 450);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (78,'French Guiana', 'GF', 'GUF',254, 13, 6, 451);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (79,'French Polynesia', 'PF', 'PYF',258, 14, 452);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (80,'French Southern Territories', 'TF', 'ATF',260, 17, 8, 453);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (81,'Gabon', 'GA', 'GAB',266, 17, 3, 454);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (82,'Gambia', 'GM', 'GMB',270, 17, 5, 455);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (83,'Georgia', 'GE', 'GEO',268, 16, 456);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (84,'Germany', 'DE', 'DEU',276, 4, 457);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (85,'Ghana', 'GH', 'GHA',288, 17, 5, 458);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (86,'Gibraltar', 'GI', 'GIB',292, 2, 459);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (87,'Greece', 'GR', 'GRC',300, 2, 460);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (88,'Greenland', 'GL', 'GRL',304, 8, 461);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (89,'Grenada', 'GD', 'GRD',308, 13, 7, 462);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (90,'Guadeloupe', 'GP', 'GLP',312, 13, 7, 463);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (91,'Guam', 'GU', 'GUM',316, 9, 464);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (92,'Guatemala', 'GT', 'GTM',320, 13, 2, 465);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (93,'Guernsey', 'GG', 'GGY',831, 7, 1, 466);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (94,'Guinea', 'GN', 'GIN',324, 17, 5, 467);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (95,'Guinea-Bissau', 'GW', 'GNB',624, 17, 5, 468);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (96,'Guyana', 'GY', 'GUY',328, 13, 6, 469);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (97,'Haiti', 'HT', 'HTI',332, 13, 7, 470);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (98,'Heard Island and McDonald Islands', 'HM', 'HMD',334, 1, 471);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (99,'Holy See', 'VA', 'VAT',336, 2, 472);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (100,'Honduras', 'HN', 'HND',340, 13, 2, 473);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (101,'Hong Kong', 'HK', 'HKG',344, 5, 474);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (102,'Hungary', 'HU', 'HUN',348, 6, 475);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (103,'Iceland', 'IS', 'ISL',352, 7, 476);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (104,'India', 'IN', 'IND',356, 3, 477);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (105,'Indonesia', 'ID', 'IDN',360, 12, 478);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (106,'Iran (Islamic Republic of)', 'IR', 'IRN',364, 3, 479);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (107,'Iraq', 'IQ', 'IRQ',368, 16, 480);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (108,'Ireland', 'IE', 'IRL',372, 7, 481);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (109,'Isle of Man', 'IM', 'IMN',833, 7, 482);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (110,'Israel', 'IL', 'ISR',376, 16, 483);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (111,'Italy', 'IT', 'ITA',380, 2, 484);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (112,'Jamaica', 'JM', 'JAM',388, 13, 7, 485);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (113,'Japan', 'JP', 'JPN',392, 5, 486);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (114,'Jersey', 'JE', 'JEY',832, 7, 1, 487);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (115,'Jordan', 'JO', 'JOR',400, 16, 488);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (116,'Kazakhstan', 'KZ', 'KAZ',398, 10, 489);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (117,'Kenya', 'KE', 'KEN',404, 17, 8, 490);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (118,'Kiribati', 'KI', 'KIR',296, 9, 491);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (119,'Korea (Democratic People''s Republic of)', 'KP', 'PRK',408, 5, 492);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (120,'Korea, Republic of', 'KR', 'KOR',410, 5, 493);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (121,'Kuwait', 'KW', 'KWT',414, 16, 494);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (122,'Kyrgyzstan', 'KG', 'KGZ',417, 10, 495);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (123,'Lao People''s Democratic Republic', 'LA', 'LAO',418, 12, 496);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (124,'Latvia', 'LV', 'LVA',428, 7, 497);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (125,'Lebanon', 'LB', 'LBN',422, 16, 498);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (126,'Lesotho', 'LS', 'LSO',426, 17, 4, 499);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (127,'Liberia', 'LR', 'LBR',430, 17, 5, 500);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (128,'Libya', 'LY', 'LBY',434, 15, 501);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (129,'Liechtenstein', 'LI', 'LIE',438, 4, 502);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (130,'Lithuania', 'LT', 'LTU',440, 7, 503);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (131,'Luxembourg', 'LU', 'LUX',442, 4, 504);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (132,'Macao', 'MO', 'MAC',446, 5, 505);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (133,'Madagascar', 'MG', 'MDG',450, 17, 8, 506);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (134,'Malawi', 'MW', 'MWI',454, 17, 8, 507);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (135,'Malaysia', 'MY', 'MYS',458, 12, 508);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (136,'Maldives', 'MV', 'MDV',462, 3, 509);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (137,'Mali', 'ML', 'MLI',466, 17, 5, 510);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (138,'Malta', 'MT', 'MLT',470, 2, 511);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (139,'Marshall Islands', 'MH', 'MHL',584, 9, 512);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (140,'Martinique', 'MQ', 'MTQ',474, 13, 7, 513);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (141,'Mauritania', 'MR', 'MRT',478, 17, 5, 514);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (142,'Mauritius', 'MU', 'MUS',480, 17, 8, 515);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (143,'Mayotte', 'YT', 'MYT',175, 17, 8, 516);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (144,'Mexico', 'MX', 'MEX',484, 13, 2, 517);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (145,'Micronesia (Federated States of)', 'FM', 'FSM',583, 9, 518);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (146,'Moldova, Republic of', 'MD', 'MDA',498, 6, 519);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (147,'Monaco', 'MC', 'MCO',492, 4, 520);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (148,'Mongolia', 'MN', 'MNG',496, 5, 521);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (149,'Montenegro', 'ME', 'MNE',499, 2, 522);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (150,'Montserrat', 'MS', 'MSR',500, 13, 7, 523);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (151,'Morocco', 'MA', 'MAR',504, 15, 524);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (152,'Mozambique', 'MZ', 'MOZ',508, 17, 8, 525);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (153,'Myanmar', 'MM', 'MMR',104, 12, 526);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (154,'Namibia', 'NA', 'NAM',516, 17, 4, 527);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (155,'Nauru', 'NR', 'NRU',520, 9, 528);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (156,'Nepal', 'NP', 'NPL',524, 3, 529);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (157,'Netherlands', 'NL', 'NLD',528, 4, 530);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (158,'New Caledonia', 'NC', 'NCL',540, 11, 531);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (159,'New Zealand', 'NZ', 'NZL',554, 1, 532);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (160,'Nicaragua', 'NI', 'NIC',558, 13, 2, 533);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (161,'Niger', 'NE', 'NER',562, 17, 5, 534);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (162,'Nigeria', 'NG', 'NGA',566, 17, 5, 535);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (163,'Niue', 'NU', 'NIU',570, 14, 536);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (164,'Norfolk Island', 'NF', 'NFK',574, 1, 537);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (165,'North Macedonia', 'MK', 'MKD',807, 2, 538);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (166,'Northern Mariana Islands', 'MP', 'MNP',580, 9, 539);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (167,'Norway', 'NO', 'NOR',578, 7, 540);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (168,'Oman', 'OM', 'OMN',512, 16, 541);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (169,'Pakistan', 'PK', 'PAK',586, 3, 542);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (170,'Palau', 'PW', 'PLW',585, 9, 543);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (171,'Palestine, State of', 'PS', 'PSE',275, 16, 544);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (172,'Panama', 'PA', 'PAN',591, 13, 2, 545);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (173,'Papua New Guinea', 'PG', 'PNG',598, 11, 546);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (174,'Paraguay', 'PY', 'PRY',600, 13, 6, 547);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (175,'Peru', 'PE', 'PER',604, 13, 6, 548);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (176,'Philippines', 'PH', 'PHL',608, 12, 549);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (177,'Pitcairn', 'PN', 'PCN',612, 14, 550);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (178,'Poland', 'PL', 'POL',616, 6, 551);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (179,'Portugal', 'PT', 'PRT',620, 2, 552);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (180,'Puerto Rico', 'PR', 'PRI',630, 13, 7, 553);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (181,'Qatar', 'QA', 'QAT',634, 16, 554);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (182,'Réunion', 'RE', 'REU',638, 17, 8, 555);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (183,'Romania', 'RO', 'ROU',642, 6, 556);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (184,'Russian Federation', 'RU', 'RUS',643, 6, 557);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (185,'Rwanda', 'RW', 'RWA',646, 17, 8, 558);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (186,'Saint Barthélemy', 'BL', 'BLM',652, 13, 7, 559);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (187,'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN',654, 17, 5, 560);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (188,'Saint Kitts and Nevis', 'KN', 'KNA',659, 13, 7, 561);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (189,'Saint Lucia', 'LC', 'LCA',662, 13, 7, 562);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (190,'Saint Martin (French part)', 'MF', 'MAF',663, 13, 7, 563);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (191,'Saint Pierre and Miquelon', 'PM', 'SPM',666, 8, 564);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (192,'Saint Vincent and the Grenadines', 'VC', 'VCT',670, 13, 7, 565);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (193,'Samoa', 'WS', 'WSM',882, 14, 566);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (194,'San Marino', 'SM', 'SMR',674, 2, 567);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (195,'Sao Tome and Principe', 'ST', 'STP',678, 17, 3, 568);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (196,'Saudi Arabia', 'SA', 'SAU',682, 16, 569);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (197,'Senegal', 'SN', 'SEN',686, 17, 5, 570);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (198,'Serbia', 'RS', 'SRB',688, 2, 571);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (199,'Seychelles', 'SC', 'SYC',690, 17, 8, 572);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (200,'Sierra Leone', 'SL', 'SLE',694, 17, 5, 573);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (201,'Singapore', 'SG', 'SGP',702, 12, 574);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (202,'Sint Maarten (Dutch part)', 'SX', 'SXM',534, 13, 7, 575);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (203,'Slovakia', 'SK', 'SVK',703, 6, 576);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (204,'Slovenia', 'SI', 'SVN',705, 2, 577);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (205,'Solomon Islands', 'SB', 'SLB',90, 11, 578);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (206,'Somalia', 'SO', 'SOM',706, 17, 8, 579);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (207,'South Africa', 'ZA', 'ZAF',710, 17, 4, 580);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (208,'South Georgia and the South Sandwich Islands', 'GS', 'SGS',239, 13, 6, 581);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (209,'South Sudan', 'SS', 'SSD',728, 17, 8, 582);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (210,'Spain', 'ES', 'ESP',724, 2, 583);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (211,'Sri Lanka', 'LK', 'LKA',144, 3, 584);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (212,'Sudan', 'SD', 'SDN',729, 15, 585);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (213,'Suriname', 'SR', 'SUR',740, 13, 6, 586);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (214,'Svalbard and Jan Mayen', 'SJ', 'SJM',744, 7, 587);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (215,'Sweden', 'SE', 'SWE',752, 7, 588);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (216,'Switzerland', 'CH', 'CHE',756, 4, 589);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (217,'Syrian Arab Republic', 'SY', 'SYR',760, 16, 590);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (218,'Taiwan, Province of China', 'TW', 'TWN',158, 5, 591);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (219,'Tajikistan', 'TJ', 'TJK',762, 10, 592);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (220,'Tanzania, United Republic of', 'TZ', 'TZA',834, 17, 8, 593);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (221,'Thailand', 'TH', 'THA',764, 12, 594);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (222,'Timor-Leste', 'TL', 'TLS',626, 12, 595);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (223,'Togo', 'TG', 'TGO',768, 17, 5, 596);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (224,'Tokelau', 'TK', 'TKL',772, 14, 597);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (225,'Tonga', 'TO', 'TON',776, 14, 598);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (226,'Trinidad and Tobago', 'TT', 'TTO',780, 13, 7, 599);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (227,'Tunisia', 'TN', 'TUN',788, 15, 600);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (228,'Turkey', 'TR', 'TUR',792, 16, 601);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (229,'Turkmenistan', 'TM', 'TKM',795, 10, 602);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (230,'Turks and Caicos Islands', 'TC', 'TCA',796, 13, 7, 603);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (231,'Tuvalu', 'TV', 'TUV',798, 14, 604);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (232,'Uganda', 'UG', 'UGA',800, 17, 8, 605);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (233,'Ukraine', 'UA', 'UKR',804, 6, 606);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (234,'United Arab Emirates', 'AE', 'ARE',784, 16, 607);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (235,'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR',826, 7, 608);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (236,'United States of America', 'US', 'USA',840, 8, 609);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (237,'United States Minor Outlying Islands', 'UM', 'UMI',581, 9, 610);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (238,'Uruguay', 'UY', 'URY',858, 13, 6, 611);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (239,'Uzbekistan', 'UZ', 'UZB',860, 10, 612);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (240,'Vanuatu', 'VU', 'VUT',548, 11, 613);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (241,'Venezuela (Bolivarian Republic of)', 'VE', 'VEN',862, 13, 6, 614);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (242,'Viet Nam', 'VN', 'VNM',704, 12, 615);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (243,'Virgin Islands (British)', 'VG', 'VGB',92, 13, 7, 616);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (244,'Virgin Islands (U.S.)', 'VI', 'VIR',850, 13, 7, 617);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (245,'Wallis and Futuna', 'WF', 'WLF',876, 14, 618);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (246,'Western Sahara', 'EH', 'ESH',732, 15, 619);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, NameTermID) VALUES (247,'Yemen', 'YE', 'YEM',887, 16, 620);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (248,'Zambia', 'ZM', 'ZMB',894, 17, 8, 621);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID, NameTermID) VALUES (249,'Zimbabwe', 'ZW', 'ZWE',716, 17, 8, 622);SET IDENTITY_INSERT Countries OFF;
SET IDENTITY_INSERT Countries OFF;

SET IDENTITY_INSERT UserMenus ON;
INSERT INTO UserMenus (
	UserMenuID, HasMenu
	, MenuController, MenuAction, MenuImageName
	, HasAdd
	, AddController, AddAction, AddImageName
	, HasSearch
	, SearchController, SearchAction, SearchImageName
	, HasAdvancedSearch
	, AdvancedSearchController, AdvancedSearchAction, AdvancedSearchImageName) VALUES 
(1, 1, '','','',1, '','','',1,'','','',1, '','','')
,(2, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(3, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(4, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(5, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(6, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(7, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(8, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(9, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(10, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(11, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(12, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(13, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(14, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(15, 1, '','','',1, '','','',1, '','','',1 , '','','')
,(16, 1, '','','',1, '','','',1, '','','',1 , '','','')
SET IDENTITY_INSERT UserMenus OFF;


SET IDENTITY_INSERT UserMenuLanguages ON;
INSERT INTO UserMenuLanguages ( UserMenuLanguageID, UserMenuID, LanguageID, Name, Description, MenuName, MenuMouseOver, AddName, AddMouseOver, SearchName, SearchMouseOver, AdvancedSearchName, AdvancedSearchMouseOver) VALUES 
  (1, 1, 41, 'My content', 'My content', 'My content', 'My content', 'Add content', 'Add content', 'My content', 'My content', 'Add content', 'Add content')
, (2, 2, 41, 'My calendar', 'My calendar', 'My calendar', 'My calendar', 'Add appointment', 'Add appointment', 'My calendar', 'My calendar', 'Add appointment', 'Add appointment')
, (3, 3, 41, 'My projects', 'My projects', 'My projects', 'My projects', 'My projects', 'My projects', 'My projects', 'My projects', 'My projects', 'My projects')
, (4, 4, 41, 'My relations', 'My relations', 'My relations', 'My relations', 'My relations', 'My relations', 'My relations', 'My relations', 'My relations', 'My relations')
, (5, 5, 41, 'Chats', 'Chats', 'Chats', 'Chats', 'New chat', 'New chat', 'Chats', 'Chats', 'New chat', 'New chat')
, (6, 6, 41, 'Conferences', 'Conferences', 'Conferences', 'Conferences', 'New conference', 'New conference', 'Conferences', 'Conferences', 'New conference', 'New conference')
, (7, 7, 41, 'My favorites', 'My favorites', 'My favorites', 'My favorites', 'My favorites', 'My favorites', 'My favorites', 'My favorites', 'My favorites', 'My favorites')
, (8, 8, 41, 'Open game', 'Open game', 'Open game', 'Open game', 'Open game', 'Open game', 'Open game', 'Open game', 'Open game', 'Open game')
, (9, 9, 41, 'To do', 'To do', 'To do', 'To do', 'New workflow', 'New workflow', 'Search workflow', 'Search workflow', 'Search workflow', 'Search workflow')
, (10, 10, 41, 'General search', 'General search', 'Search', 'Search', 'Advanced search', 'Advanced search', 'General search', 'General search', 'Search', 'Search')
, (11, 11, 41, 'Content search', 'Content search', 'Content search', 'Content search', 'Content search', 'Content search', 'Content search', 'Content search', 'Advanced content search', 'Advanced content search')
, (12, 12, 41, 'Project search', 'Project search', 'Project search', 'Project search', 'Project search', 'Project search', 'Project search', 'Project search', 'Advanced project search', 'Advanced project search')
, (13, 13, 41, 'People search', 'People search', 'People search', 'People search', 'People search', 'People search', 'People search', 'People search', 'Advanced people search', 'Advanced people search')
, (14, 14, 41, 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu', 'User defined menu')
, (15, 15, 41, 'My organizations', 'My organizations', 'My organizations', 'My organizations', 'My organizations', 'My organizations', 'My organizations', 'My organizations', 'My organizations', 'My organizations')
, (16, 16, 41, 'Users', 'Users', 'Users', 'Users', 'Users', 'Users', 'Users', 'Users', 'Users', 'Users')
, (17, 1, 39, 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content', 'Mijn content')
, (18, 2, 39, 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender', 'Mijn kalender')
, (19, 3, 39, 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten', 'Mijn projecten')
, (20, 4, 39, 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties', 'Mijn relaties')
, (21, 5, 39, 'Chats', 'Chats', 'Chats', 'Chats', 'Nieuwe chat', 'Nieuwe chat', 'Chats', 'Chats', 'Nieuwe chat', 'Nieuwe chat')
, (22, 6, 39, 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties', 'Conferenties')
, (23, 7, 39, 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten', 'Mijn favorieten')
, (24, 8, 39, 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen', 'Spel openen')
, (25, 9, 39, 'Te doen', 'Te doen', 'Te doen', 'Te doen', 'Te doen', 'Te doen', 'Te doen', 'Te doen', 'Te doen', 'Te doen')
, (26, 10, 39, 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken', 'Algemeen zoeken')
, (27, 11, 39, 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken', 'Content zoeken')
, (28, 12, 39, 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken', 'Project zoeken')
, (29, 13, 39, 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken', 'Mensen zoeken')
, (30, 14, 39, 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu', 'Gebruikers menu')
, (31, 15, 39, 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie', 'Mijn organizatie')
, (32, 16, 39, 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers', 'Gebruikers')
SET IDENTITY_INSERT UserMenuLanguages OFF;


SET IDENTITY_INSERT ClaimGroups ON;
INSERT INTO ClaimGroups (
	ClaimGroupID, Sequence, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1, 1, 641, 641, 641, 641)
SET IDENTITY_INSERT ClaimGroups OFF;

SET IDENTITY_INSERT Claims ON;
INSERT INTO Claims (
	ClaimID, ClaimGroupID, ClaimType, ClaimValue, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1, 1, 'ApplicationRight','1', 642, 642, 642, 642)
, (2, 1, 'ApplicationRight','2', 66, 66, 66, 666)
, (3, 1, 'ApplicationRight','3', 643, 643, 643, 643)
, (4, 1, 'ApplicationRight','4', 644, 644, 644, 644)
, (5, 1, 'ApplicationRight','5', 935, 935, 935, 935)
, (6, 1, 'ApplicationRight','6', 937, 937, 937, 937)
, (7, 1, 'ApplicationRight','7', 936, 936, 936, 936)
, (8, 1, 'ApplicationRight','8', 174, 174, 174, 174)
, (9, 1, 'ApplicationRight','9', 938, 938, 938, 938)
, (10, 1, 'ApplicationRight','10', 941, 941, 941, 941)
, (11, 1, 'ApplicationRight','11', 940, 940, 940, 940)
, (12, 1, 'ApplicationRight','12', 939, 939, 939, 939)
SET IDENTITY_INSERT Claims OFF;

SET IDENTITY_INSERT ProcessTemplateFieldTypes ON
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1, 645, 645, 645, 645),(2, 646, 646, 646, 646),(3, 647, 647, 647, 647),(4, 195, 195, 195, 195),(5, 648, 648, 648, 648),(6, 649, 649, 649, 649)
,(7, 650, 650, 650, 650),(8, 651, 651, 651, 651),(9, 652, 652, 652, 652),(10, 653, 653, 653, 653),(11, 654, 654, 654, 654),(12, 655, 655, 655, 655)
,(13, 656, 656, 656, 656),(14, 657, 657, 657, 657),(15, 658, 658, 658, 658),(16, 659, 659, 659, 659),(17, 660, 660, 660, 660),(18, 661, 661, 661, 661)
,(19, 662, 662, 662, 662),(20, 663, 663, 663, 663),(21, 664, 664, 664, 664),(22, 665, 665, 665, 665),(23, 666, 666, 666, 666),(24, 667, 667, 667, 667)
,(25, 668, 668, 668, 668),(26, 669, 669, 669, 669),(27, 670, 670, 670, 670),(28, 671, 671, 671, 671),(29, 672, 672, 672, 672),(30, 673, 673, 673, 673)
,(31, 674, 674, 674, 674),(32, 675, 675, 675, 675),(33, 918, 918, 918, 918),(34, 919, 919, 919, 919),(35, 920, 920, 920, 920);
SET IDENTITY_INSERT ProcessTemplateFieldTypes OFF

SET IDENTITY_INSERT MVCUIScreens ON;
INSERT INTO [dbo].[MVCUIScreens](MVCUIScreenId, [Controller],[Action])VALUES(1, 'Classification','Index')
SET IDENTITY_INSERT MVCUIScreens OFF;

SET IDENTITY_INSERT MVCUITermScreens ON;
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(1, 2, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(2, 3, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(3, 21, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(4, 22, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(5, 24, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(6, 29, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(7, 34, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(8, 36, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(9, 37, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(10, 46, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(11, 59, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(12, 60, 1)
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(13, 65, 1)
SET IDENTITY_INSERT MVCUITermScreens OFF;

SET IDENTITY_INSERT AddressTypes ON
INSERT INTO AddressTypes (AddressTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1, 321, 321, 321, 321),(2,322,322,322,322), (3,323,323,323,323);
SET IDENTITY_INSERT AddressTypes OFF

SET IDENTITY_INSERT PreferenceTypes ON;
INSERT INTO PreferenceTypes (PreferenceTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
  (1,33,33,33,33)
SET IDENTITY_INSERT PreferenceTypes OFF;

SET IDENTITY_INSERT TelecomTypes ON;
INSERT INTO TelecomTypes (TelecomTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID, Active, ModifierID,ModifiedDate) VALUES 
  (1,677,677,677,677,1, @user, getdate()),
  (2,678,678,678,678,1, @user, getdate())
SET IDENTITY_INSERT TelecomTypes OFF;

SET IDENTITY_INSERT ProcessTemplateStageFieldStatuses ON;
INSERT INTO ProcessTemplateStageFieldStatuses (ProcessTemplateStageFieldStatusID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1,679,679,679,679), (2,680,680,680,680),(3,681,681,681,681),(4,682,682,682,682);
SET IDENTITY_INSERT ProcessTemplateStageFieldStatuses OFF;

SET IDENTITY_INSERT RoleGroupLanguages ON;
INSERT INTO RoleGroupLanguages (RoleGroupLanguageID, RoleGroupID, LanguageID, Name, Description, MenuName, MouseOver, CreatorID, ModifierID, CreatedDate, ModifiedDate) 
VALUES(1,1,41,'Admin','Admin','Admin','Admin',@User,@User,getdate(),getdate());
SET IDENTITY_INSERT RoleGroupLanguages OFF;

SET IDENTITY_INSERT Genders ON;
INSERT INTO Genders (GenderId, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID, Active, ModifierID, ModifiedDate) VALUES 
(1,877,877,877,877,1,@User,getdate())
, (2,878,878,878,878,1,@User,getdate())
, (3,879,879,879,879,0,@User,getdate())
SET IDENTITY_INSERT Genders OFF;

SET IDENTITY_INSERT PageSectionDataTypes ON;
INSERT INTO PageSectionDataTypes (PageSectionDataTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1,227,227,227,227)
, (2,234,234,234,234)
SET IDENTITY_INSERT PageSectionDataTypes OFF;

SET IDENTITY_INSERT ProcessTemplateFlowConditionTypes ON;
INSERT INTO ProcessTemplateFlowConditionTypes (ProcessTemplateFlowConditionTypeID, NameTermID,DescriptionTermID,MenuNameTermID,MouseOverTermID) VALUES
(1, 880, 881, 880,880)
, (2, 882, 883, 882,882)
, (3, 884, 885, 884,884)
, (4, 886, 887, 886,886)
, (5, 888, 889, 888,888)
, (6, 890, 891, 890,890)
, (7, 892, 893, 892,892)
, (8, 894, 895, 894,894)
, (9, 896, 897, 896,896)
, (10, 898, 899, 898,898)
, (11, 900, 901, 900,900)
, (12, 902, 903, 902,904)
, (13, 904, 905, 904,904)
, (14, 906, 907, 906,906)
, (15, 908, 909, 908,908)
, (16, 910, 909, 910,910)
, (17, 911, 909, 911,911)
, (18, 912, 909, 912,912)
, (19, 913, 914, 913,913)
, (20, 915, 916, 915,915)
, (21, 917, 918, 917,917)
, (22, 928, 930, 928,928)
, (23, 929, 931, 929,929)
SET IDENTITY_INSERT ProcessTemplateFlowConditionTypes OFF;

SET IDENTITY_INSERT ProcessTemplateFlowConditionComparisonOperators ON;
INSERT INTO ProcessTemplateFlowConditionComparisonOperators (
	ProcessTemplateFlowConditionComparisonOperatorID, Symbol, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1, '', 921, 921, 921, 921)
, (2, '=', 922, 922, 922, 922)
, (3, '>', 923, 923, 923, 923)
, (4, '<', 924, 924, 924, 924)
, (5, '>=', 925, 925, 925, 925)
, (6, '<=', 926, 926, 926, 926)
, (7, '<>', 927, 927, 927, 927);
SET IDENTITY_INSERT ProcessTemplateFlowConditionComparisonOperators OFF;


SET IDENTITY_INSERT ValueUpdateTypes ON;
INSERT INTO ValueUpdateTypes (
	ValueUpdateTypeID, NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID) VALUES 
(1, 932, 932, 932, 932)
, (2, 933, 933, 933, 933)
, (3, 934, 934, 934, 934)
SET IDENTITY_INSERT ValueUpdateTypes OFF;
