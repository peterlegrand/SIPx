using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessUpdateGetField
    {
        [Key]
        public int ProcessId { get; set; }
        public int ProcessFieldId { get; set; }
        public int ProcessTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public string StringValue { get; set; }
        public int? IntValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public int ProcessTypeFieldTypeId { get; set; }
        public int ProcessTypeStageFieldStatusId { get; set; }
        public int ValueUpdateTypeId { get; set; }
        public string DefaultStringValue { get; set; }
        public int? DefaultIntValue { get; set; }
        public DateTime DefaultDateTimeValue { get; set; }
        public string FieldName { get; set; }
        public string Control1 { get; set; }
        public string Control2 { get; set; }
        public string Control3 { get; set; }
        public string Control4 { get; set; }
        public string Control5 { get; set; }
        public string Control6 { get; set; }
        public string UserName { get; set; }
        public string OrganizationName { get; set; }
        public string ProjectName { get; set; }
        public string ClassificationName { get; set; }
        public string ClassificationValueName { get; set; }
        public string LanguageName { get; set; }
        public string CountryName { get; set; }
        public string SecurityLevelName { get; set; }
        public string ContentTitle { get; set; }
        public string PersonName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
