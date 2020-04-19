USE sip
DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT Statuses ON;
INSERT INTO Statuses (StatusId) VALUES (1), (2);
SET IDENTITY_INSERT Statuses OFF;

SET IDENTITY_INSERT Languages ON;
INSERT INTO Languages (LanguageID, LanguageName, ForeignName, ISO6391, ISO6392, StatusID) VALUES (1, 'Abkhazian', N'аҧсуа бызшәа, аҧсшәа', 'ab', 'abk', 2)
, (2, 'Afar', N'Afaraf', 'aa', 'aar', 2) 
, (3, 'Afrikaans', N'Afrikaans', 'af', 'afr', 2) 
, (4, 'Akan', N'Akan', 'ak', 'aka', 2) 
, (5, 'Albanian', N'Shqip', 'sq', 'sqi', 2) 
, (6, 'Amharic', N'አማርኛ', 'am', 'amh', 2) 
, (7, 'Arabic', N'العربية', 'ar', 'ara', 2) 
, (8, 'Aragonese', N'aragonés', 'an', 'arg', 2) 
, (9, 'Armenian', N'Հայերեն', 'hy', 'hye', 2) 
, (10, 'Assamese', N'অসমীয়া', 'as', 'asm', 2) 
, (11, 'Avaric', N'авар мацӀ, магӀарул мацӀ', 'av', 'ava', 2) 
, (12, 'Avestan', N'avesta', 'ae', 'ave', 2) 
, (13, 'Aymara', N'aymar aru', 'ay', 'aym', 2) 
, (14, 'Azerbaijani', N'azərbaycan dili', 'az', 'aze', 2) 
, (15, 'Bambara', N'bamanankan', 'bm', 'bam', 2) 
, (16, 'Bashkir', N'башҡорт теле', 'ba', 'bak', 2) 
, (17, 'Basque', N'euskara, euskera', 'eu', 'eus', 2) 
, (18, 'Belarusian', N'беларуская мова', 'be', 'bel', 2) 
, (19, 'Bengali', N'বাংলা', 'bn', 'ben', 2) 
, (20, 'Bihari languages', N'भोजपुरी', 'bh', 'bih', 2) 
, (21, 'Bislama', N'Bislama', 'bi', 'bis', 2) 
, (22, 'Bosnian', N'bosanski jezik', 'bs', 'bos', 2) 
, (23, 'Breton', N'brezhoneg', 'br', 'bre', 2) 
, (24, 'Bulgarian', N'български език', 'bg', 'bul', 2) 
, (25, 'Burmese', N'ဗမာစာ', 'my', 'mya', 2) 
, (26, 'Catalan, Valencian', N'català, valencià', 'ca', 'cat', 2) 
, (27, 'Chamorro', N'Chamoru', 'ch', 'cha', 2) 
, (28, 'Chechen', N'нохчийн мотт', 'ce', 'che', 2) 
, (29, 'Chichewa, Chewa, Nyanja', N'chiCheŵa, chinyanja', 'ny', 'nya', 2) 
, (30, 'Chinese', N'中文 (Zhōngwén), 汉语, 漢語', 'zh', 'zho', 2) 
, (31, 'Chuvash', N'чӑваш чӗлхи', 'cv', 'chv', 2) 
, (32, 'Cornish', N'Kernewek', 'kw', 'cor', 2) 
, (33, 'Corsican', N'corsu, lingua corsa', 'co', 'cos', 2) 
, (34, 'Cree', N'ᓀᐦᐃᔭᐍᐏᐣ', 'cr', 'cre', 2) 
, (35, 'Croatian', N'hrvatski jezik', 'hr', 'hrv', 2) 
, (36, 'Czech', N'čeština, český jazyk', 'cs', 'ces', 2) 
, (37, 'Danish', N'dansk', 'da', 'dan', 2) 
, (38, 'Divehi, Dhivehi, Maldivian', N'ދިވެހި', 'dv', 'div', 2) 
, (39, 'Dutch, Flemish', N'Nederlands, Vlaams', 'nl', 'nld', 1) 
, (40, 'Dzongkha', N'རྫོང་ཁ', 'dz', 'dzo', 2) 
, (41, 'English', N'English', 'en', 'eng', 1)
, (42, 'Esperanto', N'Esperanto', 'eo', 'epo', 2) 
, (43, 'Estonian', N'eesti, eesti keel', 'et', 'est', 2) 
, (44, 'Ewe', N'Eʋegbe', 'ee', 'ewe', 2) 
, (45, 'Faroese', N'føroyskt', 'fo', 'fao', 2) 
, (46, 'Fijian', N'vosa Vakaviti', 'fj', 'fij', 2) 
, (47, 'Finnish', N'suomi, suomen kieli', 'fi', 'fin', 2) 
, (48, 'French', N'français, langue française', 'fr', 'fra', 2) 
, (49, 'Fulah', N'Fulfulde, Pulaar, Pular', 'ff', 'ful', 2) 
, (50, 'Galician', N'Galego', 'gl', 'glg', 2) 
, (51, 'Georgian', N'ქართული', 'ka', 'kat', 2) 
, (52, 'German', N'Deutsch', 'de', 'deu', 2) 
, (53, 'Greek, Modern (1453-)', N'ελληνικά', 'el', 'ell', 2) 
, (54, 'Guarani', N'Avañe''ẽ', 'gn', 'grn', 2) 
, (55, 'Gujarati', N'ગુજરાતી', 'gu', 'guj', 2) 
, (56, 'Haitian, Haitian Creole', N'Kreyòl ayisyen', 'ht', 'hat', 2) 
, (57, 'Hausa', N'(Hausa) هَوُسَ', 'ha', 'hau', 2) 
, (58, 'Hebrew', N'עברית', 'he', 'heb', 2) 
, (59, 'Herero', N'Otjiherero', 'hz', 'her', 2) 
, (60, 'Hindi', N'हिन्दी, हिंदी', 'hi', 'hin', 2) 
, (61, 'Hiri Motu', N'Hiri Motu', 'ho', 'hmo', 2) 
, (62, 'Hungarian', N'magyar', 'hu', 'hun', 2) 
, (63, 'Interlingua', N'Interlingua', 'ia', 'ina', 2) 
, (64, 'Indonesian', N'Bahasa Indonesia', 'id', 'ind', 2) 
, (65, 'Interlingue, Occidental', N'(originally:) Occidental, (after WWII:) Interlingue', 'ie', 'ile', 2) 
, (66, 'Irish', N'Gaeilge', 'ga', 'gle', 2) 
, (67, 'Igbo', N'Asụsụ Igbo', 'ig', 'ibo', 2) 
, (68, 'Inupiaq', N'Iñupiaq, Iñupiatun', 'ik', 'ipk', 2) 
, (69, 'Ido', N'Ido', 'io', 'ido', 2) 
, (70, 'Icelandic', N'Íslenska', 'is', 'isl', 2) 
, (71, 'Italian', N'Italiano', 'it', 'ita', 2) 
, (72, 'Inuktitut', N'ᐃᓄᒃᑎᑐᑦ', 'iu', 'iku', 2) 
, (73, 'Japanese', N'日本語 (にほんご)', 'ja', 'jpn', 2) 
, (74, 'Javanese', N'ꦧꦱꦗꦮ, Basa Jawa', 'jv', 'jav', 2) 
, (75, 'Kalaallisut, Greenlandic', N'kalaallisut, kalaallit oqaasii', 'kl', 'kal', 2) 
, (76, 'Kannada', N'ಕನ್ನಡ', 'kn', 'kan', 2) 
, (77, 'Kanuri', N'Kanuri', 'kr', 'kau', 2) 
, (78, 'Kashmiri', N'कश्मीरी, كشميري‎', 'ks', 'kas', 2) 
, (79, 'Kazakh', N'қазақ тілі', 'kk', 'kaz', 2) 
, (80, 'Central Khmer', N'ខ្មែរ, ខេមរភាសា, ភាសាខ្មែរ', 'km', 'khm', 2) 
, (81, 'Kikuyu, Gikuyu', N'Gĩkũyũ', 'ki', 'kik', 2) 
, (82, 'Kinyarwanda', N'Ikinyarwanda', 'rw', 'kin', 2) 
, (83, 'Kirghiz, Kyrgyz', N'Кыргызча, Кыргыз тили', 'ky', 'kir', 2) 
, (84, 'Komi', N'коми кыв', 'kv', 'kom', 2) 
, (85, 'Kongo', N'Kikongo', 'kg', 'kon', 2) 
, (86, 'Korean', N'한국어', 'ko', 'kor', 2) 
, (87, 'Kurdish', N'Kurdî, کوردی‎', 'ku', 'kur', 2) 
, (88, 'Kuanyama, Kwanyama', N'Kuanyama', 'kj', 'kua', 2) 
, (89, 'Latin', N'latine, lingua latina', 'la', 'lat', 2) 
, (90, 'Luxembourgish, Letzeburgesch', N'Lëtzebuergesch', 'lb', 'ltz', 2) 
, (91, 'Ganda', N'Luganda', 'lg', 'lug', 2) 
, (92, 'Limburgan, Limburger, Limburgish', N'Limburgs', 'li', 'lim', 2) 
, (93, 'Lingala', N'Lingála', 'ln', 'lin', 2) 
, (94, 'Lao', N'ພາສາລາວ', 'lo', 'lao', 2) 
, (95, 'Lithuanian', N'lietuvių kalba', 'lt', 'lit', 2) 
, (96, 'Luba-Katanga', N'Kiluba', 'lu', 'lub', 2) 
, (97, 'Latvian', N'latviešu valoda', 'lv', 'lav', 2) 
, (98, 'Manx', N'Gaelg, Gailck', 'gv', 'glv', 2) 
, (99, 'Macedonian', N'македонски јазик', 'mk', 'mkd', 2) 
, (100, 'Malagasy', N'fiteny malagasy', 'mg', 'mlg', 2) 
, (101, 'Malay', N'Bahasa Melayu, بهاس ملايو‎', 'ms', 'msa', 2) 
, (102, 'Malayalam', N'മലയാളം', 'ml', 'mal', 2) 
, (103, 'Maltese', N'Malti', 'mt', 'mlt', 2) 
, (104, 'Maori', N'te reo Māori', 'mi', 'mri', 2) 
, (105, 'Marathi', N'मराठी', 'mr', 'mar', 2) 
, (106, 'Marshallese', N'Kajin M̧ajeļ', 'mh', 'mah', 2) 
, (107, 'Mongolian', N'Монгол хэл', 'mn', 'mon', 2) 
, (108, 'Nauru', N'Dorerin Naoero', 'na', 'nau', 2) 
, (109, 'Navajo, Navaho', N'Diné bizaad', 'nv', 'nav', 2) 
, (110, 'North Ndebele', N'isiNdebele', 'nd', 'nde', 2) 
, (111, 'Nepali', N'नेपाली', 'ne', 'nep', 2) 
, (112, 'Ndonga', N'Owambo', 'ng', 'ndo', 2) 
, (113, 'Norwegian Bokmål', N'Norsk Bokmål', 'nb', 'nob', 2) 
, (114, 'Norwegian Nynorsk', N'Norsk Nynorsk', 'nn', 'nno', 2) 
, (115, 'Norwegian', N'Norsk', 'no', 'nor', 2) 
, (116, 'Sichuan Yi, Nuosu', N'ꆈꌠ꒿ Nuosuhxop', 'ii', 'iii', 2) 
, (117, 'South Ndebele', N'isiNdebele', 'nr', 'nbl', 2) 
, (118, 'Occitan', N'occitan, lenga d''òc', 'oc', 'oci', 2) 
, (119, 'Ojibwa', N'ᐊᓂᔑᓈᐯᒧᐎᓐ', 'oj', 'oji', 2) 
, (120, 'Church Slavic, Old Slavonic, Church Slavonic', N'ѩзыкъ словѣньскъ', 'cu', 'chu', 2) 
, (121, 'Oromo', N'Afaan Oromoo', 'om', 'orm', 2) 
, (122, 'Oriya', N'ଓଡ଼ିଆ', 'or', 'ori', 2) 
, (123, 'Ossetian, Ossetic', N'ирон æвзаг', 'os', 'oss', 2) 
, (124, 'Punjabi, Panjabi', N'ਪੰਜਾਬੀ, پنجابی‎', 'pa', 'pan', 2) 
, (125, 'Pali', N'पालि, पाळि', 'pi', 'pli', 2) 
, (126, 'Persian', N'فارسی', 'fa', 'fas', 2) 
, (127, 'Polish', N'język polski, polszczyzna', 'pl', 'pol', 2) 
, (128, 'Pashto, Pushto', N'پښتو', 'ps', 'pus', 2) 
, (129, 'Portuguese', N'Português', 'pt', 'por', 2) 
, (130, 'Quechua', N'Runa Simi, Kichwa', 'qu', 'que', 2) 
, (131, 'Romansh', N'Rumantsch Grischun', 'rm', 'roh', 2) 
, (132, 'Rundi', N'Ikirundi', 'rn', 'run', 2) 
, (133, 'Romanian, Moldavian, Moldovan', N'Română', 'ro', 'ron', 2) 
, (134, 'Russian', N'русский', 'ru', 'rus', 2) 
, (135, 'Sanskrit', N'संस्कृतम्', 'sa', 'san', 2) 
, (136, 'Sardinian', N'sardu', 'sc', 'srd', 2) 
, (137, 'Sindhi', N'सिन्धी, سنڌي، سندھی‎', 'sd', 'snd', 2) 
, (138, 'Northern Sami', N'Davvisámegiella', 'se', 'sme', 2) 
, (139, 'Samoan', N'gagana fa''a Samoa', 'sm', 'smo', 2) 
, (140, 'Sango', N'yângâ tî sängö', 'sg', 'sag', 2) 
, (141, 'Serbian', N'српски језик', 'sr', 'srp', 2) 
, (142, 'Gaelic, Scottish Gaelic', N'Gàidhlig', 'gd', 'gla', 2) 
, (143, 'Shona', N'chiShona', 'sn', 'sna', 2) 
, (144, 'Sinhala, Sinhalese', N'සිංහල', 'si', 'sin', 2) 
, (145, 'Slovak', N'Slovenčina, Slovenský Jazyk', 'sk', 'slk', 2) 
, (146, 'Slovenian', N'Slovenski Jezik, Slovenščina', 'sl', 'slv', 2) 
, (147, 'Somali', N'Soomaaliga, af Soomaali', 'so', 'som', 2) 
, (148, 'Southern Sotho', N'Sesotho', 'st', 'sot', 2) 
, (149, 'Spanish, Castilian', N'Español', 'es', 'spa', 2) 
, (150, 'Sundanese', N'Basa Sunda', 'su', 'sun', 2) 
, (151, 'Swahili', N'Kiswahili', 'sw', 'swa', 2) 
, (152, 'Swati', N'SiSwati', 'ss', 'ssw', 2) 
, (153, 'Swedish', N'Svenska', 'sv', 'swe', 2) 
, (154, 'Tamil', N'தமிழ்', 'ta', 'tam', 2) 
, (155, 'Telugu', N'తెలుగు', 'te', 'tel', 2) 
, (156, 'Tajik', N'тоҷикӣ, toçikī, تاجیکی‎', 'tg', 'tgk', 2) 
, (157, 'Thai', N'ไทย', 'th', 'tha', 2) 
, (158, 'Tigrinya', N'ትግርኛ', 'ti', 'tir', 2) 
, (159, 'Tibetan', N'བོད་ཡིག', 'bo', 'bod', 2) 
, (160, 'Turkmen', N'Türkmen, Түркмен', 'tk', 'tuk', 2) 
, (161, 'Tagalog', N'Wikang Tagalog', 'tl', 'tgl', 2) 
, (162, 'Tswana', N'Setswana', 'tn', 'tsn', 2) 
, (163, 'Tonga (Tonga Islands)', N'Faka Tonga', 'to', 'ton', 2) 
, (164, 'Turkish', N'Türkçe', 'tr', 'tur', 2) 
, (165, 'Tsonga', N'Xitsonga', 'ts', 'tso', 2) 
, (166, 'Tatar', N'татар теле, tatar tele', 'tt', 'tat', 2) 
, (167, 'Twi', N'Twi', 'tw', 'twi', 2) 
, (168, 'Tahitian', N'Reo Tahiti', 'ty', 'tah', 2) 
, (169, 'Uighur, Uyghur', N'ئۇيغۇرچە‎, Uyghurche', 'ug', 'uig', 2) 
, (170, 'Ukrainian', N'Українська', 'uk', 'ukr', 2) 
, (171, 'Urdu', N'اردو', 'ur', 'urd', 2) 
, (172, 'Uzbek', N'Oʻzbek, Ўзбек, أۇزبېك‎', 'uz', 'uzb', 2) 
, (173, 'Venda', N'Tshivenḓa', 've', 'ven', 2) 
, (174, 'Vietnamese', N'Tiếng Việt', 'vi', 'vie', 2) 
, (175, 'Volapük', N'Volapük', 'vo', 'vol', 2) 
, (176, 'Walloon', N'Walon', 'wa', 'wln', 2) 
, (177, 'Welsh', N'Cymraeg', 'cy', 'cym', 2) 
, (178, 'Wolof', N'Wollof', 'wo', 'wol', 2) 
, (179, 'Western Frisian', N'Frysk', 'fy', 'fry', 2) 
, (180, 'Xhosa', N'isiXhosa', 'xh', 'xho', 2) 
, (181, 'Yiddish', N'ייִדיש', 'yi', 'yid', 2) 
, (182, 'Yoruba', N'Yorùbá', 'yo', 'yor', 2) 
, (183, 'Zhuang, Chuang', N'Saɯ cueŋƅ, Saw cuengh', 'za', 'zha', 2) 
, (184, 'Zulu', N'isiZulu', 'zu', 'zul', 2); 
SET IDENTITY_INSERT Languages OFF
 
