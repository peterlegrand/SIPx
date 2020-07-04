using Microsoft.AspNetCore.Components;
using SIPx.BlazorServer.Services;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Pages
{
    public class ClassificationsBase : ComponentBase
    {
        public IEnumerable<ClassificationIndexGet> Classifications { get; set; }
        [Inject]
        public IClassificationService classificationService { get; set; }
    }
}
