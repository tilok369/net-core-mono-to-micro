using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.App.DAL.Entities
{
    public partial class Duration
    {
        public Duration()
        {
            ProductDurations = new HashSet<ProductDuration>();
        }

        public int Id { get; set; }
        public int Duration1 { get; set; }
        public bool Status { get; set; }
        public int SortOrder { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual ICollection<ProductDuration> ProductDurations { get; set; }
    }
}
