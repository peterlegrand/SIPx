﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentDeleteGet
    {
        [Key]
        public int ContentId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public int? ParentId { get; set; }
        public string ParentName { get; set; }
        public int ContentTypeId { get; set; }
        public string ContentTypeName { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public int SecurityLevelId { get; set; }
        public string SecurityLevelName { get; set; }
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }
        public int? ProjectId { get; set; }
        public string ProjectName { get; set; }
        public int ProcessId { get; set; }
        public string ProcessSubject { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

    }
}
