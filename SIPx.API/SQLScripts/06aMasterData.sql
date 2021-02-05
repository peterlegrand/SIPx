DECLARE @User as nvarchar(450);
Select @User = Id from AspNetUsers

SET IDENTITY_INSERT Statuses ON;
INSERT INTO Statuses (StatusId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES (1,192,192,192,192), (2, 327, 327, 327, 327);
SET IDENTITY_INSERT Statuses OFF;

SET IDENTITY_INSERT Languages ON;
INSERT INTO Languages (LanguageId, ForeignName, ISO6391, ISO6392, StatusId, NameTermId, ModifierId, ModifiedDate) VALUES 
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






INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (1, 41, NULL, NULL, NULL, NULL, 120, 120, 120, 120, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (2, 1, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (3, 1, NULL, NULL, NULL, NULL, 1373, 1373, 1373, 1373, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (4, NULL, @User, NULL, NULL, NULL, 1601, 1601, 1601, 1601, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (5, NULL, NULL, NULL, NULL, 0, 3883, 3883, 3883, 3883, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (6, NULL, NULL, NULL, NULL, 1, 3884, 3884, 3884, 3884, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (7, NULL, NULL, NULL, NULL, 0, 3885, 3885, 3885, 3885, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (8, NULL, NULL, NULL, NULL, 0, 3886, 3886, 3886, 3886, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (9, NULL, NULL, NULL, NULL, 0, 3887, 3887, 3887, 3887, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (10, NULL, NULL, NULL, NULL, 0, 3888, 3888, 3888, 3888, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (11, NULL, NULL, NULL, NULL, 0, 3889, 3889, 3889, 3889, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (12, NULL, NULL, NULL, NULL, 0, 3890, 3890, 3890, 3890, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (13, NULL, N'-', NULL, NULL, NULL, 3891, 3891, 3891, 3891, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (14, 2, NULL, NULL, NULL, NULL, 3892, 3892, 3892, 3892, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (15, 2, NULL, NULL, NULL, NULL, 3893, 3893, 3893, 3893, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (16, 2, NULL, NULL, NULL, NULL, 3894, 3894, 3894, 3894, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (17, 2, NULL, NULL, NULL, NULL, 3895, 3895, 3895, 3895, 1, @User, getdate())

INSERT [dbo].[Settings] ([SettingID], [IntValue], [StringValue], [DateTimeValue], [GuidValue], [BoolValue], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [TypeID], [ModifierID], [ModifiedDate]) VALUES (18, 2, NULL, NULL, NULL, NULL, 3896, 3896, 3896, 3896, 1, @User, getdate())


SET IDENTITY_INSERT DateLevels ON
INSERT INTO DateLevels (DateLevelId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES (1, 328, 328, 328, 328),
(2,329,329,329,329), (3,330,330,330,330), (4,331,331,331,331), (5,332,332,332,332);
SET IDENTITY_INSERT DateLevels OFF

SET IDENTITY_INSERT PageSectionTypes ON;
INSERT INTO PageSectionTypes (PageSectionTypeId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID, active) VALUES 
  (1,333,333,333,333,1)
, (2,334,334,334,334,1)
, (3,229,229,229,229,1)
, (4,1341,1341,1341,1341,1)
, (5,1342,1342,1342,1342,1)
, (6,1343,1343,1343,1343,1)
, (7,1344,1344,1344,1344,1)
, (8,1345,1345,1345,1345,1)
, (9, 272, 272, 272, 272,1) 
SET IDENTITY_INSERT PageSectionTypes OFF;

SET IDENTITY_INSERT ContentStatuses ON;
INSERT INTO ContentStatuses (ContentStatusId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
  (1,335,335,335,335)
, (2,336,336,336,336)
, (3,337,337,337,337)
, (4,338,338,338,338)
SET IDENTITY_INSERT ContentStatuses OFF;

SET IDENTITY_INSERT SortBys ON;
INSERT INTO SortBys (SortById, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
  (1,342,342,342,342)
, (2,343,343,343,343)
SET IDENTITY_INSERT SortBys OFF;

SET IDENTITY_INSERT Regions ON;
INSERT INTO Regions (RegionId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES (1,344,344,344,344), (2,345,345,345,345), (3,346,346,346,346), (4,347,347,347,347), (5,348,348,348,348);
SET IDENTITY_INSERT Regions OFF;


SET IDENTITY_INSERT SubRegions ON;
INSERT INTO SubRegions (SubRegionId, RegionId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES (1, 3,349,349,349,349), (2, 1,350,350,350,350), (3, 4,351,351,351,351), (4, 1,352,352,352,352)
,(5, 4,353,353,353,353), (6, 1,354,354,354,354), (7, 1,355,355,355,355), (8, 2,356,356,356,356), (9, 3,357,357,357,357), (10, 4,358,358,358,358), (11, 3,359,359,359,359)
,(12, 4,360,360,360,360), (13, 2,361,361,361,361), (14, 3,362,362,362,362), (15, 5,363,363,363,363), (16, 4,364,364,364,364), (17, 5,365,365,365,365);
SET IDENTITY_INSERT SubRegions OFF;



SET IDENTITY_INSERT IntermediateRegions ON;
INSERT INTO IntermediateRegions (IntermediateRegionId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES (1,366,366,366,366), (2,367,367,367,367)
,(3, 368, 368, 368, 368), (4, 369, 369, 369, 369), (5,370,370,370,370), (6,371,371,371,371), (7,372,372,372,372), (8,373,373,373,373);
SET IDENTITY_INSERT IntermediateRegions OFF;



SET IDENTITY_INSERT Countries ON;
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (1,'Afghanistan', 'AF', 'AFG',4, 3, 374);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (2,'Åland Islands', 'AX', 'ALA',248, 7, 375);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (3,'Albania', 'AL', 'ALB',8, 2, 376);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (4,'Algeria', 'DZ', 'DZA',12, 15, 377);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (5,'American Samoa', 'AS', 'ASM',16, 14, 378);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (6,'Andorra', 'AD', 'AND',20, 2, 379);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (7,'Angola', 'AO', 'AGO',24, 17, 3, 380);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (8,'Anguilla', 'AI', 'AIA',660, 13, 7, 381);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num,NameTermID) VALUES (9,'Antarctica', 'AQ', 'ATA',10 , 382);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (10,'Antigua and Barbuda', 'AG', 'ATG',28, 13, 7, 383);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (11,'Argentina', 'AR', 'ARG',32, 13, 6, 384);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (12,'Armenia', 'AM', 'ARM',51, 16, 385);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (13,'Aruba', 'AW', 'ABW',533, 13, 7, 386);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (14,'Australia', 'AU', 'AUS',36, 1, 387);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (15,'Austria', 'AT', 'AUT',40, 4, 388);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (16,'Azerbaijan', 'AZ', 'AZE',31, 16, 389);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (17,'Bahamas', 'BS', 'BHS',44, 13, 7, 390);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (18,'Bahrain', 'BH', 'BHR',48, 16, 391);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (19,'Bangladesh', 'BD', 'BGD',50, 3, 392);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (20,'Barbados', 'BB', 'BRB',52, 13, 7, 393);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (21,'Belarus', 'BY', 'BLR',112, 6, 394);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (22,'Belgium', 'BE', 'BEL',56, 4, 395);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (23,'Belize', 'BZ', 'BLZ',84, 13, 2, 396);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (24,'Benin', 'BJ', 'BEN',204, 17, 5, 397);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (25,'Bermuda', 'BM', 'BMU',60, 8, 398);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (26,'Bhutan', 'BT', 'BTN',64, 3, 399);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (27,'Bolivia (Plurinational State of)', 'BO', 'BOL',68, 13, 6, 400);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (28,'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES',535, 13, 7, 401);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (29,'Bosnia and Herzegovina', 'BA', 'BIH',70, 2, 402);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (30,'Botswana', 'BW', 'BWA',72, 17, 4, 403);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (31,'Bouvet Island', 'BV', 'BVT',74, 13, 6, 404);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (32,'Brazil', 'BR', 'BRA',76, 13, 6, 405);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (33,'British Indian Ocean Territory', 'IO', 'IOT',86, 17, 8, 406);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (34,'Brunei Darussalam', 'BN', 'BRN',96, 12, 407);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (35,'Bulgaria', 'BG', 'BGR',100, 6, 408);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (36,'Burkina Faso', 'BF', 'BFA',854, 17, 5, 409);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (37,'Burundi', 'BI', 'BDI',108, 17, 8, 410);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (38,'Cabo Verde', 'CV', 'CPV',132, 17, 5, 411);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (39,'Cambodia', 'KH', 'KHM',116, 12, 412);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (40,'Cameroon', 'CM', 'CMR',120, 17, 3, 413);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (41,'Canada', 'CA', 'CAN',124, 8, 414);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (42,'Cayman Islands', 'KY', 'CYM',136, 13, 7, 415);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (43,'Central African Republic', 'CF', 'CAF',140, 17, 3, 416);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (44,'Chad', 'TD', 'TCD',148, 17, 3, 417);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (45,'Chile', 'CL', 'CHL',152, 13, 6, 418);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (46,'China', 'CN', 'CHN',156, 5, 419);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (47,'Christmas Island', 'CX', 'CXR',162, 1, 420);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (48,'Cocos (Keeling) Islands', 'CC', 'CCK',166, 1, 421);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (49,'Colombia', 'CO', 'COL',170, 13, 6, 422);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (50,'Comoros', 'KM', 'COM',174, 17, 8, 423);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (51,'Congo', 'CG', 'COG',178, 17, 3, 424);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (52,'Congo, Democratic Republic of the', 'CD', 'COD',180, 17, 3, 425);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (53,'Cook Islands', 'CK', 'COK',184, 14, 426);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (54,'Costa Rica', 'CR', 'CRI',188, 13, 2, 427);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (55,'Côte d''Ivoire', 'CI', 'CIV',384, 17, 5, 428);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (56,'Croatia', 'HR', 'HRV',191, 2, 429);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (57,'Cuba', 'CU', 'CUB',192, 13, 7, 430);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (58,'Curaçao', 'CW', 'CUW',531, 13, 7, 431);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (59,'Cyprus', 'CY', 'CYP',196, 16, 432);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (60,'Czechia', 'CZ', 'CZE',203, 6, 433);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (61,'Denmark', 'DK', 'DNK',208, 7, 434);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (62,'Djibouti', 'DJ', 'DJI',262, 17, 8, 435);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (63,'Dominica', 'DM', 'DMA',212, 13, 7, 436);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (64,'Dominican Republic', 'DO', 'DOM',214, 13, 7, 437);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (65,'Ecuador', 'EC', 'ECU',218, 13, 6, 438);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (66,'Egypt', 'EG', 'EGY',818, 15, 439);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (67,'El Salvador', 'SV', 'SLV',222, 13, 2, 440);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (68,'Equatorial Guinea', 'GQ', 'GNQ',226, 17, 3, 441);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (69,'Eritrea', 'ER', 'ERI',232, 17, 8, 442);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (70,'Estonia', 'EE', 'EST',233, 7, 443);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (71,'Eswatini', 'SZ', 'SWZ',748, 17, 4, 444);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (72,'Ethiopia', 'ET', 'ETH',231, 17, 8, 445);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (73,'Falkland Islands (Malvinas)', 'FK', 'FLK',238, 13, 6, 446);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (74,'Faroe Islands', 'FO', 'FRO',234, 7, 447);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (75,'Fiji', 'FJ', 'FJI',242, 11, 448);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (76,'Finland', 'FI', 'FIN',246, 7, 449);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (77,'France', 'FR', 'FRA',250, 4, 450);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (78,'French Guiana', 'GF', 'GUF',254, 13, 6, 451);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (79,'French Polynesia', 'PF', 'PYF',258, 14, 452);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (80,'French Southern Territories', 'TF', 'ATF',260, 17, 8, 453);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (81,'Gabon', 'GA', 'GAB',266, 17, 3, 454);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (82,'Gambia', 'GM', 'GMB',270, 17, 5, 455);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (83,'Georgia', 'GE', 'GEO',268, 16, 456);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (84,'Germany', 'DE', 'DEU',276, 4, 457);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (85,'Ghana', 'GH', 'GHA',288, 17, 5, 458);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (86,'Gibraltar', 'GI', 'GIB',292, 2, 459);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (87,'Greece', 'GR', 'GRC',300, 2, 460);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (88,'Greenland', 'GL', 'GRL',304, 8, 461);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (89,'Grenada', 'GD', 'GRD',308, 13, 7, 462);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (90,'Guadeloupe', 'GP', 'GLP',312, 13, 7, 463);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (91,'Guam', 'GU', 'GUM',316, 9, 464);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (92,'Guatemala', 'GT', 'GTM',320, 13, 2, 465);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (93,'Guernsey', 'GG', 'GGY',831, 7, 1, 466);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (94,'Guinea', 'GN', 'GIN',324, 17, 5, 467);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (95,'Guinea-Bissau', 'GW', 'GNB',624, 17, 5, 468);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (96,'Guyana', 'GY', 'GUY',328, 13, 6, 469);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (97,'Haiti', 'HT', 'HTI',332, 13, 7, 470);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (98,'Heard Island and McDonald Islands', 'HM', 'HMD',334, 1, 471);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (99,'Holy See', 'VA', 'VAT',336, 2, 472);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (100,'Honduras', 'HN', 'HND',340, 13, 2, 473);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (101,'Hong Kong', 'HK', 'HKG',344, 5, 474);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (102,'Hungary', 'HU', 'HUN',348, 6, 475);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (103,'Iceland', 'IS', 'ISL',352, 7, 476);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (104,'India', 'IN', 'IND',356, 3, 477);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (105,'Indonesia', 'ID', 'IDN',360, 12, 478);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (106,'Iran (Islamic Republic of)', 'IR', 'IRN',364, 3, 479);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (107,'Iraq', 'IQ', 'IRQ',368, 16, 480);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (108,'Ireland', 'IE', 'IRL',372, 7, 481);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (109,'Isle of Man', 'IM', 'IMN',833, 7, 482);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (110,'Israel', 'IL', 'ISR',376, 16, 483);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (111,'Italy', 'IT', 'ITA',380, 2, 484);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (112,'Jamaica', 'JM', 'JAM',388, 13, 7, 485);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (113,'Japan', 'JP', 'JPN',392, 5, 486);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (114,'Jersey', 'JE', 'JEY',832, 7, 1, 487);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (115,'Jordan', 'JO', 'JOR',400, 16, 488);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (116,'Kazakhstan', 'KZ', 'KAZ',398, 10, 489);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (117,'Kenya', 'KE', 'KEN',404, 17, 8, 490);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (118,'Kiribati', 'KI', 'KIR',296, 9, 491);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (119,'Korea (Democratic People''s Republic of)', 'KP', 'PRK',408, 5, 492);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (120,'Korea, Republic of', 'KR', 'KOR',410, 5, 493);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (121,'Kuwait', 'KW', 'KWT',414, 16, 494);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (122,'Kyrgyzstan', 'KG', 'KGZ',417, 10, 495);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (123,'Lao People''s Democratic Republic', 'LA', 'LAO',418, 12, 496);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (124,'Latvia', 'LV', 'LVA',428, 7, 497);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (125,'Lebanon', 'LB', 'LBN',422, 16, 498);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (126,'Lesotho', 'LS', 'LSO',426, 17, 4, 499);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (127,'Liberia', 'LR', 'LBR',430, 17, 5, 500);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (128,'Libya', 'LY', 'LBY',434, 15, 501);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (129,'Liechtenstein', 'LI', 'LIE',438, 4, 502);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (130,'Lithuania', 'LT', 'LTU',440, 7, 503);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (131,'Luxembourg', 'LU', 'LUX',442, 4, 504);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (132,'Macao', 'MO', 'MAC',446, 5, 505);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (133,'Madagascar', 'MG', 'MDG',450, 17, 8, 506);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (134,'Malawi', 'MW', 'MWI',454, 17, 8, 507);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (135,'Malaysia', 'MY', 'MYS',458, 12, 508);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (136,'Maldives', 'MV', 'MDV',462, 3, 509);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (137,'Mali', 'ML', 'MLI',466, 17, 5, 510);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (138,'Malta', 'MT', 'MLT',470, 2, 511);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (139,'Marshall Islands', 'MH', 'MHL',584, 9, 512);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (140,'Martinique', 'MQ', 'MTQ',474, 13, 7, 513);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (141,'Mauritania', 'MR', 'MRT',478, 17, 5, 514);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (142,'Mauritius', 'MU', 'MUS',480, 17, 8, 515);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (143,'Mayotte', 'YT', 'MYT',175, 17, 8, 516);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (144,'Mexico', 'MX', 'MEX',484, 13, 2, 517);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (145,'Micronesia (Federated States of)', 'FM', 'FSM',583, 9, 518);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (146,'Moldova, Republic of', 'MD', 'MDA',498, 6, 519);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (147,'Monaco', 'MC', 'MCO',492, 4, 520);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (148,'Mongolia', 'MN', 'MNG',496, 5, 521);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (149,'Montenegro', 'ME', 'MNE',499, 2, 522);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (150,'Montserrat', 'MS', 'MSR',500, 13, 7, 523);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (151,'Morocco', 'MA', 'MAR',504, 15, 524);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (152,'Mozambique', 'MZ', 'MOZ',508, 17, 8, 525);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (153,'Myanmar', 'MM', 'MMR',104, 12, 526);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (154,'Namibia', 'NA', 'NAM',516, 17, 4, 527);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (155,'Nauru', 'NR', 'NRU',520, 9, 528);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (156,'Nepal', 'NP', 'NPL',524, 3, 529);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (157,'Netherlands', 'NL', 'NLD',528, 4, 530);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (158,'New Caledonia', 'NC', 'NCL',540, 11, 531);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (159,'New Zealand', 'NZ', 'NZL',554, 1, 532);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (160,'Nicaragua', 'NI', 'NIC',558, 13, 2, 533);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (161,'Niger', 'NE', 'NER',562, 17, 5, 534);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (162,'Nigeria', 'NG', 'NGA',566, 17, 5, 535);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (163,'Niue', 'NU', 'NIU',570, 14, 536);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (164,'Norfolk Island', 'NF', 'NFK',574, 1, 537);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (165,'North Macedonia', 'MK', 'MKD',807, 2, 538);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (166,'Northern Mariana Islands', 'MP', 'MNP',580, 9, 539);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (167,'Norway', 'NO', 'NOR',578, 7, 540);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (168,'Oman', 'OM', 'OMN',512, 16, 541);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (169,'Pakistan', 'PK', 'PAK',586, 3, 542);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (170,'Palau', 'PW', 'PLW',585, 9, 543);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (171,'Palestine, State of', 'PS', 'PSE',275, 16, 544);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (172,'Panama', 'PA', 'PAN',591, 13, 2, 545);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (173,'Papua New Guinea', 'PG', 'PNG',598, 11, 546);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (174,'Paraguay', 'PY', 'PRY',600, 13, 6, 547);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (175,'Peru', 'PE', 'PER',604, 13, 6, 548);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (176,'Philippines', 'PH', 'PHL',608, 12, 549);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (177,'Pitcairn', 'PN', 'PCN',612, 14, 550);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (178,'Poland', 'PL', 'POL',616, 6, 551);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (179,'Portugal', 'PT', 'PRT',620, 2, 552);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (180,'Puerto Rico', 'PR', 'PRI',630, 13, 7, 553);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (181,'Qatar', 'QA', 'QAT',634, 16, 554);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (182,'Réunion', 'RE', 'REU',638, 17, 8, 555);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (183,'Romania', 'RO', 'ROU',642, 6, 556);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (184,'Russian Federation', 'RU', 'RUS',643, 6, 557);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (185,'Rwanda', 'RW', 'RWA',646, 17, 8, 558);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (186,'Saint Barthélemy', 'BL', 'BLM',652, 13, 7, 559);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (187,'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN',654, 17, 5, 560);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (188,'Saint Kitts and Nevis', 'KN', 'KNA',659, 13, 7, 561);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (189,'Saint Lucia', 'LC', 'LCA',662, 13, 7, 562);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (190,'Saint Martin (French part)', 'MF', 'MAF',663, 13, 7, 563);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (191,'Saint Pierre and Miquelon', 'PM', 'SPM',666, 8, 564);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (192,'Saint Vincent and the Grenadines', 'VC', 'VCT',670, 13, 7, 565);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (193,'Samoa', 'WS', 'WSM',882, 14, 566);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (194,'San Marino', 'SM', 'SMR',674, 2, 567);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (195,'Sao Tome and Principe', 'ST', 'STP',678, 17, 3, 568);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (196,'Saudi Arabia', 'SA', 'SAU',682, 16, 569);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (197,'Senegal', 'SN', 'SEN',686, 17, 5, 570);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (198,'Serbia', 'RS', 'SRB',688, 2, 571);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (199,'Seychelles', 'SC', 'SYC',690, 17, 8, 572);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (200,'Sierra Leone', 'SL', 'SLE',694, 17, 5, 573);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (201,'Singapore', 'SG', 'SGP',702, 12, 574);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (202,'Sint Maarten (Dutch part)', 'SX', 'SXM',534, 13, 7, 575);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (203,'Slovakia', 'SK', 'SVK',703, 6, 576);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (204,'Slovenia', 'SI', 'SVN',705, 2, 577);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (205,'Solomon Islands', 'SB', 'SLB',90, 11, 578);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (206,'Somalia', 'SO', 'SOM',706, 17, 8, 579);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (207,'South Africa', 'ZA', 'ZAF',710, 17, 4, 580);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (208,'South Georgia and the South Sandwich Islands', 'GS', 'SGS',239, 13, 6, 581);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (209,'South Sudan', 'SS', 'SSD',728, 17, 8, 582);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (210,'Spain', 'ES', 'ESP',724, 2, 583);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (211,'Sri Lanka', 'LK', 'LKA',144, 3, 584);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (212,'Sudan', 'SD', 'SDN',729, 15, 585);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (213,'Suriname', 'SR', 'SUR',740, 13, 6, 586);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (214,'Svalbard and Jan Mayen', 'SJ', 'SJM',744, 7, 587);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (215,'Sweden', 'SE', 'SWE',752, 7, 588);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (216,'Switzerland', 'CH', 'CHE',756, 4, 589);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (217,'Syrian Arab Republic', 'SY', 'SYR',760, 16, 590);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (218,'Taiwan, Province of China', 'TW', 'TWN',158, 5, 591);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (219,'Tajikistan', 'TJ', 'TJK',762, 10, 592);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (220,'Tanzania, United Republic of', 'TZ', 'TZA',834, 17, 8, 593);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (221,'Thailand', 'TH', 'THA',764, 12, 594);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (222,'Timor-Leste', 'TL', 'TLS',626, 12, 595);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (223,'Togo', 'TG', 'TGO',768, 17, 5, 596);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (224,'Tokelau', 'TK', 'TKL',772, 14, 597);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (225,'Tonga', 'TO', 'TON',776, 14, 598);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (226,'Trinidad and Tobago', 'TT', 'TTO',780, 13, 7, 599);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (227,'Tunisia', 'TN', 'TUN',788, 15, 600);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (228,'Turkey', 'TR', 'TUR',792, 16, 601);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (229,'Turkmenistan', 'TM', 'TKM',795, 10, 602);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (230,'Turks and Caicos Islands', 'TC', 'TCA',796, 13, 7, 603);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (231,'Tuvalu', 'TV', 'TUV',798, 14, 604);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (232,'Uganda', 'UG', 'UGA',800, 17, 8, 605);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (233,'Ukraine', 'UA', 'UKR',804, 6, 606);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (234,'United Arab Emirates', 'AE', 'ARE',784, 16, 607);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (235,'United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR',826, 7, 608);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (236,'United States of America', 'US', 'USA',840, 8, 609);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (237,'United States Minor Outlying Islands', 'UM', 'UMI',581, 9, 610);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (238,'Uruguay', 'UY', 'URY',858, 13, 6, 611);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (239,'Uzbekistan', 'UZ', 'UZB',860, 10, 612);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (240,'Vanuatu', 'VU', 'VUT',548, 11, 613);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (241,'Venezuela (Bolivarian Republic of)', 'VE', 'VEN',862, 13, 6, 614);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (242,'Viet Nam', 'VN', 'VNM',704, 12, 615);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (243,'Virgin Islands (British)', 'VG', 'VGB',92, 13, 7, 616);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (244,'Virgin Islands (U.S.)', 'VI', 'VIR',850, 13, 7, 617);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (245,'Wallis and Futuna', 'WF', 'WLF',876, 14, 618);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (246,'Western Sahara', 'EH', 'ESH',732, 15, 619);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, NameTermID) VALUES (247,'Yemen', 'YE', 'YEM',887, 16, 620);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (248,'Zambia', 'ZM', 'ZMB',894, 17, 8, 621);
INSERT INTO Countries (CountryId, ForeignName, ISO31662, ISO31663, ISO3166Num, SubRegionId, IntermediateRegionId, NameTermID) VALUES (249,'Zimbabwe', 'ZW', 'ZWE',716, 17, 8, 622);SET IDENTITY_INSERT Countries OFF;
SET IDENTITY_INSERT Countries OFF;



SET IDENTITY_INSERT ClaimGroups ON;
INSERT INTO ClaimGroups (ClaimGroupId, Sequence, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES
(1, 1, 942, 942, 942, 942)
,(2, 2, 943, 943, 943, 943)
,(3, 3, 944, 944, 944, 944)
,(4, 4, 945, 945, 945, 945)
,(5, 5, 946, 946, 946, 946)
,(6, 6, 947, 947, 947, 947)
,(7, 7, 948, 948, 948, 948)
,(8, 8, 949, 949, 949, 949)
,(9, 9, 950, 950, 950, 950)
,(10, 10, 641, 641, 641, 641)
,(11, 11, 227, 227, 227, 227)
,(12, 12, 234, 234, 234, 234)
,(13, 13, 1785, 1785, 1785, 1785)
,(14, 14, 1786, 1786, 1786, 1786)
,(15, 15, 1601, 1601, 1601, 1601);
SET IDENTITY_INSERT ClaimGroups OFF;

SET IDENTITY_INSERT Claims ON;
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(1, 9, 'ApplicationRight', 'Admin\Index',1787,1787,1787,1787);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(2, 9, 'ApplicationRight', 'Admin\Menu',1788,1788,1788,1788);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(3, 10, 'ApplicationRight', 'Classification\Create',1789,1789,1789,1789);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(4, 10, 'ApplicationRight', 'Classification\Delete',1790,1790,1790,1790);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(5, 10, 'ApplicationRight', 'Classification\Update',1791,1791,1791,1791);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(6, 10, 'ApplicationRight', 'Classification\Index',1792,1792,1792,1792);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(7, 10, 'ApplicationRight', 'Classification\LanguageCreate',1793,1793,1793,1793);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(8, 10, 'ApplicationRight', 'Classification\LanguageEdit',1794,1794,1794,1794);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(9, 10, 'ApplicationRight', 'Classification\LanguageIndex',1795,1795,1795,1795);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(10, 10, 'ApplicationRight', 'ClassificationLevel\Create',1796,1796,1796,1796);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(11, 10, 'ApplicationRight', 'ClassificationLevel\Delete',1797,1797,1797,1797);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(12, 10, 'ApplicationRight', 'ClassificationLevel\Update',1798,1798,1798,1798);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(13, 10, 'ApplicationRight', 'ClassificationLevel\Index',1799,1799,1799,1799);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(14, 10, 'ApplicationRight', 'ClassificationLevel\LanguageCreate',1800,1800,1800,1800);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(15, 10, 'ApplicationRight', 'ClassificationLevel\LanguageEdit',1801,1801,1801,1801);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(16, 10, 'ApplicationRight', 'ClassificationLevel\LanguageIndex',1802,1802,1802,1802);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(17, 10, 'ApplicationRight', 'ClassificationLevelProperty\Create',1803,1803,1803,1803);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(18, 10, 'ApplicationRight', 'ClassificationLevelProperty\Delete',1804,1804,1804,1804);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(19, 10, 'ApplicationRight', 'ClassificationLevelProperty\Update',1805,1805,1805,1805);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(20, 10, 'ApplicationRight', 'ClassificationLevelProperty\Index',1806,1806,1806,1806);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(21, 10, 'ApplicationRight', 'ClassificationLevelProperty\LanguageCreate',1807,1807,1807,1807);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(22, 10, 'ApplicationRight', 'ClassificationLevelProperty\LanguageEdit',1808,1808,1808,1808);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(23, 10, 'ApplicationRight', 'ClassificationLevelProperty\LanguageIndex',1809,1809,1809,1809);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(24, 10, 'ApplicationRight', 'ClassificationRelationType\Create',1810,1810,1810,1810);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(25, 10, 'ApplicationRight', 'ClassificationRelationType\Delete',1811,1811,1811,1811);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(26, 10, 'ApplicationRight', 'ClassificationRelationType\Update',1812,1812,1812,1812);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(27, 10, 'ApplicationRight', 'ClassificationRelationType\Index',1813,1813,1813,1813);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(28, 10, 'ApplicationRight', 'ClassificationRelationType\LanguageCreate',1814,1814,1814,1814);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(29, 10, 'ApplicationRight', 'ClassificationRelationType\LanguageEdit',1815,1815,1815,1815);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(30, 10, 'ApplicationRight', 'ClassificationRelationType\LanguageIndex',1816,1816,1816,1816);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(31, 10, 'ApplicationRight', 'ClassificationRole\Create',1817,1817,1817,1817);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(32, 10, 'ApplicationRight', 'ClassificationRole\Delete',1818,1818,1818,1818);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(33, 10, 'ApplicationRight', 'ClassificationRole\Update',1819,1819,1819,1819);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(34, 10, 'ApplicationRight', 'ClassificationRole\Index',1820,1820,1820,1820);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(35, 10, 'ApplicationRight', 'ClassificationUser\Create',1821,1821,1821,1821);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(36, 10, 'ApplicationRight', 'ClassificationUser\Delete',1822,1822,1822,1822);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(37, 10, 'ApplicationRight', 'ClassificationUser\Update',1823,1823,1823,1823);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(38, 10, 'ApplicationRight', 'ClassificationUser\Index',1824,1824,1824,1824);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(39, 10, 'ApplicationRight', 'ClassificationValue\Create',1825,1825,1825,1825);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(40, 10, 'ApplicationRight', 'ClassificationValue\Delete',1826,1826,1826,1826);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(41, 10, 'ApplicationRight', 'ClassificationValue\Update',1827,1827,1827,1827);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(42, 10, 'ApplicationRight', 'ClassificationValue\Index',1828,1828,1828,1828);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(43, 10, 'ApplicationRight', 'ClassificationValue\LanguageCreate',1829,1829,1829,1829);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(44, 10, 'ApplicationRight', 'ClassificationValue\LanguageEdit',1830,1830,1830,1830);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(45, 10, 'ApplicationRight', 'ClassificationValue\LanguageIndex',1831,1831,1831,1831);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(46, 10, 'ApplicationRight', 'ClassificationValueRole\Create',1832,1832,1832,1832);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(47, 10, 'ApplicationRight', 'ClassificationValueRole\Delete',1833,1833,1833,1833);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(48, 10, 'ApplicationRight', 'ClassificationValueRole\Update',1834,1834,1834,1834);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(49, 10, 'ApplicationRight', 'ClassificationValueRole\Index',1835,1835,1835,1835);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(50, 10, 'ApplicationRight', 'ClassificationValueUser\Create',1836,1836,1836,1836);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(51, 10, 'ApplicationRight', 'ClassificationValueUser\Delete',1837,1837,1837,1837);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(52, 10, 'ApplicationRight', 'ClassificationValueUser\Update',1838,1838,1838,1838);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(53, 10, 'ApplicationRight', 'ClassificationValueUser\Index',1839,1839,1839,1839);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(54, 2, 'ApplicationRight', 'ContentType\Create',1840,1840,1840,1840);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(55, 2, 'ApplicationRight', 'ContentType\Delete',1841,1841,1841,1841);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(56, 2, 'ApplicationRight', 'ContentType\Update',1842,1842,1842,1842);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(57, 2, 'ApplicationRight', 'ContentType\Index',1843,1843,1843,1843);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(58, 2, 'ApplicationRight', 'ContentTypeGroup\Create',1844,1844,1844,1844);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(59, 2, 'ApplicationRight', 'ContentTypeGroup\Delete',1845,1845,1845,1845);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(60, 2, 'ApplicationRight', 'ContentTypeGroup\Update',1846,1846,1846,1846);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(61, 2, 'ApplicationRight', 'ContentTypeGroup\Index',1847,1847,1847,1847);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(62, 14, 'ApplicationRight', 'Front\Index',1848,1848,1848,1848);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(63, 15, 'ApplicationRight', 'FrontAuth\Login',1849,1849,1849,1849);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(64, 14, 'ApplicationRight', 'FrontClassificationValue\AdvancedSearch',1850,1850,1850,1850);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(65, 14, 'ApplicationRight', 'FrontClassificationValue\Dashboard',1851,1851,1851,1851);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(66, 14, 'ApplicationRight', 'FrontClassificationValue\SearchResult',1852,1852,1852,1852);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(67, 14, 'ApplicationRight', 'FrontContent\AdvancedSearch',1853,1853,1853,1853);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(68, 14, 'ApplicationRight', 'FrontContent\ContentNew',1854,1854,1854,1854);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(69, 14, 'ApplicationRight', 'FrontContent\ContentType',1855,1855,1855,1855);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(70, 14, 'ApplicationRight', 'FrontContent\SearchResult',1856,1856,1856,1856);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(71, 14, 'ApplicationRight', 'FrontContent\ShowContent',1857,1857,1857,1857);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(72, 14, 'ApplicationRight', 'FrontOrganization\AdvancedSearch',1858,1858,1858,1858);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(73, 14, 'ApplicationRight', 'FrontOrganization\Create',1859,1859,1859,1859);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(74, 14, 'ApplicationRight', 'FrontOrganization\Dashboard',1860,1860,1860,1860);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(75, 14, 'ApplicationRight', 'FrontOrganization\Index',1861,1861,1861,1861);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(76, 14, 'ApplicationRight', 'FrontOrganization\SearchResult',1862,1862,1862,1862);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(77, 14, 'ApplicationRight', 'FrontPerson\AdvancedSearch',1863,1863,1863,1863);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(78, 14, 'ApplicationRight', 'FrontPerson\SearchResult',1864,1864,1864,1864);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(79, 14, 'ApplicationRight', 'FrontProcess\AdvancedSearch',1865,1865,1865,1865);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(80, 14, 'ApplicationRight', 'FrontProcess\Create',1866,1866,1866,1866);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(81, 14, 'ApplicationRight', 'FrontProcess\Update',1867,1867,1867,1867);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(82, 14, 'ApplicationRight', 'FrontProcess\SearchResult',1868,1868,1868,1868);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(83, 14, 'ApplicationRight', 'FrontProcess\Templates',1869,1869,1869,1869);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(84, 14, 'ApplicationRight', 'FrontProcess\ToDo',1870,1870,1870,1870);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(85, 14, 'ApplicationRight', 'FrontProcess\View',1871,1871,1871,1871);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(86, 14, 'ApplicationRight', 'FrontProject\AdvancedSearch',1872,1872,1872,1872);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(87, 14, 'ApplicationRight', 'FrontProject\Create',1873,1873,1873,1873);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(88, 14, 'ApplicationRight', 'FrontProject\Dashboard',1874,1874,1874,1874);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(89, 14, 'ApplicationRight', 'FrontProject\Index',1875,1875,1875,1875);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(90, 14, 'ApplicationRight', 'FrontProject\SearchResult',1876,1876,1876,1876);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(91, 14, 'ApplicationRight', 'FrontUser\Dashboard',1877,1877,1877,1877);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(92, 15, 'ApplicationRight', 'Home\Index',1878,1878,1878,1878);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(93, 15, 'ApplicationRight', 'Home\Privacy',1879,1879,1879,1879);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(94, 9, 'ApplicationRight', 'Language\Update',1880,1880,1880,1880);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(95, 9, 'ApplicationRight', 'Language\Index',1881,1881,1881,1881);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(96, 4, 'ApplicationRight', 'Organization\Create',1882,1882,1882,1882);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(97, 4, 'ApplicationRight', 'Organization\Delete',1883,1883,1883,1883);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(98, 4, 'ApplicationRight', 'Organization\Update',1884,1884,1884,1884);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(99, 4, 'ApplicationRight', 'Organization\Index',1885,1885,1885,1885);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(100, 4, 'ApplicationRight', 'Organization\LanguageEdit',1886,1886,1886,1886);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(101, 4, 'ApplicationRight', 'Organization\LanguageIndex',1887,1887,1887,1887);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(102, 4, 'ApplicationRight', 'OrganizationAddress\Create',1888,1888,1888,1888);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(103, 4, 'ApplicationRight', 'OrganizationAddress\Delete',1889,1889,1889,1889);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(104, 4, 'ApplicationRight', 'OrganizationAddress\Update',1890,1890,1890,1890);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(105, 4, 'ApplicationRight', 'OrganizationAddress\Index',1891,1891,1891,1891);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(106, 4, 'ApplicationRight', 'OrganizationTelecom\Create',1892,1892,1892,1892);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(107, 4, 'ApplicationRight', 'OrganizationTelecom\Delete',1893,1893,1893,1893);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(108, 4, 'ApplicationRight', 'OrganizationTelecom\Update',1894,1894,1894,1894);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(109, 4, 'ApplicationRight', 'OrganizationTelecom\Index',1895,1895,1895,1895);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(110, 4, 'ApplicationRight', 'OrganizationType\Create',1896,1896,1896,1896);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(111, 4, 'ApplicationRight', 'OrganizationType\Delete',1897,1897,1897,1897);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(112, 4, 'ApplicationRight', 'OrganizationType\Update',1898,1898,1898,1898);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(113, 4, 'ApplicationRight', 'OrganizationType\Index',1899,1899,1899,1899);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(114, 4, 'ApplicationRight', 'OrganizationType\LanguageEdit',1900,1900,1900,1900);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(115, 4, 'ApplicationRight', 'OrganizationType\LanguageIndex',1901,1901,1901,1901);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(116, 6, 'ApplicationRight', 'Page\Create',1902,1902,1902,1902);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(117, 6, 'ApplicationRight', 'Page\Delete',1903,1903,1903,1903);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(118, 6, 'ApplicationRight', 'Page\Update',1904,1904,1904,1904);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(119, 6, 'ApplicationRight', 'Page\Index',1905,1905,1905,1905);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(120, 6, 'ApplicationRight', 'Page\LanguageEdit',1906,1906,1906,1906);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(121, 6, 'ApplicationRight', 'Page\LanguageIndex',1907,1907,1907,1907);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(122, 6, 'ApplicationRight', 'PageSection\Create',1908,1908,1908,1908);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(123, 6, 'ApplicationRight', 'PageSection\Delete',1909,1909,1909,1909);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(124, 6, 'ApplicationRight', 'PageSection\Update',1910,1910,1910,1910);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(125, 6, 'ApplicationRight', 'PageSection\Index',1911,1911,1911,1911);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(126, 6, 'ApplicationRight', 'PageSection\LanguageEdit',1912,1912,1912,1912);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(127, 6, 'ApplicationRight', 'PageSection\LanguageIndex',1913,1913,1913,1913);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(128, 6, 'ApplicationRight', 'PageSectionContentCondition\Create',1914,1914,1914,1914);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(129, 6, 'ApplicationRight', 'PageSectionContentCondition\Delete',1915,1915,1915,1915);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(130, 6, 'ApplicationRight', 'PageSectionContentCondition\Update',1916,1916,1916,1916);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(131, 6, 'ApplicationRight', 'PageSectionContentCondition\Index',1917,1917,1917,1917);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(132, 6, 'ApplicationRight', 'PageSectionProcessCondition\Create',1918,1918,1918,1918);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(133, 6, 'ApplicationRight', 'PageSectionProcessCondition\Delete',1919,1919,1919,1919);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(134, 6, 'ApplicationRight', 'PageSectionProcessCondition\Update',1920,1920,1920,1920);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(135, 6, 'ApplicationRight', 'PageSectionProcessCondition\Index',1921,1921,1921,1921);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(136, 14, 'ApplicationRight', 'Partial\LeftMenu',1922,1922,1922,1922);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(137, 8, 'ApplicationRight', 'Person\AdvancedSearch',1923,1923,1923,1923);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(138, 8, 'ApplicationRight', 'Person\Create',1924,1924,1924,1924);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(139, 8, 'ApplicationRight', 'Person\Delete',1925,1925,1925,1925);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(140, 8, 'ApplicationRight', 'Person\Update',1926,1926,1926,1926);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(141, 8, 'ApplicationRight', 'Person\Index',1927,1927,1927,1927);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(142, 8, 'ApplicationRight', 'PersonAddress\Create',1928,1928,1928,1928);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(143, 8, 'ApplicationRight', 'PersonAddress\Delete',1929,1929,1929,1929);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(144, 8, 'ApplicationRight', 'PersonAddress\Update',1930,1930,1930,1930);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(145, 8, 'ApplicationRight', 'PersonAddress\Index',1931,1931,1931,1931);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(146, 8, 'ApplicationRight', 'PersonRelation\Create',1932,1932,1932,1932);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(147, 8, 'ApplicationRight', 'PersonRelation\Delete',1933,1933,1933,1933);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(148, 8, 'ApplicationRight', 'PersonRelation\Update',1934,1934,1934,1934);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(149, 8, 'ApplicationRight', 'PersonRelation\Index',1935,1935,1935,1935);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(150, 8, 'ApplicationRight', 'PersonRelationType\Create',1936,1936,1936,1936);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(151, 8, 'ApplicationRight', 'PersonRelationType\Delete',1937,1937,1937,1937);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(152, 8, 'ApplicationRight', 'PersonRelationType\Update',1938,1938,1938,1938);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(153, 8, 'ApplicationRight', 'PersonRelationType\Index',1939,1939,1939,1939);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(154, 8, 'ApplicationRight', 'PersonTelecom\Create',1940,1940,1940,1940);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(155, 8, 'ApplicationRight', 'PersonTelecom\Delete',1941,1941,1941,1941);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(156, 8, 'ApplicationRight', 'PersonTelecom\Update',1942,1942,1942,1942);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(157, 8, 'ApplicationRight', 'PersonTelecom\Index',1943,1943,1943,1943);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(158, 7, 'ApplicationRight', 'ProcessType\Create',1944,1944,1944,1944);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(159, 7, 'ApplicationRight', 'ProcessType\Delete',1945,1945,1945,1945);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(160, 7, 'ApplicationRight', 'ProcessType\Update',1946,1946,1946,1946);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(161, 7, 'ApplicationRight', 'ProcessType\Index',1947,1947,1947,1947);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(162, 7, 'ApplicationRight', 'ProcessType\LanguageEdit',1948,1948,1948,1948);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(163, 7, 'ApplicationRight', 'ProcessType\LanguageIndex',1949,1949,1949,1949);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(164, 7, 'ApplicationRight', 'ProcessTypeField\Create',1950,1950,1950,1950);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(165, 7, 'ApplicationRight', 'ProcessTypeField\Delete',1951,1951,1951,1951);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(166, 7, 'ApplicationRight', 'ProcessTypeField\Update',1952,1952,1952,1952);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(167, 7, 'ApplicationRight', 'ProcessTypeField\Index',1953,1953,1953,1953);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(168, 7, 'ApplicationRight', 'ProcessTypeField\LanguageEdit',1954,1954,1954,1954);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(169, 7, 'ApplicationRight', 'ProcessTypeField\LanguageIndex',1955,1955,1955,1955);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(170, 7, 'ApplicationRight', 'ProcessTypeFieldStage\Update',1956,1956,1956,1956);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(171, 7, 'ApplicationRight', 'ProcessTypeFieldStage\Index',1957,1957,1957,1957);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(172, 7, 'ApplicationRight', 'ProcessTypeFlow\Create',1958,1958,1958,1958);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(173, 7, 'ApplicationRight', 'ProcessTypeFlow\Delete',1959,1959,1959,1959);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(174, 7, 'ApplicationRight', 'ProcessTypeFlow\Update',1960,1960,1960,1960);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(175, 7, 'ApplicationRight', 'ProcessTypeFlow\Index',1961,1961,1961,1961);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(176, 7, 'ApplicationRight', 'ProcessTypeFlow\LanguageEdit',1962,1962,1962,1962);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(177, 7, 'ApplicationRight', 'ProcessTypeFlow\LanguageIndex',1963,1963,1963,1963);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(178, 7, 'ApplicationRight', 'ProcessTypeFlowCondition\Create',1964,1964,1964,1964);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(179, 7, 'ApplicationRight', 'ProcessTypeFlowCondition\Delete',1965,1965,1965,1965);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(180, 7, 'ApplicationRight', 'ProcessTypeFlowCondition\Update',1966,1966,1966,1966);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(181, 7, 'ApplicationRight', 'ProcessTypeFlowCondition\Index',1967,1967,1967,1967);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(182, 7, 'ApplicationRight', 'ProcessTypeFlowCondition\LanguageEdit',1968,1968,1968,1968);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(183, 7, 'ApplicationRight', 'ProcessTypeFlowCondition\LanguageIndex',1969,1969,1969,1969);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(184, 7, 'ApplicationRight', 'ProcessTypeFlowPass\Create',1970,1970,1970,1970);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(185, 7, 'ApplicationRight', 'ProcessTypeFlowPass\Delete',1971,1971,1971,1971);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(186, 7, 'ApplicationRight', 'ProcessTypeFlowPass\Update',1972,1972,1972,1972);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(187, 7, 'ApplicationRight', 'ProcessTypeFlowPass\Index',1973,1973,1973,1973);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(188, 7, 'ApplicationRight', 'ProcessTypeGroup\Create',1974,1974,1974,1974);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(189, 7, 'ApplicationRight', 'ProcessTypeGroup\Delete',1975,1975,1975,1975);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(190, 7, 'ApplicationRight', 'ProcessTypeGroup\Update',1976,1976,1976,1976);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(191, 7, 'ApplicationRight', 'ProcessTypeGroup\Index',1977,1977,1977,1977);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(192, 7, 'ApplicationRight', 'ProcessTypeGroup\LanguageEdit',1978,1978,1978,1978);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(193, 7, 'ApplicationRight', 'ProcessTypeGroup\LanguageIndex',1979,1979,1979,1979);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(194, 7, 'ApplicationRight', 'ProcessTypeStage\Create',1980,1980,1980,1980);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(195, 7, 'ApplicationRight', 'ProcessTypeStage\Delete',1981,1981,1981,1981);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(196, 7, 'ApplicationRight', 'ProcessTypeStage\Update',1982,1982,1982,1982);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(197, 7, 'ApplicationRight', 'ProcessTypeStage\Index',1983,1983,1983,1983);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(198, 7, 'ApplicationRight', 'ProcessTypeStage\LanguageEdit',1984,1984,1984,1984);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(199, 7, 'ApplicationRight', 'ProcessTypeStage\LanguageIndex',1985,1985,1985,1985);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(200, 7, 'ApplicationRight', 'ProcessTypeStageField\Update',1986,1986,1986,1986);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(201, 7, 'ApplicationRight', 'ProcessTypeStageField\Index',1987,1987,1987,1987);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(202, 7, 'ApplicationRight', 'ProcessTypeStageType\Create',1988,1988,1988,1988);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(203, 7, 'ApplicationRight', 'ProcessTypeStageType\Delete',1989,1989,1989,1989);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(204, 7, 'ApplicationRight', 'ProcessTypeStageType\Update',1990,1990,1990,1990);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(205, 7, 'ApplicationRight', 'ProcessTypeStageType\Index',1991,1991,1991,1991);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(206, 7, 'ApplicationRight', 'ProcessTypeStageType\LanguageEdit',1992,1992,1992,1992);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(207, 7, 'ApplicationRight', 'ProcessTypeStageType\LanguageIndex',1993,1993,1993,1993);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(208, 5, 'ApplicationRight', 'Project\Create',1994,1994,1994,1994);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(209, 5, 'ApplicationRight', 'Project\Delete',1995,1995,1995,1995);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(210, 5, 'ApplicationRight', 'Project\Update',1996,1996,1996,1996);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(211, 5, 'ApplicationRight', 'Project\Index',1997,1997,1997,1997);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(212, 5, 'ApplicationRight', 'Project\LanguageEdit',1998,1998,1998,1998);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(213, 5, 'ApplicationRight', 'Project\LanguageIndex',1999,1999,1999,1999);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(214, 5, 'ApplicationRight', 'ProjectType\Create',2000,2000,2000,2000);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(215, 5, 'ApplicationRight', 'ProjectType\Delete',2001,2001,2001,2001);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(216, 5, 'ApplicationRight', 'ProjectType\Update',2002,2002,2002,2002);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(217, 5, 'ApplicationRight', 'ProjectType\Index',2003,2003,2003,2003);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(218, 5, 'ApplicationRight', 'ProjectType\LanguageEdit',2004,2004,2004,2004);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(219, 5, 'ApplicationRight', 'ProjectType\LanguageIndex',2005,2005,2005,2005);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(220, 10, 'ApplicationRight', 'Property\Create',2006,2006,2006,2006);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(221, 10, 'ApplicationRight', 'Property\Delete',2007,2007,2007,2007);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(222, 10, 'ApplicationRight', 'Property\Update',2008,2008,2008,2008);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(223, 10, 'ApplicationRight', 'Property\Index',2009,2009,2009,2009);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(224, 10, 'ApplicationRight', 'Property\LanguageCreate',2010,2010,2010,2010);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(225, 10, 'ApplicationRight', 'Property\LanguageEdit',2011,2011,2011,2011);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(226, 10, 'ApplicationRight', 'Property\LanguageIndex',2012,2012,2012,2012);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(227, 10, 'ApplicationRight', 'PropertyValue\Create',2013,2013,2013,2013);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(228, 10, 'ApplicationRight', 'PropertyValue\Delete',2014,2014,2014,2014);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(229, 10, 'ApplicationRight', 'PropertyValue\Update',2015,2015,2015,2015);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(230, 10, 'ApplicationRight', 'PropertyValue\Index',2016,2016,2016,2016);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(231, 10, 'ApplicationRight', 'PropertyValue\LanguageCreate',2017,2017,2017,2017);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(232, 10, 'ApplicationRight', 'PropertyValue\LanguageEdit',2018,2018,2018,2018);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(233, 10, 'ApplicationRight', 'PropertyValue\LanguageIndex',2019,2019,2019,2019);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(234, 1, 'ApplicationRight', 'Role\Create',2020,2020,2020,2020);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(235, 1, 'ApplicationRight', 'Role\Delete',2021,2021,2021,2021);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(236, 1, 'ApplicationRight', 'Role\Update',2022,2022,2022,2022);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(237, 1, 'ApplicationRight', 'Role\Index',2023,2023,2023,2023);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(238, 1, 'ApplicationRight', 'RoleClaim\Create',2024,2024,2024,2024);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(239, 1, 'ApplicationRight', 'RoleClaim\Delete',2025,2025,2025,2025);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(240, 1, 'ApplicationRight', 'RoleClaim\Index',2026,2026,2026,2026);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(241, 1, 'ApplicationRight', 'RoleGroup\Create',2027,2027,2027,2027);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(242, 1, 'ApplicationRight', 'RoleGroup\Delete',2028,2028,2028,2028);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(243, 1, 'ApplicationRight', 'RoleGroup\Update',2029,2029,2029,2029);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(244, 1, 'ApplicationRight', 'RoleGroup\Index',2030,2030,2030,2030);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(245, 1, 'ApplicationRight', 'RoleGroup\LanguageEdit',2031,2031,2031,2031);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(246, 1, 'ApplicationRight', 'RoleGroup\LanguageIndex',2032,2032,2032,2032);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(247, 15, 'ApplicationRight', 'Search\General',2033,2033,2033,2033);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(248, 9, 'ApplicationRight', 'Setting\Update',2034,2034,2034,2034);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(249, 9, 'ApplicationRight', 'Setting\Index',2035,2035,2035,2035);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(250, 9, 'ApplicationRight', 'UITerm\Index',2036,2036,2036,2036);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(251, 9, 'ApplicationRight', 'UITerm\LanguageIndex',2037,2037,2037,2037);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(252, 1, 'ApplicationRight', 'User\Create',2038,2038,2038,2038);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(253, 1, 'ApplicationRight', 'User\Delete',2039,2039,2039,2039);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(254, 1, 'ApplicationRight', 'User\Update',2040,2040,2040,2040);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(255, 1, 'ApplicationRight', 'User\Index',2041,2041,2041,2041);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(256, 14, 'ApplicationRight', 'UserMenu\Create',2042,2042,2042,2042);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(257, 14, 'ApplicationRight', 'UserMenu\Delete',2043,2043,2043,2043);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(258, 14, 'ApplicationRight', 'UserMenu\Update',2044,2044,2044,2044);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(259, 14, 'ApplicationRight', 'UserMenu\Index',2045,2045,2045,2045);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(260, 1, 'ApplicationRight', 'UserMenuTemplate\Create',2046,2046,2046,2046);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(261, 1, 'ApplicationRight', 'UserMenuTemplate\Delete',2047,2047,2047,2047);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(262, 1, 'ApplicationRight', 'UserMenuTemplate\Update',2048,2048,2048,2048);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(263, 1, 'ApplicationRight', 'UserMenuTemplate\Index',2049,2049,2049,2049);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(264, 1, 'ApplicationRight', 'UserMenuTemplateOption\Create',2050,2050,2050,2050);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(265, 1, 'ApplicationRight', 'UserMenuTemplateOption\Delete',2051,2051,2051,2051);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(266, 1, 'ApplicationRight', 'UserMenuTemplateOption\Update',2052,2052,2052,2052);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(267, 1, 'ApplicationRight', 'UserMenuTemplateOption\Index',2053,2053,2053,2053);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(268, 14, 'ApplicationRight', 'UserPage\Create',2054,2054,2054,2054);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(269, 14, 'ApplicationRight', 'UserPage\Delete',2055,2055,2055,2055);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(270, 14, 'ApplicationRight', 'UserPage\Update',2056,2056,2056,2056);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(271, 14, 'ApplicationRight', 'UserPage\Index',2057,2057,2057,2057);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(272, 14, 'ApplicationRight', 'UserPageSection\Create',2058,2058,2058,2058);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(273, 14, 'ApplicationRight', 'UserPageSection\Delete',2059,2059,2059,2059);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(274, 14, 'ApplicationRight', 'UserPageSection\Update',2060,2060,2060,2060);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(275, 14, 'ApplicationRight', 'UserPageSection\Index',2061,2061,2061,2061);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(276, 14, 'ApplicationRight', 'UserPreference\Update',2062,2062,2062,2062);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(277, 14, 'ApplicationRight', 'UserPreference\Index',2063,2063,2063,2063);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(278, 14, 'ApplicationRight', 'FrontContent\RightsUpdate',130,130,130,130);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(279, 14, 'ApplicationRight', 'FrontContent\RightsEditUserCreate',130,130,130,130);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(280, 14, 'ApplicationRight', 'FrontContent\RightsEditUserIndex',130,130,130,130);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(281, 14, 'ApplicationRight', 'FrontContent\RightsEditUserDelete',130,130,130,130);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(282, 14, 'ApplicationRight', 'FrontContent\RightsReadUserCreate',130,130,130,130);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(283, 14, 'ApplicationRight', 'FrontContent\RightsReadUserIndex',130,130,130,130);
INSERT INTO Claims ( ClaimId, ClaimGroupId, ClaimType, ClaimValue, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(284, 14, 'ApplicationRight', 'FrontContent\RightsReadUserDelete',130,130,130,130);

SET IDENTITY_INSERT Claims OFF;

SET IDENTITY_INSERT ProcessTypeFieldTypes ON
INSERT INTO ProcessTypeFieldTypes (ProcessTypeFieldTypeId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID, active) VALUES 
(1, 645, 645, 645, 645,1),(2, 646, 646, 646, 646,1),(3, 647, 647, 647, 647,1),(4, 195, 195, 195, 195,1),(5, 648, 648, 648, 648,1),(6, 649, 649, 649, 649,1)
,(7, 650, 650, 650, 650,1),(8, 651, 651, 651, 651,1),(9, 652, 652, 652, 652,1),(10, 653, 653, 653, 653,1),(11, 654, 654, 654, 654,1),(12, 655, 655, 655, 655,1)
,(13, 656, 656, 656, 656,1),(14, 657, 657, 657, 657,1),(15, 658, 658, 658, 658,1),(16, 659, 659, 659, 659,1),(17, 660, 660, 660, 660,1),(18, 661, 661, 661, 661,1)
,(19, 662, 662, 662, 662,1),(20, 663, 663, 663, 663,1),(21, 664, 664, 664, 664,1),(22, 665, 665, 665, 665,1),(23, 666, 666, 666, 666,1),(24, 667, 667, 667, 667,1)
,(25, 668, 668, 668, 668,1),(26, 669, 669, 669, 669,1),(27, 670, 670, 670, 670,1),(28, 671, 671, 671, 671,1),(29, 672, 672, 672, 672,1),(30, 673, 673, 673, 673,1)
,(31, 674, 674, 674, 674,1),(32, 675, 675, 675, 675,1),(33, 918, 918, 918, 918,1),(34, 919, 919, 919, 919,1),(35, 920, 920, 920, 920,1),(36, 1346, 1346, 1346, 1346,1),(37, 1347, 1347, 1347, 1347,1);
SET IDENTITY_INSERT ProcessTypeFieldTypes OFF

SET IDENTITY_INSERT AddressTypes ON
INSERT INTO AddressTypes (AddressTypeId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID, active) VALUES 
(1, 321, 321, 321, 321,1),(2,322,322,322,322,1), (3,323,323,323,323,1);
SET IDENTITY_INSERT AddressTypes OFF

SET IDENTITY_INSERT PreferenceTypes ON;
INSERT INTO PreferenceTypes (PreferenceTypeId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
  (1,33,33,33,33)
SET IDENTITY_INSERT PreferenceTypes OFF;

SET IDENTITY_INSERT TelecomTypes ON;
INSERT INTO TelecomTypes (TelecomTypeId, PhoneProperties, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermId, Active, ModifierId,ModifiedDate) VALUES 
(4,1, 1600,1600,1600,1600,1, @user, getdate()),
(9,1, 1593,1593,1593,1593,1, @user, getdate()),
(3,1, 1594,1594,1594,1594,1, @user, getdate()),
(2,0, 678,678,678,678,1, @user, getdate()),
(5,0, 1596,1596,1596,1596,1, @user, getdate()),
(6,0, 1597,1597,1597,1597,1, @user, getdate()),
(7,0, 1598,1598,1598,1598,1, @user, getdate()),
(8,0, 1599,1599,1599,1599,1, @user, getdate()),
(1,1, 677,677,677,677,1, @user, getdate()),
(10,0, 1595,1595,1595,1595,1, @user, getdate())
SET IDENTITY_INSERT TelecomTypes OFF;

SET IDENTITY_INSERT RoleGroupLanguages ON;
INSERT INTO RoleGroupLanguages (RoleGroupLanguageId, RoleGroupId, LanguageId, Name, Description, MenuName, MouseOver, CreatorId, ModifierId, CreatedDate, ModifiedDate) 
VALUES(1,1,41,'Admin','Admin','Admin','Admin',@User,@User,getdate(),getdate());
SET IDENTITY_INSERT RoleGroupLanguages OFF;

SET IDENTITY_INSERT Genders ON;
INSERT INTO Genders (GenderId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermId, Active, ModifierId, ModifiedDate) VALUES 
(1,877,877,877,877,1,@User,getdate())
, (2,878,878,878,878,1,@User,getdate())
, (3,879,879,879,879,0,@User,getdate())
SET IDENTITY_INSERT Genders OFF;

SET IDENTITY_INSERT PageSectionDataTypes ON;
INSERT INTO PageSectionDataTypes (PageSectionDataTypeId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID, active) VALUES 
(1,227,227,227,227,1)
, (2,234,234,234,234,1)
, (3,41,41,41,41,1)
, (4,1232,1232,1232,1232,1)
, (5,127,127,127,127,1)
, (6,231,231,231,231,1)
, (7,1,1,1,1,1)
SET IDENTITY_INSERT PageSectionDataTypes OFF;


SET IDENTITY_INSERT ProcessTypeFlowConditionTypes ON;
INSERT INTO ProcessTypeFlowConditionTypes (ProcessTypeFlowConditionTypeId, NameTermId,DescriptionTermId,MenuNameTermId,MouseOverTermID,active) VALUES
(1, 880, 881, 880,880,1)
, (2, 882, 883, 882,882,1)
, (3, 884, 885, 884,884,1)
, (4, 886, 887, 886,886,1)
, (5, 888, 889, 888,888,1)
, (6, 890, 891, 890,890,1)
, (7, 892, 893, 892,892,1)
, (8, 894, 895, 894,894,1)
, (9, 896, 897, 896,896,1)
, (10, 898, 899, 898,898,1)
, (11, 900, 901, 900,900,1)
, (12, 902, 903, 902,904,1)
, (13, 904, 905, 904,904,1)
, (14, 906, 907, 906,906,1)
, (15, 908, 909, 908,908,1)
, (16, 910, 909, 910,910,1)
, (17, 911, 909, 911,911,1)
, (18, 912, 909, 912,912,1)
, (19, 913, 914, 913,913,1)
, (20, 915, 916, 915,915,1)
, (21, 917, 918, 917,917,1)
, (22, 928, 930, 928,928,1)
, (23, 929, 931, 929,929,1)
SET IDENTITY_INSERT ProcessTypeFlowConditionTypes OFF;

SET IDENTITY_INSERT ProcessTypeFlowPassTypes ON;
INSERT INTO ProcessTypeFlowPassTypes (ProcessTypeFlowPassTypeId, NameTermId,DescriptionTermId,MenuNameTermId,MouseOverTermID,active) VALUES
(1, 880, 881, 880,880,1)
, (2, 882, 883, 882,882,1)
, (3, 884, 885, 884,884,1)
, (4, 886, 887, 886,886,1)
, (5, 888, 889, 888,888,1)
, (6, 890, 891, 890,890,1)
, (7, 892, 893, 892,892,1)
, (8, 894, 895, 894,894,1)
, (9, 896, 897, 896,896,1)
, (10, 898, 899, 898,898,1)
, (11, 900, 901, 900,900,1)
, (12, 902, 903, 902,904,1)
, (13, 904, 905, 904,904,1)
, (14, 906, 907, 906,906,1)
, (15, 908, 909, 908,908,1)
, (16, 910, 909, 910,910,1)
, (17, 911, 909, 911,911,1)
, (18, 912, 909, 912,912,1)
, (19, 913, 914, 913,913,1)
, (20, 915, 916, 915,915,1)
, (21, 917, 918, 917,917,1)
, (22, 928, 930, 928,928,1)
, (23, 929, 931, 929,929,1)
SET IDENTITY_INSERT ProcessTypeFlowPassTypes OFF;


SET IDENTITY_INSERT ProcessTypeFlowConditionComparisonOperators ON;
INSERT INTO ProcessTypeFlowConditionComparisonOperators (
	ProcessTypeFlowConditionComparisonOperatorId, Symbol, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(1, '', 921, 921, 921, 921)
, (2, '=', 922, 922, 922, 922)
, (3, '>', 923, 923, 923, 923)
, (4, '<', 924, 924, 924, 924)
, (5, '>=', 925, 925, 925, 925)
, (6, '<=', 926, 926, 926, 926)
, (7, '<>', 927, 927, 927, 927);
SET IDENTITY_INSERT ProcessTypeFlowConditionComparisonOperators OFF;

SET IDENTITY_INSERT ProcessTypeFlowPassComparisonOperators ON;
INSERT INTO ProcessTypeFlowPassComparisonOperators (
	ProcessTypeFlowPassComparisonOperatorId, Symbol, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(1, '', 921, 921, 921, 921)
, (2, '=', 922, 922, 922, 922)
, (3, '>', 923, 923, 923, 923)
, (4, '<', 924, 924, 924, 924)
, (5, '>=', 925, 925, 925, 925)
, (6, '<=', 926, 926, 926, 926)
, (7, '<>', 927, 927, 927, 927);
SET IDENTITY_INSERT ProcessTypeFlowPassComparisonOperators OFF;


SET IDENTITY_INSERT ValueUpdateTypes ON;
INSERT INTO ValueUpdateTypes (
	ValueUpdateTypeId, NameTermId, DescriptionTermId, MenuNameTermId, MouseOverTermID) VALUES 
(1, 932, 932, 932, 932)
, (2, 933, 933, 933, 933)
, (3, 934, 934, 934, 934)
SET IDENTITY_INSERT ValueUpdateTypes OFF;


SET IDENTITY_INSERT [dbo].[Icons] ON 

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 2, N'Add.png             ', 5, 5, 5, 5)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 3, N'Calendar.png        ', 228, 228, 228, 228)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 4, N'Chat.png            ', 229, 229, 229, 229)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (4, 5, N'Classification.png  ', 59, 59, 59, 59)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (5, 6, N'Conference.png      ', 230, 230, 230, 230)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (6, 7, N'Content.png         ', 227, 227, 227, 227)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (7, 8, N'Favorites.png       ', 231, 231, 231, 231)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (8, 9, N'Menu.png            ', 290, 290, 290, 290)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (9, 10, N'Process.png         ', 234, 234, 234, 234)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (10, 11, N'Todo.png            ', 236, 236, 236, 236)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (11, 1, N'                    ', 1378, 1378, 1378, 1378)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (12, 12, N'Box.png             ', 1535, 1535, 1535, 1535)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (13, 13, N'CheckList.png       ', 1536, 1536, 1536, 1536)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (14, 14, N'Label.png           ', 1537, 1537, 1537, 1537)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (15, 15, N'Light.png           ', 1538, 1538, 1538, 1538)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (16, 16, N'Search.png          ', 237, 237, 237, 237)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (17, 17, N'Setting.png         ', 54, 54, 54, 54)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (18, 18, N'Spotlight.png       ', 1539, 1539, 1539, 1539)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (19, 19, N'Template.png        ', 1507, 1507, 1507, 1507)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (20, 20, N'User.png            ', 318, 318, 318, 318)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (21, 21, N'UserPreference.png  ', 1377, 1377, 1377, 1377)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (22, 22, N'Address.png         ', 1540, 1540, 1540, 1540)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (23, 23, N'Claim.png           ', 1541, 1541, 1541, 1541)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (25, 24, N'Condition.png       ', 1542, 1542, 1542, 1542)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (27, 25, N'DeleteS.png         ', 1543, 1543, 1543, 1543)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (28, 26, N'EditS.png           ', 1544, 1544, 1544, 1544)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (29, 27, N'Field.png           ', 882, 882, 882, 882)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (30, 28, N'Flow.png            ', 143, 143, 143, 143)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (31, 29, N'Group.png           ', 1484, 1484, 1484, 1484)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (32, 30, N'Language.png        ', 33, 33, 33, 33)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (33, 31, N'LanguageS.png       ', 1545, 1545, 1545, 1545)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (34, 32, N'Level.png           ', 1546, 1546, 1546, 1546)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (35, 33, N'New.png             ', 1547, 1547, 1547, 1547)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (36, 34, N'Option.png          ', 1548, 1548, 1548, 1548)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (37, 35, N'Organization.png    ', 41, 41, 41, 41)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (38, 36, N'Page.png            ', 1210, 1210, 1210, 1210)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (39, 37, N'Panel.png           ', 1549, 1549, 1549, 1549)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (40, 38, N'Person.png          ', 1232, 1232, 1232, 1232)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (41, 39, N'Project.png         ', 127, 127, 127, 127)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (42, 40, N'Relation.png        ', 299, 299, 299, 299)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (43, 41, N'Role.png            ', 139, 139, 139, 139)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (44, 42, N'SIP.png             ', 1550, 1550, 1550, 1550)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (45, 43, N'StageField.png      ', 1551, 1551, 1551, 1551)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (46, 44, N'SU.png              ', 1552, 1552, 1552, 1552)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (47, 45, N'Telecom.png         ', 1160, 1160, 1160, 1160)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (48, 46, N'Type.png            ', 79, 79, 79, 79)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (49, 47, N'UITerm.png          ', 1553, 1553, 1553, 1553)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (50, 48, N'UserMenu.png        ', 1355, 1355, 1355, 1355)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (51, 49, N'UserTemplate.png    ', 1554, 1554, 1554, 1554)

INSERT [dbo].[Icons] ([IconId], [Sequence], [FileName], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (52, 50, N'Value.png           ', 1376, 1376, 1376, 1376)

SET IDENTITY_INSERT [dbo].[Icons] OFF


INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (1, 1, 1, 1210, 1210, 1210, 1210,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (2, 1, 1, 233, 233, 233, 233,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (3, 1, 1, 226, 266, 266, 266,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (4, 1, 1, 1360, 1360, 1360, 1360,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (5, 1, 1, 1357, 1357, 1357, 1357,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (6, 1, 1, 1358, 1358, 1358, 1358,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (7, 1, 1, 1359, 1359, 1359, 1359,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (8, 1, 1, 1361, 1361, 1361, 1361,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (9, 1, 0, 1362, 1362, 1362, 1362,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (10, 1, 0, 1363, 1363, 1363, 1363,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (11, 1, 0, 1364, 1364, 1364, 1364,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (12, 1, 0, 1365, 1365, 1365, 1365,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (13, 1, 0, 1366, 1366, 1366, 1366,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (14, 1, 0, 1459, 1459, 1459, 1459,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (15, 1, 0, 1367, 1367, 1367, 1367,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (16, 1, 0, 1368, 1368, 1368, 1368,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (17, 1, 0, 1369, 1369, 1369, 1369,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (18, 1, 1, 1454, 1454, 1454, 1454,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (19, 1, 1, 1455, 1455, 1455, 1455,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (20, 1, 1, 1456, 1456, 1456, 1456,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (21, 1, 1, 1457, 1457, 1457, 1457,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (22, 1, 1, 1458, 1458, 1458, 1458,1)
INSERT [dbo].[UserMenuTypes] ([UserMenuTypeID], [AvailableForLeft], [AvailableForRight], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (23, 1, 1, 1509, 1509, 1509, 1509,1)

SET IDENTITY_INSERT [dbo].[UserPreferenceTypeGroups] ON 
INSERT [dbo].[UserPreferenceTypeGroups] ([UserPreferenceTypeGroupID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 1370, 1370, 1370, 1370)
SET IDENTITY_INSERT [dbo].[UserPreferenceTypeGroups] OFF

SET IDENTITY_INSERT [dbo].[UserPreferenceTypes] ON 
INSERT [dbo].[UserPreferenceTypes] ([UserPreferenceTypeID], [UserPreferenceTypeGroupID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 1, 1371, 1371, 1371, 1371)
INSERT [dbo].[UserPreferenceTypes] ([UserPreferenceTypeID], [UserPreferenceTypeGroupID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 1, 1373, 1373, 1373, 1373)
SET IDENTITY_INSERT [dbo].[UserPreferenceTypes] OFF
 
SET IDENTITY_INSERT [dbo].[OrganizationSettingTypeGroups] ON 
INSERT [dbo].[OrganizationSettingTypeGroups] ([OrganizationSettingTypeGroupID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 1370, 1370, 1370, 1370)
SET IDENTITY_INSERT [dbo].[OrganizationSettingTypeGroups] OFF
 
SET IDENTITY_INSERT [dbo].[OrganizationSettingTypes] ON 
INSERT [dbo].[OrganizationSettingTypes] ([OrganizationSettingTypeID], [OrganizationSettingTypeGroupID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 1, 1373, 1373, 1373, 1373)
INSERT [dbo].[OrganizationSettingTypes] ([OrganizationSettingTypeID], [OrganizationSettingTypeGroupID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[OrganizationSettingTypes] OFF
 
SET IDENTITY_INSERT MenuTypes ON 
INSERT MenuTypes([MenuTypeID], NameTermID, DescriptionTermID, MenuNameTermID, MouseOverTermID,FirstLevelOnly, Active) 
VALUES (1, 1210, 1210, 1210, 1210,0,1)
,(2, 233, 233, 233, 233,0,1)
,(3, 226, 266, 266, 226,0,1)
,(4, 1360, 1360, 1360, 1360,0,1)
,(5, 1357, 1357, 1357, 1357,0,1)
,(6, 1358, 1358, 1358, 1358,0,1)
,(7, 1359, 1359, 1359, 1359,0,1)
,(8, 1361, 1361, 1361, 1361,0,1)
,(9, 1362, 1362, 1362, 1362,0,1)
,(10, 1363, 1363, 1363, 1363,0,1)
,(11, 1364, 1364, 1364, 1364,0,1)
,(12, 1365, 1365, 1365, 1365,0,1)
,(13, 1366, 1366, 1366, 1366,0,1)
,(14, 1367, 1367, 1367, 1367,0,1)
,(15, 1368, 1368, 1368, 1368,0,1)
,(16, 1369, 1369, 1369, 1369,0,1)
,(17,1,1,1,1,1,1)
,(18, 1357, 1357, 1357, 1357,0,1)
,(19, 921, 921, 921, 921,0,1)
SET IDENTITY_INSERT MenuTypes OFF

SET IDENTITY_INSERT Pages ON;
INSERT INTO Pages (PageID, StatusID, ShowTitleName, ShowTitleDescription, CreatorID, CreatedDate, ModifierID, ModifiedDate) VALUES (1, 1, 1, 0, @User, getdate(), @User, getdate())
SET IDENTITY_INSERT Pages OFF;

SET IDENTITY_INSERT PageSections ON;
INSERT INTO PageSections (
	PageSectionId, PageID, PageSectionTypeID, PageSectionDataTypeID
	, ShowSectionTitleName, ShowSectionTitleDescription, ShowContentTypeTitleName, ShowContentTypeTitleDescription
	, SizeX, SizeY, DashboardRow, DashboardColumn
	, SortById, MaxContent, HasPaging
	, CreatorId, CreatedDate, ModifierId, ModifiedDate) VALUES 
	(1, 1, 2, 1
	,1,0,0,0
	, 10, 1, 0,0
	,1,5,1
	,@User, getdate(), @User, getdate())
	, (2, 1, 2, 2
	,1,0,0,0
	, 10, 1, 1,0
	,1,5,1
	,@User, getdate(), @User, getdate())
	, (3, 1, 2, 3
	,1,0,0,0
	, 10, 2, 1,0
	,1,5,1
	,@User, getdate(), @User, getdate())
	, (4, 1, 2, 4
	,1,0,0,0
	, 10, 3, 1,0
	,1,5,1
	,@User, getdate(), @User, getdate())
	, (5, 1, 2, 5
	,1,0,0,0
	, 10, 4, 1,0
	,1,5,1
	,@User, getdate(), @User, getdate())
	, (6, 1, 2, 7
	,1,0,0,0
	, 10, 4, 1,0
	,1,5,1
	,@User, getdate(), @User, getdate())
SET IDENTITY_INSERT PageSections OFF;

SET IDENTITY_INSERT PageLanguages ON;
INSERT INTO PageLanguages(PageLanguageId, PageId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
  (1, 1, 41, 'Search results', 'Search results', 'Search results', 'Search results', 'Search results', 'Search results', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageLanguages OFF;


SET IDENTITY_INSERT PageSectionLanguages ON;
INSERT INTO PageSectionLanguages(PageSectionLanguageId,  PageId, PageSectionId, LanguageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription, CreatorId, ModifierId, CreatedDate, ModifiedDate) VALUES 
  (1, 1, 1, 41, 'Content', 'Content', 'Content', 'Content', 'Content', 'Content', @User, @User, GETDATE(), GETDATE())
, (2, 1, 2, 41, 'Processes', 'Processes', 'Processes', 'Processes', 'Processes', 'Processes', @User, @User, GETDATE(), GETDATE())
, (3, 1, 3, 41, 'Organizations', 'Organizations', 'Organizations', 'Organizations', 'Organizations', 'Organizations', @User, @User, GETDATE(), GETDATE())
, (4, 1, 4, 41, 'Persons', 'Persons', 'Persons', 'Persons', 'Persons', 'Persons', @User, @User, GETDATE(), GETDATE())
, (5, 1, 5, 41, 'Projects', 'Projects', 'Projects', 'Projects', 'Projects', 'Projects', @User, @User, GETDATE(), GETDATE())
, (6, 1, 6, 41, 'Classification values', 'Classification values', 'Classification values', 'Classification values', 'Classification values', 'Classification values', @User, @User, GETDATE(), GETDATE())
SET IDENTITY_INSERT PageSectionLanguages OFF;


SET IDENTITY_INSERT [dbo].[PageSectionContentConditionTypes] ON 
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (1, 318, 318, 318, 318,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (2, 1513, 1513, 1513, 1513,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (3, 41, 41, 41, 41,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (4, 127, 127, 127, 127,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (5, 17, 17, 17, 17,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (6, 177, 177, 177, 177,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (7, 33, 33, 33, 33,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (8, 312, 312, 312, 312,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (9, 67, 67, 67, 67,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (10, 68, 68, 68, 68,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (11, 1308, 1308, 1308, 1308,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (12, 1563, 1563, 1563, 1563,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (13, 1564, 1564, 1564, 1564,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (14, 1565, 1565, 1565, 1565,1)
INSERT [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (15, 1566, 1566, 1566, 1566,1)
SET IDENTITY_INSERT [dbo].[PageSectionContentConditionTypes] OFF

SET IDENTITY_INSERT [dbo].[PageSectionProcessConditionTypes] ON 
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (1, 1507, 1507, 1507, 1507,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (2, 1572, 1572, 1572, 1572,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (3, 624, 624, 624, 624,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (4, 1341, 1341, 1341, 1341,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (5, 1342, 1342, 1342, 1342,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (6, 1343, 1343, 1343, 1343,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (7, 1573, 1573, 1573, 1573,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (8, 1574, 1574, 1574, 1574,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (9, 1575, 1575, 1575, 1575,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (10, 1245, 1245, 1245, 1245,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (11, 1576, 1576, 1576, 1576,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (12, 41, 41, 41, 41,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (13, 127, 127, 127, 127,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (14, 880, 880, 880, 880,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (15, 139, 139, 139, 139,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (16, 312, 312, 312, 312,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (17, 1577, 1577, 1577, 1577,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (18, 890, 890, 890, 890,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (19, 892, 892, 892, 892,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (20, 1578, 1578, 1578, 1578,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (21, 900, 900, 900, 900,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (22, 1579, 1579, 1579, 1579,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (23, 1580, 1580, 1580, 1580,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (24, 1581, 1581, 1581, 1581,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (25, 227, 227, 227, 227,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (26, 17, 17, 17, 17,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (27, 1583, 1583, 1583, 1583,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (28, 318, 318, 318, 318,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (29, 1584, 1584, 1584, 1584,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (30, 1585, 1585, 1585, 1585,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (31, 1586, 1586, 1586, 1586,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (32, 649, 649, 649, 649,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (33, 650, 650, 650, 650,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (34, 645, 645, 645, 645,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (35, 646, 646, 646, 646,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (36, 675, 675, 675, 675,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (37, 1232, 1232, 1232, 1232,1)
INSERT [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (38, 319, 319, 319, 319,1)
SET IDENTITY_INSERT [dbo].[PageSectionProcessConditionTypes] OFF

SET IDENTITY_INSERT [dbo].[PageSectionOrganizationConditionTypes] ON 
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (1, 1513, 1513, 1513, 1513,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (2, 80, 80, 80, 80,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (3, 121, 121, 121, 121,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (4, 1165, 1165, 1165, 1165,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (5, 42, 42, 42, 42,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (6, 1602, 1602, 1602, 1602,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (7, 1421, 1421, 1421, 1421,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (8, 1164, 1164, 1164, 1164,1)
INSERT [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID],active) VALUES (9, 1422, 1422, 1422, 1422,1)
SET IDENTITY_INSERT [dbo].[PageSectionOrganizationConditionTypes] OFF

SET IDENTITY_INSERT [dbo].[PageSectionPersonConditionTypes] ON 
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (1, 1513, 1513, 1513, 1513, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (2, 1224, 1224, 1224, 1224, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (3, 41, 41, 41, 41, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (4, 127, 127, 127, 127, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (5, 121, 121, 121, 121, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (6, 1165, 1165, 1165, 1165, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (7, 1164, 1164, 1164, 1164, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (8, 628, 628, 628, 628, 1)
INSERT [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (9, 1471, 1471, 1471, 1471, 1)
SET IDENTITY_INSERT [dbo].[PageSectionPersonConditionTypes] OFF

SET IDENTITY_INSERT [dbo].[PageSectionClassificationValueConditionTypes] ON 
INSERT [dbo].[PageSectionClassificationValueConditionTypes] ([PageSectionClassificationValueConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (1, 1513, 1513, 1513, 1513, 1)
INSERT [dbo].[PageSectionClassificationValueConditionTypes] ([PageSectionClassificationValueConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (2, 1, 1, 1, 1, 1)
INSERT [dbo].[PageSectionClassificationValueConditionTypes] ([PageSectionClassificationValueConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (3, 1204, 1204, 1204, 1204, 0)
INSERT [dbo].[PageSectionClassificationValueConditionTypes] ([PageSectionClassificationValueConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], [active]) VALUES (4, 1309, 1309, 1309, 1309, 0)
SET IDENTITY_INSERT [dbo].[PageSectionClassificationValueConditionTypes] OFF


SET IDENTITY_INSERT [dbo].[PageSectionProjectConditionTypes] ON 
INSERT [dbo].[PageSectionProjectConditionTypes] ([PageSectionProjectConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (1, 297, 297, 297, 297,1)
INSERT [dbo].[PageSectionProjectConditionTypes] ([PageSectionProjectConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (2, 626, 626, 626, 626,1)
INSERT [dbo].[PageSectionProjectConditionTypes] ([PageSectionProjectConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (3, 1513, 1513, 1513, 1513,1)
INSERT [dbo].[PageSectionProjectConditionTypes] ([PageSectionProjectConditionTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (4, 1383, 1383, 1383, 1383,1)
SET IDENTITY_INSERT [dbo].[PageSectionProjectConditionTypes] OFF

SET IDENTITY_INSERT [dbo].[PropertyTypes] ON 
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (1, 1606, 1606, 1606, 1606,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (2, 647, 647, 647, 647,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (3, 646, 646, 646, 646,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (4, 1608, 1608, 1608, 1608,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (5, 1607, 1607, 1607, 1607,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (6, 1609, 1609, 1609, 1609,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (7, 1610, 1610, 1610, 1610,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (8, 1611, 1611, 1611, 1611,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (9, 1612, 1612, 1612, 1612,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (10, 1613, 1613, 1613, 1613,1)
INSERT [dbo].[PropertyTypes] ([PropertyTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID], active) VALUES (11, 1614, 1614, 1614, 1614,1)
SET IDENTITY_INSERT [dbo].[PropertyTypes] OFF

SET IDENTITY_INSERT [dbo].[PropertyStatuses] ON 
INSERT [dbo].[PropertyStatuses] ([PropertyStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 682, 682, 682, 682)
INSERT [dbo].[PropertyStatuses] ([PropertyStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 340, 340, 340, 340)
SET IDENTITY_INSERT [dbo].[PropertyStatuses] OFF

USE [sip]

SET IDENTITY_INSERT [dbo].[ChangeTypes] ON 
INSERT [dbo].[ChangeTypes] ([ChangeTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 1134, 1134, 1134, 1134)
INSERT [dbo].[ChangeTypes] ([ChangeTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 24, 24, 24, 24)
INSERT [dbo].[ChangeTypes] ([ChangeTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 21, 21, 21, 21)
SET IDENTITY_INSERT [dbo].[ChangeTypes] OFF

SET IDENTITY_INSERT [dbo].[RightTypes] ON 
INSERT [dbo].[RightTypes] ([RightTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 1784, 1784, 1784, 1784)
INSERT [dbo].[RightTypes] ([RightTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 24, 24, 24, 24)
INSERT [dbo].[RightTypes] ([RightTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 1783, 1783, 1783, 1783)
SET IDENTITY_INSERT [dbo].[RightTypes] OFF

SET IDENTITY_INSERT [dbo].[MetaContentTypes] ON 
 
INSERT [dbo].[MetaContentTypes] ([MetaContentTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 3848, 3848, 3848, 3848)
INSERT [dbo].[MetaContentTypes] ([MetaContentTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 3849, 3849, 3849, 3849)
INSERT [dbo].[MetaContentTypes] ([MetaContentTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 3850, 3850, 3850, 3850)
INSERT [dbo].[MetaContentTypes] ([MetaContentTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (4, 3851, 3851, 3851, 3851)
SET IDENTITY_INSERT [dbo].[MetaContentTypes] OFF
 
 SET IDENTITY_INSERT [dbo].[MetaTypes] ON 
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 3852, 3852, 3852, 3852)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 3853, 3853, 3853, 3853)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 3854, 3854, 3854, 3854)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (4, 3855, 3855, 3855, 3855)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (5, 3856, 3856, 3856, 3856)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (6, 3857, 3857, 3857, 3857)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (7, 3858, 3858, 3858, 3858)
INSERT [dbo].[MetaTypes] ([MetaTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (8, 3859, 3859, 3859, 3859)
SET IDENTITY_INSERT [dbo].[MetaTypes] OFF




SET IDENTITY_INSERT [dbo].[ExplanationTypes] ON 

INSERT [dbo].[ExplanationTypes] ([ExplanationTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 3882, 3882, 3882, 3882)

SET IDENTITY_INSERT [dbo].[ExplanationTypes] OFF

SET IDENTITY_INSERT [dbo].[ObjectTypeClassificationStatuses] ON 

INSERT [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 339, 339, 339, 339)

INSERT [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 340, 340, 340, 340)

INSERT [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 341, 341, 341, 341)
INSERT [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (4, 4072, 4072, 4072, 4072)
INSERT [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (5, 4073, 4073, 4073, 4073)

SET IDENTITY_INSERT [dbo].[ObjectTypeClassificationStatuses] OFF

SET IDENTITY_INSERT [dbo].[ProcessTypeStageFieldStatuses] ON 

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 679, 679, 679, 679)

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 680, 680, 680, 680)

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 681, 681, 681, 681)

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (4, 682, 682, 682, 682)

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (5, 3879, 3879, 3879, 3879)

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (6, 3880, 3880, 3880, 3880)

INSERT [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (7, 3881, 3881, 3881, 3881)

SET IDENTITY_INSERT [dbo].[ProcessTypeStageFieldStatuses] OFF

SET IDENTITY_INSERT [dbo].[CodeTypes] ON 

INSERT [dbo].[CodeTypes] ([CodeTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 3897, 3897, 3897, 3897)

INSERT [dbo].[CodeTypes] ([CodeTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 3898, 3898, 3898, 3898)

INSERT [dbo].[CodeTypes] ([CodeTypeID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 3899, 3899, 3899, 3899)

SET IDENTITY_INSERT [dbo].[CodeTypes] OFF




INSERT [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (1, 336, 336, 336, 336)

INSERT [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (2, 192, 192, 192, 192)

INSERT [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID], [NameTermID], [DescriptionTermID], [MenuNameTermID], [MouseOverTermID]) VALUES (3, 327, 327, 327, 327)

