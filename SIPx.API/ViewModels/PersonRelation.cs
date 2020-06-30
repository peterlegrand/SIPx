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
        public int PersonRelationId { get; set; }
        public int FromPersonId { get; set; }
        public string FromPersonName { get; set; }
        public int ToPersonId { get; set; }
        public string ToPersonName { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTill { get; set; }
        public int PersonRelationTypeId { get; set; }
        public string PersonRelationTypeName { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
