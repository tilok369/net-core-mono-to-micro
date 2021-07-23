using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.MicroService.App.Operations.DAL.Entities
{
    public partial class LoanAccount
    {
        public LoanAccount()
        {
            LoanSchedules = new HashSet<LoanSchedule>();
        }

        public int Id { get; set; }
        public int IdentityId { get; set; }
        public int ProductId { get; set; }
        public int Duration { get; set; }
        public int InstallmentFrequencyId { get; set; }
        public DateTime DisbursedDate { get; set; }
        public int Amount { get; set; }
        public bool Status { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual Duration DurationNavigation { get; set; }
        public virtual Identity Identity { get; set; }
        public virtual InstallmentFrequency InstallmentFrequency { get; set; }
        public virtual Product Product { get; set; }
        public virtual ICollection<LoanSchedule> LoanSchedules { get; set; }
    }
}
