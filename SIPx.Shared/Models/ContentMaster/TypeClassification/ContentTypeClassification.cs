using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class ContentTypeClassification
    {
        [Key]
        public int ContentTypeClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public string StatusName { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
