
using Dapper;
using SIPx.Shared;
using SIPx.Shared.Models.FrontProcess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class FrontProcessProvider : IFrontProcessProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontProcessProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<NewProcessShowTemplateGroup>> NewProcessShowTemplateGroup(string UserId)
        {
            string usp = "usp_FrontNewProcessShowTemplateGroup @UserID";
            var x = await _sqlDataAccess.LoadData<NewProcessShowTemplateGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<NewProcessShowTemplate>> NewProcessShowTemplate(string UserId)
        {
            string usp = "usp_FrontNewProcessShowTemplate @UserID";
            var x = await _sqlDataAccess.LoadData<NewProcessShowTemplate, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<FrontProcessEditGet> FrontProcessEditGet(string UserId, int ProcessId)
        {
            string usp = "usp_FrontProcessEditGet @UserID, @ProcessId";
            string usp2 = "usp_FrontProcessEditGetFields @UserID, @ProcessId";
            var x = await _sqlDataAccess.LoadSingleRecord<FrontProcessEditGet, dynamic>(usp, new { UserId = UserId, ProcessId = ProcessId });
            var y = await _sqlDataAccess.LoadData<FrontProcessEditGetFields, dynamic>(usp2, new { UserId = UserId, ProcessId = ProcessId });
            x.ProcessFields = y;
            return x;
        }
        public async Task<bool> FrontProcessEditPost(FrontProcessEditGet Process, string UserId)
        {
//            DataTable fields = new DataTable();
//            fields.Columns.Add("ProcessFieldId", typeof(int));
//            fields.Columns.Add("ProcessId", typeof(int));
//            fields.Columns.Add("StringValue", typeof(string));
//            DataColumn intvalue;
//            intvalue = new DataColumn("IntValue", typeof(int));
//            intvalue.AllowDBNull = true;
//            fields.Columns.Add(intvalue);
//            //            fields.Columns.Add("IntValue", typeof(int?));
//            DataColumn dateTimeValue;
//            dateTimeValue = new DataColumn("DateTimeValue", typeof(DateTime));
//            intvalue.AllowDBNull = true;
//            fields.Columns.Add(dateTimeValue);
////            fields.Columns.Add("DateTimeValue", typeof(DateTime));
//            fields.Columns.Add("ModifierId", typeof(string));
//            fields.Columns.Add("ModifiedDate", typeof(DateTime));
//            foreach(var x in Process.ProcessFields)
//            {
//                DataRow DR = fields.NewRow();
//                    DR["ProcessFieldId"] = x.ProcessfieldId;
//                DR["ProcessId"] = x.ProcessId;
//                DR["StringValue"] = x.StringValue;
//                DR["IntValue"] = x.IntValue??0;
//                DR["DateTimeValue"] = x.DateTimeValue??DateTime.Now;
//                DR["ModifierId"] = x.ModifierId;
//                DR["ModifiedDate"] = x.ModifiedDate;
//                fields.Rows.Add(DR);
//            }
            DataTable ProcessFieldTable = ProcessFieldDataTable.CreateTable();
            var xy = new List<ProcessFieldsToDataTable>();

           // for (int i = 0; i < Process.ProcessFields.Count; i++)
            foreach (var x in Process.ProcessFields)
            {
                if (x.StringValue == null)
                { x.StringValue = ""; }
                if (x.IntValue== null)
                { x.IntValue = 0; }
                if (x.DateTimeValue == null)
                { x.DateTimeValue = DateTime.Today; }
                else
                { x.DateTimeValue = Convert.ToDateTime(DateTime.Now.ToString("dd MMMM yyyy hh:mm:ss tt").tod; }
            x.ModifiedDate = DateTime.Today; 
                if (x.ModifierId== null)
                { x.ModifierId = UserId; }
                //var y = new ProcessFieldsToDataTable();
                //if (Process.ProcessFields[i].StringValue == null)
                //{ Process.ProcessFields[i].StringValue = ""; }
                //if (Process.ProcessFields[i].IntValue== null)
                //{ Process.ProcessFields[i].IntValue = 0; }
                //if (Process.ProcessFields[i].DateTimeValue== null)
                //{ Process.ProcessFields[i].DateTimeValue = DateTime.Now; }
                //Process.ProcessFields[i].ModifiedDate = DateTime.Now;
                //Process.ProcessFields[i].ModifierId = UserId;
                //y.ProcessFieldId = Process.ProcessFields[i].ProcessfieldId;
                //y.ProcessId = Process.ProcessFields[i].ProcessId;
                //y.StringValue = Process.ProcessFields[i].StringValue;
                //y.IntValue = Process.ProcessFields[i].IntValue ?? 0;
                //y.DateTimeValue = Process.ProcessFields[i].DateTimeValue ?? DateTime.Now;
                //y.ModifierId = Process.ProcessFields[i].ModifierId;
                //y.ModifiedDate= Process.ProcessFields[i].ModifiedDate;
                //xy.Add(y);
                ProcessFieldTable.Rows.Add(

                x.ProcessfieldId
                        , x.ProcessId
                        , x.StringValue
                        , x.IntValue
                        , x.DateTimeValue
                        , x.ModifierId
                        , x.ModifiedDate);
                //Process.ProcessFields[i].ProcessfieldId
                //, Process.ProcessFields[i].ProcessId
                //, Process.ProcessFields[i].StringValue
                //, Process.ProcessFields[i].IntValue
                //, Process.ProcessFields[i].DateTimeValue
                //, Process.ProcessFields[i].ModifierId
                //, Process.ProcessFields[i].ModifiedDate);
            }
            // DataTable z = xy.ToDataTable();
        //    ProcessFieldTable.Rows.Add(

        //            1
        //            , 1
        //            , ""
        //            , 0
        //            , DateTime.Today
        //            , UserId
        //            , DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //14
        //, 1
        //, ""
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //2
        //, 1
        //, "wbla bla new "
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //32
        //, 1
        //, ""
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //3
        //, 1
        //, "wbla bla new  2"
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //32
        //, 1
        //, "wbla bla new  2"
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //55
        //, 1
        //, "wbla bla new  2"
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);
        //    ProcessFieldTable.Rows.Add(

        //36
        //, 1
        //, "wbla bla new  2"
        //, 0
        //, DateTime.Today
        //, UserId
        //, DateTime.Today);

            string usp = "usp_ProcessUpdatePost @UserId, @ProcessId , @ProcessFieldTable ";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId = UserId, ProcessId = Process.ProcessId , ProcessFieldTable = ProcessFieldTable.AsTableValuedParameter("udt_ProcessFieldUpdate") });
            return true;
        }
    }
}
