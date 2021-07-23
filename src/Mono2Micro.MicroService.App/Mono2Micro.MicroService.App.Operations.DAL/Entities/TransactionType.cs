using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.MicroService.App.Operations.DAL.Entities
{
    public partial class TransactionType
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public int SortOrder { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
    }
}
