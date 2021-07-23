using Mono2Micro.MicroService.App.Operations.Model.LoanAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Operations.Web.Factories.LoanAccount
{
    public interface ILoanAccountFactory
    {
        IList<LoanAccountRequestDTO> Get();
        LoanAccountRequestDTO Get(int id);

        LoanAccountResponseDTO Save(LoanAccountRequestDTO loanAccount);
        IList<LoanScheduleDTO> CreateSchedule(int duration, int frequesncy, int amount, DateTime disbursedDate);
    }
}
