﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessFieldFromAPI : INewProcessFieldFromAPI
    {
        [Key]
        public int Sequence { get; set; }
        public int ProcessTemplateId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public string StringValue { get; set; }
        public int? IntValue { get; set; }
        public DateTime? DateTimeValue { get; set; }
        
    }
}
