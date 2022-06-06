using AutoMapper;
using BackEnd.DTO;
using BackEnd.Models;

namespace BackEnd.Profiles
{


    public class StudentProfile : Profile
    {

        private readonly IMapper _mapper;
        public StudentProfile(IMapper mapper)
        {

            _mapper = mapper;
        }
        public StudentProfile()
        {
            CreateMap<Student, StudentDto>()
  .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
             .ForMember(dest => dest.Person, opt => opt.MapFrom(src => src.Person));
          


            CreateMap<StudentDto, Student>();
 
        }



    }

}
