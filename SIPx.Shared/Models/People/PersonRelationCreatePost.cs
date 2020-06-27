using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationCreatePost : IPersonRelationCreatePost
    {
        [Key]
        public int FromPersonID { get; set; }
        public int ToPersonID { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTill { get; set; }
        public int PersonRelationTypeID { get; set; }
        public string UserId { get; set; }

    }
}
