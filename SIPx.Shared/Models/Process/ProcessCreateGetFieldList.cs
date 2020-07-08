using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessCreateGetFieldList
    {
        [Key]
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int? IntValue { get; set; }
        public string StringValue { get; set; }
        public DateTime? DateTimeValue { get; set; }
        public string LocationValue { get; set; }
        public string FieldStatusId { get; set; }
        public string FieldStatusName { get; set; }
    }
}
