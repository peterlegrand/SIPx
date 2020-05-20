USE sip
DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT Statuses ON;
INSERT INTO Statuses (StatusId) VALUES (1), (2);
SET IDENTITY_INSERT Statuses OFF;

SET IDENTITY_INSERT Languages ON;
INSERT INTO Languages (LanguageID, LanguageName, ForeignName, ISO6391, ISO6392, StatusID, ModifierID, ModifiedDate) VALUES 
  (1, 'Abkhazian', N'аҧсуа бызшәа, аҧсшәа', 'ab', 'abk', 2, @User, getdate())
, (2, 'Afar', N'Afaraf', 'aa', 'aar', 2, @User, getdate()) 
, (3, 'Afrikaans', N'Afrikaans', 'af', 'afr', 2, @User, getdate()) 
, (4, 'Akan', N'Akan', 'ak', 'aka', 2, @User, getdate()) 
, (5, 'Albanian', N'Shqip', 'sq', 'sqi', 2, @User, getdate()) 
, (6, 'Amharic', N'አማርኛ', 'am', 'amh', 2, @User, getdate()) 
, (7, 'Arabic', N'العربية', 'ar', 'ara', 2, @User, getdate()) 
, (8, 'Aragonese', N'aragonés', 'an', 'arg', 2, @User, getdate()) 
, (9, 'Armenian', N'Հայերեն', 'hy', 'hye', 2, @User, getdate()) 
, (10, 'Assamese', N'অসমীয়া', 'as', 'asm', 2, @User, getdate()) 
, (11, 'Avaric', N'авар мацӀ, магӀарул мацӀ', 'av', 'ava', 2, @User, getdate()) 
, (12, 'Avestan', N'avesta', 'ae', 'ave', 2, @User, getdate()) 
, (13, 'Aymara', N'aymar aru', 'ay', 'aym', 2, @User, getdate()) 
, (14, 'Azerbaijani', N'azərbaycan dili', 'az', 'aze', 2, @User, getdate()) 
, (15, 'Bambara', N'bamanankan', 'bm', 'bam', 2, @User, getdate()) 
, (16, 'Bashkir', N'башҡорт теле', 'ba', 'bak', 2, @User, getdate()) 
, (17, 'Basque', N'euskara, euskera', 'eu', 'eus', 2, @User, getdate()) 
, (18, 'Belarusian', N'беларуская мова', 'be', 'bel', 2, @User, getdate()) 
, (19, 'Bengali', N'বাংলা', 'bn', 'ben', 2, @User, getdate()) 
, (20, 'Bihari languages', N'भोजपुरी', 'bh', 'bih', 2, @User, getdate()) 
, (21, 'Bislama', N'Bislama', 'bi', 'bis', 2, @User, getdate()) 
, (22, 'Bosnian', N'bosanski jezik', 'bs', 'bos', 2, @User, getdate()) 
, (23, 'Breton', N'brezhoneg', 'br', 'bre', 2, @User, getdate()) 
, (24, 'Bulgarian', N'български език', 'bg', 'bul', 2, @User, getdate()) 
, (25, 'Burmese', N'ဗမာစာ', 'my', 'mya', 2, @User, getdate()) 
, (26, 'Catalan, Valencian', N'català, valencià', 'ca', 'cat', 2, @User, getdate()) 
, (27, 'Chamorro', N'Chamoru', 'ch', 'cha', 2, @User, getdate()) 
, (28, 'Chechen', N'нохчийн мотт', 'ce', 'che', 2, @User, getdate()) 
, (29, 'Chichewa, Chewa, Nyanja', N'chiCheŵa, chinyanja', 'ny', 'nya', 2, @User, getdate()) 
, (30, 'Chinese', N'中文 (Zhōngwén), 汉语, 漢語', 'zh', 'zho', 2, @User, getdate()) 
, (31, 'Chuvash', N'чӑваш чӗлхи', 'cv', 'chv', 2, @User, getdate()) 
, (32, 'Cornish', N'Kernewek', 'kw', 'cor', 2, @User, getdate()) 
, (33, 'Corsican', N'corsu, lingua corsa', 'co', 'cos', 2, @User, getdate()) 
, (34, 'Cree', N'ᓀᐦᐃᔭᐍᐏᐣ', 'cr', 'cre', 2, @User, getdate()) 
, (35, 'Croatian', N'hrvatski jezik', 'hr', 'hrv', 2, @User, getdate()) 
, (36, 'Czech', N'čeština, český jazyk', 'cs', 'ces', 2, @User, getdate()) 
, (37, 'Danish', N'dansk', 'da', 'dan', 2, @User, getdate()) 
, (38, 'Divehi, Dhivehi, Maldivian', N'ދިވެހި', 'dv', 'div', 2, @User, getdate()) 
, (39, 'Dutch, Flemish', N'Nederlands, Vlaams', 'nl', 'nld', 1, @User, getdate()) 
, (40, 'Dzongkha', N'རྫོང་ཁ', 'dz', 'dzo', 2, @User, getdate()) 
, (41, 'English', N'English', 'en', 'eng', 1, @User, getdate())
, (42, 'Esperanto', N'Esperanto', 'eo', 'epo', 2, @User, getdate()) 
, (43, 'Estonian', N'eesti, eesti keel', 'et', 'est', 2, @User, getdate()) 
, (44, 'Ewe', N'Eʋegbe', 'ee', 'ewe', 2, @User, getdate()) 
, (45, 'Faroese', N'føroyskt', 'fo', 'fao', 2, @User, getdate()) 
, (46, 'Fijian', N'vosa Vakaviti', 'fj', 'fij', 2, @User, getdate()) 
, (47, 'Finnish', N'suomi, suomen kieli', 'fi', 'fin', 2, @User, getdate()) 
, (48, 'French', N'français, langue française', 'fr', 'fra', 2, @User, getdate()) 
, (49, 'Fulah', N'Fulfulde, Pulaar, Pular', 'ff', 'ful', 2, @User, getdate()) 
, (50, 'Galician', N'Galego', 'gl', 'glg', 2, @User, getdate()) 
, (51, 'Georgian', N'ქართული', 'ka', 'kat', 2, @User, getdate()) 
, (52, 'German', N'Deutsch', 'de', 'deu', 2, @User, getdate()) 
, (53, 'Greek, Modern (1453-)', N'ελληνικά', 'el', 'ell', 2, @User, getdate()) 
, (54, 'Guarani', N'Avañe''ẽ', 'gn', 'grn', 2, @User, getdate()) 
, (55, 'Gujarati', N'ગુજરાતી', 'gu', 'guj', 2, @User, getdate()) 
, (56, 'Haitian, Haitian Creole', N'Kreyòl ayisyen', 'ht', 'hat', 2, @User, getdate()) 
, (57, 'Hausa', N'(Hausa) هَوُسَ', 'ha', 'hau', 2, @User, getdate()) 
, (58, 'Hebrew', N'עברית', 'he', 'heb', 2, @User, getdate()) 
, (59, 'Herero', N'Otjiherero', 'hz', 'her', 2, @User, getdate()) 
, (60, 'Hindi', N'हिन्दी, हिंदी', 'hi', 'hin', 2, @User, getdate()) 
, (61, 'Hiri Motu', N'Hiri Motu', 'ho', 'hmo', 2, @User, getdate()) 
, (62, 'Hungarian', N'magyar', 'hu', 'hun', 2, @User, getdate()) 
, (63, 'Interlingua', N'Interlingua', 'ia', 'ina', 2, @User, getdate()) 
, (64, 'Indonesian', N'Bahasa Indonesia', 'id', 'ind', 2, @User, getdate()) 
, (65, 'Interlingue, Occidental', N'(originally:) Occidental, (after WWII:) Interlingue', 'ie', 'ile', 2, @User, getdate()) 
, (66, 'Irish', N'Gaeilge', 'ga', 'gle', 2, @User, getdate()) 
, (67, 'Igbo', N'Asụsụ Igbo', 'ig', 'ibo', 2, @User, getdate()) 
, (68, 'Inupiaq', N'Iñupiaq, Iñupiatun', 'ik', 'ipk', 2, @User, getdate()) 
, (69, 'Ido', N'Ido', 'io', 'ido', 2, @User, getdate()) 
, (70, 'Icelandic', N'Íslenska', 'is', 'isl', 2, @User, getdate()) 
, (71, 'Italian', N'Italiano', 'it', 'ita', 2, @User, getdate()) 
, (72, 'Inuktitut', N'ᐃᓄᒃᑎᑐᑦ', 'iu', 'iku', 2, @User, getdate()) 
, (73, 'Japanese', N'日本語 (にほんご)', 'ja', 'jpn', 2, @User, getdate()) 
, (74, 'Javanese', N'ꦧꦱꦗꦮ, Basa Jawa', 'jv', 'jav', 2, @User, getdate()) 
, (75, 'Kalaallisut, Greenlandic', N'kalaallisut, kalaallit oqaasii', 'kl', 'kal', 2, @User, getdate()) 
, (76, 'Kannada', N'ಕನ್ನಡ', 'kn', 'kan', 2, @User, getdate()) 
, (77, 'Kanuri', N'Kanuri', 'kr', 'kau', 2, @User, getdate()) 
, (78, 'Kashmiri', N'कश्मीरी, كشميري‎', 'ks', 'kas', 2, @User, getdate()) 
, (79, 'Kazakh', N'қазақ тілі', 'kk', 'kaz', 2, @User, getdate()) 
, (80, 'Central Khmer', N'ខ្មែរ, ខេមរភាសា, ភាសាខ្មែរ', 'km', 'khm', 2, @User, getdate()) 
, (81, 'Kikuyu, Gikuyu', N'Gĩkũyũ', 'ki', 'kik', 2, @User, getdate()) 
, (82, 'Kinyarwanda', N'Ikinyarwanda', 'rw', 'kin', 2, @User, getdate()) 
, (83, 'Kirghiz, Kyrgyz', N'Кыргызча, Кыргыз тили', 'ky', 'kir', 2, @User, getdate()) 
, (84, 'Komi', N'коми кыв', 'kv', 'kom', 2, @User, getdate()) 
, (85, 'Kongo', N'Kikongo', 'kg', 'kon', 2, @User, getdate()) 
, (86, 'Korean', N'한국어', 'ko', 'kor', 2, @User, getdate()) 
, (87, 'Kurdish', N'Kurdî, کوردی‎', 'ku', 'kur', 2, @User, getdate()) 
, (88, 'Kuanyama, Kwanyama', N'Kuanyama', 'kj', 'kua', 2, @User, getdate()) 
, (89, 'Latin', N'latine, lingua latina', 'la', 'lat', 2, @User, getdate()) 
, (90, 'Luxembourgish, Letzeburgesch', N'Lëtzebuergesch', 'lb', 'ltz', 2, @User, getdate()) 
, (91, 'Ganda', N'Luganda', 'lg', 'lug', 2, @User, getdate()) 
, (92, 'Limburgan, Limburger, Limburgish', N'Limburgs', 'li', 'lim', 2, @User, getdate()) 
, (93, 'Lingala', N'Lingála', 'ln', 'lin', 2, @User, getdate()) 
, (94, 'Lao', N'ພາສາລາວ', 'lo', 'lao', 2, @User, getdate()) 
, (95, 'Lithuanian', N'lietuvių kalba', 'lt', 'lit', 2, @User, getdate()) 
, (96, 'Luba-Katanga', N'Kiluba', 'lu', 'lub', 2, @User, getdate()) 
, (97, 'Latvian', N'latviešu valoda', 'lv', 'lav', 2, @User, getdate()) 
, (98, 'Manx', N'Gaelg, Gailck', 'gv', 'glv', 2, @User, getdate()) 
, (99, 'Macedonian', N'македонски јазик', 'mk', 'mkd', 2, @User, getdate()) 
, (100, 'Malagasy', N'fiteny malagasy', 'mg', 'mlg', 2, @User, getdate()) 
, (101, 'Malay', N'Bahasa Melayu, بهاس ملايو‎', 'ms', 'msa', 2, @User, getdate()) 
, (102, 'Malayalam', N'മലയാളം', 'ml', 'mal', 2, @User, getdate()) 
, (103, 'Maltese', N'Malti', 'mt', 'mlt', 2, @User, getdate()) 
, (104, 'Maori', N'te reo Māori', 'mi', 'mri', 2, @User, getdate()) 
, (105, 'Marathi', N'मराठी', 'mr', 'mar', 2, @User, getdate()) 
, (106, 'Marshallese', N'Kajin M̧ajeļ', 'mh', 'mah', 2, @User, getdate()) 
, (107, 'Mongolian', N'Монгол хэл', 'mn', 'mon', 2, @User, getdate()) 
, (108, 'Nauru', N'Dorerin Naoero', 'na', 'nau', 2, @User, getdate()) 
, (109, 'Navajo, Navaho', N'Diné bizaad', 'nv', 'nav', 2, @User, getdate()) 
, (110, 'North Ndebele', N'isiNdebele', 'nd', 'nde', 2, @User, getdate()) 
, (111, 'Nepali', N'नेपाली', 'ne', 'nep', 2, @User, getdate()) 
, (112, 'Ndonga', N'Owambo', 'ng', 'ndo', 2, @User, getdate()) 
, (113, 'Norwegian Bokmål', N'Norsk Bokmål', 'nb', 'nob', 2, @User, getdate()) 
, (114, 'Norwegian Nynorsk', N'Norsk Nynorsk', 'nn', 'nno', 2, @User, getdate()) 
, (115, 'Norwegian', N'Norsk', 'no', 'nor', 2, @User, getdate()) 
, (116, 'Sichuan Yi, Nuosu', N'ꆈꌠ꒿ Nuosuhxop', 'ii', 'iii', 2, @User, getdate()) 
, (117, 'South Ndebele', N'isiNdebele', 'nr', 'nbl', 2, @User, getdate()) 
, (118, 'Occitan', N'occitan, lenga d''òc', 'oc', 'oci', 2, @User, getdate()) 
, (119, 'Ojibwa', N'ᐊᓂᔑᓈᐯᒧᐎᓐ', 'oj', 'oji', 2, @User, getdate()) 
, (120, 'Church Slavic, Old Slavonic, Church Slavonic', N'ѩзыкъ словѣньскъ', 'cu', 'chu', 2, @User, getdate()) 
, (121, 'Oromo', N'Afaan Oromoo', 'om', 'orm', 2, @User, getdate()) 
, (122, 'Oriya', N'ଓଡ଼ିଆ', 'or', 'ori', 2, @User, getdate()) 
, (123, 'Ossetian, Ossetic', N'ирон æвзаг', 'os', 'oss', 2, @User, getdate()) 
, (124, 'Punjabi, Panjabi', N'ਪੰਜਾਬੀ, پنجابی‎', 'pa', 'pan', 2, @User, getdate()) 
, (125, 'Pali', N'पालि, पाळि', 'pi', 'pli', 2, @User, getdate()) 
, (126, 'Persian', N'فارسی', 'fa', 'fas', 2, @User, getdate()) 
, (127, 'Polish', N'język polski, polszczyzna', 'pl', 'pol', 2, @User, getdate()) 
, (128, 'Pashto, Pushto', N'پښتو', 'ps', 'pus', 2, @User, getdate()) 
, (129, 'Portuguese', N'Português', 'pt', 'por', 2, @User, getdate()) 
, (130, 'Quechua', N'Runa Simi, Kichwa', 'qu', 'que', 2, @User, getdate()) 
, (131, 'Romansh', N'Rumantsch Grischun', 'rm', 'roh', 2, @User, getdate()) 
, (132, 'Rundi', N'Ikirundi', 'rn', 'run', 2, @User, getdate()) 
, (133, 'Romanian, Moldavian, Moldovan', N'Română', 'ro', 'ron', 2, @User, getdate()) 
, (134, 'Russian', N'русский', 'ru', 'rus', 2, @User, getdate()) 
, (135, 'Sanskrit', N'संस्कृतम्', 'sa', 'san', 2, @User, getdate()) 
, (136, 'Sardinian', N'sardu', 'sc', 'srd', 2, @User, getdate()) 
, (137, 'Sindhi', N'सिन्धी, سنڌي، سندھی‎', 'sd', 'snd', 2, @User, getdate()) 
, (138, 'Northern Sami', N'Davvisámegiella', 'se', 'sme', 2, @User, getdate()) 
, (139, 'Samoan', N'gagana fa''a Samoa', 'sm', 'smo', 2, @User, getdate()) 
, (140, 'Sango', N'yângâ tî sängö', 'sg', 'sag', 2, @User, getdate()) 
, (141, 'Serbian', N'српски језик', 'sr', 'srp', 2, @User, getdate()) 
, (142, 'Gaelic, Scottish Gaelic', N'Gàidhlig', 'gd', 'gla', 2, @User, getdate()) 
, (143, 'Shona', N'chiShona', 'sn', 'sna', 2, @User, getdate()) 
, (144, 'Sinhala, Sinhalese', N'සිංහල', 'si', 'sin', 2, @User, getdate()) 
, (145, 'Slovak', N'Slovenčina, Slovenský Jazyk', 'sk', 'slk', 2, @User, getdate()) 
, (146, 'Slovenian', N'Slovenski Jezik, Slovenščina', 'sl', 'slv', 2, @User, getdate()) 
, (147, 'Somali', N'Soomaaliga, af Soomaali', 'so', 'som', 2, @User, getdate()) 
, (148, 'Southern Sotho', N'Sesotho', 'st', 'sot', 2, @User, getdate()) 
, (149, 'Spanish, Castilian', N'Español', 'es', 'spa', 2, @User, getdate()) 
, (150, 'Sundanese', N'Basa Sunda', 'su', 'sun', 2, @User, getdate()) 
, (151, 'Swahili', N'Kiswahili', 'sw', 'swa', 2, @User, getdate()) 
, (152, 'Swati', N'SiSwati', 'ss', 'ssw', 2, @User, getdate()) 
, (153, 'Swedish', N'Svenska', 'sv', 'swe', 2, @User, getdate()) 
, (154, 'Tamil', N'தமிழ்', 'ta', 'tam', 2, @User, getdate()) 
, (155, 'Telugu', N'తెలుగు', 'te', 'tel', 2, @User, getdate()) 
, (156, 'Tajik', N'тоҷикӣ, toçikī, تاجیکی‎', 'tg', 'tgk', 2, @User, getdate()) 
, (157, 'Thai', N'ไทย', 'th', 'tha', 2, @User, getdate()) 
, (158, 'Tigrinya', N'ትግርኛ', 'ti', 'tir', 2, @User, getdate()) 
, (159, 'Tibetan', N'བོད་ཡིག', 'bo', 'bod', 2, @User, getdate()) 
, (160, 'Turkmen', N'Türkmen, Түркмен', 'tk', 'tuk', 2, @User, getdate()) 
, (161, 'Tagalog', N'Wikang Tagalog', 'tl', 'tgl', 2, @User, getdate()) 
, (162, 'Tswana', N'Setswana', 'tn', 'tsn', 2, @User, getdate()) 
, (163, 'Tonga (Tonga Islands)', N'Faka Tonga', 'to', 'ton', 2, @User, getdate()) 
, (164, 'Turkish', N'Türkçe', 'tr', 'tur', 2, @User, getdate()) 
, (165, 'Tsonga', N'Xitsonga', 'ts', 'tso', 2, @User, getdate()) 
, (166, 'Tatar', N'татар теле, tatar tele', 'tt', 'tat', 2, @User, getdate()) 
, (167, 'Twi', N'Twi', 'tw', 'twi', 2, @User, getdate()) 
, (168, 'Tahitian', N'Reo Tahiti', 'ty', 'tah', 2, @User, getdate()) 
, (169, 'Uighur, Uyghur', N'ئۇيغۇرچە‎, Uyghurche', 'ug', 'uig', 2, @User, getdate()) 
, (170, 'Ukrainian', N'Українська', 'uk', 'ukr', 2, @User, getdate()) 
, (171, 'Urdu', N'اردو', 'ur', 'urd', 2, @User, getdate()) 
, (172, 'Uzbek', N'Oʻzbek, Ўзбек, أۇزبېك‎', 'uz', 'uzb', 2, @User, getdate()) 
, (173, 'Venda', N'Tshivenḓa', 've', 'ven', 2, @User, getdate()) 
, (174, 'Vietnamese', N'Tiếng Việt', 'vi', 'vie', 2, @User, getdate()) 
, (175, 'Volapük', N'Volapük', 'vo', 'vol', 2, @User, getdate()) 
, (176, 'Walloon', N'Walon', 'wa', 'wln', 2, @User, getdate()) 
, (177, 'Welsh', N'Cymraeg', 'cy', 'cym', 2, @User, getdate()) 
, (178, 'Wolof', N'Wollof', 'wo', 'wol', 2, @User, getdate()) 
, (179, 'Western Frisian', N'Frysk', 'fy', 'fry', 2, @User, getdate()) 
, (180, 'Xhosa', N'isiXhosa', 'xh', 'xho', 2, @User, getdate()) 
, (181, 'Yiddish', N'ייִדיש', 'yi', 'yid', 2, @User, getdate()) 
, (182, 'Yoruba', N'Yorùbá', 'yo', 'yor', 2, @User, getdate()) 
, (183, 'Zhuang, Chuang', N'Saɯ cueŋƅ, Saw cuengh', 'za', 'zha', 2, @User, getdate()) 
, (184, 'Zulu', N'isiZulu', 'zu', 'zul', 2, @User, getdate()); 
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
INSERT INTO LeftMenus (
	LeftMenuID, HasMenu
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
SET IDENTITY_INSERT LeftMenus OFF;


SET IDENTITY_INSERT LeftMenuLanguages ON;
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
SET IDENTITY_INSERT LeftMenuLanguages OFF;


SET IDENTITY_INSERT ClaimGroups ON;
INSERT INTO ClaimGroups (
	ClaimGroupID, Sequence) VALUES 
(1, 1)
SET IDENTITY_INSERT ClaimGroups OFF;


SET IDENTITY_INSERT ClaimGroupLanguages ON;
INSERT INTO ClaimGroupLanguages ( ClaimGroupLanguageID, ClaimGroupID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
  (1, 1, 41, 'Classification Master', 'Classification Master', 'Classification Master', 'Classification Master')
,  (2, 1, 39, 'Classificering onderhoud', 'Classificering onderhoud', 'Classificering onderhoud', 'Classificering onderhoud')
SET IDENTITY_INSERT ClaimGroupLanguages OFF;


SET IDENTITY_INSERT Claims ON;
INSERT INTO Claims (
	ClaimID, ClaimGroupID, ClaimType, ClaimValue) VALUES 
(1, 1, 'ApplicationRights','ClassificationRead')
, (2, 1, 'ApplicationRights','ClassificationDelete')
, (3, 1, 'ApplicationRights','ClassificationUpdate')
, (4, 1, 'ApplicationRights','ClassificationCreate')
SET IDENTITY_INSERT Claims OFF;


SET IDENTITY_INSERT ClaimLanguages ON;
INSERT INTO ClaimLanguages ( ClaimLanguageID, ClaimID, LanguageID, Name, Description, MenuName, MouseOver) VALUES 
  (1, 1, 41, 'Read classification', 'Read classification', 'Read classification', 'Read classification')
, (2, 2, 41, 'Delete classification', 'Delete classification', 'Delete classification', 'Delete classification')
, (3, 3, 41, 'Update classification', 'Update classification', 'Update classification', 'Update classification')
, (4, 4, 41, 'Create classification', 'Create classification', 'Create classification', 'Create classification')
, (5, 1, 39, 'Classificering lezen', 'Classificering lezen', 'Classificering lezen', 'Classificering lezen')
, (6, 2, 39, 'Classificering verwijderen', 'Classificering verwijderen', 'Classificering verwijderen', 'Classificering verwijderen')
, (7, 3, 39, 'Classificering veranderen', 'Classificering veranderen', 'Classificering veranderen', 'Classificering veranderen')
, (8, 4, 39, 'Classificering toevoegen', 'Classificering toevoegen', 'Classificering toevoegen', 'Classificering toevoegen')
SET IDENTITY_INSERT ClaimLanguages OFF;



SET IDENTITY_INSERT ProcessTemplateFieldTypes ON
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (1);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (2);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (3);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (4);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (5);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (6);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (7);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (8);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (9);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (10);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (11);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (12);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (13);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (14);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (15);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (16);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (17);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (18);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (19);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (20);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (21);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (22);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (23);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (24);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (25);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (26);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (27);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (28);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (29);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (30);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (31);
INSERT INTO ProcessTemplateFieldTypes (ProcessTemplateFieldTypeID) VALUES (32);
SET IDENTITY_INSERT ProcessTemplateFieldTypes OFF


SET IDENTITY_INSERT ProcessTemplateFieldTypeLanguages ON
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (1, 1, 41, 'Primary subject', 'Primary subject', 'Primary subject', 'Primary subject');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (2, 2, 41, 'Text', 'Text', 'Text', 'Text');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (3, 3, 41, 'Number', 'Number', 'Number', 'Number');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (4, 4, 41, 'Date', 'Date', 'Date', 'Date');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (5, 5, 41, 'Date time', 'Date time', 'Date time', 'Date time');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (6, 6, 41, 'From date', 'From date', 'From date', 'From date');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (7, 7, 41, 'To date', 'To date', 'To date', 'To date');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (8, 8, 41, 'From date time', 'From date time', 'From date time', 'From date time');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (9, 9, 41, 'To date time', 'To date time', 'To date time', 'To date time');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (10, 10, 41, 'Action button', 'Action button', 'Action button', 'Action button');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (11, 11, 41, 'Cancel button', 'Cancel button', 'Cancel button', 'Cancel button');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (12, 12, 41, 'Primary user', 'Primary user', 'Primary user', 'Primary user');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (13, 13, 41, 'Secondary user', 'Secondary user', 'Secondary user', 'Secondary user');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (14, 14, 41, 'Primary organization', 'Primary organization', 'Primary organization', 'Primary organization');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (15, 15, 41, 'Secondary organization', 'Secondary organization', 'Secondary organization', 'Secondary organization');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (16, 16, 41, 'Primary project', 'Primary project', 'Primary project', 'Primary project');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (17, 17, 41, 'Secondary project', 'Secondary project', 'Secondary project', 'Secondary project');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (18, 18, 41, 'Primary language', 'Primary language', 'Primary language', 'Primary language');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (19, 19, 41, 'Secondary language', 'Secondary language', 'Secondary language', 'Secondary language');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (20, 20, 41, 'Primary classification', 'Primary classification', 'Primary classification', 'Primary classification');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (21, 21, 41, 'Secondary classification', 'Secondary classification', 'Secondary classification', 'Secondary classification');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (22, 22, 41, 'Primary classification value', 'Primary classification value', 'Primary classification value', 'Primary classification value');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (23, 23, 41, 'Secondary classification value', 'Secondary classification value', 'Secondary classification value', 'Secondary classification value');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (24, 24, 41, 'Primary content', 'Primary content', 'Primary content', 'Primary content');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (25, 25, 41, 'Secondary content', 'Secondary content', 'Secondary content', 'Secondary content');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (26, 26, 41, 'Primary country', 'Primary country', 'Primary country', 'Primary country');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (27, 27, 41, 'Secondary country', 'Secondary country', 'Secondary country', 'Secondary country');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (28, 28, 41, 'Primary security level', 'Primary security level', 'Primary security level', 'Primary security level');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (29, 29, 41, 'Secondary security level', 'Secondary security level', 'Secondary security level', 'Secondary security level');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (30, 30, 41, 'Primary role', 'Primary role', 'Primary role', 'Primary role');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (31, 31, 41, 'Secondary role', 'Secondary role', 'Secondary role', 'Secondary role');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (32, 32, 41, 'HTML text', 'HTML text', 'HTML text', 'HTML text');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (33, 1, 39, 'Hoofd onderwerp', 'Hoofd onderwerp', 'Hoofd onderwerp', 'Hoofd onderwerp');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (34, 2, 39, 'Tekst', 'Tekst', 'Tekst', 'Tekst');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (35, 3, 39, 'Nummer', 'Nummer', 'Nummer', 'Nummer');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (36, 4, 39, 'Datum', 'Datum', 'Datum', 'Datum');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (37, 5, 39, 'Datum tijd', 'Datum tijd', 'Datum tijd', 'Datum tijd');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (38, 6, 39, 'Van datum', 'Van datum', 'Van datum', 'Van datum');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (39, 7, 39, 'Tot datum', 'Tot datum', 'Tot datum', 'Tot datum');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (40, 8, 39, 'Van datum tijd', 'Van datum tijd', 'Van datum tijd', 'Van datum tijd');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (41, 9, 39, 'Tot datum tijd', 'Tot datum tijd', 'Tot datum tijd', 'Tot datum tijd');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (42, 10, 39, 'Aktie knop', 'Aktie knop', 'Aktie knop', 'Aktie knop');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (43, 11, 39, 'Annuleren knop', 'Annuleren knop', 'Annuleren knop', 'Annuleren knop');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (44, 12, 39, 'Hoofd gebruiker', 'Hoofd gebruiker', 'Hoofd gebruiker', 'Hoofd gebruiker');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (45, 13, 39, 'Tweede gebruiker', 'Tweede gebruiker', 'Tweede gebruiker', 'Tweede gebruiker');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (46, 14, 39, 'Hoofd organizatie', 'Hoofd organizatie', 'Hoofd organizatie', 'Hoofd organizatie');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (47, 15, 39, 'Tweede organizatie', 'Tweede organizatie', 'Tweede organizatie', 'Tweede organizatie');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (48, 16, 39, 'Hoofd project', 'Hoofd project', 'Hoofd project', 'Hoofd project');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (49, 17, 39, 'Tweede project', 'Tweede project', 'Tweede project', 'Tweede project');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (50, 18, 39, 'Hoofd taal', 'Hoofd taal', 'Hoofd taal', 'Hoofd taal');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (51, 19, 39, 'Tweede taal', 'Tweede taal', 'Tweede taal', 'Tweede taal');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (52, 20, 39, 'Hoofd classificering', 'Hoofd classificering', 'Hoofd classificering', 'Hoofd classificering');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (53, 21, 39, 'Tweede classificering', 'Tweede classificering', 'Tweede classificering', 'Tweede classificering');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (54, 22, 39, 'Hoofd classificering waarde', 'Hoofd classificering waarde', 'Hoofd classificering waarde', 'Hoofd classificering waarde');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (55, 23, 39, 'Tweede classificering waarde', 'Tweede classificering waarde', 'Tweede classificering waarde', 'Tweede classificering waarde');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (56, 24, 39, 'Hoofd inhoud', 'Hoofd inhoud', 'Hoofd inhoud', 'Hoofd inhoud');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (57, 25, 39, 'Tweede inhoud', 'Tweede inhoud', 'Tweede inhoud', 'Tweede inhoud');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (58, 26, 39, 'Hoofd land', 'Hoofd land', 'Hoofd land', 'Hoofd land');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (59, 27, 39, 'Tweede land', 'Tweede land', 'Tweede land', 'Tweede land');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (60, 28, 39, 'Hoofd veiligheids niveau', 'Hoofd veiligheids niveau', 'Hoofd veiligheids niveau', 'Hoofd veiligheids niveau');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (61, 29, 39, 'Tweede veiligheids niveau', 'Tweede veiligheids niveau', 'Tweede veiligheids niveau', 'Tweede veiligheids niveau');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (62, 30, 39, 'Hoofd rol', 'Hoofd rol', 'Hoofd rol', 'Hoofd rol');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (63, 31, 39, 'Tweede rol', 'Tweede rol', 'Tweede rol', 'Tweede rol');
INSERT INTO ProcessTemplateFieldTypeLanguages (ProcessTemplateFieldTypeLanguageID, ProcessTemplateFieldTypeID, LanguageID, Name, Description, MouseOver, MenuName) VALUES (64, 32, 39, 'HTML tekst', 'HTML tekst', 'HTML tekst', 'HTML tekst');
SET IDENTITY_INSERT ProcessTemplateFieldTypeLanguages OFF

SET IDENTITY_INSERT UITerms ON;
INSERT INTO UITerms (UITermId, InternalName) VALUES(1, 'Classification');
INSERT INTO UITerms (UITermId, InternalName) VALUES(2, 'Id');
INSERT INTO UITerms (UITermId, InternalName) VALUES(3, 'Name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(4, 'Create new classification');
INSERT INTO UITerms (UITermId, InternalName) VALUES(5, 'Add');
INSERT INTO UITerms (UITermId, InternalName) VALUES(6, 'Add language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(7, 'Add values');
INSERT INTO UITerms (UITermId, InternalName) VALUES(8, 'Alphabetically');
INSERT INTO UITerms (UITermId, InternalName) VALUES(9, 'Back to classification levels');
INSERT INTO UITerms (UITermId, InternalName) VALUES(10, 'Back to classification values');
INSERT INTO UITerms (UITermId, InternalName) VALUES(11, 'Back to classifications');
INSERT INTO UITerms (UITermId, InternalName) VALUES(12, 'Can link');
INSERT INTO UITerms (UITermId, InternalName) VALUES(13, 'Cancel');
INSERT INTO UITerms (UITermId, InternalName) VALUES(14, 'Classification languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(15, 'Classification levels');
INSERT INTO UITerms (UITermId, InternalName) VALUES(16, 'Classification value languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(17, 'Content type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(18, 'Create new classification level');
INSERT INTO UITerms (UITermId, InternalName) VALUES(19, 'Create new value');
INSERT INTO UITerms (UITermId, InternalName) VALUES(20, 'Date level');
INSERT INTO UITerms (UITermId, InternalName) VALUES(21, 'Delete');
INSERT INTO UITerms (UITermId, InternalName) VALUES(22, 'Description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(23, 'Drop down name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(24, 'Edit');
INSERT INTO UITerms (UITermId, InternalName) VALUES(25, 'Edit classification');
INSERT INTO UITerms (UITermId, InternalName) VALUES(26, 'Edit classification level');
INSERT INTO UITerms (UITermId, InternalName) VALUES(27, 'Edit language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(28, 'Edit value');
INSERT INTO UITerms (UITermId, InternalName) VALUES(29, 'Has dropdown');
INSERT INTO UITerms (UITermId, InternalName) VALUES(30, 'Header description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(31, 'Header name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(32, 'In drop down');
INSERT INTO UITerms (UITermId, InternalName) VALUES(33, 'Language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(34, 'Languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(35, 'Logout');
INSERT INTO UITerms (UITermId, InternalName) VALUES(36, 'Menu name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(37, 'Mouse over');
INSERT INTO UITerms (UITermId, InternalName) VALUES(38, 'New value');
INSERT INTO UITerms (UITermId, InternalName) VALUES(39, 'On the fly');
INSERT INTO UITerms (UITermId, InternalName) VALUES(40, 'Open');
INSERT INTO UITerms (UITermId, InternalName) VALUES(41, 'Organization');
INSERT INTO UITerms (UITermId, InternalName) VALUES(42, 'Organization type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(43, 'Page description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(44, 'Page name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(45, 'Page type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(46, 'Pages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(47, 'Process template field types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(48, 'Process template groups');
INSERT INTO UITerms (UITermId, InternalName) VALUES(49, 'Process templates');
INSERT INTO UITerms (UITermId, InternalName) VALUES(50, 'Projects');
INSERT INTO UITerms (UITermId, InternalName) VALUES(51, 'Roles');
INSERT INTO UITerms (UITermId, InternalName) VALUES(52, 'Save');
INSERT INTO UITerms (UITermId, InternalName) VALUES(53, 'Section types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(54, 'Settings');
INSERT INTO UITerms (UITermId, InternalName) VALUES(55, 'Setup wizard');
INSERT INTO UITerms (UITermId, InternalName) VALUES(56, 'Status');
INSERT INTO UITerms (UITermId, InternalName) VALUES(57, 'Terms');
INSERT INTO UITerms (UITermId, InternalName) VALUES(58, 'Topic name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(59, 'Classifications');
INSERT INTO UITerms (UITermId, InternalName) VALUES(60, 'Levels');
INSERT INTO UITerms (UITermId, InternalName) VALUES(61, 'Sequence');
INSERT INTO UITerms (UITermId, InternalName) VALUES(62, 'Classification level languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(63, 'Update');
INSERT INTO UITerms (UITermId, InternalName) VALUES(64, 'Users');
INSERT INTO UITerms (UITermId, InternalName) VALUES(65, 'Values');
INSERT INTO UITerms (UITermId, InternalName) VALUES(66, 'Delete classification');
INSERT INTO UITerms (UITermId, InternalName) VALUES(67, 'Creator');
INSERT INTO UITerms (UITermId, InternalName) VALUES(68, 'Modifier');
INSERT INTO UITerms (UITermId, InternalName) VALUES(69, 'Content types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(70, 'Create new content type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(71, 'Edit content type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(72, 'Content type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(73, 'Back to content types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(74, 'Delete language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(75, 'Organizations');
INSERT INTO UITerms (UITermId, InternalName) VALUES(76, 'Create new organization');
INSERT INTO UITerms (UITermId, InternalName) VALUES(77, 'Organization languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(78, 'Back to organization');
INSERT INTO UITerms (UITermId, InternalName) VALUES(79, 'Type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(80, 'Parent organization');
INSERT INTO UITerms (UITermId, InternalName) VALUES(81, 'Organization types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(82, 'Create new organization type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(83, 'Edit organization type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(84, 'Organization type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(85, 'Back to organization types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(86, 'Sections');
INSERT INTO UITerms (UITermId, InternalName) VALUES(87, 'Create page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(88, 'Edit page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(89, 'Page sections');
INSERT INTO UITerms (UITermId, InternalName) VALUES(90, 'Create new page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(91, 'Back to pages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(92, 'Edit page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(93, 'Back to page sections');
INSERT INTO UITerms (UITermId, InternalName) VALUES(94, 'Create page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(95, 'Title');
INSERT INTO UITerms (UITermId, InternalName) VALUES(96, 'Show title');
INSERT INTO UITerms (UITermId, InternalName) VALUES(97, 'Show title description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(98, 'Show content type title');
INSERT INTO UITerms (UITermId, InternalName) VALUES(99, 'Show content type description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(100, 'Page types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(101, 'Create new page type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(102, 'Edit page type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(103, 'Page type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(104, 'Back to page types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(105, 'Create new project');
INSERT INTO UITerms (UITermId, InternalName) VALUES(106, 'Edit project');
INSERT INTO UITerms (UITermId, InternalName) VALUES(107, 'Project languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(108, 'Back to projects');
INSERT INTO UITerms (UITermId, InternalName) VALUES(109, 'Page section types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(110, 'Create new page section type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(111, 'Edit page section type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(112, 'Index section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(113, 'Page section type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(114, 'Back to page section types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(115, 'Relations');
INSERT INTO UITerms (UITermId, InternalName) VALUES(116, 'Add new role');
INSERT INTO UITerms (UITermId, InternalName) VALUES(117, 'Edit user');
INSERT INTO UITerms (UITermId, InternalName) VALUES(118, 'Create user');
INSERT INTO UITerms (UITermId, InternalName) VALUES(119, 'Email');
INSERT INTO UITerms (UITermId, InternalName) VALUES(120, 'Default language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(121, 'Country');
INSERT INTO UITerms (UITermId, InternalName) VALUES(122, 'Password');
INSERT INTO UITerms (UITermId, InternalName) VALUES(123, 'Confirm password');
INSERT INTO UITerms (UITermId, InternalName) VALUES(124, 'User projects');
INSERT INTO UITerms (UITermId, InternalName) VALUES(125, 'Back to users');
INSERT INTO UITerms (UITermId, InternalName) VALUES(126, 'Add user to project');
INSERT INTO UITerms (UITermId, InternalName) VALUES(127, 'Project');
INSERT INTO UITerms (UITermId, InternalName) VALUES(128, 'Edit role');
INSERT INTO UITerms (UITermId, InternalName) VALUES(129, 'Manage users');
INSERT INTO UITerms (UITermId, InternalName) VALUES(130, 'Rights');
INSERT INTO UITerms (UITermId, InternalName) VALUES(131, 'Manage rights');
INSERT INTO UITerms (UITermId, InternalName) VALUES(132, 'Manage users to role');
INSERT INTO UITerms (UITermId, InternalName) VALUES(133, 'Role Id');
INSERT INTO UITerms (UITermId, InternalName) VALUES(134, 'User name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(135, 'Manage rights to role');
INSERT INTO UITerms (UITermId, InternalName) VALUES(136, 'Selected');
INSERT INTO UITerms (UITermId, InternalName) VALUES(137, 'Claim type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(138, 'Claim value');
INSERT INTO UITerms (UITermId, InternalName) VALUES(139, 'Role');
INSERT INTO UITerms (UITermId, InternalName) VALUES(140, 'Create new role');
INSERT INTO UITerms (UITermId, InternalName) VALUES(141, 'Role name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(142, 'Fields');
INSERT INTO UITerms (UITermId, InternalName) VALUES(143, 'Flow');
INSERT INTO UITerms (UITermId, InternalName) VALUES(144, 'Edit process template');
INSERT INTO UITerms (UITermId, InternalName) VALUES(145, 'Create new process template');
INSERT INTO UITerms (UITermId, InternalName) VALUES(146, 'Process template group');
INSERT INTO UITerms (UITermId, InternalName) VALUES(147, 'Process template fields');
INSERT INTO UITerms (UITermId, InternalName) VALUES(148, 'Steps');
INSERT INTO UITerms (UITermId, InternalName) VALUES(149, 'Create new process template field');
INSERT INTO UITerms (UITermId, InternalName) VALUES(150, 'Edit process template field');
INSERT INTO UITerms (UITermId, InternalName) VALUES(151, 'Data type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(152, 'Linked table');
INSERT INTO UITerms (UITermId, InternalName) VALUES(153, 'Steps for field');
INSERT INTO UITerms (UITermId, InternalName) VALUES(154, 'Edit step field settings');
INSERT INTO UITerms (UITermId, InternalName) VALUES(155, 'Process template field languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(156, 'Back to process template fields');
INSERT INTO UITerms (UITermId, InternalName) VALUES(157, 'Process template flows');
INSERT INTO UITerms (UITermId, InternalName) VALUES(158, 'Conditions');
INSERT INTO UITerms (UITermId, InternalName) VALUES(159, 'Create new process template flow');
INSERT INTO UITerms (UITermId, InternalName) VALUES(160, 'Back to process templates');
INSERT INTO UITerms (UITermId, InternalName) VALUES(161, 'Edit process template flow');
INSERT INTO UITerms (UITermId, InternalName) VALUES(162, 'Condition relation');
INSERT INTO UITerms (UITermId, InternalName) VALUES(163, 'From step');
INSERT INTO UITerms (UITermId, InternalName) VALUES(164, 'To step');
INSERT INTO UITerms (UITermId, InternalName) VALUES(165, 'Process template flow languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(166, 'Flow conditions');
INSERT INTO UITerms (UITermId, InternalName) VALUES(167, 'Char');
INSERT INTO UITerms (UITermId, InternalName) VALUES(168, 'Create new process template flow condition');
INSERT INTO UITerms (UITermId, InternalName) VALUES(169, 'Back to process template flows');
INSERT INTO UITerms (UITermId, InternalName) VALUES(170, 'Create new process template group');
INSERT INTO UITerms (UITermId, InternalName) VALUES(171, 'Edit process template group');
INSERT INTO UITerms (UITermId, InternalName) VALUES(172, 'Process template group languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(173, 'Back to process template groups');
INSERT INTO UITerms (UITermId, InternalName) VALUES(174, 'Create content');
INSERT INTO UITerms (UITermId, InternalName) VALUES(175, 'Content title');
INSERT INTO UITerms (UITermId, InternalName) VALUES(176, 'Content description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(177, 'Content status');
INSERT INTO UITerms (UITermId, InternalName) VALUES(178, 'Content organization');
INSERT INTO UITerms (UITermId, InternalName) VALUES(179, 'Content project');
INSERT INTO UITerms (UITermId, InternalName) VALUES(180, 'Foreign name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(181, 'ISO6391');
INSERT INTO UITerms (UITermId, InternalName) VALUES(182, 'ISO6392');
INSERT INTO UITerms (UITermId, InternalName) VALUES(183, 'Back to process fields');
INSERT INTO UITerms (UITermId, InternalName) VALUES(184, 'Fields for step');
INSERT INTO UITerms (UITermId, InternalName) VALUES(185, 'Back to steps');
INSERT INTO UITerms (UITermId, InternalName) VALUES(186, 'Process template steps');
INSERT INTO UITerms (UITermId, InternalName) VALUES(187, 'Create new process template step');
INSERT INTO UITerms (UITermId, InternalName) VALUES(188, 'Edit step');
INSERT INTO UITerms (UITermId, InternalName) VALUES(189, 'Add step');
INSERT INTO UITerms (UITermId, InternalName) VALUES(190, 'Process template step languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(191, 'Add new language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(192, 'Active');
INSERT INTO UITerms (UITermId, InternalName) VALUES(193, 'Int');
INSERT INTO UITerms (UITermId, InternalName) VALUES(194, 'String');
INSERT INTO UITerms (UITermId, InternalName) VALUES(195, 'Date');
INSERT INTO UITerms (UITermId, InternalName) VALUES(196, 'Edit setting');
INSERT INTO UITerms (UITermId, InternalName) VALUES(197, 'Process template field type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(198, 'Edit process template field type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(199, 'Delete process template field type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(200, 'Create process template field type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(201, 'Back to process template field types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(202, 'User organization type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(203, 'User organization type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(204, 'Add user organization type language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(205, 'Back to user organization types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(206, 'CreatedDate');
INSERT INTO UITerms (UITermId, InternalName) VALUES(207, 'ModifiedDate');
INSERT INTO UITerms (UITermId, InternalName) VALUES(208, 'Delete content type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(209, 'Delete organization');
INSERT INTO UITerms (UITermId, InternalName) VALUES(210, 'Delete organization type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(211, 'Delete page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(212, 'Delete page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(213, 'Has paging');
INSERT INTO UITerms (UITermId, InternalName) VALUES(214, 'Max content');
INSERT INTO UITerms (UITermId, InternalName) VALUES(215, 'One two columns');
INSERT INTO UITerms (UITermId, InternalName) VALUES(216, 'Page section languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(217, 'Page languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(218, 'Application title');
INSERT INTO UITerms (UITermId, InternalName) VALUES(219, 'Drop down sequence');
INSERT INTO UITerms (UITermId, InternalName) VALUES(220, 'Default page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(221, 'Preference');
INSERT INTO UITerms (UITermId, InternalName) VALUES(222, 'User project type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(223, 'User relation type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(224, 'login');
INSERT INTO UITerms (UITermId, InternalName) VALUES(225, 'Register');
INSERT INTO UITerms (UITermId, InternalName) VALUES(226, 'Add content');
INSERT INTO UITerms (UITermId, InternalName) VALUES(227, 'Content');
INSERT INTO UITerms (UITermId, InternalName) VALUES(228, 'Calendar');
INSERT INTO UITerms (UITermId, InternalName) VALUES(229, 'Chat');
INSERT INTO UITerms (UITermId, InternalName) VALUES(230, 'Conference');
INSERT INTO UITerms (UITermId, InternalName) VALUES(231, 'Favorites');
INSERT INTO UITerms (UITermId, InternalName) VALUES(232, 'Game');
INSERT INTO UITerms (UITermId, InternalName) VALUES(233, 'Add process');
INSERT INTO UITerms (UITermId, InternalName) VALUES(234, 'Process');
INSERT INTO UITerms (UITermId, InternalName) VALUES(235, 'Add todo');
INSERT INTO UITerms (UITermId, InternalName) VALUES(236, 'Todo');
INSERT INTO UITerms (UITermId, InternalName) VALUES(237, 'Search');
INSERT INTO UITerms (UITermId, InternalName) VALUES(238, 'Classification pages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(239, 'Create new classification page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(240, 'Edit classification page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(241, 'Show title name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(242, 'Title name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(243, 'Delete classification page');
INSERT INTO UITerms (UITermId, InternalName) VALUES(244, 'Back to classification pages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(245, 'Classification page sections');
INSERT INTO UITerms (UITermId, InternalName) VALUES(246, 'Create new classification page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(247, 'Edit classification page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(248, 'Section type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(249, 'Show section title name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(250, 'Show section title description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(251, 'Show content type title name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(252, 'Show content type title description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(253, 'Sort by');
INSERT INTO UITerms (UITermId, InternalName) VALUES(254, 'Delete classification page section');
INSERT INTO UITerms (UITermId, InternalName) VALUES(255, 'In Menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(256, 'User Project type languages');
INSERT INTO UITerms (UITermId, InternalName) VALUES(257, 'Add user Project type language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(258, 'Back to user Project types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(259, 'From is of to name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(260, 'To is of from name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(261, 'From is of to description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(262, 'To is of from description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(263, 'From is of to mouse over');
INSERT INTO UITerms (UITermId, InternalName) VALUES(264, 'To is of from mouse over');
INSERT INTO UITerms (UITermId, InternalName) VALUES(265, 'From is of to menu name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(266, 'To is of from menu name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(267, 'Back to user relation types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(268, 'Add user relation type language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(269, 'User relation types');
INSERT INTO UITerms (UITermId, InternalName) VALUES(270, 'Edit user relation type language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(271, 'Delete user relation type language');
INSERT INTO UITerms (UITermId, InternalName) VALUES(272, 'To do');
INSERT INTO UITerms (UITermId, InternalName) VALUES(273, 'Process name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(274, 'Add menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(275, 'Controller');
INSERT INTO UITerms (UITermId, InternalName) VALUES(276, 'Action');
INSERT INTO UITerms (UITermId, InternalName) VALUES(277, 'Destination Id');
INSERT INTO UITerms (UITermId, InternalName) VALUES(278, 'Feature');
INSERT INTO UITerms (UITermId, InternalName) VALUES(279, 'Delete menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(280, 'OId');
INSERT INTO UITerms (UITermId, InternalName) VALUES(281, 'Type name');
INSERT INTO UITerms (UITermId, InternalName) VALUES(282, 'LId');
INSERT INTO UITerms (UITermId, InternalName) VALUES(283, 'Edit menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(284, 'Menu type');
INSERT INTO UITerms (UITermId, InternalName) VALUES(285, 'Menus');
INSERT INTO UITerms (UITermId, InternalName) VALUES(286, 'Menu level 2');
INSERT INTO UITerms (UITermId, InternalName) VALUES(287, 'Back to menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(288, 'Left menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(289, 'Edit left menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(290, 'Menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(291, 'Menu description');
INSERT INTO UITerms (UITermId, InternalName) VALUES(292, 'Show menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(293, 'Show add menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(294, 'Show search');
INSERT INTO UITerms (UITermId, InternalName) VALUES(295, 'Show advanced search');
INSERT INTO UITerms (UITermId, InternalName) VALUES(296, 'Menu URL');
INSERT INTO UITerms (UITermId, InternalName) VALUES(297, 'Parent project');
INSERT INTO UITerms (UITermId, InternalName) VALUES(298, 'Create new user');
INSERT INTO UITerms (UITermId, InternalName) VALUES(299, 'Relation');
INSERT INTO UITerms (UITermId, InternalName) VALUES(300, 'TRUE');
INSERT INTO UITerms (UITermId, InternalName) VALUES(301, 'FALSE');
INSERT INTO UITerms (UITermId, InternalName) VALUES(302, 'Build data');
INSERT INTO UITerms (UITermId, InternalName) VALUES(303, 'Master data');
INSERT INTO UITerms (UITermId, InternalName) VALUES(304, 'Login as eplegrand@gmail.com');
INSERT INTO UITerms (UITermId, InternalName) VALUES(305, 'Demo data');
INSERT INTO UITerms (UITermId, InternalName) VALUES(306, 'Demo data NL');
INSERT INTO UITerms (UITermId, InternalName) VALUES(307, 'Demo data is done');
INSERT INTO UITerms (UITermId, InternalName) VALUES(308, 'Back to Setup wizard');
INSERT INTO UITerms (UITermId, InternalName) VALUES(309, 'View content');
INSERT INTO UITerms (UITermId, InternalName) VALUES(310, 'Content type classifications');
INSERT INTO UITerms (UITermId, InternalName) VALUES(311, 'Edit content type classification');
INSERT INTO UITerms (UITermId, InternalName) VALUES(312, 'Security level');
INSERT INTO UITerms (UITermId, InternalName) VALUES(313, 'Created flow');
INSERT INTO UITerms (UITermId, InternalName) VALUES(314, 'Add left menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(315, 'New menu');
INSERT INTO UITerms (UITermId, InternalName) VALUES(316, 'Location');
INSERT INTO UITerms (UITermId, InternalName) VALUES(317, 'User dashboard');
INSERT INTO UITerms (UITermId, InternalName) VALUES(318, 'User');
INSERT INTO UITerms (UITermId, InternalName) VALUES(319, 'Content type group');
INSERT INTO UITerms (UITermId, InternalName) VALUES(320, 'Process template');
SET IDENTITY_INSERT UITerms OFF;

SET IDENTITY_INSERT UITermLanguages ON;
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(1,1, 41,'Classification','Classification','Classification');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(2,2, 41,'Id','Id','Id');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(3,3, 41,'Name','Name','Name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(4,4, 41,'Create new classification','Create new classification','Create new classification');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(5,5, 41,'Add','Add','Add');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(6,6, 41,'Add language','Add language','Add language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(7,7, 41,'Add values','Add values','Add values');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(8,8, 41,'Alphabetically','Alphabetically','Alphabetically');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(9,9, 41,'Back to classification levels','Back to classification levels','Back to classification levels');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(10,10, 41,'Back to classification values','Back to classification values','Back to classification values');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(11,11, 41,'Back to classifications','Back to classifications','Back to classifications');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(12,12, 41,'Can link','Can link','Can link');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(13,13, 41,'Cancel','Cancel','Cancel');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(14,14, 41,'Classification languages','Classification languages','Classification languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(15,15, 41,'Classification levels','Classification levels','Classification levels');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(16,16, 41,'Classification value languages','Classification value languages','Classification value languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(17,17, 41,'Content type','Content type','Content type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(18,18, 41,'Create new classification level','Create new classification level','Create new classification level');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(19,19, 41,'Create new value','Create new value','Create new value');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(20,20, 41,'Date level','Date level','Date level');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(21,21, 41,'Delete','Delete','Delete');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(22,22, 41,'Description','Description','Description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(23,23, 41,'Drop down name','Drop down name','Drop down name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(24,24, 41,'Edit','Edit','Edit');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(25,25, 41,'Edit classification','Edit classification','Edit classification');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(26,26, 41,'Edit classification level','Edit classification level','Edit classification level');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(27,27, 41,'Edit language','Edit language','Edit language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(28,28, 41,'Edit value','Edit value','Edit value');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(29,29, 41,'Has dropdown','Has dropdown','Has dropdown');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(30,30, 41,'Header description','Header description','Header description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(31,31, 41,'Header name','Header name','Header name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(32,32, 41,'In drop down','In drop down','In drop down');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(33,33, 41,'Language','Language','Language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(34,34, 41,'Languages','Languages','Languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(35,35, 41,'Logout','Logout','Logout');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(36,36, 41,'Menu name','Menu name','Menu name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(37,37, 41,'Mouse over','Mouse over','Mouse over');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(38,38, 41,'New value','New value','New value');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(39,39, 41,'On the fly','On the fly','On the fly');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(40,40, 41,'Open','Open','Open');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(41,41, 41,'Organization','Organization','Organization');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(42,42, 41,'Organization type','Organization type','Organization type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(43,43, 41,'Page description','Page description','Page description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(44,44, 41,'Page name','Page name','Page name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(45,45, 41,'Page type','Page type','Page type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(46,46, 41,'Pages','Pages','Pages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(47,47, 41,'Process template field types','Process template field types','Process template field types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(48,48, 41,'Process template groups','Process template groups','Process template groups');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(49,49, 41,'Process templates','Process templates','Process templates');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(50,50, 41,'Projects','Projects','Projects');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(51,51, 41,'Roles','Roles','Roles');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(52,52, 41,'Save','Save','Save');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(53,53, 41,'Section types','Section types','Section types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(54,54, 41,'Settings','Settings','Settings');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(55,55, 41,'Setup wizard','Setup wizard','Setup wizard');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(56,56, 41,'Status','Status','Status');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(57,57, 41,'Terms','Terms','Terms');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(58,58, 41,'Topic name','Topic name','Topic name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(59,59, 41,'Classifications','Classifications','Classifications');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(60,60, 41,'Levels','Levels','Levels');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(61,61, 41,'Sequence','Sequence','Sequence');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(62,62, 41,'Classification level languages','Classification level languages','Classification level languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(63,63, 41,'Update','Update','Update');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(64,64, 41,'Users','Users','Users');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(65,65, 41,'Values','Values','Values');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(66,66, 41,'Delete classification','Delete classification','Delete classification');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(67,67, 41,'Creator','Creator','Creator');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(68,68, 41,'Modifier','Modifier','Modifier');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(69,69, 41,'Content types','Content types','Content types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(70,70, 41,'Create new content type','Create new content type','Create new content type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(71,71, 41,'Edit content type','Edit content type','Edit content type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(72,72, 41,'Content type languages','Content type languages','Content type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(73,73, 41,'Back to content types','Back to content types','Back to content types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(74,74, 41,'Delete language','Delete language','Delete language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(75,75, 41,'Organizations','Organizations','Organizations');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(76,76, 41,'Create new organization','Create new organization','Create new organization');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(77,77, 41,'Organization languages','Organization languages','Organization languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(78,78, 41,'Back to organization','Back to organization','Back to organization');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(79,79, 41,'Type','Type','Type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(80,80, 41,'Parent organization','Parent organization','Parent organization');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(81,81, 41,'Organization types','Organization types','Organization types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(82,82, 41,'Create new organization type','Create new organization type','Create new organization type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(83,83, 41,'Edit organization type','Edit organization type','Edit organization type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(84,84, 41,'Organization type languages','Organization type languages','Organization type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(85,85, 41,'Back to organization types','Back to organization types','Back to organization types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(86,86, 41,'Sections','Sections','Sections');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(87,87, 41,'Create page','Create page','Create page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(88,88, 41,'Edit page','Edit page','Edit page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(89,89, 41,'Page sections','Page sections','Page sections');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(90,90, 41,'Create new page section','Create new page section','Create new page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(91,91, 41,'Back to pages','Back to pages','Back to pages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(92,92, 41,'Edit page section','Edit page section','Edit page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(93,93, 41,'Back to page sections','Back to page sections','Back to page sections');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(94,94, 41,'Create page section','Create page section','Create page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(95,95, 41,'Title','Title','Title');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(96,96, 41,'Show title','Show title','Show title');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(97,97, 41,'Show title description','Show title description','Show title description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(98,98, 41,'Show content type title','Show content type title','Show content type title');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(99,99, 41,'Show content type description','Show content type description','Show content type description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(100,100, 41,'Page types','Page types','Page types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(101,101, 41,'Create new page type','Create new page type','Create new page type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(102,102, 41,'Edit page type','Edit page type','Edit page type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(103,103, 41,'Page type languages','Page type languages','Page type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(104,104, 41,'Back to page types','Back to page types','Back to page types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(105,105, 41,'Create new project','Create new project','Create new project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(106,106, 41,'Edit project','Edit project','Edit project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(107,107, 41,'Project languages','Project languages','Project languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(108,108, 41,'Back to projects','Back to projects','Back to projects');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(109,109, 41,'Page section types','Page section types','Page section types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(110,110, 41,'Create new page section type','Create new page section type','Create new page section type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(111,111, 41,'Edit page section type','Edit page section type','Edit page section type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(112,112, 41,'Index section','Index section','Index section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(113,113, 41,'Page section type languages','Page section type languages','Page section type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(114,114, 41,'Back to page section types','Back to page section types','Back to page section types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(115,115, 41,'Relations','Relations','Relations');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(116,116, 41,'Add new role','Add new role','Add new role');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(117,117, 41,'Edit user','Edit user','Edit user');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(118,118, 41,'Create user','Create user','Create user');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(119,119, 41,'Email','Email','Email');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(120,120, 41,'Default language','Default language','Default language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(121,121, 41,'Country','Country','Country');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(122,122, 41,'Password','Password','Password');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(123,123, 41,'Confirm password','Confirm password','Confirm password');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(124,124, 41,'User projects','User projects','User projects');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(125,125, 41,'Back to users','Back to users','Back to users');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(126,126, 41,'Add user to project','Add user to project','Add user to project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(127,127, 41,'Project','Project','Project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(128,128, 41,'Edit role','Edit role','Edit role');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(129,129, 41,'Manage users','Manage users','Manage users');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(130,130, 41,'Rights','Rights','Rights');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(131,131, 41,'Manage rights','Manage rights','Manage rights');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(132,132, 41,'Manage users to role','Manage users to role','Manage users to role');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(133,133, 41,'Role Id','Role Id','Role Id');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(134,134, 41,'User name','User name','User name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(135,135, 41,'Manage rights to role','Manage rights to role','Manage rights to role');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(136,136, 41,'Selected','Selected','Selected');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(137,137, 41,'Claim type','Claim type','Claim type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(138,138, 41,'Claim value','Claim value','Claim value');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(139,139, 41,'Role','Role','Role');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(140,140, 41,'Create new role','Create new role','Create new role');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(141,141, 41,'Role name','Role name','Role name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(142,142, 41,'Fields','Fields','Fields');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(143,143, 41,'Flow','Flow','Flow');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(144,144, 41,'Edit process template','Edit process template','Edit process template');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(145,145, 41,'Create new process template','Create new process template','Create new process template');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(146,146, 41,'Process template group','Process template group','Process template group');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(147,147, 41,'Process template fields','Process template fields','Process template fields');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(148,148, 41,'Steps','Steps','Steps');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(149,149, 41,'Create new process template field','Create new process template field','Create new process template field');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(150,150, 41,'Edit process template field','Edit process template field','Edit process template field');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(151,151, 41,'Data type','Data type','Data type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(152,152, 41,'Linked table','Linked table','Linked table');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(153,153, 41,'Steps for field','Steps for field','Steps for field');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(154,154, 41,'Edit step field settings','Edit step field settings','Edit step field settings');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(155,155, 41,'Process template field languages','Process template field languages','Process template field languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(156,156, 41,'Back to process template fields','Back to process template fields','Back to process template fields');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(157,157, 41,'Process template flows','Process template flows','Process template flows');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(158,158, 41,'Conditions','Conditions','Conditions');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(159,159, 41,'Create new process template flow','Create new process template flow','Create new process template flow');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(160,160, 41,'Back to process templates','Back to process templates','Back to process templates');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(161,161, 41,'Edit process template flow','Edit process template flow','Edit process template flow');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(162,162, 41,'Condition relation','Condition relation','Condition relation');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(163,163, 41,'From step','From step','From step');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(164,164, 41,'To step','To step','To step');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(165,165, 41,'Process template flow languages','Process template flow languages','Process template flow languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(166,166, 41,'Flow conditions','Flow conditions','Flow conditions');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(167,167, 41,'Char','Char','Char');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(168,168, 41,'Create new process template flow condition','Create new process template flow condition','Create new process template flow condition');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(169,169, 41,'Back to process template flows','Back to process template flows','Back to process template flows');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(170,170, 41,'Create new process template group','Create new process template group','Create new process template group');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(171,171, 41,'Edit process template group','Edit process template group','Edit process template group');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(172,172, 41,'Process template group languages','Process template group languages','Process template group languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(173,173, 41,'Back to process template groups','Back to process template groups','Back to process template groups');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(174,174, 41,'Create content','Create content','Create content');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(175,175, 41,'Content title','Content title','Content title');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(176,176, 41,'Content description','Content description','Content description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(177,177, 41,'Content status','Content status','Content status');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(178,178, 41,'Content organization','Content organization','Content organization');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(179,179, 41,'Content project','Content project','Content project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(180,180, 41,'Foreign name','Foreign name','Foreign name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(181,181, 41,'ISO6391','ISO6391','ISO6391');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(182,182, 41,'ISO6392','ISO6392','ISO6392');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(183,183, 41,'Back to process fields','Back to process fields','Back to process fields');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(184,184, 41,'Fields for step','Fields for step','Fields for step');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(185,185, 41,'Back to steps','Back to steps','Back to steps');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(186,186, 41,'Process template steps','Process template steps','Process template steps');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(187,187, 41,'Create new process template step','Create new process template step','Create new process template step');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(188,188, 41,'Edit step','Edit step','Edit step');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(189,189, 41,'Add step','Add step','Add step');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(190,190, 41,'Process template step languages','Process template step languages','Process template step languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(191,191, 41,'Add new language','Add new language','Add new language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(192,192, 41,'Active','Active','Active');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(193,193, 41,'Int','Int','Int');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(194,194, 41,'String','String','String');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(195,195, 41,'Date','Date','Date');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(196,196, 41,'Edit setting','Edit setting','Edit setting');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(197,197, 41,'Process template field type languages','Process template field type languages','Process template field type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(198,198, 41,'Edit process template field type','Edit process template field type','Edit process template field type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(199,199, 41,'Delete process template field type','Delete process template field type','Delete process template field type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(200,200, 41,'Create process template field type','Create process template field type','Create process template field type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(201,201, 41,'Back to process template field types','Back to process template field types','Back to process template field types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(202,202, 41,'User organization type','User organization type','User organization type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(203,203, 41,'User organization type languages','User organization type languages','User organization type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(204,204, 41,'Add user organization type language','Add user organization type language','Add user organization type language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(205,205, 41,'Back to user organization types','Back to user organization types','Back to user organization types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(206,206, 41,'CreatedDate','CreatedDate','CreatedDate');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(207,207, 41,'ModifiedDate','ModifiedDate','ModifiedDate');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(208,208, 41,'Delete content type','Delete content type','Delete content type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(209,209, 41,'Delete organization','Delete organization','Delete organization');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(210,210, 41,'Delete organization type','Delete organization type','Delete organization type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(211,211, 41,'Delete page','Delete page','Delete page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(212,212, 41,'Delete page section','Delete page section','Delete page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(213,213, 41,'Has paging','Has paging','Has paging');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(214,214, 41,'Max content','Max content','Max content');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(215,215, 41,'One two columns','One two columns','One two columns');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(216,216, 41,'Page section languages','Page section languages','Page section languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(217,217, 41,'Page languages','Page languages','Page languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(218,218, 41,'Application title','Application title','Application title');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(219,219, 41,'Drop down sequence','Drop down sequence','Drop down sequence');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(220,220, 41,'Default page','Default page','Default page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(221,221, 41,'Preference','Preference','Preference');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(222,222, 41,'User project type','User project type','User project type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(223,223, 41,'User relation type','User relation type','User relation type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(224,224, 41,'login','login','login');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(225,225, 41,'Register','Register','Register');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(226,226, 41,'Add content','Add content','Add content');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(227,227, 41,'Content','Content','Content');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(228,228, 41,'Calendar','Calendar','Calendar');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(229,229, 41,'Chat','Chat','Chat');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(230,230, 41,'Conference','Conference','Conference');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(231,231, 41,'Favorites','Favorites','Favorites');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(232,232, 41,'Game','Game','Game');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(233,233, 41,'Add process','Add process','Add process');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(234,234, 41,'Process','Process','Process');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(235,235, 41,'Add todo','Add todo','Add todo');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(236,236, 41,'Todo','Todo','Todo');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(237,237, 41,'Search','Search','Search');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(238,238, 41,'Classification pages','Classification pages','Classification pages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(239,239, 41,'Create new classification page','Create new classification page','Create new classification page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(240,240, 41,'Edit classification page','Edit classification page','Edit classification page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(241,241, 41,'Show title name','Show title name','Show title name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(242,242, 41,'Title name','Title name','Title name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(243,243, 41,'Delete classification page','Delete classification page','Delete classification page');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(244,244, 41,'Back to classification pages','Back to classification pages','Back to classification pages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(245,245, 41,'Classification page sections','Classification page sections','Classification page sections');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(246,246, 41,'Create new classification page section','Create new classification page section','Create new classification page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(247,247, 41,'Edit classification page section','Edit classification page section','Edit classification page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(248,248, 41,'Section type','Section type','Section type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(249,249, 41,'Show section title name','Show section title name','Show section title name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(250,250, 41,'Show section title description','Show section title description','Show section title description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(251,251, 41,'Show content type title name','Show content type title name','Show content type title name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(252,252, 41,'Show content type title description','Show content type title description','Show content type title description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(253,253, 41,'Sort by','Sort by','Sort by');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(254,254, 41,'Delete classification page section','Delete classification page section','Delete classification page section');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(255,255, 41,'In Menu','In Menu','In Menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(256,256, 41,'User Project type languages','User Project type languages','User Project type languages');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(257,257, 41,'Add user Project type language','Add user Project type language','Add user Project type language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(258,258, 41,'Back to user Project types','Back to user Project types','Back to user Project types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(259,259, 41,'From is of to name','From is of to name','From is of to name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(260,260, 41,'To is of from name','To is of from name','To is of from name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(261,261, 41,'From is of to description','From is of to description','From is of to description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(262,262, 41,'To is of from description','To is of from description','To is of from description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(263,263, 41,'From is of to mouse over','From is of to mouse over','From is of to mouse over');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(264,264, 41,'To is of from mouse over','To is of from mouse over','To is of from mouse over');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(265,265, 41,'From is of to menu name','From is of to menu name','From is of to menu name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(266,266, 41,'To is of from menu name','To is of from menu name','To is of from menu name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(267,267, 41,'Back to user relation types','Back to user relation types','Back to user relation types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(268,268, 41,'Add user relation type language','Add user relation type language','Add user relation type language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(269,269, 41,'User relation types','User relation types','User relation types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(270,270, 41,'Edit user relation type language','Edit user relation type language','Edit user relation type language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(271,271, 41,'Delete user relation type language','Delete user relation type language','Delete user relation type language');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(272,272, 41,'To do','To do','To do');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(273,273, 41,'Process name','Process name','Process name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(274,274, 41,'Add menu','Add menu','Add menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(275,275, 41,'Controller','Controller','Controller');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(276,276, 41,'Action','Action','Action');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(277,277, 41,'Destination Id','Destination Id','Destination Id');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(278,278, 41,'Feature','Feature','Feature');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(279,279, 41,'Delete menu','Delete menu','Delete menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(280,280, 41,'OId','OId','OId');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(281,281, 41,'Type name','Type name','Type name');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(282,282, 41,'LId','LId','LId');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(283,283, 41,'Edit menu','Edit menu','Edit menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(284,284, 41,'Menu type','Menu type','Menu type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(285,285, 41,'Menus','Menus','Menus');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(286,286, 41,'Menu level 2','Menu level 2','Menu level 2');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(287,287, 41,'Back to menu','Back to menu','Back to menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(288,288, 41,'Left menu','Left menu','Left menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(289,289, 41,'Edit left menu','Edit left menu','Edit left menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(290,290, 41,'Menu','Menu','Menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(291,291, 41,'Menu description','Menu description','Menu description');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(292,292, 41,'Show menu','Show menu','Show menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(293,293, 41,'Show add menu','Show add menu','Show add menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(294,294, 41,'Show search','Show search','Show search');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(295,295, 41,'Show advanced search','Show advanced search','Show advanced search');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(296,296, 41,'Menu URL','Menu URL','Menu URL');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(297,297, 41,'Parent project','Parent project','Parent project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(298,298, 41,'Create new user','Create new user','Create new user');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(299,299, 41,'Relation','Relation','Relation');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(300,300, 41,'TRUE','TRUE','TRUE');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(301,301, 41,'FALSE','FALSE','FALSE');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(302,302, 41,'Build data','Build data','Build data');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(303,303, 41,'Master data','Master data','Master data');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(304,304, 41,'Login as eplegrand@gmail.com','Login as eplegrand@gmail.com','Login as eplegrand@gmail.com');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(305,305, 41,'Demo data','Demo data','Demo data');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(306,306, 41,'Demo data NL','Demo data NL','Demo data NL');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(307,307, 41,'Demo data is done','Demo data is done','Demo data is done');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(308,308, 41,'Back to Setup wizard','Back to Setup wizard','Back to Setup wizard');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(309,309, 41,'View content','View content','View content');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(310,310, 41,'Content type classifications','Content type classifications','Content type classifications');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(311,311, 41,'Edit content type classification','Edit content type classification','Edit content type classification');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(312,312, 41,'Security level','Security level','Security level');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(313,313, 41,'Created flow','Created flow','Created flow');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(314,314, 41,'Add left menu','Add left menu','Add left menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(315,315, 41,'New menu','New menu','New menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(316,316, 41,'Location','Location','Location');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(317,317, 41,'User dashboard','User dashboard','User dashboard');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(318,318, 41,'User','User','User');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(319,319, 41,'Content type group','Content type group','Content type group');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(320,320, 41,'Process template','Process template','Process template');

INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(321,1, 39,'Classificatie','Classificatie','Classificatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(322,2, 39,'Id','Id','Id');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(323,3, 39,'Naam','Naam','Naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(324,4, 39,'Nieuwe classificatie toevoegen','Nieuwe classificatie toevoegen','Nieuwe classificatie toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(325,5, 39,'Toevoegen','Toevoegen','Toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(326,6, 39,'Taal toevoegen','Taal toevoegen','Taal toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(327,7, 39,'Maarde toevoegen','Maarde toevoegen','Maarde toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(328,8, 39,'Alfabetisch','Alfabetisch','Alfabetisch');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(329,9, 39,'Terug naar classificatie niveaus','Terug naar classificatie niveaus','Terug naar classificatie niveaus');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(330,10, 39,'Terug naar classificatie waarden','Terug naar classificatie waarden','Terug naar classificatie waarden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(331,11, 39,'Terug naar classificaties','Terug naar classificaties','Terug naar classificaties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(332,12, 39,'Kan koppelen','Kan koppelen','Kan koppelen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(333,13, 39,'Annuleren','Annuleren','Annuleren');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(334,14, 39,'Classificatie taal','Classificatie taal','Classificatie taal');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(335,15, 39,'Classificatie niveau','Classificatie niveau','Classificatie niveau');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(336,16, 39,'Classificatie waarde taal','Classificatie waarde taal','Classificatie waarde taal');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(337,17, 39,'Inhoud type','Inhoud type','Inhoud type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(338,18, 39,'Nieuw classificatie niveau toevoegen','Nieuw classificatie niveau toevoegen','Nieuw classificatie niveau toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(339,19, 39,'Nieuwe waarde toevoegen','Nieuwe waarde toevoegen','Nieuwe waarde toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(340,20, 39,'Datum niveau','Datum niveau','Datum niveau');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(341,21, 39,'Verwijderen','Verwijderen','Verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(342,22, 39,'Omschrijving','Omschrijving','Omschrijving');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(343,23, 39,'Dropdown naam','Dropdown naam','Dropdown naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(344,24, 39,'Veranderen','Veranderen','Veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(345,25, 39,'Verander classificatie','Verander classificatie','Verander classificatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(346,26, 39,'Verander classificatie niveau','Verander classificatie niveau','Verander classificatie niveau');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(347,27, 39,'Taal veranderen','Taal veranderen','Taal veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(348,28, 39,'Waarde veranderen','Waarde veranderen','Waarde veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(349,29, 39,'Heeft dropdown','Heeft dropdown','Heeft dropdown');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(350,30, 39,'Titel beschrijving','Titel beschrijving','Titel beschrijving');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(351,31, 39,'Titel naam','Titel naam','Titel naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(352,32, 39,'In dropdown','In dropdown','In dropdown');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(353,33, 39,'Taal','Taal','Taal');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(354,34, 39,'Talen','Talen','Talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(355,35, 39,'Uitloggen','Uitloggen','Uitloggen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(356,36, 39,'Menu naam','Menu naam','Menu naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(357,37, 39,'muis over','muis over','muis over');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(358,38, 39,'Nieuwe waarde','Nieuwe waarde','Nieuwe waarde');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(359,39, 39,'flexibele toevoeging','flexibele toevoeging','flexibele toevoeging');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(360,40, 39,'Openen','Openen','Openen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(361,41, 39,'Organizatie','Organizatie','Organizatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(362,42, 39,'Organizatie type','Organizatie type','Organizatie type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(363,43, 39,'Pagina beschrijving','Pagina beschrijving','Pagina beschrijving');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(364,44, 39,'pagina naam','pagina naam','pagina naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(365,45, 39,'Pagina type','Pagina type','Pagina type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(366,46, 39,'paginas','paginas','paginas');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(367,47, 39,'Proces sjabloon veld type','Proces sjabloon veld type','Proces sjabloon veld type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(368,48, 39,'Proces sjabloon group','Proces sjabloon group','Proces sjabloon group');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(369,49, 39,'Proces sjabloon','Proces sjabloon','Proces sjabloon');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(370,50, 39,'Projecten','Projecten','Projecten');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(371,51, 39,'Rollen','Rollen','Rollen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(372,52, 39,'opslaan','opslaan','opslaan');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(373,53, 39,'Sectie types','Sectie types','Sectie types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(374,54, 39,'Instellingen','Instellingen','Instellingen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(375,55, 39,'opzet leidraad','opzet leidraad','opzet leidraad');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(376,56, 39,'Status','Status','Status');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(377,57, 39,'Term','Term','Term');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(378,58, 39,'Onderwerp naam','Onderwerp naam','Onderwerp naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(379,59, 39,'Classificaties','Classificaties','Classificaties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(380,60, 39,'Niveaus','Niveaus','Niveaus');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(381,61, 39,'Volgorde','Volgorde','Volgorde');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(382,62, 39,'Classificatie niveau talen','Classificatie niveau talen','Classificatie niveau talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(383,63, 39,'Veranderen','Veranderen','Veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(384,64, 39,'Gebruikers','Gebruikers','Gebruikers');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(385,65, 39,'Waarden','Waarden','Waarden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(386,66, 39,'Classificatie verwijderen','Classificatie verwijderen','Classificatie verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(387,67, 39,'Maker','Maker','Maker');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(388,68, 39,'Veranderaar','Veranderaar','Veranderaar');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(389,69, 39,'Inhoud types','Inhoud types','Inhoud types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(390,70, 39,'Nieuw inhoud type toevoegen','Nieuw inhoud type toevoegen','Nieuw inhoud type toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(391,71, 39,'Inhoud type veranderen','Inhoud type veranderen','Inhoud type veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(392,72, 39,'Inhoud type talen','Inhoud type talen','Inhoud type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(393,73, 39,'Terug naar inhoud types','Terug naar inhoud types','Terug naar inhoud types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(394,74, 39,'Taal verwijderen','Taal verwijderen','Taal verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(395,75, 39,'Organizaties','Organizaties','Organizaties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(396,76, 39,'Nieuwe organizatie toevoegen','Nieuwe organizatie toevoegen','Nieuwe organizatie toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(397,77, 39,'Organizatie talen','Organizatie talen','Organizatie talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(398,78, 39,'Terug naar organizatie','Terug naar organizatie','Terug naar organizatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(399,79, 39,'Type','Type','Type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(400,80, 39,'Vader organizatie','Vader organizatie','Vader organizatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(401,81, 39,'Organizatie type','Organizatie type','Organizatie type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(402,82, 39,'Organizatie type toevoegen','Organizatie type toevoegen','Organizatie type toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(403,83, 39,'Organizatie type veranderen','Organizatie type veranderen','Organizatie type veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(404,84, 39,'Organizatie type talen','Organizatie type talen','Organizatie type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(405,85, 39,'Terug naar organizatie types','Terug naar organizatie types','Terug naar organizatie types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(406,86, 39,'Secties','Secties','Secties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(407,87, 39,'Pagina aanmaken','Pagina aanmaken','Pagina aanmaken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(408,88, 39,'Pagina veranderen','Pagina veranderen','Pagina veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(409,89, 39,'Pagina secties','Pagina secties','Pagina secties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(410,90, 39,'Nieuwe pagina sectie aanmaken','Nieuwe pagina sectie aanmaken','Nieuwe pagina sectie aanmaken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(411,91, 39,'Terug naar paginas','Terug naar paginas','Terug naar paginas');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(412,92, 39,'Pagina sectie veranderen','Pagina sectie veranderen','Pagina sectie veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(413,93, 39,'Terug naar pagina secties','Terug naar pagina secties','Terug naar pagina secties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(414,94, 39,'Pagina sectie aanmaken','Pagina sectie aanmaken','Pagina sectie aanmaken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(415,95, 39,'Titel','Titel','Titel');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(416,96, 39,'Titel tonen','Titel tonen','Titel tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(417,97, 39,'Titel beschrijving tonen','Titel beschrijving tonen','Titel beschrijving tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(418,98, 39,'Inhoud type titel tonen','Inhoud type titel tonen','Inhoud type titel tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(419,99, 39,'Inhoud type beschrijving tonen','Inhoud type beschrijving tonen','Inhoud type beschrijving tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(420,100, 39,'Pagina types','Pagina types','Pagina types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(421,101, 39,'Nieuwe pagina type toevoegen','Nieuwe pagina type toevoegen','Nieuwe pagina type toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(422,102, 39,'Pagina type veranderen','Pagina type veranderen','Pagina type veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(423,103, 39,'Pagina type talen','Pagina type talen','Pagina type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(424,104, 39,'Terug naar pagina typen','Terug naar pagina typen','Terug naar pagina typen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(425,105, 39,'Nieuw project toevoegen','Nieuw project toevoegen','Nieuw project toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(426,106, 39,'Project veranderen','Project veranderen','Project veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(427,107, 39,'Project talen','Project talen','Project talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(428,108, 39,'Terug naar projecten','Terug naar projecten','Terug naar projecten');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(429,109, 39,'Pagina sectie types','Pagina sectie types','Pagina sectie types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(430,110, 39,'Nieuwe pagina sectie type toevoegen','Nieuwe pagina sectie type toevoegen','Nieuwe pagina sectie type toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(431,111, 39,'Pagina sectie type veranderen','Pagina sectie type veranderen','Pagina sectie type veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(432,112, 39,'Index sectie','Index sectie','Index sectie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(433,113, 39,'Paginae sectie type talen','Paginae sectie type talen','Paginae sectie type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(434,114, 39,'Terug naar pagina sectie typen','Terug naar pagina sectie typen','Terug naar pagina sectie typen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(435,115, 39,'Relaties','Relaties','Relaties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(436,116, 39,'Rol toevoegen','Rol toevoegen','Rol toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(437,117, 39,'Gebruiker veranderen','Gebruiker veranderen','Gebruiker veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(438,118, 39,'Gebruiker toevoegen','Gebruiker toevoegen','Gebruiker toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(439,119, 39,'email','email','email');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(440,120, 39,'standard taal','standard taal','standard taal');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(441,121, 39,'Land','Land','Land');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(442,122, 39,'Wachtwoord','Wachtwoord','Wachtwoord');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(443,123, 39,'Wachtwoord bevestigen','Wachtwoord bevestigen','Wachtwoord bevestigen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(444,124, 39,'Gebruikers projecten','Gebruikers projecten','Gebruikers projecten');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(445,125, 39,'Terug naar gebruikers','Terug naar gebruikers','Terug naar gebruikers');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(446,126, 39,'Gebruikers toevoegen aan project','Gebruikers toevoegen aan project','Gebruikers toevoegen aan project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(447,127, 39,'Project','Project','Project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(448,128, 39,'Rol veranderen','Rol veranderen','Rol veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(449,129, 39,'Gebruikers veranderen','Gebruikers veranderen','Gebruikers veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(450,130, 39,'Rechten','Rechten','Rechten');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(451,131, 39,'Rechten veranderen','Rechten veranderen','Rechten veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(452,132, 39,'Gebruikers veranderen per rol','Gebruikers veranderen per rol','Gebruikers veranderen per rol');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(453,133, 39,'Rol ID','Rol ID','Rol ID');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(454,134, 39,'Bebruikers naam','Bebruikers naam','Bebruikers naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(455,135, 39,'Rechten veranderen per rol','Rechten veranderen per rol','Rechten veranderen per rol');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(456,136, 39,'Geselecteerd','Geselecteerd','Geselecteerd');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(457,137, 39,'Claim type','Claim type','Claim type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(458,138, 39,'Claim waarde','Claim waarde','Claim waarde');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(459,139, 39,'Rol','Rol','Rol');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(460,140, 39,'Nieuwe rol toevoegen','Nieuwe rol toevoegen','Nieuwe rol toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(461,141, 39,'Rol naam','Rol naam','Rol naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(462,142, 39,'Velden','Velden','Velden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(463,143, 39,'Werkstroom','Werkstroom','Werkstroom');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(464,144, 39,'Process sjabloon veranderen','Process sjabloon veranderen','Process sjabloon veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(465,145, 39,'Nieuw process sjabloon toevoegen','Nieuw process sjabloon toevoegen','Nieuw process sjabloon toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(466,146, 39,'Process sjabloon groep','Process sjabloon groep','Process sjabloon groep');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(467,147, 39,'Process sjabloon velden','Process sjabloon velden','Process sjabloon velden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(468,148, 39,'Stappen','Stappen','Stappen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(469,149, 39,'Nieuw process sjabloon veld toevoegen','Nieuw process sjabloon veld toevoegen','Nieuw process sjabloon veld toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(470,150, 39,'Process sjabloon veld veranderen','Process sjabloon veld veranderen','Process sjabloon veld veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(471,151, 39,'Gegevens type','Gegevens type','Gegevens type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(472,152, 39,'Gekoppelde tabel','Gekoppelde tabel','Gekoppelde tabel');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(473,153, 39,'Stappen voor veld','Stappen voor veld','Stappen voor veld');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(474,154, 39,'Veld stap instellingen veranderen','Veld stap instellingen veranderen','Veld stap instellingen veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(475,155, 39,'Process sjabloon veld talen','Process sjabloon veld talen','Process sjabloon veld talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(476,156, 39,'Terug naar process sjabloon velden','Terug naar process sjabloon velden','Terug naar process sjabloon velden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(477,157, 39,'Process sjabloon werkstroom','Process sjabloon werkstroom','Process sjabloon werkstroom');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(478,158, 39,'Voorwaarden','Voorwaarden','Voorwaarden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(479,159, 39,'Nieuwe process sjabloon werkstroom toevoegen','Nieuwe process sjabloon werkstroom toevoegen','Nieuwe process sjabloon werkstroom toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(480,160, 39,'Terug naar process sjablonen','Terug naar process sjablonen','Terug naar process sjablonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(481,161, 39,'Process sjabloon werkstroom veranderen','Process sjabloon werkstroom veranderen','Process sjabloon werkstroom veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(482,162, 39,'Voorwaarde relatie','Voorwaarde relatie','Voorwaarde relatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(483,163, 39,'Van stap','Van stap','Van stap');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(484,164, 39,'Naar stap','Naar stap','Naar stap');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(485,165, 39,'Process sjabloon werkstroom talen','Process sjabloon werkstroom talen','Process sjabloon werkstroom talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(486,166, 39,'Werkstroom voorwaarden','Werkstroom voorwaarden','Werkstroom voorwaarden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(487,167, 39,'Letter','Letter','Letter');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(488,168, 39,'Nieuwe process sjabloon werkstroom conditie toevoegen','Nieuwe process sjabloon werkstroom conditie toevoegen','Nieuwe process sjabloon werkstroom conditie toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(489,169, 39,'Terug naar process sjabloon werkstromen','Terug naar process sjabloon werkstromen','Terug naar process sjabloon werkstromen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(490,170, 39,'Nieuwe process sjabloon groep aanmaken','Nieuwe process sjabloon groep aanmaken','Nieuwe process sjabloon groep aanmaken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(491,171, 39,'Process sjabloon groep veranderen','Process sjabloon groep veranderen','Process sjabloon groep veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(492,172, 39,'Process sjabloon groep talen','Process sjabloon groep talen','Process sjabloon groep talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(493,173, 39,'Terug naar process sjabloon groepen','Terug naar process sjabloon groepen','Terug naar process sjabloon groepen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(494,174, 39,'Inhoud maken','Inhoud maken','Inhoud maken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(495,175, 39,'Inhoud titel','Inhoud titel','Inhoud titel');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(496,176, 39,'Inhoud beschrijving','Inhoud beschrijving','Inhoud beschrijving');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(497,177, 39,'Inhoud status','Inhoud status','Inhoud status');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(498,178, 39,'Inhoud organizatie','Inhoud organizatie','Inhoud organizatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(499,179, 39,'Inhoud project','Inhoud project','Inhoud project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(500,180, 39,'Buitenlandse naam','Buitenlandse naam','Buitenlandse naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(501,181, 39,'ISO6391','ISO6391','ISO6391');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(502,182, 39,'ISO6392','ISO6392','ISO6392');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(503,183, 39,'Terug naar process velden','Terug naar process velden','Terug naar process velden');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(504,184, 39,'Velden voor de stap','Velden voor de stap','Velden voor de stap');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(505,185, 39,'Terug naar stappen','Terug naar stappen','Terug naar stappen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(506,186, 39,'Process sjabloon stappen','Process sjabloon stappen','Process sjabloon stappen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(507,187, 39,'Nieuwe process sjabloon stap aanmaken','Nieuwe process sjabloon stap aanmaken','Nieuwe process sjabloon stap aanmaken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(508,188, 39,'Stap veranderen','Stap veranderen','Stap veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(509,189, 39,'Stap toevoegen','Stap toevoegen','Stap toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(510,190, 39,'Process sjabloon stap talen','Process sjabloon stap talen','Process sjabloon stap talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(511,191, 39,'Nieuwe taal toevoegen','Nieuwe taal toevoegen','Nieuwe taal toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(512,192, 39,'Actief','Actief','Actief');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(513,193, 39,'Nummer','Nummer','Nummer');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(514,194, 39,'Tekst','Tekst','Tekst');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(515,195, 39,'Datum','Datum','Datum');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(516,196, 39,'Instelling veranderen','Instelling veranderen','Instelling veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(517,197, 39,'Process sjabloon veld type talen','Process sjabloon veld type talen','Process sjabloon veld type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(518,198, 39,'Process sjabloon veld type veranderen','Process sjabloon veld type veranderen','Process sjabloon veld type veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(519,199, 39,'Process sjabloon veld type verwijderen','Process sjabloon veld type verwijderen','Process sjabloon veld type verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(520,200, 39,'Nieuw process sjabloon veld type toevoegen','Nieuw process sjabloon veld type toevoegen','Nieuw process sjabloon veld type toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(521,201, 39,'Terug naar process sjabloon veld types','Terug naar process sjabloon veld types','Terug naar process sjabloon veld types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(522,202, 39,'Gebruikers organizatie type','Gebruikers organizatie type','Gebruikers organizatie type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(523,203, 39,'Gebruikers organizatie type talen','Gebruikers organizatie type talen','Gebruikers organizatie type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(524,204, 39,'Nieuwe gebruikers organizatie type taal toevoegen','Nieuwe gebruikers organizatie type taal toevoegen','Nieuwe gebruikers organizatie type taal toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(525,205, 39,'Terug naar gebruikers organizatie types','Terug naar gebruikers organizatie types','Terug naar gebruikers organizatie types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(526,206, 39,'Toevoeg datum','Toevoeg datum','Toevoeg datum');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(527,207, 39,'Verander datum','Verander datum','Verander datum');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(528,208, 39,'Inhouds type verwijderen','Inhouds type verwijderen','Inhouds type verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(529,209, 39,'Organizatie verwijderen','Organizatie verwijderen','Organizatie verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(530,210, 39,'Organizatie type verwijderen','Organizatie type verwijderen','Organizatie type verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(531,211, 39,'Pagina verwijderen','Pagina verwijderen','Pagina verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(532,212, 39,'Pagina sectie verwijderen','Pagina sectie verwijderen','Pagina sectie verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(533,213, 39,'Heeft pagineren','Heeft pagineren','Heeft pagineren');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(534,214, 39,'Maximale inhoud','Maximale inhoud','Maximale inhoud');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(535,215, 39,'Een of twee colomen','Een of twee colomen','Een of twee colomen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(536,216, 39,'Pagina sectie talen','Pagina sectie talen','Pagina sectie talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(537,217, 39,'Pagina talen','Pagina talen','Pagina talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(538,218, 39,'Programma titel','Programma titel','Programma titel');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(539,219, 39,'Dropdown volgorde','Dropdown volgorde','Dropdown volgorde');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(540,220, 39,'Standard pagina','Standard pagina','Standard pagina');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(541,221, 39,'Voorkeur','Voorkeur','Voorkeur');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(542,222, 39,'Gebruikers project type','Gebruikers project type','Gebruikers project type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(543,223, 39,'Gebruikers relatie type','Gebruikers relatie type','Gebruikers relatie type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(544,224, 39,'Inloggen','Inloggen','Inloggen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(545,225, 39,'Registreren','Registreren','Registreren');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(546,226, 39,'Inhoud toevoegen','Inhoud toevoegen','Inhoud toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(547,227, 39,'Inhoud','Inhoud','Inhoud');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(548,228, 39,'Kalender','Kalender','Kalender');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(549,229, 39,'Babbellen','Babbellen','Babbellen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(550,230, 39,'Conferentie','Conferentie','Conferentie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(551,231, 39,'Favorieten','Favorieten','Favorieten');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(552,232, 39,'Spel','Spel','Spel');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(553,233, 39,'Proces toevoegen','Proces toevoegen','Proces toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(554,234, 39,'Proces','Proces','Proces');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(555,235, 39,'Te doen toevoegen','Te doen toevoegen','Te doen toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(556,236, 39,'Te doen','Te doen','Te doen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(557,237, 39,'Zoeken','Zoeken','Zoeken');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(558,238, 39,'Classificatie paginas','Classificatie paginas','Classificatie paginas');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(559,239, 39,'Nieuwe classificatie pagina toevoegen','Nieuwe classificatie pagina toevoegen','Nieuwe classificatie pagina toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(560,240, 39,'Classificatie pagina veranderen','Classificatie pagina veranderen','Classificatie pagina veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(561,241, 39,'Titel naam tonen','Titel naam tonen','Titel naam tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(562,242, 39,'Titel naam','Titel naam','Titel naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(563,243, 39,'Classificatie pagina verwijderen','Classificatie pagina verwijderen','Classificatie pagina verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(564,244, 39,'Terug naar classificatie paginas','Terug naar classificatie paginas','Terug naar classificatie paginas');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(565,245, 39,'Classificatie pagina secties','Classificatie pagina secties','Classificatie pagina secties');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(566,246, 39,'Nieuwe classificatie pagina sectie toevoegen','Nieuwe classificatie pagina sectie toevoegen','Nieuwe classificatie pagina sectie toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(567,247, 39,'Classificatie pagina sectie veranderen','Classificatie pagina sectie veranderen','Classificatie pagina sectie veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(568,248, 39,'Sectie type','Sectie type','Sectie type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(569,249, 39,'Sectie titel naam tonen','Sectie titel naam tonen','Sectie titel naam tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(570,250, 39,'Sectie titel beschrijving tonen','Sectie titel beschrijving tonen','Sectie titel beschrijving tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(571,251, 39,'Inhoud type naam tonen','Inhoud type naam tonen','Inhoud type naam tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(572,252, 39,'Inhoud type beschrijving tonen','Inhoud type beschrijving tonen','Inhoud type beschrijving tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(573,253, 39,'Op volgorde van','Op volgorde van','Op volgorde van');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(574,254, 39,'Classificatie pagina sectie verwijderen','Classificatie pagina sectie verwijderen','Classificatie pagina sectie verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(575,255, 39,'In menu','In menu','In menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(576,256, 39,'Gebruikers project type talen','Gebruikers project type talen','Gebruikers project type talen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(577,257, 39,'Gebruikers project type taal toevoegen','Gebruikers project type taal toevoegen','Gebruikers project type taal toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(578,258, 39,'Terug naar gebruikers project types','Terug naar gebruikers project types','Terug naar gebruikers project types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(579,259, 39,'x is de "naam" van y','x is de "naam" van y','x is de "naam" van y');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(580,260, 39,'y van "naam" is de x','y van "naam" is de x','y van "naam" is de x');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(581,261, 39,'x is de "beschrijving" van y','x is de "beschrijving" van y','x is de "beschrijving" van y');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(582,262, 39,'y van "beschrijving" is de x','y van "beschrijving" is de x','y van "beschrijving" is de x');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(583,263, 39,'x is de "muis over" van y','x is de "muis over" van y','x is de "muis over" van y');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(584,264, 39,'y van "muis over" is de x','y van "muis over" is de x','y van "muis over" is de x');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(585,265, 39,'x is de "menu naam" van y','x is de "menu naam" van y','x is de "menu naam" van y');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(586,266, 39,'y van "menu naam" is de x','y van "menu naam" is de x','y van "menu naam" is de x');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(587,267, 39,'Terug naar gebruikers relatie types','Terug naar gebruikers relatie types','Terug naar gebruikers relatie types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(588,268, 39,'Gebruikers relatie type taal toevoegen','Gebruikers relatie type taal toevoegen','Gebruikers relatie type taal toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(589,269, 39,'Gebruikers relatie types','Gebruikers relatie types','Gebruikers relatie types');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(590,270, 39,'Gebruikers relatie type taal veranderen','Gebruikers relatie type taal veranderen','Gebruikers relatie type taal veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(591,271, 39,'Gebruikers relatie type taal verwijderen','Gebruikers relatie type taal verwijderen','Gebruikers relatie type taal verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(592,272, 39,'Te doen','Te doen','Te doen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(593,273, 39,'Proces naam','Proces naam','Proces naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(594,274, 39,'Menu toevoegen','Menu toevoegen','Menu toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(595,275, 39,'Controller','Controller','Controller');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(596,276, 39,'Action','Action','Action');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(597,277, 39,'Bestemming ID','Bestemming ID','Bestemming ID');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(598,278, 39,'Kenmerk','Kenmerk','Kenmerk');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(599,279, 39,'Menu verwijderen','Menu verwijderen','Menu verwijderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(600,280, 39,'Oud','Oud','Oud');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(601,281, 39,'Type naam','Type naam','Type naam');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(602,282, 39,'Lid','Lid','Lid');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(603,283, 39,'Menu veranderen','Menu veranderen','Menu veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(604,284, 39,'Menu type','Menu type','Menu type');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(605,285, 39,'Menus','Menus','Menus');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(606,286, 39,'Menu niveau 1','Menu niveau 1','Menu niveau 1');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(607,287, 39,'Terug naar menu','Terug naar menu','Terug naar menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(608,288, 39,'Linker menu','Linker menu','Linker menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(609,289, 39,'Linked menu veranderen','Linked menu veranderen','Linked menu veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(610,290, 39,'Menu','Menu','Menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(611,291, 39,'Menu beschrijving','Menu beschrijving','Menu beschrijving');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(612,292, 39,'Menu tonen','Menu tonen','Menu tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(613,293, 39,'Toevoeg menu tonen','Toevoeg menu tonen','Toevoeg menu tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(614,294, 39,'Zoeken tonen','Zoeken tonen','Zoeken tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(615,295, 39,'Gevorderd zoeken tonen','Gevorderd zoeken tonen','Gevorderd zoeken tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(616,296, 39,'Menu URL','Menu URL','Menu URL');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(617,297, 39,'Vader project','Vader project','Vader project');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(618,298, 39,'Nieuwe gebruiker toevoegen','Nieuwe gebruiker toevoegen','Nieuwe gebruiker toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(619,299, 39,'Relatie','Relatie','Relatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(620,300, 39,'Waar','Waar','Waar');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(621,301, 39,'Onwaar','Onwaar','Onwaar');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(622,302, 39,'Gegevens bouwen','Gegevens bouwen','Gegevens bouwen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(623,303, 39,'Hoofd gegeven bouwen','Hoofd gegeven bouwen','Hoofd gegeven bouwen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(624,304, 39,'Inloggen als eplegrand@gmail.com','Inloggen als eplegrand@gmail.com','Inloggen als eplegrand@gmail.com');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(625,305, 39,'Voorbeeld gegeven bouwen','Voorbeeld gegeven bouwen','Voorbeeld gegeven bouwen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(626,306, 39,'Nederlandse voorbeeld gegeven','Nederlandse voorbeeld gegeven','Nederlandse voorbeeld gegeven');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(627,307, 39,'Voorbeeld gegevens laden is voltooid','Voorbeeld gegevens laden is voltooid','Voorbeeld gegevens laden is voltooid');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(628,308, 39,'Terug naar gegevens bouwen leidraad','Terug naar gegevens bouwen leidraad','Terug naar gegevens bouwen leidraad');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(629,309, 39,'Inhoud tonen','Inhoud tonen','Inhoud tonen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(630,310, 39,'Inhouds type classificering','Inhouds type classificering','Inhouds type classificering');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(631,311, 39,'Inhouds type classificering veranderen','Inhouds type classificering veranderen','Inhouds type classificering veranderen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(632,312, 39,'Veiligheids niveau','Veiligheids niveau','Veiligheids niveau');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(633,313, 39,'Gemaakte werkstroom','Gemaakte werkstroom','Gemaakte werkstroom');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(634,314, 39,'Linker menu toevoegen','Linker menu toevoegen','Linker menu toevoegen');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(635,315, 39,'Nieuw menu','Nieuw menu','Nieuw menu');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(636,316, 39,'Lokatie','Lokatie','Lokatie');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(637,317, 39,'Gebruikers dashboard','Gebruikers dashboard','Gebruikers dashboard');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(638,318, 39,'Gebruikers','Gebruikers','Gebruikers');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(639,319, 39,'Inhouds type groep','Inhouds type groep','Inhouds type groep');
INSERT INTO UITermLanguages (UITermLanguageId, UITermID, LanguageID, Name, Description, MouseOver) VALUES(640,320, 39,'Proces sjabloon','Proces sjabloon','Proces sjabloon');
SET IDENTITY_INSERT UITermLanguages OFF;

SET IDENTITY_INSERT MVCUIScreens ON;
INSERT INTO [dbo].[MVCUIScreens](MVCUIScreenId, [Controller],[Action])VALUES(1, 'Classification','Index')
SET IDENTITY_INSERT MVCUIScreens OFF;

SET IDENTITY_INSERT MVCUITermScreens ON;
INSERT INTO [dbo].[MVCUITermScreens](MVCUITermScreenID,[UITermID],[MVCUIScreenID])VALUES(1, 3,1)
SET IDENTITY_INSERT MVCUITermScreens OFF;
