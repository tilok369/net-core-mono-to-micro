using Mono2Micro.MicroService.App.Transactions.Model.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Web.Factories.Transactions
{
    public interface ITransactionFactory
    {
        IList<TransactionDTO> Get();
        TransactionDTO Get(int id);
        TransactionResponseDTO Save(TransactionRequestDTO transaction);
    }
}
