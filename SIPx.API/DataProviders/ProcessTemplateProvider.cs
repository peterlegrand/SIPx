
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ProcessTemplateProvider : IProcessTemplateProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateFieldLanguageIndexGet>> ProcessTemplateFieldLanguageIndexGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldLanguageIndexGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<ProcessTemplateFieldLanguageIndexGet> ProcessTemplateFieldLanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId)
        {
            string usp = "usp_ProcessTemplateFieldLanguageUpdateGet @UserId, @ProcessTemplateFieldLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldLanguageId = ProcessTemplateFieldLanguageId });

        }
        public Task<List<ProcessTemplateFieldIndexGet>> ProcessTemplateFieldIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFieldIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateFieldUpdateGet> ProcessTemplateFieldUpdateGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldUpdateGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<List<ProcessTemplateFlowConditionLanguageIndexGet>> ProcessTemplateFlowConditionLanguageIndexGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguageIndexGet @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<ProcessTemplateFlowConditionLanguageIndexGet> ProcessTemplateFlowConditionLanguageUpdateGet(string UserId, int ProcessTemplateFlowConditionLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguageUpdateGet @UserId, @ProcessTemplateFlowConditionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionLanguageId = ProcessTemplateFlowConditionLanguageId });

        }
        public Task<List<ProcessTemplateFlowConditionIndexGet>> ProcessTemplateFlowConditionIndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowConditionUpdateGet> ProcessTemplateFlowConditionUpdateGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditioUpdateGetn @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<List<ProcessTemplateFlowLanguageIndexGet>> ProcessTemplateFlowLanguageIndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowLanguageIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowLanguageIndexGet> ProcessTemplateFlowLanguageUpdateGet(string UserId, int ProcessTemplateFlowLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowLanguageUpdateGet @UserId, @ProcessTemplateFlowLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowLanguageId = ProcessTemplateFlowLanguageId });

        }
        public Task<List<ProcessTemplateFlowIndexGet>> ProcessTemplateFlowIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFlowIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateFlowUpdateGet> ProcessTemplateFlowUpdateGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<List<ProcessTemplateGroupLanguageIndexGet>> ProcessTemplateGroupLanguageIndexGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupLanguageIndexGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public Task<ProcessTemplateGroupLanguageIndexGet> ProcessTemplateGroupLanguageUpdateGet(string UserId, int ProcessTemplateGroupLanguageId)
        {
            string usp = "usp_ProcessTemplateGroupLanguageUpdateGet @UserId, @ProcessTemplateGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupLanguageId = ProcessTemplateGroupLanguageId });

        }
        public Task<List<ProcessTemplateLanguageIndexGet>> ProcessTemplateLanguageIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateLanguageIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateLanguageIndexGet> ProcessTemplateLanguageUpdateGet(string UserId, int ProcessTemplateLanguageId)
        {
            string usp = "usp_ProcessTemplateLanguageUpdateGet @UserId, @ProcessTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateLanguageId = ProcessTemplateLanguageId });

        }
        public Task<List<ProcessTemplateStageFieldIndexGet>> ProcessTemplateStageFieldIndexGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageFieldIndexGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageFieldUpdateGet> ProcessTemplateStageFieldUpdateGet(string UserId, int ProcessTemplateStageFieldId)
        {
            string usp = "usp_ProcessTemplateStageFieldUpdateGet @UserId, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldId = ProcessTemplateStageFieldId });

        }
        public Task<List<ProcessTemplateStageFieldIndexGet>> ProcessTemplateFieldStageIndexGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldStageIndexGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<ProcessTemplateStageFieldUpdateGet> ProcessTemplateFieldStageUpdateGet(string UserId, int ProcessTemplateStageFieldID)
        {
            string usp = "usp_ProcessTemplateStageFieldUpdateGet @UserId, @ProcessTemplateStageFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldID = ProcessTemplateStageFieldID });

        }
        public Task<List<ProcessTemplateStageFieldStatus>> ProcessTemplateStageFieldStatusIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageFieldStatusIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId });

        }
        //public Task<ProcessTemplateStageFieldStatus> ProcessTemplateStageFieldStatuIndexGet(string UserId, int ProcessTemplateStageFieldStatusId)
        //{
        //    string usp = "usp_ProcessTemplateStageFieldStatus @UserId, @ProcessTemplateStageFieldStatusID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatus, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldStatusId = ProcessTemplateStageFieldStatusId });

        //}
        public Task<List<ProcessTemplateStageLanguageIndexGet>> ProcessTemplateStageLanguageIndexGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageLanguageIndexGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageLanguageIndexGet> ProcessTemplateStageLanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId)
        {
            string usp = "usp_ProcessTemplateStageLanguageUpdateGet @UserId, @ProcessTemplateStageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageLanguageId = ProcessTemplateStageLanguageId });

        }
        public Task<List<ProcessTemplateStageIndexGet>> ProcessTemplateStageIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateStageIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateStageUpdateGet> ProcessTemplateStageUpdateGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageUpdateGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<List<ProcessTemplateFieldType>> ProcessTemplateFieldTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateFieldTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFieldType> ProcessTemplateFieldTypeUpdateGet(string UserId, int ProcessTemplateFieldTypeId)
        {
            string usp = "usp_ProcessTemplateFieldTypeUpdateGet @UserId, @ProcessTemplateFieldTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldTypeId = ProcessTemplateFieldTypeId });

        }
        public Task<List<ProcessTemplateFlowConditionComparisonOperator>> ProcessTemplateFlowConditionComparisonOperatorIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFlowConditionComparisonOperator> ProcessTemplateFlowConditionComparisonOperatorUpdateGet(string UserId, int ProcessTemplateFlowConditionComparisonOperatorId)
        {
            string usp = "usp_ProcessTemplateFlowConditionComparisonOperatorUpdateGet @UserId, @ProcessTemplateFlowConditionComparisonOperatorID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionComparisonOperator, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionComparisonOperatorId = ProcessTemplateFlowConditionComparisonOperatorId });

        }
        public Task<List<ProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateFlowConditionType> ProcessTemplateFlowConditionTypeUpdateGet(string UserId, int ProcessTemplateFlowConditionTypeId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypeUpdateGet @UserId, @ProcessTemplateFlowConditionTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionTypeId = ProcessTemplateFlowConditionTypeId });

        }
        public Task<List<ProcessTemplateGroupIndexGet>> ProcessTemplateGroupIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateGroupUpdateGet> ProcessTemplateGroupUpdateGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupUpdateGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public Task<List<ProcessTemplateIndexGet>> ProcessTemplateIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateUpdateGet> ProcessTemplateUpdateGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateUpdateGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<List<ProcessTemplateStageType>> ProcessTemplateStageTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateStageType> ProcessTemplateStageTypeUpdateGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdateGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<List<ProcessTemplateStageTypeLanguage>> ProcessTemplateStageTypeLanguageIndexGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageIndexGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<ProcessTemplateStageTypeLanguage> ProcessTemplateStageTypeLanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeLanguageId = ProcessTemplateStageTypeLanguageId });

        }
        public Task<ProcessTemplateStageFieldStatusUpdateGet> ProcessTemplateStageFieldStatusUpdateGet(string UserId, int ProcessTemplateStageFieldDStatusId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageFieldDStatusId";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageFieldStatusUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldDStatusId = ProcessTemplateStageFieldDStatusId });
        }
        public Task<List<ProcessTemplateFieldList>> ProcessTemplateStageFieldUpdateGetSequence(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldUpdateGetSequence @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }
        public Task<List<ProcessTemplateFieldTypeList>> ProcessTemplateFieldTypeList(string UserId)
        {
            string usp = "usp_ProcessTemplateFieldTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ProcessTemplateStageTypeList>> ProcessTemplateStageTypeList(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ProcessTemplateStageList>> ProcessTemplateStageList(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateStageList @UserId, @ProcessTemplateId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ProcessTemplateFlowConditionTypeList>> ProcessTemplateFlowConditionTypeList(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowConditionTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ComparisonOperatorList>> ComparisonOperatorList(string UserId)
        {
            string usp = "usp_ComparisonOperatorList @UserId";
            return _sqlDataAccess.LoadData<ComparisonOperatorList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ProcessTemplateFieldList>> ProcessTemplateFieldList(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFieldList @UserId, @ProcessTemplateId ";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<List<ProcessTemplateStageList>> ProcessTemplateFlowUpdateGetStageList(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGetStageList @UserId, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageList, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<List<ProcessTemplateFieldList>> ProcessTemplateStageFieldUpdateGetFieldList(string UserId, int ProcessTemplateStageFieldId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGetStageList @UserId, @ProcessTemplateStageFieldId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldId = ProcessTemplateStageFieldId });

        }

        public Task<List<ProcessTemplateStageFieldStatusList>> ProcessTemplateStageFieldUpdateGetStatusList(string UserId)
        {
            string usp = "usp_ProcessTemplateStageFieldStatusList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatusList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ValueUpdateTypeList>> ProcessTemplateStageFieldUpdateGetValueUpdateTypeList(string UserId)
        {
            string usp = "usp_ValueUpdateTypeList @UserId";
            return _sqlDataAccess.LoadData<ValueUpdateTypeList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<ProcessTemplateGroupList>> ProcessTemplateGroupList(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupList, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<string> ProcessTemplateFlowPostCheck(ProcessTemplateFlowCreatePost ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowCreatePostCheck @ProcessTemplateId, @ProcessTemplateFromStageId, @ProcessTemplateToStageId, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlow);
            return CheckString;
        }
        public async Task<string> ProcessTemplateFlowPost(ProcessTemplateFlowCreatePost ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowCreatePost @ProcessTemplateId, @ProcessTemplateFromStageId, @ProcessTemplateToStageId, @OnTheFly, @Alhpabetically, @CanLink, @InDropDow, @InMenu, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlow);
            return String;
        }
        public async Task<string> ProcessTemplateGroupCreatePostCheck(ProcessTemplateGroupCreatePost ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupCreatePostCheck @Sequence, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateGroup);
            return CheckString;
        }
        public async Task<string> ProcessTemplateGroupCreatePost(ProcessTemplateGroupCreatePost ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupCreatePost @Sequence, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateGroup);
            return String;
        }
        public async Task<string> ProcessTemplateCreatePostCheck(ProcessTemplateCreatePost ProcessTemplate)
        {
            string usp = "usp_ProcessTemplateCreatePostCheck @ProcessTemplateGroupId, @Sequence, @LanguageId, @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplate);
            return CheckString;
        }
        public async Task<string> ProcessTemplateCreatePost(ProcessTemplateCreatePost ProcessTemplate)
        {
            string usp = "usp_ProcessTemplateCreatePost @ProcessTemplateGroupId, @ShowInPersonalCalendar, @ShowInEventCalendar, @Sequence, @IsPersonal, @ShowInNew, @ShowInSearch, @ShowInReports, @HideEverywhere, @ProcessMultiMax, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplate);
            return String;
        }

        public async Task<string> ProcessTemplateStageCreatePostCheck(ProcessTemplateStageCreatePost ProcessTemplateStage)
        {
            string usp = "usp_ProcessTemplateStageCreatePostCheck @ProcessTemplateId, @ProcessTemplateTypeId, @LanguageId, @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStage);
            return CheckString;
        }
        public async Task<string> ProcessTemplateStageCreatePost(ProcessTemplateStageCreatePost ProcessTemplateStage)
        {
            string usp = "usp_ProcessTemplateStageCreatePost @ProcessTemplateId, @ProcessTemplateTypeId, @IsEndStage, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStage);
            return String;
        }
        public async Task<string> ProcessTemplateFieldCreatePostCheck(ProcessTemplateFieldCreatePost ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldCreatePostCheck @ProcessTemplateId, @ProcessTemplateFieldTypeId, @LanguageId, @Name, @CreaterId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateField);
            return CheckString;
        }
        public async Task<string> ProcessTemplateFieldCreatePost(ProcessTemplateFieldCreatePost ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldCreatePost @ProcessTemplateId, @ProcessTemplateFieldTypeId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreaterId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateField);
            return String;
        }
        public async Task<string> ProcessTemplateFlowConditionCreatePostCheck(ProcessTemplateFlowConditionCreatePost ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreatePostCheck @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowConditionTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @LanguageId, @Name, @CreaterId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlowCondition);
            return CheckString;
        }
        public async Task<string> ProcessTemplateFlowConditionCreatePost(ProcessTemplateFlowConditionCreatePost ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreatePost @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowConditionTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @ProcessTemplateFlowConditionString, @ProcessTemplateFlowConditionInt, @ProcessTemplateFlowConditionDate, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreaterId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlowCondition);
            return String;
        }
        public Task<List<SequenceList>> ProcessTemplateCreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTemplateCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }
        public Task<List<SequenceList>> ProcessTemplateGroupCreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }
        public Task<List<SequenceList>> ProcessTemplateFlowConditionCreateGetSequence(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreateGetSequence @UserID, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
        }

    }
}
