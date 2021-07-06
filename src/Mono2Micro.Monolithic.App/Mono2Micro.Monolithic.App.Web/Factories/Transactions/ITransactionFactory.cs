using Mono2Micro.App.Model.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Factories.Transactions
{
    public interface ITransactionFactory
    {
        IList<TransactionDTO> Get();
        TransactionDTO Get(int id);
        TransactionResponseDTO Save(TransactionRequestDTO transaction);
    }
}
