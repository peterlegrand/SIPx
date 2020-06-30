using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationCreatePost : IPersonRelationCreatePost
    {
        [Key]
        public int FromPersonId { get; set; }
        public int ToPersonId { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTill { get; set; }
        public int PersonRelationTypeId { get; set; }
        public string UserId { get; set; }

    }
}
