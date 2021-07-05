﻿using Mono2Micro.App.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Service.LoanAccount
{
    public interface ILoanAccountService
    {
        IList<DAL.Entities.LoanAccount> Get();
        DAL.Entities.LoanAccount Get(int id);

        DAL.Entities.LoanAccount Save(DAL.Entities.LoanAccount loanAccount);
        bool Save(IList<LoanSchedule> loanSchedules);
        bool Delete(IList<LoanSchedule> loanSchedules);

        IList<LoanSchedule> GetSchedules(int LoanAccountId);
    }
}
