using System;

namespace SIPx.Shared
{
    public interface IContent
    {
         int ContentId { get; set; }
         string Title { get; set; }
         string ContentTypeName { get; set; }
         string StatusName { get; set; }
         string LanguageName { get; set; }
         string SecurityLevelName { get; set; }
         string OrganizationName { get; set; }
         string ProjectName { get; set; }
         string ProcessSubject { get; set; }
         string Creator { get; set; }
         DateTime CreatedDate { get; set; }
         string Modifier { get; set; }
         DateTime ModifiedDate { get; set; }
    }
}