using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessCreateGet
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public string ProcessTemplateStageId { get; set; }
        public string ProcessTemplateStageName { get; set; }
        public int? ProcessMultiId { get; set; }
        public string CreatorId { get; set; }
        public List<SequenceList> Sequences { get; set; }
        public List<ProcessTemplateGroupList> ProcessTemplateGroups { get; set; }
        public List<ProcessCreateGetFieldList> ProcessCreateGetFields { get; set; }
    }
    }
