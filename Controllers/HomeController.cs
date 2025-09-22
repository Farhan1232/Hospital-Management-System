using Microsoft.AspNetCore.Mvc;
using HospitalManagement.Data;
using Microsoft.EntityFrameworkCore;

namespace HospitalManagement.Controllers
{
   public class HomeController : Controller
{
    private readonly ApplicationDbContext _context;

    public HomeController(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        var model = new
        {
            TotalPatients = await _context.Patients.CountAsync(),
            TotalDoctors = await _context.Doctors.CountAsync(),
            TotalAppointments = await _context.Appointments.CountAsync(),
            UpcomingAppointments = await _context.Appointments
                .Include(a => a.Patient)
                .Include(a => a.Doctor)
                .Where(a => a.AppointmentDate >= DateTime.Now)
                .OrderBy(a => a.AppointmentDate)
                .Take(5)
                .ToListAsync()
        };
        
        return View(model);
    }
}
}