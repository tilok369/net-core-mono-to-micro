using Microsoft.EntityFrameworkCore;
using Mono2Micro.MicroService.App.Transactions.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.DAL.Repositories
{
    public class GenericRepository: IGenericRepository
    {
        private readonly DbContextOptionsBuilder<MicroTransactionsDBContext> _dbContextOptionBuilder;


        public GenericRepository(string connectionString)
        {
            _dbContextOptionBuilder = new DbContextOptionsBuilder<MicroTransactionsDBContext>();
            _dbContextOptionBuilder.UseSqlServer(connectionString);
        }

        public T Add<T>(T entity) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                dbSet.Add(entity);
                context.SaveChanges();
                return entity;
            }
        }

        public T Delete<T>(T entity) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                dbSet.Remove(entity);
                context.SaveChanges();
                return entity;
            }
        }

        public T Edit<T>(T entity) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                context.Entry(entity).State = EntityState.Modified;
                context.SaveChanges();
                return entity;
            }
        }

        public T Delete<T>(int id) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                var entity = dbSet.Find(id);
                dbSet.Remove(entity);
                context.SaveChanges();
                return entity;
            }
        }

        public bool AddAll<T>(List<T> entityList) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                try
                {
                    DbSet<T> dbSet = context.Set<T>();
                    foreach (var entity in entityList)
                    {
                        dbSet.Add(entity);
                    }
                    context.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public bool EditAll<T>(List<T> entityList) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                try
                {
                    foreach (var entity in entityList)
                    {
                        context.Entry(entity).State = EntityState.Modified;
                    }
                    context.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public bool DeleteAll<T>(List<T> entityList) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                try
                {
                    DbSet<T> dbSet = context.Set<T>();
                    foreach (var entity in entityList)
                    {
                        dbSet.Attach(entity);
                        dbSet.Remove(entity);
                    }
                    context.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public T Get<T>(int id) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                var entity = dbSet.Find(id);
                return entity;
            }
        }

        public List<T> GetAll<T>() where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                var entityList = dbSet.AsNoTracking().ToList();
                return entityList;
            }
        }

        public List<T> Find<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                var entityList = dbSet.Where(predicate).ToList();
                return entityList;
            }
        }

        public T First<T>(Expression<Func<T, bool>> predicate) where T : class
        {
            using (var context = new MicroTransactionsDBContext(_dbContextOptionBuilder.Options))
            {
                DbSet<T> dbSet = context.Set<T>();
                var entity = dbSet.FirstOrDefault(predicate);
                return entity;
            }
        }
    }
}
