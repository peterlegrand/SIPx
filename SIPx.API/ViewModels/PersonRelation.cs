using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class PersonRelation
    {
        [Key]
        public int PersonRelationID { get; set; }
        public int FromPersonID { get; set; }
        public string FromPersonName { get; set; }
        public int ToPersonID { get; set; }
        public string ToPersonName { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTill { get; set; }
        public int PersonRelationTypeID { get; set; }
        public string PersonRelationTypeName { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
