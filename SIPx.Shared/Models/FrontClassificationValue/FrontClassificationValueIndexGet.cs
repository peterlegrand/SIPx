using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueIndexGet
    {
        [Key]
        public int ClassificationID { get; set; }
        public int ClassificationValueID { get; set; }
        public string ClassificationValue { get; set; }
        public string ClassificationName { get; set; }
        public List<FrontClassificationValueIndexGetUser> Users { get; set; }
        public List<FrontClassificationValueIndexGetRole> Roles { get; set; }
        public List<FrontClassificationValueIndexGetContent> Contents { get; set; }
    }
}
