using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Model.Transactions
{
    public record TransactionRequestDTO : BaseEntityDTO
    {
        public int LoanAccountId { get; set; }
        public int Amount { get; set; }
        public DateTime Date { get; set; }
        public int Type { get; set; }
        public string Product { get; set; }
        public string Member { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
    }
}
