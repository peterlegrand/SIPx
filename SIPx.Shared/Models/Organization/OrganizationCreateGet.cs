using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationCreateGet
    {
        [Key]
        public int OrganizationTypeId { get; set; }
        public int? ParentOrganizationId { get; set; }
        public string ParentOrganizationName { get; set; }
        public int StatusId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<OrganizationTypeList> OrganizationTypes { get; set; }
        public List<StatusList> Statuses { get; set; }
    }
}
