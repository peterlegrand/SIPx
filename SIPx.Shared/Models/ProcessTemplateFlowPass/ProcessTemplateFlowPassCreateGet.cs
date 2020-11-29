using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProcessTemplateFlowPassCreateGet
    {
        [Key]
        public int ProcessTemplateId { get; set; }
        public string ProcessTemplateName { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public string ProcessTemplateFlowName { get; set; }
        public int Sequence { get; set; }
        public int ProcessTemplateFlowPassTypeId { get; set; }
        public int ProcessTemplateFieldId { get; set; }
        public int ProcessTemplateFieldIdRole { get; set; }
        public int ComparisonOperatorId { get; set; }
        public string ProcessTemplateFlowPassString { get; set; }
        public int ProcessTemplateFlowPassInt { get; set; }
        public DateTime ProcessTemplateFlowPassDate { get; set; }
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string LanguageName { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
       // public string CreatorId { get; set; }
        public string UserId { get; set; }
        public List<SequenceList> Sequences { get; set; }
        public List<ProcessTemplateFlowPassTypeList> ProcessTemplateFlowPassTypes { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFields { get; set; }
        public List<ProcessTemplateFieldList> ProcessTemplateFieldRoles { get; set; }
        public List<ProcessTemplateFlowPassComparisonOperatorList> ComparisonOperators { get; set; }

        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<UserList> Users { get; set; }
        //public List<RelationList> Users { get; set; }
    }
}
