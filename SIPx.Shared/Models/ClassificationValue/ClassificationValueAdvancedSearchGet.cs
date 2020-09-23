using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueAdvancedSearchPost
    {
        [Key]
        public string UserId { get; set; }
        public string Contains { get; set; }
        public int ClassificationId { get; set; }
        public int DateLevelId { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public int PersonId{ get; set; }
        public List<DateLevelList> DateLevels { get; set; }
        public List<ClassificationList> Classifications { get; set; }
        public List<PersonList> Persons { get; set; }
    }
}
