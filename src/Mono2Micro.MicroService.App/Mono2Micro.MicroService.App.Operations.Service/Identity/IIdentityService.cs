using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Operations.Service.Identity
{
    public interface IIdentityService
    {
        int Save(DAL.Entities.Identity identity);
        DAL.Entities.Identity Get(int id);
        IEnumerable<DAL.Entities.Identity> Get();
    }
}
