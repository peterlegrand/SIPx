using Microsoft.AspNetCore.Components;
using SIPx.BlazorServer.Services;
using SIPx.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Pages
{
    public class ClassificationsBase : ComponentBase
    {
        public IEnumerable<AdminClassificationDetails> Classifications { get; set; }
        [Inject]
        public IClassificationService classificationService { get; set; }
    }
}
