using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessEditGetFields
    {
       
        public int ProcessId { get; set; }
        [Key]
        public int ProcessfieldId { get; set; }
        public int? IntValue { get; set; }
        public string StringValue { get; set; }
        public DateTime? DateTimeValue { get; set; }
        public string FieldName { get; set; }
        public int ProcessTemplateStageFieldStatusID { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFieldTypeID { get; set; }
        public string ControlId { get; set; }
        //public string ControlId1 { get; set; }
        //public string ControlId2 { get; set; }
        //public string ControlId3 { get; set; }
        //public string ControlId4 { get; set; }
        //public string ControlId5 { get; set; }
        //public string ControlId6 { get; set; }
        //public string ControlId7 { get; set; }
        //public string ControlId8 { get; set; }
        //public string ControlId9 { get; set; }
        public string ControlProcessFieldId { get; set; }
        public string ControlProcessId { get; set; }

        public string ModifierId { get; set; }

        public DateTime ModifiedDate { get; set; }
        //[ForeignKey("ProcessId")]
        //public virtual Process Process { get; set; }

    }
}
