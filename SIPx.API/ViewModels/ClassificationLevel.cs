using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class ClassificationLevel
    {
        [Key]
        public int ClassificationLevelID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string DateLevelName { get; set; }
        public int Sequence { get; set; }
        public bool Alphabetically { get; set; }
        public bool OnTheFly { get; set; }
        public bool InDropDown { get; set; }
        public bool InMenu { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public string ModifiedDate { get; set; }
    }
}
