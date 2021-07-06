using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Mono2Micro.App.Model.Transactions;
using Mono2Micro.Monolithic.App.Web.Factories.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Controllers
{
    [Route("api/v{version:apiVersion}/transaction")]
    [ApiController]
    public class TransactionController : ControllerBase
    {
        private readonly ITransactionFactory _transactionFactory;

        public TransactionController(ITransactionFactory transactionFactory)
        {
            this._transactionFactory = transactionFactory;
        }

        [HttpGet("all")]
        public ActionResult<IList<TransactionDTO>> Get()
        {
            var transactions = _transactionFactory.Get();
            return Ok(transactions);
        }

        [HttpGet("single")]
        public ActionResult<TransactionDTO> Get(int id)
        {
            var transaction = _transactionFactory.Get(id);
            return Ok(transaction);
        }

        [HttpGet("post")]
        public ActionResult<TransactionResponseDTO> Post(TransactionRequestDTO request)
        {
            var response = _transactionFactory.Save(request);
            return Ok(response);
        }
    }
}
