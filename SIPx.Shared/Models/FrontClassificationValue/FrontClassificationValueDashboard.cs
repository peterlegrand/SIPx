using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontClassificationValueDashboard
    {
        [Key]
        public int ClassificationID { get; set; }
        public int ClassificationValueID { get; set; }
        public string ClassificationValueName { get; set; }
        public string ClassificationValueDescription { get; set; }
        public string ClassificationName { get; set; }
        public List<FrontClassificationValueDashboardUser> Users { get; set; }
        public List<FrontClassificationValueDashboardRole> Roles { get; set; }
        public List<FrontClassificationValueDashboardContent> Contents { get; set; }
        public List<FrontClassificationValueDashboardProcess> Processes { get; set; }
    }
}
