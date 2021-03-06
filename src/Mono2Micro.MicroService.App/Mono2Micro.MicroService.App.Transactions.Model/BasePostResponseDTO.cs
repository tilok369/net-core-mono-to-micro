using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Model
{
    public abstract record BasePostResponseDTO
    {
        public int Id { get; init; }
        public bool Success { get; init; }
        public string Message { get; init; }
    }
}
