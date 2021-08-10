
export class LoanAccount {
    Id!: number;
    IdentityId!: number;
    Client!: string;
    ProductId!: number;
    Product!: string;
    Duration!: number;
    InstallmentFrequencyId!: number;
    Frequency!: string;
    DisbursedDate!: Date;
    Amount!: number;
    Status!: boolean;
    CreatedOn!: Date;
    CreatedBy!: string;
    UpdatedOn!: Date;
    UpdatedBy!: string;
  
  }