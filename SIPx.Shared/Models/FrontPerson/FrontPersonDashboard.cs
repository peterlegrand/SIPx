using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontPersonDashboard
    {
        [Key]
        public string Id { get; set; }
        public bool IsUser { get; set; }
        public int PersonId { get; set; }
        public int SecurityLevelId { get; set; }
        public string Salutation { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string PersonalTitle { get; set; }
        public string Suffix { get; set; }
        public string NickName { get; set; }
        public string FirstNameLocal { get; set; }
        public string MiddleNameLocal { get; set; }
        public string LastNameLocal { get; set; }
        public string GenderName { get; set; }
        public DateTime BirthDate { get; set; }
        public string SecurityLevelName { get; set; }
        public string OrganizationName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<FrontPersonDashboardAddress> Addresses { get; set; }
        public List<FrontPersonDashboardTelecom> Telecoms { get; set; }
        public List<FrontPersonDashboardOrganizationRole> OrganizationRoles { get; set; }
        public List<FrontPersonDashboardOrganizationPosition> OrganizationPositions { get; set; }
        public List<FrontPersonDashboardProject> Projects { get; set; }
        public List<FrontPersonDashboardContent> Contents { get; set; }
        public List<FrontPersonDashboardProcess> Processes { get; set; }
    }
}
