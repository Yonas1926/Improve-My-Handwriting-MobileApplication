
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
    public class StudentController : ControllerBase
    {
        private readonly IRepository<Student> _studentRepository;

        private readonly IMapper _mapper;
        public StudentController(IRepository<Student> repo, IMapper mapper)
        {

            _studentRepository = repo;
            _mapper = mapper;
        }
        // [Authorize(AuthenticationSchemes=JwtBearerDefaults.AuthenticationScheme,Roles = "Admin")]
        [HttpGet]
        public async Task<IActionResult> GetStudents()
        {

            Console.WriteLine("Get Student Method invocked");

            var model = await _studentRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<StudentDto>>(model));
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetInstructor(int id)
        {
            Console.WriteLine("Get Student Method invocked");
            var model = await _studentRepository.GetDataById(id);
            return Ok(_mapper.Map<StudentDto>(model));
        }


        [HttpPost]
        public async Task<IActionResult> CreateStudent(StudentDto studentDto)
        {
            Console.WriteLine("Creating student");
            var student = _mapper.Map<Student>(studentDto);
            await _studentRepository.InsertData(student);
            return Ok(_studentRepository);
        }
        // [Authorize(Roles = RoleEntity.Admin)]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudent(int id)
        {
            var model = await _studentRepository.GetDataById(id);
            var student = _mapper.Map<Student>(model);
            await _studentRepository.DeleteData(student);
            return Ok(model);
        }
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateStudent(int id, StudentDto studentDto)
        {
            // Console.WriteLine(technician.AccepteStatus);
            var student = _mapper.Map<Student>(studentDto);
            await _studentRepository.UpdateData(student);
            return Ok(studentDto);
        }


    }

}