SET IDENTITY_INSERT StatusLanguages ON
INSERT INTO StatusLanguages (StatusLanguageID, StatusID, LanguageID, Name, Description, MenuName, MouseOver) VALUES (1, 1, 39, 'Aktief', 'Aktief', 'Aktief', 'Aktief')
, (2, 2, 39, 'Niet aktief', 'Niet aktief', 'Niet aktief', 'Niet aktief')
, (3, 1, 41, 'Active', 'Active', 'Active', 'Active')
, (4, 2, 41, 'Inactive', 'Inactive', 'Inactive', 'Inactive');
SET IDENTITY_INSERT StatusLanguages OFF

SET IDENTITY_INSERT Settings ON
INSERT INTO Settings (SettingID, IntValue, ModifierID, ModifiedDate) VALUES (1,41, @User, getdate());
SET IDENTITY_INSERT Settings OFF

SET IDENTITY_INSERT SettingLanguages ON
INSERT INTO SettingLanguages (SettingLanguageID, SettingID, LanguageID, Name, Description, MenuName, MouseOver) VALUES (1,1, 41, 'Default language', 'Default language', 'Default language', 'Default language' )
, (2,1, 39, 'Standaard taal', 'Standaard taal', 'Standaard taal', 'Standaard taal' );
SET IDENTITY_INSERT SettingLanguages OFF

