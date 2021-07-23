using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.MicroService.App.Transactions.DAL.Entities
{
    public partial class Transaction
    {
        public int Id { get; set; }
        public int LoanAccountId { get; set; }
        public int Amount { get; set; }
        public DateTime Date { get; set; }
        public int Type { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual TransactionType TypeNavigation { get; set; }
    }
}
