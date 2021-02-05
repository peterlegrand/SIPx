using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessFromAPI : INewProcessFromAPI
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public int ProcessTypeStageId { get; set; }
        public List<NewProcessFieldFromAPI> ProcessFields { get; set; }
    }
}
