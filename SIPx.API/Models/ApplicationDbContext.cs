using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.Models
{
    public class ApplicationDbContext : IdentityDbContext<SipUser>
    {
        public ApplicationDbContext(DbContextOptions options) :base(options)
        {

        }

    }

}
