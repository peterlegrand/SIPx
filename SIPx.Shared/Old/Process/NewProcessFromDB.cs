using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessFromDB : INewProcessFromDB
    {
        [Key]
        public int Sequence { get; set; }
        public int ProcessTemplateStageFieldStatusId { get; set; }
        public int? IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string StringValue { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldTypeId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateStageId { get; set; }
        public string Name { get; set; }
        public string ControlId { get; set; }
        public string ControlId2 { get; set; }
    }
}
