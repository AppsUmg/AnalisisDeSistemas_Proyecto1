using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WEB_API_ANALISIS.Clases;

namespace WEB_API_ANALISIS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiciosController : ControllerBase
    {
        [HttpPut]
        public ActionResult setPutNote(Boolean isImportant, int number, string tittle, string description)
        {
            return this.Content(ClsApi.setPutNote(isImportant, number, tittle, description), "application/json", System.Text.Encoding.UTF8);
        }

        [HttpGet]
        public ActionResult getNotes()
        {
            return this.Content(ClsApi.getNotes(), "application/json", System.Text.Encoding.UTF8);
        }

        [HttpGet("{id}")]
        public ActionResult getNote(int Id)
        {
            return this.Content(ClsApi.getNote(Id), "application/json", System.Text.Encoding.UTF8);
        }

        [HttpDelete]
        public ActionResult deleteNote(int Id, Boolean ds)
        {
            return this.Content(ClsApi.deleteNote(Id), "application/json", System.Text.Encoding.UTF8);
        }

        [HttpPost]
        public ActionResult setNote(int Id, Boolean isImportant, int number, string tittle, string description)
        {
            return this.Content(ClsApi.setNote(Id, isImportant, number, tittle, description), "application/json", System.Text.Encoding.UTF8);
        }

    }
}
