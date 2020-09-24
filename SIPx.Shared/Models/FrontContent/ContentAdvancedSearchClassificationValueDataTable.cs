using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SIPx.Shared
{
    public class ContentAdvancedSearchClassificationValueDataTable
    {
            public static DataTable CreateTable()
            {
                DataTable ValueFields = new DataTable();
            //                ProcessFields.Columns.Add("ContentID", typeof(Int32));
             ValueFields.Columns.Add("ClassificationValueId", typeof(Int32));
                return  ValueFields;

        }
    }
}
