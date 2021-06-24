using Mono2Micro.App.Model.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Factories.Identity
{
    public interface IIdentityFactory
    {
        IdentityResponseDTO Save(IdentityRequestDTO request);
        IdentityDTO Get(int id);
        IList<IdentityDTO> Get();
    }
}
