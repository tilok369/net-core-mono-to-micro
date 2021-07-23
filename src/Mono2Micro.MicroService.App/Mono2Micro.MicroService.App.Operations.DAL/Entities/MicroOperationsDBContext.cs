using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Mono2Micro.MicroService.App.Operations.DAL.Entities
{
    public partial class MicroOperationsDBContext : DbContext
    {
        public MicroOperationsDBContext()
        {
        }

        public MicroOperationsDBContext(DbContextOptions<MicroOperationsDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Duration> Durations { get; set; }
        public virtual DbSet<Identity> Identities { get; set; }
        public virtual DbSet<IdentityType> IdentityTypes { get; set; }
        public virtual DbSet<InstallmentFrequency> InstallmentFrequencies { get; set; }
        public virtual DbSet<LoanAccount> LoanAccounts { get; set; }
        public virtual DbSet<LoanSchedule> LoanSchedules { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductDuration> ProductDurations { get; set; }
        public virtual DbSet<ProductInstallmentFrequency> ProductInstallmentFrequencies { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<TransactionType> TransactionTypes { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=MicroOptDBConn");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Duration>(entity =>
            {
                entity.ToTable("Duration", "config");

                entity.HasIndex(e => e.Duration1, "UQ__Duration__AE1EFC919F57BBF0")
                    .IsUnique();

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Duration1).HasColumnName("Duration");

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<Identity>(entity =>
            {
                entity.ToTable("Identity", "operation");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.IdentityNumber)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Identities)
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Identity__TypeId__52593CB8");
            });

            modelBuilder.Entity<IdentityType>(entity =>
            {
                entity.ToTable("IdentityType", "operation");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<InstallmentFrequency>(entity =>
            {
                entity.ToTable("InstallmentFrequency", "config");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<LoanAccount>(entity =>
            {
                entity.ToTable("LoanAccount", "operation");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.DisbursedDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.DurationNavigation)
                    .WithMany(p => p.LoanAccounts)
                    .HasPrincipalKey(p => p.Duration1)
                    .HasForeignKey(d => d.Duration)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__LoanAccou__Durat__534D60F1");

                entity.HasOne(d => d.Identity)
                    .WithMany(p => p.LoanAccounts)
                    .HasForeignKey(d => d.IdentityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__LoanAccou__Ident__5441852A");

                entity.HasOne(d => d.InstallmentFrequency)
                    .WithMany(p => p.LoanAccounts)
                    .HasForeignKey(d => d.InstallmentFrequencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__LoanAccou__Insta__5535A963");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.LoanAccounts)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__LoanAccou__Produ__5629CD9C");
            });

            modelBuilder.Entity<LoanSchedule>(entity =>
            {
                entity.ToTable("LoanSchedule", "operation");

                entity.Property(e => e.ScheduledDate).HasColumnType("datetime");

                entity.HasOne(d => d.LoanAccount)
                    .WithMany(p => p.LoanSchedules)
                    .HasForeignKey(d => d.LoanAccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__LoanSched__LoanA__571DF1D5");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("Product", "config");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<ProductDuration>(entity =>
            {
                entity.ToTable("ProductDuration", "config");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.DurationNavigation)
                    .WithMany(p => p.ProductDurations)
                    .HasPrincipalKey(p => p.Duration1)
                    .HasForeignKey(d => d.Duration)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProductDu__Durat__4D94879B");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductDurations)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProductDu__Produ__4E88ABD4");
            });

            modelBuilder.Entity<ProductInstallmentFrequency>(entity =>
            {
                entity.ToTable("ProductInstallmentFrequency", "config");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.InstallmentFrequency)
                    .WithMany(p => p.ProductInstallmentFrequencies)
                    .HasForeignKey(d => d.InstallmentFrequencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProductIn__Insta__4F7CD00D");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductInstallmentFrequencies)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProductIn__Produ__5070F446");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<TransactionType>(entity =>
            {
                entity.ToTable("TransactionType", "config");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.CreatedBy)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(15);

                entity.Property(e => e.UpdatedBy).HasMaxLength(50);

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__User__RoleId__5165187F");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
