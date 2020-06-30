using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationEditGet : IClassificationEditGet
    {
        [Key]
        public int ClassificationId { get; set; }
        public int StatusId { get; set; }
        public int? DefaultPageId { get; set; }
        public bool HasDropDown { get; set; }
        public bool DropDownSequence { get; set; }
        public int ClassificationLanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<StatusList> Statuses { get; set; }
        public List<ClassificationPageList> DefaultPages { get; set; }
        public List<int> Sequences { get; set; }

    }
}
