using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationCreateGet
    {
        [Key]
        public int FromPersonId { get; set; }
        public string FromPersonFirstName { get; set; }
        public string FromPersonLastName { get; set; }
        public int ToPersonId { get; set; }
        public string ToPersonFirstName { get; set; }
        public string ToPersonLastName { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTill { get; set; }
        public int PersonRelationTypeId { get; set; }
        public string CreatorId { get; set; }
        public List<UserList> FromUsers { get; set; }
        public List<UserList> ToUsers { get; set; }
        public List<PersonRelationTypeList> PersonRelationTypes { get; set; }

    }
}
