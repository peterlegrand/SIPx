using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessTypeGet : INewProcessTypeGet
    {
        public int ProcessTypeStageFieldStatusId { get; set; }
        public int ProcessTypeFieldTypeId { get; set; }
        [Key]
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeId { get; set; }
        public int Sequence { get; set; }
        public int? IntValue { get; set; }
        public DateTime? DateTimeValue { get; set; }
        public string StringValue { get; set; }
        //        public DbGeography? ProcessTypeFlowConditionInt { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }

    }
}
