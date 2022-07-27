using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace API.Migrations
{
    public partial class first : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Vendas",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DAT_CRIACAO = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DAT_ALTERACAO = table.Column<DateTime>(type: "datetime2", nullable: false),
                    DAT_EXCLUSAO = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CRIADO_POR_USU_ID = table.Column<int>(type: "int", nullable: false),
                    ALTERADO_POR_USU_ID = table.Column<int>(type: "int", nullable: false),
                    EXCLUIDO_POR_USU_ID = table.Column<int>(type: "int", nullable: false),
                    IND_ATIVO = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vendas", x => x.ID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Vendas");
        }
    }
}
