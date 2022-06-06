using BackEnd.Data;
using BackEnd.Models;
using Microsoft.EntityFrameworkCore;
using WeSafe.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
// builder.Services.AddEndpointsApiExplorer();
// builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<DataContext>(opt => opt.UseSqlServer(
                builder.Configuration.GetConnectionString("wesafeConnection"),
                 o => o.UseQuerySplittingBehavior(QuerySplittingBehavior.SplitQuery)

                ));
// builder.Services.AddControllers();
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
builder.Services.AddCors(option =>
{
    option.AddPolicy(name: "AllowedOrigin",
        builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()
        );
});
// builder.Services.AddControllers();
builder.Services.AddScoped<IRepository<Instructor>, InstructorRepository>();
builder.Services.AddScoped<IRepository<Student>, StudentRepository>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors(x => x
               .AllowAnyMethod()
               .AllowAnyHeader()
               .SetIsOriginAllowed(origin => true) // allow any origin
               .AllowCredentials());
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
