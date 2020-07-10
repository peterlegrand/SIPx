﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationUpdateGet 
    {
        [Key]
        public int OrganizationId { get; set; }
        public int OrganizationLanguageId { get; set; }
        public int? ParentOrganizationId { get; set; }
        public int StatusId { get; set; }
        public int OrganizationTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<OrganizationList> Organizations { get; set; }
        public List<StatusList> Statuses { get; set; }
        public List<OrganizationTypeList> OrganizationTypes { get; set; }
    }
}
