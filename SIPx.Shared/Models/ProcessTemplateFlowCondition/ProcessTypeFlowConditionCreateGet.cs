using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTypeFlowConditionCreateGet
    {
        [Key]
        public int ProcessTypeId { get; set; }
        public string ProcessTypeName { get; set; }
        public int ProcessTypeFlowId { get; set; }
        public string ProcessTypeFlowName { get; set; }
        public int Sequence { get; set; }
        public int ProcessTypeFlowConditionTypeId { get; set; }
        public int ProcessTypeFieldId { get; set; }
        public int ProcessTypeFieldIdRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTypeFlowConditionString { get; set; }
        public int ProcessTypeFlowConditionInt { get; set; }
        public DateTime ProcessTypeFlowConditionDate { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string LanguageName { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
       // public string CreatorId { get; set; }
        public string UserId { get; set; }
        public List<SequenceList> Sequences { get; set; }
        public List<ProcessTypeFlowConditionTypeList> ProcessTypeFlowConditionTypes { get; set; }
        public List<ProcessTypeFieldList> ProcessTypeFields { get; set; }
        public List<ProcessTypeFieldList> ProcessTypeFieldRoles { get; set; }
        public List<ProcessTypeFlowConditionComparisonOperatorList> ComparisonOperators { get; set; }

        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<UserList> Users { get; set; }
        //public List<RelationList> Users { get; set; }
    }
}
