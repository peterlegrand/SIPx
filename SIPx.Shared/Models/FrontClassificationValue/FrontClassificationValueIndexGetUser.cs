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
        public int ClassificationValueUserID { get; set; }
        public int ClassificationRelationTypeID { get; set; }
        public int ClassificationValueID { get; set; }
        public string UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int PersonID { get; set; }
        public string ClassificationRelationTypeName { get; set; }
    }
}
