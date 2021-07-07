using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Model.LoanAccount
{
    public record LoanScheduleDTO: BaseEntityDTO
    {
        public int LoanAccountId { get; set; }
        public int InstallmentNo { get; set; }
        public DateTime ScheduledDate { get; set; }
        public double InstallmentAmount { get; set; }
        public double PaidAmount { get; set; }
        public double OutstandingAmount { get; set; }
    }
}
