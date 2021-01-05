
using Dapper;
using SIPx.Shared;
using SIPx.Shared.Models.FrontProcess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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

        public async Task<List<NewProcessTemplateList>> CreateGetTemplateList(string SQLString)
        {
            var x = await _sqlDataAccess.LoadData<NewProcessTemplateList>(SQLString);
            return x;
        }


        //THIS might be old
        public async Task<List<NewProcessTemplateList>> NewProcessShowTemplate(string UserId)
        {
            string usp = "usp_FrontNewProcessShowTemplate @UserID";
            var x = await _sqlDataAccess.LoadData<NewProcessTemplateList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<FrontProcessEditGet> FrontProcessEditGet(string UserId, int ProcessId)
        {
            string usp = "usp_FrontProcessEditGet @UserID, @ProcessId";
            string usp2 = "usp_FrontProcessEditGetFields @UserID, @ProcessId";
            var x = await _sqlDataAccess.LoadSingleRecord<FrontProcessEditGet, dynamic>(usp, new { UserId = UserId, ProcessId = ProcessId });
            var y = await _sqlDataAccess.LoadData<FrontProcessEditGetField, dynamic>(usp2, new { UserId = UserId, ProcessId = ProcessId });
            x.ProcessFields = y;
            return x;
        }

        public async Task<bool> FrontProcessEditPost(FrontProcessUpdateGet Process, string UserId)
        {
            { //OLDSTUFF
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
            }
            DataTable ProcessFieldTable = ProcessFieldDataTable.CreateTable();
            var xy = new List<ProcessFieldsToDataTable>();

           // for (int i = 0; i < Process.ProcessFields.Count; i++)
            foreach (var x in Process.Fields)
            {
                if (x.StringValue == null)
                { x.StringValue = ""; }
                if (x.IntValue== null)
                { x.IntValue = 0; }
                if (x.DateTimeValue == null)
                { x.DateTimeValue = DateTime.Today; }
                else
                { x.DateTimeValue = Convert.ToDateTime(DateTime.Now.ToString("dd MMMM yyyy hh:mm:ss tt")); }
            x.ModifiedDate = DateTime.Today; 
                if (x.ModifierId== null)
                { x.ModifierId = UserId; }

                {
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
                }
                ProcessFieldTable.Rows.Add(

                x.ProcessFieldId
                        , x.ProcessId
                        , x.StringValue
                        , x.IntValue
                        , x.DateTimeValue
                        , x.ModifierId
                        , x.ModifiedDate);
               
            }
            

            string usp = "usp_ProcessUpdatePost @UserId, @ProcessId ,@ProcessTemplateFlowId, @ProcessFieldTable ";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId = UserId, ProcessId = Process.ProcessId , ProcessTemplateFlowId = Process.ProcessTemplateFlowId, ProcessFieldTable = ProcessFieldTable.AsTableValuedParameter("udt_ProcessFieldUpdate") });
            return true;
        }
        public async Task<FrontProcessView> FrontProcessView(string UserId, int ProcessId)
        {
            string usp = "usp_FrontProcessView @UserId, @ProcessId";
            var x = await _sqlDataAccess.LoadSingleRecord<FrontProcessView, dynamic>(usp, new { UserId = UserId, ProcessId = ProcessId });
            return x;
        }
        public async Task<List<FrontProcessViewGetField>> FrontProcessViewGetField(string UserId, int ProcessId)
        {
            string usp = "usp_FrontProcessViewGetField @UserId, @ProcessId";
            var x = await _sqlDataAccess.LoadData<FrontProcessViewGetField, dynamic>(usp, new { UserId = UserId, ProcessId = ProcessId });
            return x;
        }
        public async Task<List<int>> FrontProcessToDoFlows()
        {
            string usp = "usp_FrontProcessToDoFlowList";
            var x = await _sqlDataAccess.LoadData<int>(usp);
            return x;
        }
        public async Task<List<FrontProcessToDoFlowCondition>> FrontProcessToDoConditions(int ProcessTemplateFlowId)
        {
            string usp = "usp_FrontProcessToDoFlowConditionList @ProcessTemplateFlowId";
            var x = await _sqlDataAccess.LoadData<FrontProcessToDoFlowCondition, dynamic>(usp, new { ProcessTemplateFlowId = ProcessTemplateFlowId});
            return x;
        }
        public async Task<List<FrontProcessToDoProcess>> FrontProcessToDoProcesses(int ProcessTemplateFlowId)
        {
            string usp = "usp_FrontProcessToDoProcessList @ProcessTemplateFlowId";
            var x = await _sqlDataAccess.LoadData<FrontProcessToDoProcess, dynamic>(usp, new { ProcessTemplateFlowId = ProcessTemplateFlowId });
            return x;
        }
        public async Task<List<FrontProcessToDoProcessField>> FrontProcessToDoProcessFields(int ProcessId)
        {
            string usp = "usp_FrontProcessToDoProcessFieldList @ProcessId";
            var x = await _sqlDataAccess.LoadData<FrontProcessToDoProcessField, dynamic>(usp, new { ProcessId = ProcessId });
            return x;
        }
        public async Task<List<int>> FrontProcessNewReturnFlows(int ProcessTemplateId)
        {
            string usp = "usp_FrontProcessNewReturnFlows @ProcessTemplateId";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, new { ProcessTemplateId = ProcessTemplateId });
            return x;
        }
        public async Task<List<int>> FrontProcessUpdateReturnFlows(int ProcessTemplateStageId)
        {
            string usp = "usp_FrontProcessUpdateReturnFlows @ProcessTemplateStageId";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, new { ProcessTemplateStageId = ProcessTemplateStageId });
            return x;
        }
        public async Task<List<FrontProcessNewReturnFlowPass>> FrontProcessNewReturnFlowPasses(int ProcessTemplateFlowId)
        {
            string usp = "usp_FrontProcessNewReturnFlowPasses @ProcessTemplateFlowId";
            var x = await _sqlDataAccess.LoadData<FrontProcessNewReturnFlowPass, dynamic>(usp, new { ProcessTemplateFlowId = ProcessTemplateFlowId });
            return x;
        }
        public async Task<List<int>> ReturnProcessTemplateFlowPass(string UserId, string SQLStatement)
        {
            string usp = "usp_NewProcessPass @SQLStatement";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, new { SQLStatement = SQLStatement });
            return x;
        }
        public async Task<bool> FrontProcessCreatePost(FrontProcessNewProcessWithMaster Process)
        {

            DataTable ProcessFieldValueTable = new DataTable();
            ProcessFieldValueTable.Columns.Add("ProcessTemplateId", typeof(Int32));
            ProcessFieldValueTable.Columns.Add("ProcessTemplateFieldId", typeof(Int32));
            ProcessFieldValueTable.Columns.Add("StringValue", typeof(string));
            ProcessFieldValueTable.Columns.Add("IntValue", typeof(Int32));
            ProcessFieldValueTable.Columns.Add("DateTimeValue", typeof(DateTime));
            //var xy = new List<DataTable>();

            foreach (var x in Process.ProcessFields)
            {
                if(x.ProcessTemplateFieldTypeId == 32)
                { 
                    x.StringValue = x.HTMLStringValue;
                }
                //if (x.ProcessTemplateFieldId != null && x.ClassificationValueId != 0)
                //{
                DateTime NewDate;
                int NewInt;
                if (1==1)//x.ProcessTemplateFieldId
                {
                    if (new[] { 4, 5, 6, 7, 8, 9 }.Contains(x.ProcessTemplateFieldTypeId))
                    {
                        if (x.DateTimeValue.ToString() == "1/1/0001 12:00:00 AM")
                        {
                            NewDate = DateTime.Now;
                        }
                        else
                        {
                            NewDate = x.DateTimeValue;
                        }
                    }
                    else
                    {
                        NewDate = DateTime.Now;
                    }
                    if (new[] { 3, 14, 15, 16, 17, 18,19,20,21,22,23,24,25,26,27,28,29,36,37 }.Contains(x.ProcessTemplateFieldTypeId))
                    {
                        NewInt = x.IntValue??0;
                    }
                    else
                    {
                        NewInt = 0;
                    }
                ProcessFieldValueTable.Rows.Add(

                    Process.ProcessTemplateId
                            , x.ProcessTemplateFieldId 
                            , x.StringValue
                            , NewInt
                            , NewDate //DateTime.Now //
                            );
                    //}
                }
            }
            string usp = "usp_ProcessCreatePost @UserId, @ProcessTemplateId , @ProcessTemplateFlowId , @ProcessFieldValueTable ";
               
            _sqlDataAccess.SaveData<dynamic>(usp, new { 
                UserId  = Process.UserId
                , ProcessTemplateId = Process.ProcessTemplateId
                , ProcessTemplateFlowId = Process.ProcessTemplateFlowId 
                , ProcessFieldValueTable = ProcessFieldValueTable.AsTableValuedParameter("udt_ProcessFieldsNew") });
            return true;


        }
        public async Task<List<ToDoIndexGet>> FrontProcessToDo(string SQLStatement)
        {
            string usp = "usp_FrontProcessToDo @SQLStatement";
            var x = await _sqlDataAccess.LoadData<ToDoIndexGet, dynamic>(usp, new { SQLStatement = SQLStatement });
            return x;
        }
        public async Task<FrontProcessUpdateGet> FrontProcessUpdateGet(string UserId, int ProcessId)
        {
            string usp = "usp_FrontProcessUpdateGet @UserId, @ProcessId";
            var x = await _sqlDataAccess.LoadSingleRecord<FrontProcessUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessId = ProcessId });
            return x;
        }
        public async Task<List<FrontProcessUpdateGetField>> FrontProcessUpdateGetFields(string UserId, int ProcessId)
        {
            string usp = "usp_FrontProcessUpdateGetFields  @UserId, @ProcessId";
            var x = await _sqlDataAccess.LoadData<FrontProcessUpdateGetField, dynamic>(usp, new { UserId = UserId, ProcessId = ProcessId });
            return x;
        }

    }
}
