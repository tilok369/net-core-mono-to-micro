using Mono2Micro.App.Model.LoanAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Factories.LoanAccount
{
    public interface ILoanAccountFactory
    {
        IList<LoanAccountRequestDTO> Get();
        LoanAccountRequestDTO Get(int id);

        LoanAccountResponseDTO Save(LoanAccountRequestDTO loanAccount);
        IList<LoanScheduleDTO> CreateSchedule(int duration, int frequesncy, int amount, DateTime disbursedDate);
    }
}
