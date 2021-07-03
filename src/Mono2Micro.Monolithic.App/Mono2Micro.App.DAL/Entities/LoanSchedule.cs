using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.App.DAL.Entities
{
    public partial class LoanSchedule
    {
        public int Id { get; set; }
        public int LoanAccountId { get; set; }
        public int InstallmentNo { get; set; }
        public DateTime ScheduledDate { get; set; }
        public double InstallmentAmount { get; set; }
        public double PaidAmount { get; set; }
        public double OutstandingAmount { get; set; }

        public virtual LoanAccount LoanAccount { get; set; }
    }
}
