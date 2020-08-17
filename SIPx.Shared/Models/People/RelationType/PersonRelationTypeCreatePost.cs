using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationTypeCreatePost : IPersonRelationTypeCreatePost
    {
        [Key]
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public string FromIsAnXOfTo { get; set; }
        public string ToIsAnXOfFrom { get; set; }
        public bool SeePersonal { get; set; }
        public string Color { get; set; }

    }
}
