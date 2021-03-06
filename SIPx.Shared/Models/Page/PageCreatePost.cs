﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageCreatePost : IPageCreatePost
    {
        public bool ShowTitleName { get; set; }
        public bool ShowTitleDescription { get; set; }
        public int LanguageId { get; set; }
        public int StatusId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string UserId { get; set; }
        public string SelectedUserId { get; set; }
    }
}
