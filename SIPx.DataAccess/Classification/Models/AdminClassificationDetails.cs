using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.DataAccess
{
    public class AdminClassificationDetails : IAdminClassificationDetails
    {
        [Key]
        public int ClassificationId { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
        public string StatusName { get; set; }
        public bool DefaultStatusLanguage { get; set; }
        public string ClassificationPageName { get; set; }
        public bool DefaultClassificationPageLanguage { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string Creator { get; set; }
        public string Modifier { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public bool DefaultLanguage { get; set; }
    }
}
