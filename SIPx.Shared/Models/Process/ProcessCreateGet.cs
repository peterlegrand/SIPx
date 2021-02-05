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
        public int ProcessTypeId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public string ProcessTypeName { get; set; }
        public string ProcessTypeStageId { get; set; }
        public string ProcessTypeStageName { get; set; }
        public int? ProcessMultiId { get; set; }
        public string UserId { get; set; }
        public List<SequenceList> Sequences { get; set; }
        public List<ProcessTypeGroupList> ProcessTypeGroups { get; set; }
        public List<ProcessCreateGetFieldList> ProcessCreateGetFields { get; set; }
    }
    }
