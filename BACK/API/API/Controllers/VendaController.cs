using API.Entities;
using API.Entities.Cliente;
using API.Repository.Interface;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class VendaController : ControllerBase
    {

        private readonly IVendaRepository _repository;
        public VendaController(IVendaRepository repository)
        {
            _repository = repository;
        }

        [HttpGet(Name = "GetAll")]
        public IActionResult GetAll()
        {
            var retorno = _repository.GetAll();
            return Ok(retorno);

        }

        [HttpGet("{Id}")]
        public IActionResult Get([FromRoute] Venda venda)
        {
            var retorno = _repository.Read(venda.ID);
            return Ok(retorno);

        }

        [HttpPost]
        public IActionResult Post(Venda venda)
        {
            if (_repository.Create(venda))
                return Ok();

            return BadRequest();
        }

        [HttpPut]
        public IActionResult Put(Venda venda)
        {
            if (_repository.Update(venda))
                return Ok();

            return BadRequest();
        }

        [HttpDelete("{Id}")]
        public IActionResult Delete(int id)
        {
            if (_repository.Delete(id))
                return Ok();

            return BadRequest();
        }
    }
}