SET IDENTITY_INSERT DateLevels ON
INSERT INTO DateLevels (DateLevelID) VALUES (1), (2), (3), (4), (5);
SET IDENTITY_INSERT DateLevels OFF

SET IDENTITY_INSERT DateLevelLanguages ON
INSERT INTO DateLevelLanguages (DateLevelLanguageID, DateLevelID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1,1, 41, 'No date', 'No date', 'No date', 'No date' )
, (2,1, 41, 'Single date', 'Single date', 'Single date', 'Single date' )
, (3,1, 41, 'Date range', 'Date range', 'Date range', 'Date range' )
, (4,1, 41, 'Single date time', 'Single date time', 'Single date time', 'Single date time' )
, (5,1, 41, 'Date time range', 'Date time range', 'Date time range', 'Date time range' )
, (6,1, 39, 'Geen datum', 'Geen datum', 'Geen datum', 'Geen datum' )
, (7,1, 39, 'Datum', 'Datum', 'Datum', 'Datum' )
, (8,1, 39, 'Datum range', 'Datum range', 'Datum range', 'Datum range' )
, (9,1, 39, 'Datum en tijd', 'Datum en tijd', 'Datum en tijd', 'Datum en tijd' )
, (10,1, 39, 'Datum en tijd range', 'Datum en tijd range', 'Datum en tijd range', 'Datum en tijd range' )
SET IDENTITY_INSERT DateLevelLanguages OFF

SET IDENTITY_INSERT PageSectionTypes ON;
INSERT INTO PageSectionTypes (PageSectionTypeID) VALUES 
  (1)
, (2)
SET IDENTITY_INSERT PageSectionTypes OFF;

SET IDENTITY_INSERT PageSectionTypeLanguages ON;
INSERT INTO PageSectionTypeLanguages(PageSectionTypeLanguageID, PageSectionTypeID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1, 1, 41, 'List', 'List', 'List', 'List')
, (2, 2, 41, 'Index', 'Index', 'Index', 'Index')
, (3, 1, 39, 'Lijst', 'Lijst', 'Lijst', 'Lijst')
, (4, 2, 39, 'Inhoudsopgave', 'Inhoudsopgave', 'Inhoudsopgave', 'Inhoudsopgave')
SET IDENTITY_INSERT PageSectionTypeLanguages OFF;

SET IDENTITY_INSERT ContentStatuses ON;
INSERT INTO ContentStatuses (ContentStatusID) VALUES 
  (1)
, (2)
, (3)
, (4)
SET IDENTITY_INSERT ContentStatuses OFF;

SET IDENTITY_INSERT ContentStatusLanguages ON;
INSERT INTO ContentStatusLanguages(ContentStatusLanguageID, ContentStatusID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1, 1, 41, 'Draft', 'Draft', 'Draft', 'Draft')
, (2, 2, 41, 'Pending', 'Pending', 'Pending', 'Pending')
, (3, 3, 41, 'Rejected', 'Rejected', 'Rejected', 'Rejected')
, (4, 4, 41, 'Approved', 'Approved', 'Approved', 'Approved')
, (5, 1, 39, 'Concept', 'Concept', 'Concept', 'Concept')
, (6, 2, 39, 'Onbeslist', 'Onbeslist', 'Onbeslist', 'Onbeslist')
, (7, 3, 39, 'Afgekeurd', 'Afgekeurd', 'Afgekeurd', 'Afgekeurd')
, (8, 4, 39, 'Goedgekeurd', 'Goedgekeurd', 'Goedgekeurd', 'Goedgekeurd')
SET IDENTITY_INSERT ContentStatusLanguages OFF;

SET IDENTITY_INSERT ContentTypeClassificationStatuses ON;
INSERT INTO ContentTypeClassificationStatuses (ContentTypeClassificationStatusID) VALUES 
  (1)
, (2)
, (3)
SET IDENTITY_INSERT ContentTypeClassificationStatuses OFF;

SET IDENTITY_INSERT ContentTypeClassificationStatusLanguages ON;
INSERT INTO ContentTypeClassificationStatusLanguages(ContentTypeClassificationStatusLanguageID, ContentTypeClassificationStatusID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1, 1, 41, 'Hidden', 'Hidden', 'Hidden', 'Hidden')
, (2, 2, 41, 'Optional', 'Optional', 'Optional', 'Optional')
, (3, 3, 41, 'Required', 'Required', 'Required', 'Required')
, (4, 1, 39, 'Verborgen', 'Verborgen', 'Verborgen', 'Verborgen')
, (5, 2, 39, 'Onverplicht', 'Onverplicht', 'Onverplicht', 'Onverplicht')
, (6, 3, 39, 'Verplicht', 'Verplicht', 'Verplicht', 'Verplicht')
SET IDENTITY_INSERT ContentTypeClassificationStatusLanguages OFF;

SET IDENTITY_INSERT SortBys ON;
INSERT INTO SortBys (SortByID) VALUES 
  (1)
, (2)
SET IDENTITY_INSERT SortBys OFF;

SET IDENTITY_INSERT SortByLanguages ON;
INSERT INTO SortByLanguages(SortByLanguageID, SortByID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1, 1, 41, 'Newest', 'Newest', 'Newest', 'Newest')
, (2, 2, 41, 'Most popular', 'Most popular', 'Most popular', 'Most popular')
, (3, 1, 39, 'Nieuwste', 'Nieuwste', 'Nieuwste', 'Nieuwste')
, (4, 2, 39, 'Hoogst gewaardeerde', 'Hoogst gewaardeerde', 'Hoogst gewaardeerde', 'Hoogst gewaardeerde')
SET IDENTITY_INSERT SortByLanguages OFF;

SET IDENTITY_INSERT SecurityLevels ON;
INSERT INTO SecurityLevels (SecurityLevelID) VALUES 
  (1)
