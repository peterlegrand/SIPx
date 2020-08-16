using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentCreateListSet 
    {
        [Key]
        public int ContentTypeId { get; set; }
        //        public string ContentTypeName { get; set; }
        public List<ClassificationList> ClassificationList { get; set; }
        public List<LanguageList> LanguageList { get; set; }
        public List<OrganizationList> OrganizationList { get; set; }
        //public string StatusName { get; set; }
        //public string LanguageName { get; set; }
        //public string SecurityLevelName { get; set; }
        //public string OrganizationName { get; set; }
        //public string ProjectName { get; set; }
        //public string ProcessSubject { get; set; }
        //public string Creator { get; set; }
        //public DateTime CreatedDate { get; set; }
        //public string Modifier { get; set; }
        //public DateTime ModifiedDate { get; set; }

    }
}
