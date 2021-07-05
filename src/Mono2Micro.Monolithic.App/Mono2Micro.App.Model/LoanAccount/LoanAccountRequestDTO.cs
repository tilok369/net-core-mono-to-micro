using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Model.LoanAccount
{
    public record LoanAccountRequestDTO: BaseEntityDTO
    {
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
    }
}
