using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Content
    {
        [Key]
        public int ContentID { get; set; }
        public string Title { get; set; }
        public string ContentypeName { get; set; }
        public string StatusName { get; set; }
        public string LanguageName { get; set; }
        public string SecurityLevelName { get; set; }
        public string OrganiztionName { get; set; }
        public string ProjectName { get; set; }
        public string ProcessSubject { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
