using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageUpdateGet 
    {
        [Key]
        public int PageId { get; set; }
        public int PageLanguageId { get; set; }
        public int StatusId { get; set; }
        public bool ShowTitleName { get; set; }
        public bool ShowTitleDescription { get; set; }
        public int? OrganizationId { get; set; }
        public int? ProjectId { get; set; }
        public string UserId { get; set; }
        public string SelectedUserId { get; set; }
        public int? ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<UserList> Users { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<ClassificationList> Classifications { get; set; }
        public List<StatusList> Statuses { get; set; }
    }
}
