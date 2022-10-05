/*
    ERROS:
        1 - tb_funcionario = tá dando erro de tipo (não achei o motivo)
        2 - 
*/

CREATE TABLE tb_usuario OF tp_usuario (
    cpf PRIMARY KEY,
    nome NOT NULL,
    endereco NOT NULL,
    telefone NOT NULL
);
/
CREATE TABLE tb_funcionario OF tp_funcionario (
    cpf PRIMARY KEY,
    supervisor NULL,
    salario NOT NULL CHECK(salario >= 1212.00),
    data_de_admissao NOT NULL,
    cargo NOT NULL
);
/

CREATE TABLE tb_cliente OF tp_cliente (
    cpf PRIMARY KEY,
    tipo_de_assinatura NOT NULL
);
/
CREATE TABLE tb_empresa OF tp_empresa (
    cnpj PRIMARY KEY,
    nome_fantasia NOT NULL,
    telefone NOT NULL
) NESTED TABLE telefones STORE AS telefones_empresas;
/
CREATE TABLE tb_loja OF tp_loja (
    cnpj PRIMARY KEY,
    categorias NOT NULL
);
/
CREATE TABLE tb_transportadora OF tp_transportadora (
    cnpj PRIMARY KEY,
    frete NOT NULL
);
/
CREATE TABLE tb_produto OF tp_produto (
    cnpj_loja WITH ROWID REFERENCES tb_loja NOT NULL, -- deveria usar o SCOPE IS?
    cod_identificacao PRIMARY KEY,
    nome NOT NULL,
    estoque NOT NULL,
    preco NOT NULL,
    media NOT NULL
);

CREATE TABLE tb_pedido OF tp_pedido (
    ID_do_pedido PRIMARY KEY,
    quantidade NOT NULL,
    forma_de_pagamento NOT NULL,
    data_da_compra NOT NULL,
    transportadora WITH ROWID REFERENCES tb_transportadora NOT NULL, 
    -- devemos colocar?
    -- pedido_funcionario REF tp_funcionario, -- PRECISAMOS TER A REF PARA FUNCIONÁRIO?
    cliente WITH ROWID REFERENCES tb_cliente,
    produto WITH ROWID REFERENCES tb_produto
);
 