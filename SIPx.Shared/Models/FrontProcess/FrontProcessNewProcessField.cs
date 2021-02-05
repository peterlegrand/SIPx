using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessNewProcessField : INewProcessFromDB
    {
        [Key]
        public int Sequence { get; set; }
        public int ProcessTypeStageFieldStatusId { get; set; }
        public int? IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public string StringValue { get; set; }
        public string UserId { get; set; }
        public string RoleId { get; set; }
        public string HTMLStringValue { get; set; }
        public string MissingValueText { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldTypeId { get; set; }
        public int ProcessTypeId { get; set; }
        public int ProcessTypeStageId { get; set; }
        public string Name { get; set; }
        public string ControlId { get; set; }
        public string ControlIdProcessTypeFieldId { get; set; }
        public string ControlIdProcessTypeFieldTypeId { get; set; }
        public string ControlIdOnFocusOutFunction { get; set; }
        public string ControlIdWarning { get; set; }
    }
}
