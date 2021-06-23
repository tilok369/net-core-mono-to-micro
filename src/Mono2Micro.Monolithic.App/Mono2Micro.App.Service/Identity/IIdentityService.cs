﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Service.Identity
{
    public interface IIdentityService
    {
        int Save(DAL.Entities.Identity identity);
        DAL.Entities.Identity Get(int id);
    }
}
