using System.Collections.Generic;
using System.Threading.Tasks;
using BackEnd.Data;
using BackEnd.Models;
using Microsoft.EntityFrameworkCore;

namespace WeSafe.Data
{
    public class InstructorRepository : IRepository<Instructor>
    {
        private readonly DataContext _context;

        public async Task<bool> DeleteData(Instructor instructor)
        {
            _context.Instructors.Remove(instructor);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<List<Instructor>> GetData()
        {
           var data = await _context.Instructors.ToListAsync();
            return data;
        }

        public async Task<Instructor> GetDataById(int id)
        {
            return await _context.Instructors.FirstOrDefaultAsync(x => x.Id == id);
   
        }

        public async Task<Instructor> InsertData(Instructor instructor)
        {
             _context.Instructors.Add(instructor);
            await _context.SaveChangesAsync();
            return instructor;
        }

        public async Task<Instructor> UpdateData(Instructor instructor)
        {
           _context.Update(instructor).Property(x => x.Id).IsModified = false;
            await _context.SaveChangesAsync();
            return instructor;
        }
    }
}
