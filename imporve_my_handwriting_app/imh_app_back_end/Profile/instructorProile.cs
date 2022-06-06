using AutoMapper;
using BackEnd.DTO;
using BackEnd.Models;

namespace BackEnd.Profiles
{


    public class InstructorProfile : Profile
    {

        private readonly IMapper _mapper;
        public InstructorProfile(IMapper mapper)
        {

            _mapper = mapper;
        }
        public InstructorProfile()
        {
            CreateMap<Instructor, InstructorDto>()
  .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
             .ForMember(dest => dest.Person, opt => opt.MapFrom(src => src.Person));



            CreateMap<InstructorDto, Instructor>();

        }



    }

}
