using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueIndexGetUser
    {
        [Key]
        public int ClassificationValueUserId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public int ClassificationValueId { get; set; }
        public string UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int PersonId { get; set; }
        public string ClassificationRelationTypeName { get; set; }
    }
}
