using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectAdvancedSearchPost
    {
        [Key]
        public string UserId { get; set; }
        public string Contains { get; set; }
        public int ParentProjectId { get; set; }
        public int ProjectTypeId { get; set; }
        public int SecurityLevelId { get; set; }
        public int StatusId { get; set; }
        public int PersonId { get; set; }


        public List<ProjectList> ParentProjects { get; set; }
        public List<ProjectTypeList> ProjectTypes { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<StatusList> Statuses { get; set; }
        public List<PersonList> Persons { get; set; }

    }
}
