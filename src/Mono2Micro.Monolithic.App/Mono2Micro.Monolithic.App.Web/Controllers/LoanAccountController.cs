using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Mono2Micro.App.Model.LoanAccount;
using Mono2Micro.Monolithic.App.Web.Factories.LoanAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Controllers
{
    [Route("api/v{version:apiVersion}/account")]
    [ApiController]
    public class LoanAccountController : ControllerBase
    {
        private readonly ILoanAccountFactory _loanAccountFactory;

        public LoanAccountController(ILoanAccountFactory loanAccountFactory)
        {
            this._loanAccountFactory = loanAccountFactory;
        }

        [HttpGet("all")]
        public ActionResult<IList<LoanAccountRequestDTO>> Get()
        {
            var accounts = _loanAccountFactory.Get();
            return Ok(accounts);
        }

        [HttpGet("single")]
        public ActionResult<LoanAccountRequestDTO> Get(int id)
        {
            var account = _loanAccountFactory.Get(id);
            return Ok(account);
        }

        [HttpPost("post")]
        public ActionResult<LoanAccountResponseDTO> Post(LoanAccountRequestDTO request)
        {
            var response = _loanAccountFactory.Save(request);
            return Ok(response);
        }

        [HttpGet("schedule/{duration}/{frequesncy}/{amount}/{disbursedDate}")]
        public ActionResult<IList<LoanScheduleDTO>> GetSchedule(int duration, int frequesncy, int amount, DateTime disbursedDate)
        {
            var response = _loanAccountFactory.CreateSchedule(duration, frequesncy, amount, disbursedDate);
            return Ok(response);
        }
    }
}
