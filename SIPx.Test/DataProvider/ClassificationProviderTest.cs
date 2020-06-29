using Moq;
using SIPx.API.ViewModels;
using SIPx.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace SIPx.Test.DataProvider
{
    public class ClassificationProviderTest
    {
        [Fact]
        public async void GetClassifications()
        {
            //Arrange
            var DataAccessz = new Mock<ISqlDataAccess>();
            var a =  Task.FromResult<List<Classification>>(new List<Classification> { new Classification { ClassificationID = 1 } });
            var x = await a;
            DataAccessz.Setup(m => m.LoadData<Classification, dynamic>("usp_Classifications @UserID", new { UserID = "a" }))
            .Returns(a);
            // act
            var c = new ClassificationProvider(DataAccessz.Object);
            var b = await c.GetClassifications("d");
            //Assert
            Assert.True(b == x);
        }
    }
}
