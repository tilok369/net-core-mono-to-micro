using Mono2Micro.App.DAL.Entities;
using Mono2Micro.App.DAL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Service.LoanAccount
{
    public class LoanAccountService : ILoanAccountService
    {
        private readonly IGenericRepository _genericRepository;

        public LoanAccountService(IGenericRepository genericRepository)
        {
            this._genericRepository = genericRepository;
        }

        public bool Delete(IList<LoanSchedule> loanSchedules)
        {
            return _genericRepository.DeleteAll<LoanSchedule>(loanSchedules.ToList());
        }

        public DAL.Entities.LoanAccount Get(int id)
        {
            return _genericRepository.Get<DAL.Entities.LoanAccount>(id);
        }

        public IList<DAL.Entities.LoanAccount> Get()
        {
            return _genericRepository.GetAll<DAL.Entities.LoanAccount>();
        }

        public IList<LoanSchedule> GetSchedules(int LoanAccountId)
        {
            return _genericRepository.Find<LoanSchedule>(s => s.LoanAccountId == LoanAccountId);
        }

        public DAL.Entities.LoanAccount Save(DAL.Entities.LoanAccount loanAccount)
        {
            if (loanAccount.Id == 0)
                return _genericRepository.Add<DAL.Entities.LoanAccount>(loanAccount);
            return _genericRepository.Edit<DAL.Entities.LoanAccount>(loanAccount);
        }

        public bool Save(IList<LoanSchedule> loanSchedules)
        {
            foreach (var schedule in loanSchedules)
            {
                var item = _genericRepository.Add<DAL.Entities.LoanSchedule>(schedule);
                if (item.Id == 0) return false;
            }

            return true;
        }
    }
}
