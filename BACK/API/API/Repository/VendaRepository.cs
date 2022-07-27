using API.Context;
using API.Entities;
using API.Repository.Interface;

namespace API.Repository
{
    public class VendaRepository : IVendaRepository
    {
        private readonly DataContext db;

        public VendaRepository(DataContext _db)
        {
            db = _db;
        }
        public bool Create(Venda venda)
        {
            try
            {
                var venda_db = new Venda()
                {
                    DAT_CRIACAO = venda.DAT_CRIACAO,
                    DAT_ALTERACAO = venda.DAT_ALTERACAO,
                    DAT_EXCLUSAO = venda.DAT_EXCLUSAO,
                    CRIADO_POR_USU_ID = venda.CRIADO_POR_USU_ID,
                    ALTERADO_POR_USU_ID = venda.ALTERADO_POR_USU_ID,
                    EXCLUIDO_POR_USU_ID =  venda.EXCLUIDO_POR_USU_ID,
                    IND_ATIVO = venda.IND_ATIVO

                };

                db.Vendas.Add(venda_db);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public Venda Read(int id)
        {
            try
            {
                var venda = db.Vendas.Find(id);
                return venda;
            }
            catch
            {
                return new Venda();
            }
        }

        public bool Update(Venda venda)
        {
            try
            {
                var venda_db = db.Vendas.Find(venda.ID);
                venda_db.DAT_CRIACAO = venda.DAT_CRIACAO;
                venda_db.DAT_ALTERACAO = venda.DAT_ALTERACAO;
                venda_db.DAT_EXCLUSAO = venda.DAT_EXCLUSAO;
                venda_db.CRIADO_POR_USU_ID = venda.CRIADO_POR_USU_ID;
                venda_db.ALTERADO_POR_USU_ID = venda.ALTERADO_POR_USU_ID;
                venda_db.EXCLUIDO_POR_USU_ID = venda.EXCLUIDO_POR_USU_ID;
                venda_db.IND_ATIVO = venda.IND_ATIVO;
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var cliente_db = db.Vendas.Find(id);
                db.Vendas.Remove(cliente_db);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IEnumerable<Venda> GetAll()
        {
            try
            {
                var venda = db.Vendas.ToList();
                return venda;
            }
            catch
            {
                return db.Vendas.ToList();
            }
        }
    }
}
