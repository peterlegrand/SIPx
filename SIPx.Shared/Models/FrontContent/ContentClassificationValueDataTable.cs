using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SIPx.Shared
{
    public class ContentClassificationValueDataTable
    {
            public static DataTable CreateTable()
            {
                DataTable ProcessFields = new DataTable();
//                ProcessFields.Columns.Add("ContentID", typeof(Int32));
                ProcessFields.Columns.Add("ClassificationCalueID", typeof(Int32));
                ProcessFields.Columns.Add("ClassificationId", typeof(Int32));
                ProcessFields.Columns.Add("CreatorId", typeof(string));
                ProcessFields.Columns.Add("CreatedDate", typeof(DateTime));
                return ProcessFields;

        }
    }
}
