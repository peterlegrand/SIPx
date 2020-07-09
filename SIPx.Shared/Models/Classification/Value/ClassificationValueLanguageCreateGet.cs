using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueLanguageCreateGet
    {
        [Key]
        public int ClassificationValueId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int LanguageId { get; set; }
        public string PageName { get; set; }
        public string PageDescription { get; set; }
        public string HeaderName { get; set; }
        public string HeaderDescription { get; set; }
        public string TopicName { get; set; }
        public string CreatorId { get; set; }
        public List<LanguageList> Languages { get; set; }
    }
}