, (2)
, (3)
, (4)
, (5)
, (6)
, (7)
, (8)
, (9)
, (10)
SET IDENTITY_INSERT SecurityLevels OFF;

SET IDENTITY_INSERT SecurityLevelLanguages ON;
INSERT INTO SecurityLevelLanguages(SecurityLevelLanguageID, SecurityLevelID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
(1, 1, 41, '1', '1', '1', '1')
, (2, 2, 41, '2', '2', '2', '2')
, (3, 2, 41, '3', '3', '3', '3')
, (4, 2, 41, '4', '4', '4', '4')
, (5, 2, 41, '5', '5', '5', '5')
, (6, 2, 41, '6', '6', '6', '6')
, (7, 2, 41, '7', '7', '7', '7')
, (8, 2, 41, '8', '8', '8', '8')
, (9, 2, 41, '9', '9', '9', '9')
, (10, 2, 41, '10', '10', '10', '10')
, (11, 1, 39, '1', '1', '1', '1')
, (12, 2, 39, '2', '2', '2', '2')
, (13, 2, 39, '3', '3', '3', '3')
, (14, 2, 39, '4', '4', '4', '4')
, (15, 2, 39, '5', '5', '5', '5')
, (16, 2, 39, '6', '6', '6', '6')
, (17, 2, 39, '7', '7', '7', '7')
, (18, 2, 39, '8', '8', '8', '8')
, (19, 2, 39, '9', '9', '9', '9')
, (20, 2, 39, '10', '10', '10', '10')
SET IDENTITY_INSERT SecurityLevelLanguages OFF;

INSERT INTO Regions (RegionID, Name) VALUES (150,'Europe');
INSERT INTO Regions (RegionID, Name) VALUES (19,'Americas');
INSERT INTO Regions (RegionID, Name) VALUES (9,'Oceania');
INSERT INTO Regions (RegionID, Name) VALUES (142,'Asia');
INSERT INTO Regions (RegionID, Name) VALUES (2,'Africa');

INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (53,9,'Australia and New Zealand');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (39,150,'Southern Europe');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (34,142,'Southern Asia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (155,150,'Western Europe');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (30,142,'Eastern Asia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (151,150,'Eastern Europe');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (154,150,'Northern Europe');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (21,19,'Northern America');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (57,9,'Micronesia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (143,142,'Central Asia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (54,9,'Melanesia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (35,142,'South-eastern Asia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (419,19,'Latin America and the Caribbean');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (61,9,'Polynesia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (15,2,'Northern Africa');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (145,142,'Western Asia');
INSERT INTO SubRegions (SubRegionID, RegionID, Name) VALUES (202,2,'Sub-Saharan Africa');

INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (830,154,'Channel Islands');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (13,419,'Central America');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (17,202,'Middle Africa');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (18,202,'Southern Africa');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (11,202,'Western Africa');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (5,419,'South America');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (29,419,'Caribbean');
INSERT INTO IntermediateRegions (IntermediateRegionID, SubRegionID, Name) VALUES (14,202,'Eastern Africa');

SET IDENTITY_INSERT Countries ON;
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (1,'Afghanistan','AF' , 'AFG', 4, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (2,'Åland Islands','AX' , 'ALA', 248, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (3,'Albania','AL' , 'ALB', 8, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (4,'Algeria','DZ' , 'DZA', 12, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (5,'American Samoa','AS' , 'ASM', 16, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (6,'Andorra','AD' , 'AND', 20, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (7,'Angola','AO' , 'AGO', 24, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (8,'Anguilla','AI' , 'AIA', 660, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num) VALUES (9,'Antarctica','AQ' , 'ATA', 10);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (10,'Antigua and Barbuda','AG' , 'ATG', 28, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (11,'Argentina','AR' , 'ARG', 32, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (12,'Armenia','AM' , 'ARM', 51, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (13,'Aruba','AW' , 'ABW', 533, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (14,'Australia','AU' , 'AUS', 36, 53);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (15,'Austria','AT' , 'AUT', 40, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (16,'Azerbaijan','AZ' , 'AZE', 31, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (17,'Bahamas','BS' , 'BHS', 44, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (18,'Bahrain','BH' , 'BHR', 48, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (19,'Bangladesh','BD' , 'BGD', 50, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (20,'Barbados','BB' , 'BRB', 52, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (21,'Belarus','BY' , 'BLR', 112, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (22,'Belgium','BE' , 'BEL', 56, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (23,'Belize','BZ' , 'BLZ', 84, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (24,'Benin','BJ' , 'BEN', 204, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (25,'Bermuda','BM' , 'BMU', 60, 21);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (26,'Bhutan','BT' , 'BTN', 64, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (27,'Bolivia (Plurinational State of)','BO' , 'BOL', 68, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (28,'Bonaire, Sint Eustatius and Saba','BQ' , 'BES', 535, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (29,'Bosnia and Herzegovina','BA' , 'BIH', 70, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (30,'Botswana','BW' , 'BWA', 72, 202, 18);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (31,'Bouvet Island','BV' , 'BVT', 74, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (32,'Brazil','BR' , 'BRA', 76, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (33,'British Indian Ocean Territory','IO' , 'IOT', 86, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (34,'Brunei Darussalam','BN' , 'BRN', 96, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (35,'Bulgaria','BG' , 'BGR', 100, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (36,'Burkina Faso','BF' , 'BFA', 854, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (37,'Burundi','BI' , 'BDI', 108, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (38,'Cabo Verde','CV' , 'CPV', 132, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (39,'Cambodia','KH' , 'KHM', 116, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (40,'Cameroon','CM' , 'CMR', 120, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (41,'Canada','CA' , 'CAN', 124, 21);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (42,'Cayman Islands','KY' , 'CYM', 136, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (43,'Central African Republic','CF' , 'CAF', 140, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (44,'Chad','TD' , 'TCD', 148, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (45,'Chile','CL' , 'CHL', 152, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (46,'China','CN' , 'CHN', 156, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (47,'Christmas Island','CX' , 'CXR', 162, 53);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (48,'Cocos (Keeling) Islands','CC' , 'CCK', 166, 53);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (49,'Colombia','CO' , 'COL', 170, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (50,'Comoros','KM' , 'COM', 174, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (51,'Congo','CG' , 'COG', 178, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (52,'Congo, Democratic Republic of the','CD' , 'COD', 180, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (53,'Cook Islands','CK' , 'COK', 184, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (54,'Costa Rica','CR' , 'CRI', 188, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (55,'Côte d''Ivoire','CI' , 'CIV', 384, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (56,'Croatia','HR' , 'HRV', 191, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (57,'Cuba','CU' , 'CUB', 192, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (58,'Curaçao','CW' , 'CUW', 531, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (59,'Cyprus','CY' , 'CYP', 196, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (60,'Czechia','CZ' , 'CZE', 203, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (61,'Denmark','DK' , 'DNK', 208, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (62,'Djibouti','DJ' , 'DJI', 262, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (63,'Dominica','DM' , 'DMA', 212, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (64,'Dominican Republic','DO' , 'DOM', 214, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (65,'Ecuador','EC' , 'ECU', 218, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (66,'Egypt','EG' , 'EGY', 818, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (67,'El Salvador','SV' , 'SLV', 222, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (68,'Equatorial Guinea','GQ' , 'GNQ', 226, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (69,'Eritrea','ER' , 'ERI', 232, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (70,'Estonia','EE' , 'EST', 233, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (71,'Eswatini','SZ' , 'SWZ', 748, 202, 18);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (72,'Ethiopia','ET' , 'ETH', 231, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (73,'Falkland Islands (Malvinas)','FK' , 'FLK', 238, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (74,'Faroe Islands','FO' , 'FRO', 234, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (75,'Fiji','FJ' , 'FJI', 242, 54);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (76,'Finland','FI' , 'FIN', 246, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (77,'France','FR' , 'FRA', 250, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (78,'French Guiana','GF' , 'GUF', 254, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (79,'French Polynesia','PF' , 'PYF', 258, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (80,'French Southern Territories','TF' , 'ATF', 260, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (81,'Gabon','GA' , 'GAB', 266, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (82,'Gambia','GM' , 'GMB', 270, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (83,'Georgia','GE' , 'GEO', 268, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (84,'Germany','DE' , 'DEU', 276, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (85,'Ghana','GH' , 'GHA', 288, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (86,'Gibraltar','GI' , 'GIB', 292, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (87,'Greece','GR' , 'GRC', 300, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (88,'Greenland','GL' , 'GRL', 304, 21);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (89,'Grenada','GD' , 'GRD', 308, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (90,'Guadeloupe','GP' , 'GLP', 312, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (91,'Guam','GU' , 'GUM', 316, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (92,'Guatemala','GT' , 'GTM', 320, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (93,'Guernsey','GG' , 'GGY', 831, 154, 830);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (94,'Guinea','GN' , 'GIN', 324, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (95,'Guinea-Bissau','GW' , 'GNB', 624, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (96,'Guyana','GY' , 'GUY', 328, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (97,'Haiti','HT' , 'HTI', 332, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (98,'Heard Island and McDonald Islands','HM' , 'HMD', 334, 53);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (99,'Holy See','VA' , 'VAT', 336, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (100,'Honduras','HN' , 'HND', 340, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (101,'Hong Kong','HK' , 'HKG', 344, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (102,'Hungary','HU' , 'HUN', 348, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (103,'Iceland','IS' , 'ISL', 352, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (104,'India','IN' , 'IND', 356, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (105,'Indonesia','ID' , 'IDN', 360, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (106,'Iran (Islamic Republic of)','IR' , 'IRN', 364, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (107,'Iraq','IQ' , 'IRQ', 368, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (108,'Ireland','IE' , 'IRL', 372, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (109,'Isle of Man','IM' , 'IMN', 833, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (110,'Israel','IL' , 'ISR', 376, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (111,'Italy','IT' , 'ITA', 380, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (112,'Jamaica','JM' , 'JAM', 388, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (113,'Japan','JP' , 'JPN', 392, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (114,'Jersey','JE' , 'JEY', 832, 154, 830);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (115,'Jordan','JO' , 'JOR', 400, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (116,'Kazakhstan','KZ' , 'KAZ', 398, 143);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (117,'Kenya','KE' , 'KEN', 404, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (118,'Kiribati','KI' , 'KIR', 296, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (119,'Korea (Democratic People''s Republic of)','KP' , 'PRK', 408, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (120,'Korea, Republic of','KR' , 'KOR', 410, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (121,'Kuwait','KW' , 'KWT', 414, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (122,'Kyrgyzstan','KG' , 'KGZ', 417, 143);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (123,'Lao People''s Democratic Republic','LA' , 'LAO', 418, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (124,'Latvia','LV' , 'LVA', 428, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (125,'Lebanon','LB' , 'LBN', 422, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (126,'Lesotho','LS' , 'LSO', 426, 202, 18);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (127,'Liberia','LR' , 'LBR', 430, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (128,'Libya','LY' , 'LBY', 434, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (129,'Liechtenstein','LI' , 'LIE', 438, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (130,'Lithuania','LT' , 'LTU', 440, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (131,'Luxembourg','LU' , 'LUX', 442, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (132,'Macao','MO' , 'MAC', 446, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (133,'Madagascar','MG' , 'MDG', 450, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (134,'Malawi','MW' , 'MWI', 454, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (135,'Malaysia','MY' , 'MYS', 458, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (136,'Maldives','MV' , 'MDV', 462, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (137,'Mali','ML' , 'MLI', 466, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (138,'Malta','MT' , 'MLT', 470, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (139,'Marshall Islands','MH' , 'MHL', 584, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (140,'Martinique','MQ' , 'MTQ', 474, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (141,'Mauritania','MR' , 'MRT', 478, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (142,'Mauritius','MU' , 'MUS', 480, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (143,'Mayotte','YT' , 'MYT', 175, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (144,'Mexico','MX' , 'MEX', 484, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (145,'Micronesia (Federated States of)','FM' , 'FSM', 583, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (146,'Moldova, Republic of','MD' , 'MDA', 498, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (147,'Monaco','MC' , 'MCO', 492, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (148,'Mongolia','MN' , 'MNG', 496, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (149,'Montenegro','ME' , 'MNE', 499, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (150,'Montserrat','MS' , 'MSR', 500, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (151,'Morocco','MA' , 'MAR', 504, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (152,'Mozambique','MZ' , 'MOZ', 508, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (153,'Myanmar','MM' , 'MMR', 104, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (154,'Namibia','NA' , 'NAM', 516, 202, 18);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (155,'Nauru','NR' , 'NRU', 520, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (156,'Nepal','NP' , 'NPL', 524, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (157,'Netherlands','NL' , 'NLD', 528, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (158,'New Caledonia','NC' , 'NCL', 540, 54);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (159,'New Zealand','NZ' , 'NZL', 554, 53);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (160,'Nicaragua','NI' , 'NIC', 558, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (161,'Niger','NE' , 'NER', 562, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (162,'Nigeria','NG' , 'NGA', 566, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (163,'Niue','NU' , 'NIU', 570, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (164,'Norfolk Island','NF' , 'NFK', 574, 53);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (165,'North Macedonia','MK' , 'MKD', 807, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (166,'Northern Mariana Islands','MP' , 'MNP', 580, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (167,'Norway','NO' , 'NOR', 578, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (168,'Oman','OM' , 'OMN', 512, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (169,'Pakistan','PK' , 'PAK', 586, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (170,'Palau','PW' , 'PLW', 585, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (171,'Palestine, State of','PS' , 'PSE', 275, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (172,'Panama','PA' , 'PAN', 591, 419, 13);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (173,'Papua New Guinea','PG' , 'PNG', 598, 54);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (174,'Paraguay','PY' , 'PRY', 600, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (175,'Peru','PE' , 'PER', 604, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (176,'Philippines','PH' , 'PHL', 608, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (177,'Pitcairn','PN' , 'PCN', 612, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (178,'Poland','PL' , 'POL', 616, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (179,'Portugal','PT' , 'PRT', 620, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (180,'Puerto Rico','PR' , 'PRI', 630, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (181,'Qatar','QA' , 'QAT', 634, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (182,'Réunion','RE' , 'REU', 638, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (183,'Romania','RO' , 'ROU', 642, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (184,'Russian Federation','RU' , 'RUS', 643, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (185,'Rwanda','RW' , 'RWA', 646, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (186,'Saint Barthélemy','BL' , 'BLM', 652, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (187,'Saint Helena, Ascension and Tristan da Cunha','SH' , 'SHN', 654, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (188,'Saint Kitts and Nevis','KN' , 'KNA', 659, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (189,'Saint Lucia','LC' , 'LCA', 662, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (190,'Saint Martin (French part)','MF' , 'MAF', 663, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (191,'Saint Pierre and Miquelon','PM' , 'SPM', 666, 21);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (192,'Saint Vincent and the Grenadines','VC' , 'VCT', 670, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (193,'Samoa','WS' , 'WSM', 882, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (194,'San Marino','SM' , 'SMR', 674, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (195,'Sao Tome and Principe','ST' , 'STP', 678, 202, 17);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (196,'Saudi Arabia','SA' , 'SAU', 682, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (197,'Senegal','SN' , 'SEN', 686, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (198,'Serbia','RS' , 'SRB', 688, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (199,'Seychelles','SC' , 'SYC', 690, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (200,'Sierra Leone','SL' , 'SLE', 694, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (201,'Singapore','SG' , 'SGP', 702, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (202,'Sint Maarten (Dutch part)','SX' , 'SXM', 534, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (203,'Slovakia','SK' , 'SVK', 703, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (204,'Slovenia','SI' , 'SVN', 705, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (205,'Solomon Islands','SB' , 'SLB', 90, 54);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (206,'Somalia','SO' , 'SOM', 706, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (207,'South Africa','ZA' , 'ZAF', 710, 202, 18);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (208,'South Georgia and the South Sandwich Islands','GS' , 'SGS', 239, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (209,'South Sudan','SS' , 'SSD', 728, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (210,'Spain','ES' , 'ESP', 724, 39);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (211,'Sri Lanka','LK' , 'LKA', 144, 34);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (212,'Sudan','SD' , 'SDN', 729, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (213,'Suriname','SR' , 'SUR', 740, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (214,'Svalbard and Jan Mayen','SJ' , 'SJM', 744, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (215,'Sweden','SE' , 'SWE', 752, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (216,'Switzerland','CH' , 'CHE', 756, 155);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (217,'Syrian Arab Republic','SY' , 'SYR', 760, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (218,'Taiwan, Province of China','TW' , 'TWN', 158, 30);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (219,'Tajikistan','TJ' , 'TJK', 762, 143);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (220,'Tanzania, United Republic of','TZ' , 'TZA', 834, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (221,'Thailand','TH' , 'THA', 764, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (222,'Timor-Leste','TL' , 'TLS', 626, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (223,'Togo','TG' , 'TGO', 768, 202, 11);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (224,'Tokelau','TK' , 'TKL', 772, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (225,'Tonga','TO' , 'TON', 776, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (226,'Trinidad and Tobago','TT' , 'TTO', 780, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (227,'Tunisia','TN' , 'TUN', 788, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (228,'Turkey','TR' , 'TUR', 792, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (229,'Turkmenistan','TM' , 'TKM', 795, 143);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (230,'Turks and Caicos Islands','TC' , 'TCA', 796, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (231,'Tuvalu','TV' , 'TUV', 798, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (232,'Uganda','UG' , 'UGA', 800, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (233,'Ukraine','UA' , 'UKR', 804, 151);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (234,'United Arab Emirates','AE' , 'ARE', 784, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (235,'United Kingdom of Great Britain and Northern Ireland','GB' , 'GBR', 826, 154);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (236,'United States of America','US' , 'USA', 840, 21);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (237,'United States Minor Outlying Islands','UM' , 'UMI', 581, 57);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (238,'Uruguay','UY' , 'URY', 858, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (239,'Uzbekistan','UZ' , 'UZB', 860, 143);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (240,'Vanuatu','VU' , 'VUT', 548, 54);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (241,'Venezuela (Bolivarian Republic of)','VE' , 'VEN', 862, 419, 5);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (242,'Viet Nam','VN' , 'VNM', 704, 35);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (243,'Virgin Islands (British)','VG' , 'VGB', 92, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (244,'Virgin Islands (U.S.)','VI' , 'VIR', 850, 419, 29);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (245,'Wallis and Futuna','WF' , 'WLF', 876, 61);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (246,'Western Sahara','EH' , 'ESH', 732, 15);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID) VALUES (247,'Yemen','YE' , 'YEM', 887, 145);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (248,'Zambia','ZM' , 'ZMB', 894, 202, 14);
INSERT INTO Countries (CountryID, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionID, IntermediateRegionID) VALUES (249,'Zimbabwe','ZW' , 'ZWE', 716, 202, 14);
SET IDENTITY_INSERT Countries OFF;

SET IDENTITY_INSERT CountryLanguages ON;
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (1,1, 41, 'Afghanistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (2,2, 41, 'Åland Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (3,3, 41, 'Albania');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (4,4, 41, 'Algeria');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (5,5, 41, 'American Samoa');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (6,6, 41, 'Andorra');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (7,7, 41, 'Angola');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (8,8, 41, 'Anguilla');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (9,9, 41, 'Antarctica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (10,10, 41, 'Antigua and Barbuda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (11,11, 41, 'Argentina');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (12,12, 41, 'Armenia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (13,13, 41, 'Aruba');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (14,14, 41, 'Australia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (15,15, 41, 'Austria');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (16,16, 41, 'Azerbaijan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (17,17, 41, 'Bahamas');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (18,18, 41, 'Bahrain');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (19,19, 41, 'Bangladesh');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (20,20, 41, 'Barbados');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (21,21, 41, 'Belarus');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (22,22, 41, 'Belgium');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (23,23, 41, 'Belize');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (24,24, 41, 'Benin');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (25,25, 41, 'Bermuda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (26,26, 41, 'Bhutan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (27,27, 41, 'Bolivia (Plurinational State of)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (28,28, 41, 'Bonaire, Sint Eustatius and Saba');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (29,29, 41, 'Bosnia and Herzegovina');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (30,30, 41, 'Botswana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (31,31, 41, 'Bouvet Island');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (32,32, 41, 'Brazil');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (33,33, 41, 'British Indian Ocean Territory');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (34,34, 41, 'Brunei Darussalam');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (35,35, 41, 'Bulgaria');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (36,36, 41, 'Burkina Faso');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (37,37, 41, 'Burundi');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (38,38, 41, 'Cabo Verde');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (39,39, 41, 'Cambodia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (40,40, 41, 'Cameroon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (41,41, 41, 'Canada');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (42,42, 41, 'Cayman Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (43,43, 41, 'Central African Republic');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (44,44, 41, 'Chad');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (45,45, 41, 'Chile');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (46,46, 41, 'China');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (47,47, 41, 'Christmas Island');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (48,48, 41, 'Cocos (Keeling) Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (49,49, 41, 'Colombia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (50,50, 41, 'Comoros');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (51,51, 41, 'Congo');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (52,52, 41, 'Congo, Democratic Republic of the');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (53,53, 41, 'Cook Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (54,54, 41, 'Costa Rica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (55,55, 41, 'Côte d''Ivoire');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (56,56, 41, 'Croatia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (57,57, 41, 'Cuba');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (58,58, 41, 'Curaçao');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (59,59, 41, 'Cyprus');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (60,60, 41, 'Czechia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (61,61, 41, 'Denmark');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (62,62, 41, 'Djibouti');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (63,63, 41, 'Dominica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (64,64, 41, 'Dominican Republic');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (65,65, 41, 'Ecuador');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (66,66, 41, 'Egypt');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (67,67, 41, 'El Salvador');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (68,68, 41, 'Equatorial Guinea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (69,69, 41, 'Eritrea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (70,70, 41, 'Estonia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (71,71, 41, 'Eswatini');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (72,72, 41, 'Ethiopia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (73,73, 41, 'Falkland Islands (Malvinas)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (74,74, 41, 'Faroe Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (75,75, 41, 'Fiji');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (76,76, 41, 'Finland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (77,77, 41, 'France');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (78,78, 41, 'French Guiana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (79,79, 41, 'French Polynesia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (80,80, 41, 'French Southern Territories');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (81,81, 41, 'Gabon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (82,82, 41, 'Gambia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (83,83, 41, 'Georgia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (84,84, 41, 'Germany');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (85,85, 41, 'Ghana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (86,86, 41, 'Gibraltar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (87,87, 41, 'Greece');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (88,88, 41, 'Greenland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (89,89, 41, 'Grenada');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (90,90, 41, 'Guadeloupe');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (91,91, 41, 'Guam');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (92,92, 41, 'Guatemala');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (93,93, 41, 'Guernsey');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (94,94, 41, 'Guinea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (95,95, 41, 'Guinea-Bissau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (96,96, 41, 'Guyana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (97,97, 41, 'Haiti');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (98,98, 41, 'Heard Island and McDonald Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (99,99, 41, 'Holy See');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (100,100, 41, 'Honduras');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (101,101, 41, 'Hong Kong');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (102,102, 41, 'Hungary');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (103,103, 41, 'Iceland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (104,104, 41, 'India');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (105,105, 41, 'Indonesia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (106,106, 41, 'Iran (Islamic Republic of)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (107,107, 41, 'Iraq');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (108,108, 41, 'Ireland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (109,109, 41, 'Isle of Man');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (110,110, 41, 'Israel');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (111,111, 41, 'Italy');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (112,112, 41, 'Jamaica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (113,113, 41, 'Japan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (114,114, 41, 'Jersey');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (115,115, 41, 'Jordan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (116,116, 41, 'Kazakhstan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (117,117, 41, 'Kenya');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (118,118, 41, 'Kiribati');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (119,119, 41, 'Korea (Democratic People''s Republic of)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (120,120, 41, 'Korea, Republic of');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (121,121, 41, 'Kuwait');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (122,122, 41, 'Kyrgyzstan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (123,123, 41, 'Lao People''s Democratic Republic');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (124,124, 41, 'Latvia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (125,125, 41, 'Lebanon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (126,126, 41, 'Lesotho');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (127,127, 41, 'Liberia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (128,128, 41, 'Libya');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (129,129, 41, 'Liechtenstein');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (130,130, 41, 'Lithuania');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (131,131, 41, 'Luxembourg');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (132,132, 41, 'Macao');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (133,133, 41, 'Madagascar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (134,134, 41, 'Malawi');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (135,135, 41, 'Malaysia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (136,136, 41, 'Maldives');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (137,137, 41, 'Mali');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (138,138, 41, 'Malta');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (139,139, 41, 'Marshall Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (140,140, 41, 'Martinique');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (141,141, 41, 'Mauritania');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (142,142, 41, 'Mauritius');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (143,143, 41, 'Mayotte');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (144,144, 41, 'Mexico');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (145,145, 41, 'Micronesia (Federated States of)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (146,146, 41, 'Moldova, Republic of');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (147,147, 41, 'Monaco');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (148,148, 41, 'Mongolia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (149,149, 41, 'Montenegro');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (150,150, 41, 'Montserrat');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (151,151, 41, 'Morocco');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (152,152, 41, 'Mozambique');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (153,153, 41, 'Myanmar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (154,154, 41, 'Namibia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (155,155, 41, 'Nauru');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (156,156, 41, 'Nepal');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (157,157, 41, 'Netherlands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (158,158, 41, 'New Caledonia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (159,159, 41, 'New Zealand');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (160,160, 41, 'Nicaragua');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (161,161, 41, 'Niger');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (162,162, 41, 'Nigeria');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (163,163, 41, 'Niue');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (164,164, 41, 'Norfolk Island');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (165,165, 41, 'North Macedonia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (166,166, 41, 'Northern Mariana Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (167,167, 41, 'Norway');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (168,168, 41, 'Oman');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (169,169, 41, 'Pakistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (170,170, 41, 'Palau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (171,171, 41, 'Palestine, State of');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (172,172, 41, 'Panama');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (173,173, 41, 'Papua New Guinea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (174,174, 41, 'Paraguay');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (175,175, 41, 'Peru');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (176,176, 41, 'Philippines');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (177,177, 41, 'Pitcairn');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (178,178, 41, 'Poland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (179,179, 41, 'Portugal');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (180,180, 41, 'Puerto Rico');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (181,181, 41, 'Qatar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (182,182, 41, 'Réunion');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (183,183, 41, 'Romania');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (184,184, 41, 'Russian Federation');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (185,185, 41, 'Rwanda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (186,186, 41, 'Saint Barthélemy');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (187,187, 41, 'Saint Helena, Ascension and Tristan da Cunha');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (188,188, 41, 'Saint Kitts and Nevis');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (189,189, 41, 'Saint Lucia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (190,190, 41, 'Saint Martin (French part)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (191,191, 41, 'Saint Pierre and Miquelon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (192,192, 41, 'Saint Vincent and the Grenadines');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (193,193, 41, 'Samoa');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (194,194, 41, 'San Marino');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (195,195, 41, 'Sao Tome and Principe');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (196,196, 41, 'Saudi Arabia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (197,197, 41, 'Senegal');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (198,198, 41, 'Serbia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (199,199, 41, 'Seychelles');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (200,200, 41, 'Sierra Leone');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (201,201, 41, 'Singapore');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (202,202, 41, 'Sint Maarten (Dutch part)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (203,203, 41, 'Slovakia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (204,204, 41, 'Slovenia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (205,205, 41, 'Solomon Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (206,206, 41, 'Somalia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (207,207, 41, 'South Africa');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (208,208, 41, 'South Georgia and the South Sandwich Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (209,209, 41, 'South Sudan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (210,210, 41, 'Spain');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (211,211, 41, 'Sri Lanka');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (212,212, 41, 'Sudan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (213,213, 41, 'Suriname');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (214,214, 41, 'Svalbard and Jan Mayen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (215,215, 41, 'Sweden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (216,216, 41, 'Switzerland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (217,217, 41, 'Syrian Arab Republic');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (218,218, 41, 'Taiwan, Province of China');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (219,219, 41, 'Tajikistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (220,220, 41, 'Tanzania, United Republic of');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (221,221, 41, 'Thailand');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (222,222, 41, 'Timor-Leste');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (223,223, 41, 'Togo');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (224,224, 41, 'Tokelau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (225,225, 41, 'Tonga');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (226,226, 41, 'Trinidad and Tobago');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (227,227, 41, 'Tunisia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (228,228, 41, 'Turkey');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (229,229, 41, 'Turkmenistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (230,230, 41, 'Turks and Caicos Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (231,231, 41, 'Tuvalu');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (232,232, 41, 'Uganda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (233,233, 41, 'Ukraine');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (234,234, 41, 'United Arab Emirates');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (235,235, 41, 'United Kingdom of Great Britain and Northern Ireland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (236,236, 41, 'United States of America');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (237,237, 41, 'United States Minor Outlying Islands');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (238,238, 41, 'Uruguay');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (239,239, 41, 'Uzbekistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (240,240, 41, 'Vanuatu');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (241,241, 41, 'Venezuela (Bolivarian Republic of)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (242,242, 41, 'Viet Nam');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (243,243, 41, 'Virgin Islands (British)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (244,244, 41, 'Virgin Islands (U.S.)');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (245,245, 41, 'Wallis and Futuna');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (246,246, 41, 'Western Sahara');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (247,247, 41, 'Yemen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (248,248, 41, 'Zambia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (249,249, 41, 'Zimbabwe');

INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (250,1, 39, 'Afghanistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (251,2, 39, 'Åland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (252,3, 39, 'Albanië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (253,4, 39, 'Algerije');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (254,5, 39, 'Amerikaans-Samoa');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (255,6, 39, 'Andorra');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (256,7, 39, 'Angola');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (257,8, 39, 'Anguilla');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (258,9, 39, 'Antarctica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (259,10, 39, 'Antigua en Barbuda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (260,11, 39, 'Argentinië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (261,12, 39, 'Armenië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (262,13, 39, 'Aruba');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (263,14, 39, 'Australië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (264,15, 39, 'Oostenrijk');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (265,16, 39, 'Azerbeidzjan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (266,17, 39, 'Bahama''s');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (267,18, 39, 'Bahrein');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (268,19, 39, 'Bangladesh');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (269,20, 39, 'Barbados');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (270,21, 39, 'Wit-Rusland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (271,22, 39, 'België');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (272,23, 39, 'Belize');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (273,24, 39, 'Benin');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (274,25, 39, 'Bermuda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (275,26, 39, 'Bhutan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (276,27, 39, 'Bolivia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (277,28, 39, 'Caribisch Nederland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (278,29, 39, 'Bosnië en Herzegovina');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (279,30, 39, 'Botswana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (280,31, 39, 'Bouveteiland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (281,32, 39, 'Brazilië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (282,33, 39, 'Brits Indische Oceaanterritorium');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (283,34, 39, 'Brunei');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (284,35, 39, 'Bulgarije');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (285,36, 39, 'Burkina Faso');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (286,37, 39, 'Burundi');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (287,38, 39, 'Kaapverdië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (288,39, 39, 'Cambodja');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (289,40, 39, 'Kameroen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (290,41, 39, 'Canada');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (291,42, 39, 'Kaaimaneilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (292,43, 39, 'Centraal-Afrikaanse Republiek');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (293,44, 39, 'Tsjaad');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (294,45, 39, 'Chili');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (295,46, 39, 'China');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (296,47, 39, 'Christmaseiland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (297,48, 39, 'Cocoseilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (298,49, 39, 'Colombia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (299,50, 39, 'Comoren');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (300,51, 39, 'Congo-Brazzaville');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (301,52, 39, 'Congo-Kinshasa');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (302,53, 39, 'Cookeilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (303,54, 39, 'Costa Rica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (304,55, 39, 'Ivoorkust');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (305,56, 39, 'Kroatië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (306,57, 39, 'Cuba');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (307,58, 39, 'Curaçao');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (308,59, 39, 'Cyprus');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (309,60, 39, 'Tsjechië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (310,61, 39, 'Denemarken');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (311,62, 39, 'Djibouti');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (312,63, 39, 'Dominica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (313,64, 39, 'Dominicaanse Republiek');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (314,65, 39, 'Ecuador');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (315,66, 39, 'Egypte');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (316,67, 39, 'El Salvador');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (317,68, 39, 'Equatoriaal-Guinea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (318,69, 39, 'Eritrea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (319,70, 39, 'Estland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (320,71, 39, 'Swaziland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (321,72, 39, 'Ethiopië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (322,73, 39, 'Falklandeilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (323,74, 39, 'Faeröer');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (324,75, 39, 'Fiji');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (325,76, 39, 'Finland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (326,77, 39, 'Frankrijk');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (327,78, 39, 'Frans-Guyana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (328,79, 39, 'Frans-Polynesië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (329,80, 39, 'Franse Zuidelijke en Antarctische Gebieden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (330,81, 39, 'Gabon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (331,82, 39, 'Gambia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (332,83, 39, 'Georgië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (333,84, 39, 'Duitsland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (334,85, 39, 'Ghana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (335,86, 39, 'Gibraltar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (336,87, 39, 'Griekenland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (337,88, 39, 'Groenland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (338,89, 39, 'Grenada');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (339,90, 39, 'Guadeloupe');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (340,91, 39, 'Guam');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (341,92, 39, 'Guatemala');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (342,93, 39, 'Guernsey');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (343,94, 39, 'Guinee');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (344,95, 39, 'Guinee-Bissau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (345,96, 39, 'Guyana');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (346,97, 39, 'Haïti');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (347,98, 39, 'Heard en McDonaldeilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (348,99, 39, 'Vaticaanstad');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (349,100, 39, 'Honduras');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (350,101, 39, 'Hongkong');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (351,102, 39, 'Hongarije');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (352,103, 39, 'IJsland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (353,104, 39, 'India');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (354,105, 39, 'Indonesië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (355,106, 39, 'Iran');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (356,107, 39, 'Irak');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (357,108, 39, 'Ierland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (358,109, 39, 'Man');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (359,110, 39, 'Israël');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (360,111, 39, 'Italië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (361,112, 39, 'Jamaica');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (362,113, 39, 'Japan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (363,114, 39, 'Jersey');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (364,115, 39, 'Jordanië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (365,116, 39, 'Kazachstan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (366,117, 39, 'Kenia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (367,118, 39, 'Kiribati');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (368,119, 39, 'Noord-Korea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (369,120, 39, 'Zuid-Korea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (370,121, 39, 'Koeweit');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (371,122, 39, 'Kirgizië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (372,123, 39, 'Laos');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (373,124, 39, 'Letland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (374,125, 39, 'Libanon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (375,126, 39, 'Lesotho');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (376,127, 39, 'Liberia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (377,128, 39, 'Libië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (378,129, 39, 'Liechtenstein');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (379,130, 39, 'Litouwen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (380,131, 39, 'Luxemburg');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (381,132, 39, 'Macau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (382,133, 39, 'Madagaskar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (383,134, 39, 'Malawi');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (384,135, 39, 'Maleisië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (385,136, 39, 'Maldiven');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (386,137, 39, 'Mali');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (387,138, 39, 'Malta');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (388,139, 39, 'Marshalleilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (389,140, 39, 'Martinique');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (390,141, 39, 'Mauritanië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (391,142, 39, 'Mauritius');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (392,143, 39, 'Mayotte');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (393,144, 39, 'Mexico');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (394,145, 39, 'Micronesia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (395,146, 39, 'Moldavië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (396,147, 39, 'Monaco');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (397,148, 39, 'Mongolië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (398,149, 39, 'Montenegro');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (399,150, 39, 'Montserrat');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (400,151, 39, 'Marokko');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (401,152, 39, 'Mozambique');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (402,153, 39, 'Myanmar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (403,154, 39, 'Namibië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (404,155, 39, 'Nauru');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (405,156, 39, 'Nepal');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (406,157, 39, 'Nederland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (407,158, 39, 'Nieuw-Caledonië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (408,159, 39, 'Nieuw-Zeeland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (409,160, 39, 'Nicaragua');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (410,161, 39, 'Niger');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (411,162, 39, 'Nigeria');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (412,163, 39, 'Niue');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (413,164, 39, 'Norfolk');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (414,165, 39, 'Noord-Macedonië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (415,166, 39, 'Noordelijke Marianen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (416,167, 39, 'Noorwegen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (417,168, 39, 'Oman');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (418,169, 39, 'Pakistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (419,170, 39, 'Palau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (420,171, 39, 'Palestina');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (421,172, 39, 'Panama');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (422,173, 39, 'Papoea-Nieuw-Guinea');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (423,174, 39, 'Paraguay');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (424,175, 39, 'Peru');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (425,176, 39, 'Filipijnen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (426,177, 39, 'Pitcairneilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (427,178, 39, 'Polen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (428,179, 39, 'Portugal');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (429,180, 39, 'Puerto Rico');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (430,181, 39, 'Qatar');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (431,182, 39, 'Réunion');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (432,183, 39, 'Roemenië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (433,184, 39, 'Rusland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (434,185, 39, 'Rwanda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (435,186, 39, 'Saint-Barthélemy');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (436,187, 39, 'Sint-Helena, Ascension en Tristan da Cunha');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (437,188, 39, 'Saint Kitts en Nevis');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (438,189, 39, 'Saint Lucia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (439,190, 39, 'Sint-Maarten');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (440,191, 39, 'Saint-Pierre en Miquelon');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (441,192, 39, 'Saint Vincent en de Grenadines');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (442,193, 39, 'Samoa');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (443,194, 39, 'San Marino');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (444,195, 39, 'Sao Tomé en Principe');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (445,196, 39, 'Saoedi-Arabië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (446,197, 39, 'Senegal');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (447,198, 39, 'Servië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (448,199, 39, 'Seychellen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (449,200, 39, 'Sierra Leone');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (450,201, 39, 'Singapore');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (451,202, 39, 'Sint Maarten');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (452,203, 39, 'Slowakije');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (453,204, 39, 'Slovenië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (454,205, 39, 'Salomonseilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (455,206, 39, 'Somalië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (456,207, 39, 'Zuid-Afrika');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (457,208, 39, 'Zuid-Georgia en de Zuidelijke Sandwicheilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (458,209, 39, 'Zuid-Soedan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (459,210, 39, 'Spanje');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (460,211, 39, 'Sri Lanka');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (461,212, 39, 'Soedan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (462,213, 39, 'Suriname');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (463,214, 39, 'Spitsbergen en Jan Mayen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (464,215, 39, 'Zweden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (465,216, 39, 'Zwitserland');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (466,217, 39, 'Syrië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (467,218, 39, 'Taiwan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (468,219, 39, 'Tadzjikistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (469,220, 39, 'Tanzania');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (470,221, 39, 'Thailand');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (471,222, 39, 'Oost-Timor');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (472,223, 39, 'Togo');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (473,224, 39, 'Tokelau');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (474,225, 39, 'Tonga');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (475,226, 39, 'Trinidad en Tobago');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (476,227, 39, 'Tunesië');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (477,228, 39, 'Turkije');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (478,229, 39, 'Turkmenistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (479,230, 39, 'Turks- en Caicoseilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (480,231, 39, 'Tuvalu');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (481,232, 39, 'Oeganda');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (482,233, 39, 'Oekraïne');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (483,234, 39, 'Verenigde Arabische Emiraten');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (484,235, 39, 'Verenigd Koninkrijk');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (485,236, 39, 'Verenigde Staten');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (486,237, 39, 'Kleine afgelegen eilanden van de Verenigde Staten');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (487,238, 39, 'Uruguay');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (488,239, 39, 'Oezbekistan');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (489,240, 39, 'Vanuatu');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (490,241, 39, 'Venezuela');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (491,242, 39, 'Vietnam');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (492,243, 39, 'Britse Maagdeneilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (493,244, 39, 'Amerikaanse Maagdeneilanden');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (494,245, 39, 'Wallis en Futuna');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (495,246, 39, 'Westelijke Sahara');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (496,247, 39, 'Jemen');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (497,248, 39, 'Zambia');
INSERT INTO CountryLanguages (CountryLanguageID, CountryID, LanguageID, Name) VALUES (498,249, 39, 'Zimbabwe');
SET IDENTITY_INSERT CountryLanguages OFF;


SET IDENTITY_INSERT LeftMenus ON;

INSERT INTO LeftMenus (LeftMenuID, Name, HasMenu, MenuController, MenuAction, MenuImageName, HasAdd, AddController, AddAction, AddImageName, HasSearch, SearchController, SearchAction, SearchImageName, HasAdvancedSearch, AdvancedSearchController, AdvancedSearchAction, AdvancedSearchImageName) VALUES 
(1, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(2, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(3, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(4, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(5, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(6, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(7, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(8, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(9, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(10, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(11, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(12, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(13, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(14, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(15, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
,(16, 1, '','','',1, 1, '','','',1, 1, '','','',1, 1, '','','')
SET IDENTITY_INSERT LeftMenus OFF;


SELECT * FROM LeftMenuLanguages
SET IDENTITY_INSERT LeftMenusLanguage ON;
INSERT INTO LeftMenuLanguages ( LeftMenuLanguageID, LeftMenuID, LanguageID, Name, Description, MenuName, MenuMouseOver, AddName, AddMouseOver, SearchName, SearchMouseOver, AdvancedSearchName, AdvancedSearchMouseOver) VALUES 
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
SET IDENTITY_INSERT LeftMenusLanguage OFF;

