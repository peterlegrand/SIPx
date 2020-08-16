using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessTemplateGet : INewProcessTemplateGet
    {
        public int ProcessTemplateStageFieldStatusId { get; set; }
        public int ProcessTemplateFieldTypeId { get; set; }
        [Key]
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int Sequence { get; set; }
        public int? IntValue { get; set; }
        public DateTime? DateTimeValue { get; set; }
        public string StringValue { get; set; }
        //        public DbGeography? ProcessTemplateFlowConditionInt { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }

    }
}
