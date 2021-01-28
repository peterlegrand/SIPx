using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IContentTypeClassificationEditGet
    {
        int ClassificationId { get; set; }
        string ClassificationName { get; set; }
        int ContentTypeClassificationId { get; set; }
        List<ContentTypeClassificationStatusList> ContentTypeClassificationStatuses { get; set; }
        string ObjectTypeClassificationStatusId { get; set; }
        int ContentTypeId { get; set; }
        string ContentTypeName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
    }
}