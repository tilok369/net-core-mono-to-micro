using Mono2Micro.App.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Service.Transactions
{
    public interface ITransactionService
    {
        IList<Transaction> Get();
        Transaction Get(int id);
        Transaction Save(Transaction transaction);
    }
}
