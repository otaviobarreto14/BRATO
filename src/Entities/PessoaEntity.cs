using System;
using TopDown.TopFramework.Entities;

namespace Brato.Entities
{
    public partial class PessoaEntity : AuditableEntity
    {
        public PessoaEntity()
            : base()
        {
        }

        public virtual UfEntity UF { get; set; }
        public virtual MunicipioEntity Municipio { get; set; }
        public virtual BairroEntity Bairro { get; set; }
        public virtual LogradouroEntity Logradouro { get; set; }
        public virtual string Complemento { get; set; }
        public virtual string Numero { get; set; }

        public virtual string Endereco
        {
            get
            {
                string endCompleto = "";
                string rua = "";
                string numero = "";
                string complemento = "";
                string bairro = "";
                if (IdEndereco.IdLogradouro != null)
                    rua = IdEndereco.IdLogradouro.Descricao;
                numero = IdEndereco.Numero;

                if (IdEndereco.IdComplemento != null)
                    complemento = IdEndereco.IdComplemento.Descricao;

                if (IdEndereco.IdLogradouro != null && IdEndereco.IdLogradouro.IdBairro != null)
                    bairro = IdEndereco.IdLogradouro.IdBairro.Descricao;

                endCompleto = string.Format("{0}, {1} - {2}, {3}", rua, numero, complemento, bairro);
                return endCompleto;
            }
        }

        public virtual string Cidade
        {
            get
            {
                if (IdEndereco.IdLogradouro != null && IdEndereco.IdLogradouro.IdBairro != null && IdEndereco.IdLogradouro.IdBairro.IdMunicipio != null)
                    return IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Descricao;
                else
                    return "";
            }
        }



        public virtual string Estado
        {
            get
            {
                if (IdEndereco.IdLogradouro != null && IdEndereco.IdLogradouro.IdBairro != null && IdEndereco.IdLogradouro.IdBairro.IdMunicipio != null && IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Uf != null)
                    return IdEndereco.IdLogradouro.IdBairro.IdMunicipio.Uf.Uf;
                else
                    return "";
            }
        }


    }
}