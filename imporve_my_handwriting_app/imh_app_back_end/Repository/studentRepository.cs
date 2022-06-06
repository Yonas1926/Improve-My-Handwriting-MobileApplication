using System.Collections.Generic;
using System.Threading.Tasks;
using BackEnd.Data;
using BackEnd.Models;
using Microsoft.EntityFrameworkCore;

namespace WeSafe.Data
{
    public class StudentRepository : IRepository<Student>
    {
        private readonly DataContext _context;
        public StudentRepository(DataContext context)
        {
            _context = context;
        }

        public Task<bool> DeleteData(Student service)
        {
            throw new NotImplementedException();
        }

        public Task<List<Student>> GetData()
        {
            throw new NotImplementedException();
        }

        public Task<Student> GetDataById(int id)
        {
            throw new NotImplementedException();
        }

        public Task<Student> InsertData(Student service)
        {
            throw new NotImplementedException();
        }

        public Task<Student> UpdateData(Student service)
        {
            throw new NotImplementedException();
        }
    }
}
