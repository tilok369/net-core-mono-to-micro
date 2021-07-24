using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Common.Model
{
    public class TransactionPublishDTO
    {
        public int LoanAccountId { get; set; }
        public int Amount { get; set; }
        public DateTime Date { get; set; }
        public string Product { get; set; }
        public string Member { get; set; }
    }
}
