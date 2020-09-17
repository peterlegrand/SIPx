using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class SearchGlobalPost
    {
        public List<ClassificationValueSearch> ClassificationValues { get; set; }
        public List<ContentSearch> Contents { get; set; }
        public List<OrganizationSearch> Organizations { get; set; }
        public List<PersonSearch> Persons { get; set; }
        public List<ProcessSearch> Processes { get; set; }
        public List<ProjectSearch> Projects { get; set; }
        public SearchGlobalPostPage Page { get; set; }
    }
}

