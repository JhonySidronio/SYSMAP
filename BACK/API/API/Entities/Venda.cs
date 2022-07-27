namespace API.Entities
{
    public class Venda
    {
        public int ID { get; set; }
        public DateTime DAT_CRIACAO { get; set; }
        public DateTime DAT_ALTERACAO { get; set; }
        public DateTime DAT_EXCLUSAO { get; set; }
        public int CRIADO_POR_USU_ID { get; set; }
        public int ALTERADO_POR_USU_ID { get; set; }
        public int EXCLUIDO_POR_USU_ID { get; set; }
        public bool IND_ATIVO { get; set; }
    }
}
