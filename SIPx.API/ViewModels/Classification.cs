using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Classification
    {
        [Key]
        public int ClassificationID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string StatusName { get; set; }
        public string DefaultPageName { get; set; }
        public int DefaultPageID { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public string ModifiedDate { get; set; }
    }
}
