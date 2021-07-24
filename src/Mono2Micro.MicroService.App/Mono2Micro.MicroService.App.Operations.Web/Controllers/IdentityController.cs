using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mono2Micro.MicroService.App.Operations.Web.Factories.Identity;
using Mono2Micro.MicroService.App.Operations.Model.Identity;

namespace Mono2Micro.MicroService.App.Operations.Web.Controllers
{
    [Route("api/v{version:apiVersion}/identity")]
    [ApiController]
    //[Authorize]
    public class IdentityController : ControllerBase
    {
        private readonly IIdentityFactory _identityFactory;
        public IdentityController(IIdentityFactory identityFactory)
        {
            _identityFactory = identityFactory;
        }

        [HttpGet("single")]
        public ActionResult<IdentityDTO> Get(int id)
        {
            var identity = _identityFactory.Get(id);

            return Ok(identity);
        }

        [HttpGet("all")]
        public ActionResult<IList<IdentityDTO>> Get()
        {
            var identity = _identityFactory.Get();

            return Ok(identity);
        }

        [HttpPost("post")]
        public ActionResult<IdentityResponseDTO> Post(IdentityRequestDTO identity)
        {
            var result = _identityFactory.Save(identity);

            return Ok(result);
        }
    }
}
