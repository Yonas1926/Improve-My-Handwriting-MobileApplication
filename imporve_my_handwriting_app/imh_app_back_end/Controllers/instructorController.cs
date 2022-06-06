
using AutoMapper;
using BackEnd.DTO;
using BackEnd.Models;
using Microsoft.AspNetCore.Mvc;
using WeSafe.Data;

namespace Controllers
{
    // [Authorize]

    [ApiController]
    [Route("api/instructor")]
    // [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*")]
    public class InstructorController : ControllerBase
    {
        private readonly IRepository<Instructor> _instructorRepsitory;
      
        private readonly IMapper _mapper;
        public InstructorController(IRepository<Instructor> repo, IMapper mapper)
        {

            _instructorRepsitory = repo;
            _mapper = mapper;
        }
        // [Authorize(AuthenticationSchemes=JwtBearerDefaults.AuthenticationScheme,Roles = "Admin")]
        [HttpGet]
        public async Task<IActionResult> GetInstructors()
        {

            Console.WriteLine("Get Instructors Method invocked");

            var model = await _instructorRepsitory.GetData();
            return Ok(_mapper.Map<IEnumerable<InstructorDto>>(model));
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetInstructor(int id)
        {
            Console.WriteLine("Get Instructors Method invocked");
            var model = await _instructorRepsitory.GetDataById(id);
            return Ok(_mapper.Map<InstructorDto>(model));
        }


        [HttpPost]
        public async Task<IActionResult> CreateInstructor(InstructorDto instructorDto)
        {
           Console.WriteLine("Creating roles");
            var instructor = _mapper.Map<Instructor>(instructorDto);
            await _instructorRepsitory.InsertData(instructor);
            return Ok(instructorDto);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInstructor(int id)
        {
            var model = await _instructorRepsitory.GetDataById(id);
            var Instructor = _mapper.Map<Instructor>(model);
            await _instructorRepsitory.DeleteData(Instructor);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateInstructor(int id, InstructorDto InstructorDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var Instructor = _mapper.Map<Instructor>(InstructorDto);
            await _instructorRepsitory.UpdateData(Instructor);
            return Ok(InstructorDto);
        }


    }

}