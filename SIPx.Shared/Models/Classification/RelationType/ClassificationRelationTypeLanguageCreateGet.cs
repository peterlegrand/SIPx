using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRelationTypeLanguageCreateGet
    {
        [Key]
        public int ClassificationRelationTypeId { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public List<LanguageList> Languages { get; set; }

    }
}
