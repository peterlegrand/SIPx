﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageUpdateGet 
    {
        [Key]
        public int OrganizationTypeId { get; set; }
        public int OrganizationTypeLanguageId { get; set; }
        public int StatusId { get; set; }
        public bool ShowTitleName { get; set; }
        public bool ShowTitleDescription { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<StatusList> Statuses { get; set; }
    }
}