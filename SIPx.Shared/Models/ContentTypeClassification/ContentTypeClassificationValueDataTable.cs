using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeClassificationValueDataTable
    {
            public static DataTable CreateTable()
            {
                DataTable ClassificationFields = new DataTable();
            //                ProcessFields.Columns.Add("ContentID", typeof(Int32));
            ClassificationFields.Columns.Add("ClassificationId", typeof(Int32));
            ClassificationFields.Columns.Add("ObjectTypeClassificationStatusId", typeof(Int32));
            return ClassificationFields;

        }
    }
}
