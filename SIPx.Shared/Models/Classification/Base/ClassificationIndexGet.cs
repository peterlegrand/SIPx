using System;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationIndexGet 
    {
        [Key]
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string StatusName { get; set; }
        public string DefaultPageName { get; set; }
        public int DefaultPageId { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public string ModifiedDate { get; set; }

    }
}
