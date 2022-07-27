namespace API.Entities
{
    public class VendaProduto
    {
        public int ID { get; set; }
        public int ID_VENDA { get; set; }
        public int ID_PRODUTO { get; set; }
        public decimal VALOR { get; set; }
        public int DESCONTO { get; set; }
        public int VALOR_FINAL { get; set; }
        public DateTime DAT_CRIACAO { get; set; }
        public DateTime DAT_ALTERACAO { get; set; }
        public DateTime DAT_EXCLUSAO { get; set; }
        public int CRIADO_POR_USU_ID { get; set; }
        public int ALTERADO_POR_USU_ID { get; set; }
        public int EXCLUIDO_POR_USU_ID { get; set; }
        public bool IND_ATIVO { get; set; }
    }
}
