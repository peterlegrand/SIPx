using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class Content : IContent
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
        public string ContentTypeName { get; set; }
        public string StatusName { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string SecurityLevelName { get; set; }
        public string OrganizationName { get; set; }
        public string ProjectName { get; set; }
        public string ProcessSubject { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
