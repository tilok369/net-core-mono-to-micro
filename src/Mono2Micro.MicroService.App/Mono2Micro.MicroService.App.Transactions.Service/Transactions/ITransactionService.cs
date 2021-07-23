using Mono2Micro.MicroService.App.Transactions.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Service.Transactions
{
    public interface ITransactionService
    {
        IList<Transaction> Get();
        Transaction Get(int id);
        Transaction Save(Transaction transaction);
    }
}
