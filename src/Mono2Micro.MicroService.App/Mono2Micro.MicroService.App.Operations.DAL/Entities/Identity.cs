using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.MicroService.App.Operations.DAL.Entities
{
    public partial class Identity
    {
        public Identity()
        {
            LoanAccounts = new HashSet<LoanAccount>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string IdentityNumber { get; set; }
        public int TypeId { get; set; }
        public bool Status { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual IdentityType Type { get; set; }
        public virtual ICollection<LoanAccount> LoanAccounts { get; set; }
    }
}
