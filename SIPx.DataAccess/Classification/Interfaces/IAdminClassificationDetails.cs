using System;

namespace SIPx.DataAccess
{
    public interface IAdminClassificationDetails
    {
        int ClassificationId { get; set; }
        string ClassificationPageName { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        bool DefaultClassificationPageLanguage { get; set; }
        bool DefaultLanguage { get; set; }
        bool DefaultStatusLanguage { get; set; }
        string Description { get; set; }
        int DropDownSequence { get; set; }
        bool HasDropDown { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string StatusName { get; set; }
    }
}