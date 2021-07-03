using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.App.DAL.Entities
{
    public partial class Product
    {
        public Product()
        {
            LoanAccounts = new HashSet<LoanAccount>();
            ProductDurations = new HashSet<ProductDuration>();
            ProductInstallmentFrequencies = new HashSet<ProductInstallmentFrequency>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public int SortOrder { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual ICollection<LoanAccount> LoanAccounts { get; set; }
        public virtual ICollection<ProductDuration> ProductDurations { get; set; }
        public virtual ICollection<ProductInstallmentFrequency> ProductInstallmentFrequencies { get; set; }
    }
}
