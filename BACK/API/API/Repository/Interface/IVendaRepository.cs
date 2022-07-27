using API.Entities;
using API.Entities.Cliente;

namespace API.Repository.Interface
{
    public interface IVendaRepository
    {
        public IEnumerable<Venda> GetAll();
        public bool Create(Venda venda);
        public Venda Read(int id);
        public bool Update(Venda venda);
        public bool Delete(int id);
    }
}
