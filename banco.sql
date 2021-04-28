-- SQLINES DEMO *** ------------------------------------
-- Table `ci_sessions`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE ci_sessions (
        [id] varchar(128) NOT NULL,
        [ip_address] varchar(45) NOT NULL,
        [timestamp] int check ([timestamp] > 0) DEFAULT 0 NOT NULL,
        [data] nvarchar(max) NOT NULL
);

CREATE INDEX [ci_sessions_timestamp] ON ci_sessions ([timestamp]);


-- SQLINES DEMO *** ------------------------------------
-- Table `clientes`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE clientes (
  [idClientes] INT NOT NULL IDENTITY,
  [nomeCliente] VARCHAR(255) NOT NULL,
  [sexo] VARCHAR(20) NULL,
  [pessoa_fisica] BIT NOT NULL DEFAULT 1,
  [documento] VARCHAR(20) NOT NULL,
  [telefone] VARCHAR(20) NOT NULL,
  [celular] VARCHAR(20) NULL DEFAULT NULL,
  [email] VARCHAR(100) NOT NULL,
  [dataCadastro] DATE NULL DEFAULT NULL,
  [rua] VARCHAR(70) NULL DEFAULT NULL,
  [numero] VARCHAR(15) NULL DEFAULT NULL,
  [bairro] VARCHAR(45) NULL DEFAULT NULL,
  [cidade] VARCHAR(45) NULL DEFAULT NULL,
  [estado] VARCHAR(20) NULL DEFAULT NULL,
  [cep] VARCHAR(20) NULL DEFAULT NULL,
  [contato] varchar(45) DEFAULT NULL,
  [complemento] varchar(45) DEFAULT NULL,
  [fornecedor] BIT NOT NULL DEFAULT 0,
  PRIMARY KEY ([idClientes]))
;

-- SQLINES DEMO *** ------------------------------------
-- Table `carros`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE [dbo].[carros](
	[idCarros] [int] IDENTITY(1,1) NOT NULL,
	[idClientes] [int] NOT NULL,
	[carro] [varchar](255) NOT NULL,
	[placa] [varchar](10) NOT NULL,
	[montadora] [varchar](255) NULL,
	[anoFabricacao] [varchar](4) NULL,
	[anoModelo] [varchar](4) NULL,
	[cor] [varchar](50) NULL,
	[chassi] [varchar](50) NULL,
	[municipio] [varchar](50) NULL,
	[uf] [char](2) NULL,
	[status] [varchar](100) NULL,
	[dataCadastro] [datetime] NULL,
	[dataAlteracao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_carros] UNIQUE NONCLUSTERED 
(
	[placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- SQLINES DEMO *** ------------------------------------
-- Table `categorias`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE categorias (
  [idCategorias] INT NOT NULL IDENTITY,
  [categoria] VARCHAR(80) NULL,
  [cadastro] DATE NULL,
  [status] SMALLINT NULL,
  [tipo] VARCHAR(15) NULL,
  PRIMARY KEY ([idCategorias]))
;


-- SQLINES DEMO *** ------------------------------------
-- Table `contas`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE contas (
  [idContas] INT NOT NULL IDENTITY,
  [conta] VARCHAR(45) NULL,
  [banco] VARCHAR(45) NULL,
  [numero] VARCHAR(45) NULL,
  [saldo] DECIMAL(10,2) NULL,
  [cadastro] DATE NULL,
  [status] SMALLINT NULL,
  [tipo] VARCHAR(80) NULL,
  PRIMARY KEY ([idContas]))
;

-- SQLINES DEMO *** ------------------------------------
-- Table `permissoes`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE permissoes (
  [idPermissao] INT NOT NULL IDENTITY,
  [nome] VARCHAR(80) NOT NULL,
  [permissoes] VARCHAR(max) NULL,
  [situacao] SMALLINT NULL,
  [data] DATE NULL,
  PRIMARY KEY ([idPermissao]))
;


-- SQLINES DEMO *** ------------------------------------
-- Table `usuarios`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE usuarios (
  [idUsuarios] INT NOT NULL IDENTITY,
  [nome] VARCHAR(80) NOT NULL,
  [rg] VARCHAR(20) NULL DEFAULT NULL,
  [cpf] VARCHAR(20) NOT NULL,
  [cep] VARCHAR(9) NOT NULL,
  [rua] VARCHAR(70) NULL DEFAULT NULL,
  [numero] VARCHAR(15) NULL DEFAULT NULL,
  [bairro] VARCHAR(45) NULL DEFAULT NULL,
  [cidade] VARCHAR(45) NULL DEFAULT NULL,
  [estado] VARCHAR(20) NULL DEFAULT NULL,
  [email] VARCHAR(80) NOT NULL,
  [senha] VARCHAR(200) NOT NULL,
  [telefone] VARCHAR(20) NOT NULL,
  [celular] VARCHAR(20) NULL DEFAULT NULL,
  [situacao] SMALLINT NOT NULL,
  [dataCadastro] DATE NOT NULL,
  [permissoes_id] INT NOT NULL,
  [dataExpiracao] date DEFAULT NULL,
  PRIMARY KEY ([idUsuarios])
 ,
  CONSTRAINT [fk_usuarios_permissoes1]
    FOREIGN KEY ([permissoes_id])
    REFERENCES permissoes ([idPermissao])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_usuarios_permissoes1_idx] ON usuarios ([permissoes_id] ASC);



-- SQLINES DEMO *** ------------------------------------
-- Table `lancamentos`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE lancamentos (
  [idLancamentos] INT NOT NULL IDENTITY,
  [descricao] VARCHAR(255) NULL DEFAULT NULL,
  [valor] DECIMAL(10,2) NOT NULL,
  [data_vencimento] DATE NOT NULL,
  [data_pagamento] DATE NULL DEFAULT NULL,
  [baixado] SMALLINT NULL DEFAULT 0,
  [cliente_fornecedor] VARCHAR(255) NULL DEFAULT NULL,
  [forma_pgto] VARCHAR(100) NULL DEFAULT NULL,
  [tipo] VARCHAR(45) NULL DEFAULT NULL,
  [anexo] VARCHAR(250) NULL,
  [observacoes] VARCHAR(max) NULL,
  [clientes_id] INT NULL DEFAULT NULL,
  [categorias_id] INT NULL,
  [contas_id] INT NULL,
  [vendas_id] INT NULL,
  [usuarios_id] INT NOT NULL,
  PRIMARY KEY ([idLancamentos])
 ,
  CONSTRAINT [fk_lancamentos_clientes1]
    FOREIGN KEY ([clientes_id])
    REFERENCES clientes ([idClientes])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_lancamentos_categorias1]
    FOREIGN KEY ([categorias_id])
    REFERENCES categorias ([idCategorias])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_lancamentos_contas1]
    FOREIGN KEY ([contas_id])
    REFERENCES contas ([idContas])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_lancamentos_usuarios1]
    FOREIGN KEY ([usuarios_id])
    REFERENCES usuarios ([idUsuarios])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_lancamentos_clientes1] ON lancamentos ([clientes_id] ASC);
CREATE INDEX [fk_lancamentos_categorias1_idx] ON lancamentos ([categorias_id] ASC);
CREATE INDEX [fk_lancamentos_contas1_idx] ON lancamentos ([contas_id] ASC);
CREATE INDEX [fk_lancamentos_usuarios1] ON lancamentos ([usuarios_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- Table `Garantia`
-- SQLINES DEMO *** ------------------------------------

CREATE TABLE garantias (
  [idGarantias] INT NOT NULL IDENTITY,
  [dataGarantia] DATE NULL,
  [refGarantia] VARCHAR(15) NULL,
  [textoGarantia] VARCHAR(max) NULL,
  [usuarios_id] INT NULL,
  PRIMARY KEY ([idGarantias])
 ,
  CONSTRAINT [fk_garantias_usuarios1]
    FOREIGN KEY ([usuarios_id])
    REFERENCES usuarios ([idUsuarios])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_garantias_usuarios1] ON garantias ([usuarios_id] ASC);

-- SQLINES DEMO *** ------------------------------------
-- Table `os`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE os (
  [idOs] INT NOT NULL IDENTITY,
  [dataInicial] DATE NULL DEFAULT NULL,
  [dataFinal] DATE NULL DEFAULT NULL,
  [garantia] VARCHAR(45) NULL DEFAULT NULL,
  [descricaoProduto] VARCHAR(max) NULL DEFAULT NULL,
  [defeito] VARCHAR(max) NULL DEFAULT NULL,
  [status] VARCHAR(45) NULL DEFAULT NULL,
  [observacoes] VARCHAR(max) NULL DEFAULT NULL,
  [laudoTecnico] VARCHAR(max) NULL DEFAULT NULL,
  [valorTotal] DECIMAL(10,2) NULL DEFAULT NULL,
  [clientes_id] INT NOT NULL,
  [usuarios_id] INT NOT NULL,
  [lancamento] INT NULL DEFAULT NULL,
  [faturado] SMALLINT NOT NULL,
  [garantias_id] int NULL,
  PRIMARY KEY ([idOs])
 ,
  CONSTRAINT [fk_os_clientes1]
    FOREIGN KEY ([clientes_id])
    REFERENCES clientes ([idClientes])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_os_lancamentos1]
    FOREIGN KEY ([lancamento])
    REFERENCES lancamentos ([idLancamentos])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_os_usuarios1]
    FOREIGN KEY ([usuarios_id])
    REFERENCES usuarios ([idUsuarios])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_os_clientes1] ON os ([clientes_id] ASC);
CREATE INDEX [fk_os_usuarios1] ON os ([usuarios_id] ASC);
CREATE INDEX [fk_os_lancamentos1] ON os ([lancamento] ASC);
CREATE INDEX [fk_os_garantias1] ON os ([garantias_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- Table `produtos`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE produtos (
  [idProdutos] INT NOT NULL IDENTITY,
  [codDeBarra] VARCHAR(70) NOT NULL,
  [descricao] VARCHAR(80) NOT NULL,
  [unidade] VARCHAR(10) NULL DEFAULT NULL,
  [precoCompra] DECIMAL(10,2) NULL DEFAULT NULL,
  [precoVenda] DECIMAL(10,2) NOT NULL,
  [estoque] INT NOT NULL,
  [estoqueMinimo] INT NULL DEFAULT NULL,
  [saida]	SMALLINT NULL DEFAULT NULL,
  [entrada]	SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY ([idProdutos]))
;


-- SQLINES DEMO *** ------------------------------------
-- Table `produtos_os`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE produtos_os (
  [idProdutos_os] INT NOT NULL IDENTITY,
  [quantidade] INT NOT NULL,
  [descricao] VARCHAR(80) NULL,
  [preco] DECIMAL(10,2) NULL,
  [os_id] INT NOT NULL,
  [produtos_id] INT NOT NULL,
  [subTotal] DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY ([idProdutos_os])
 ,
  CONSTRAINT [fk_produtos_os_os1]
    FOREIGN KEY ([os_id])
    REFERENCES os ([idOs])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_produtos_os_produtos1]
    FOREIGN KEY ([produtos_id])
    REFERENCES produtos ([idProdutos])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_produtos_os_os1] ON produtos_os ([os_id] ASC);
CREATE INDEX [fk_produtos_os_produtos1] ON produtos_os ([produtos_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- Table `servicos`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE servicos (
  [idServicos] INT NOT NULL IDENTITY,
  [nome] VARCHAR(45) NOT NULL,
  [descricao] VARCHAR(45) NULL DEFAULT NULL,
  [preco] DECIMAL(10,2) NOT NULL,
  PRIMARY KEY ([idServicos]))
;


-- SQLINES DEMO *** ------------------------------------
-- Table `servicos_os`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE servicos_os (
  [idServicos_os] INT NOT NULL IDENTITY,
  [servico] VARCHAR(80) NULL,
  [quantidade] FLOAT NULL,
  [preco] DECIMAL(10,2) NULL,
  [os_id] INT NOT NULL,
  [servicos_id] INT NOT NULL,
  [subTotal] DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY ([idServicos_os])
 ,
  CONSTRAINT [fk_servicos_os_os1]
    FOREIGN KEY ([os_id])
    REFERENCES os ([idOs])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_servicos_os_servicos1]
    FOREIGN KEY ([servicos_id])
    REFERENCES servicos ([idServicos])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_servicos_os_os1] ON servicos_os ([os_id] ASC);
CREATE INDEX [fk_servicos_os_servicos1] ON servicos_os ([servicos_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- Table `vendas`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE vendas (
  [idVendas] INT NOT NULL IDENTITY,
  [dataVenda] DATE NULL,
  [valorTotal] DECIMAL(10,2) NULL,
  [desconto] VARCHAR(45) NULL,
  [faturado] SMALLINT NULL,
  [observacoes] VARCHAR(max) NULL,
  [observacoes_cliente] VARCHAR(max) NULL,
  [clientes_id] INT NOT NULL,
  [usuarios_id] INT NULL,
  [lancamentos_id] INT NULL,
  PRIMARY KEY ([idVendas])
 ,
  CONSTRAINT [fk_vendas_clientes1]
    FOREIGN KEY ([clientes_id])
    REFERENCES clientes ([idClientes])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_vendas_usuarios1]
    FOREIGN KEY ([usuarios_id])
    REFERENCES usuarios ([idUsuarios])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_vendas_lancamentos1]
    FOREIGN KEY ([lancamentos_id])
    REFERENCES lancamentos ([idLancamentos])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_vendas_clientes1] ON vendas ([clientes_id] ASC);
CREATE INDEX [fk_vendas_usuarios1] ON vendas ([usuarios_id] ASC);
CREATE INDEX [fk_vendas_lancamentos1] ON vendas ([lancamentos_id] ASC);


--
-- SQLINES DEMO *** la `cobrancas`
--
CREATE TABLE cobrancas (
    [idCobranca] INT NOT NULL IDENTITY,
  [charge_id] int DEFAULT NULL,
  [conditional_discount_date] date DEFAULT NULL,
  [created_at] datetime2(0) DEFAULT NULL,
  [custom_id] int DEFAULT NULL,
  [expire_at] date NOT NULL,
  [message] varchar(255) NOT NULL,
  [payment_method] varchar(11) DEFAULT NULL,
  [payment_url] varchar(255) DEFAULT NULL,
  [request_delivery_address] varchar(64) DEFAULT NULL,
  [status] varchar(36) NOT NULL,
  [total] varchar(15) DEFAULT NULL,
  [barcode] varchar(255) NOT NULL,
  [link] varchar(255) NOT NULL,
  [payment_gateway] varchar(255) NULL DEFAULT NULL,
  [payment] varchar(64) NOT NULL,
  [pdf] varchar(255) DEFAULT NULL,
  [vendas_id] int DEFAULT NULL,
  [os_id] int DEFAULT NULL,
  [clientes_id] int DEFAULT NULL,
  PRIMARY KEY ([idCobranca])
 ,
  CONSTRAINT [fk_cobrancas_os1] FOREIGN KEY ([os_id]) REFERENCES os ([idOs]) ON DELETE NO ACTION ON UPDATE NO ACTION
 ,
  CONSTRAINT [fk_cobrancas_vendas1] FOREIGN KEY ([vendas_id]) REFERENCES vendas ([idVendas]) ON DELETE NO ACTION ON UPDATE NO ACTION
 ,
  CONSTRAINT [fk_cobrancas_clientes1] FOREIGN KEY ([clientes_id]) REFERENCES clientes ([idClientes]) ON DELETE NO ACTION ON UPDATE NO ACTION

) ;

CREATE INDEX [fk_cobrancas_os1] ON cobrancas ([os_id] ASC);
CREATE INDEX [fk_cobrancas_vendas1] ON cobrancas ([vendas_id] ASC);
CREATE INDEX [fk_cobrancas_clientes1] ON cobrancas ([clientes_id] ASC);

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** endas`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE itens_de_vendas (
  [idItens] INT NOT NULL IDENTITY,
  [subTotal] DECIMAL(10,2) NULL,
  [quantidade] INT NULL,
  [preco] DECIMAL(10,2) NULL,
  [vendas_id] INT NOT NULL,
  [produtos_id] INT NOT NULL,
  PRIMARY KEY ([idItens])
 ,
  CONSTRAINT [fk_itens_de_vendas_vendas1]
    FOREIGN KEY ([vendas_id])
    REFERENCES vendas ([idVendas])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_itens_de_vendas_produtos1]
    FOREIGN KEY ([produtos_id])
    REFERENCES produtos ([idProdutos])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_itens_de_vendas_vendas1] ON itens_de_vendas ([vendas_id] ASC);
CREATE INDEX [fk_itens_de_vendas_produtos1] ON itens_de_vendas ([produtos_id] ASC);

-- SQLINES DEMO *** ------------------------------------
-- Table `anexos`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE anexos (
  [idAnexos] INT NOT NULL IDENTITY,
  [anexo] VARCHAR(45) NULL,
  [thumb] VARCHAR(45) NULL,
  [url] VARCHAR(300) NULL,
  [path] VARCHAR(300) NULL,
  [os_id] INT NOT NULL,
  PRIMARY KEY ([idAnexos])
 ,
  CONSTRAINT [fk_anexos_os1]
    FOREIGN KEY ([os_id])
    REFERENCES os ([idOs])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_anexos_os1] ON anexos ([os_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- Table `documentos`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE documentos (
  [idDocumentos] INT NOT NULL IDENTITY,
  [documento] VARCHAR(70) NULL,
  [descricao] VARCHAR(max) NULL,
  [file] VARCHAR(100) NULL,
  [path] VARCHAR(300) NULL,
  [url] VARCHAR(300) NULL,
  [cadastro] DATE NULL,
  [categoria] VARCHAR(80) NULL,
  [tipo] VARCHAR(15) NULL,
  [tamanho] VARCHAR(45) NULL,
  PRIMARY KEY ([idDocumentos]))
;


-- SQLINES DEMO *** ------------------------------------
-- Table `marcas`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE marcas (
  [idMarcas] INT NOT NULL IDENTITY,
  [marca] VARCHAR(100) NULL,
  [cadastro] DATE NULL,
  [situacao] SMALLINT NULL,
  PRIMARY KEY ([idMarcas]))
;


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** os`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE equipamentos (
  [idEquipamentos] INT NOT NULL IDENTITY,
  [equipamento] VARCHAR(150) NOT NULL,
  [num_serie] VARCHAR(80) NULL,
  [modelo] VARCHAR(80) NULL,
  [cor] VARCHAR(45) NULL,
  [descricao] VARCHAR(150) NULL,
  [tensao] VARCHAR(45) NULL,
  [potencia] VARCHAR(45) NULL,
  [voltagem] VARCHAR(45) NULL,
  [data_fabricacao] DATE NULL,
  [marcas_id] INT NULL,
  [clientes_id] INT NULL,
  PRIMARY KEY ([idEquipamentos])
 ,
  CONSTRAINT [fk_equipanentos_marcas1]
    FOREIGN KEY ([marcas_id])
    REFERENCES marcas ([idMarcas])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_equipanentos_clientes1]
    FOREIGN KEY ([clientes_id])
    REFERENCES clientes ([idClientes])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_equipanentos_marcas1_idx] ON equipamentos ([marcas_id] ASC);
CREATE INDEX [fk_equipanentos_clientes1_idx] ON equipamentos ([clientes_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** os_os`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE equipamentos_os (
  [idEquipamentos_os] INT NOT NULL IDENTITY,
  [defeito_declarado] VARCHAR(200) NULL,
  [defeito_encontrado] VARCHAR(200) NULL,
  [solucao] VARCHAR(45) NULL,
  [equipamentos_id] INT NULL,
  [os_id] INT NULL,
  PRIMARY KEY ([idEquipamentos_os])
 ,
  CONSTRAINT [fk_equipamentos_os_equipanentos1]
    FOREIGN KEY ([equipamentos_id])
    REFERENCES equipamentos ([idEquipamentos])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT [fk_equipamentos_os_os1]
    FOREIGN KEY ([os_id])
    REFERENCES os ([idOs])
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX [fk_equipamentos_os_equipanentos1_idx] ON equipamentos_os ([equipamentos_id] ASC);
CREATE INDEX [fk_equipamentos_os_os1_idx] ON equipamentos_os ([os_id] ASC);


-- SQLINES DEMO *** ------------------------------------
-- Table `logs`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE logs (
  [idLogs] INT NOT NULL IDENTITY,
  [usuario] VARCHAR(80) NULL,
  [tarefa] VARCHAR(100) NULL,
  [data] DATE NULL,
  [hora] TIME(0) NULL,
  [ip] VARCHAR(45) NULL,
  PRIMARY KEY ([idLogs]))
;

-- SQLINES DEMO *** ------------------------------------
-- Table `emitente`
-- SQLINES DEMO *** ------------------------------------
CREATE  TABLE emitente (
  [id] INT NOT NULL IDENTITY ,
  [nome] VARCHAR(255) NULL ,
  [cnpj] VARCHAR(45) NULL ,
  [ie] VARCHAR(50) NULL ,
  [rua] VARCHAR(70) NULL ,
  [numero] VARCHAR(15) NULL ,
  [bairro] VARCHAR(45) NULL ,
  [cidade] VARCHAR(45) NULL ,
  [uf] VARCHAR(20) NULL ,
  [telefone] VARCHAR(20) NULL ,
  [email] VARCHAR(255) NULL ,
  [url_logo] VARCHAR(225) NULL ,
  [cep] VARCHAR(20) NULL ,
  PRIMARY KEY ([id]) )
;

-- SQLINES DEMO *** ------------------------------------
-- Table `email_queue`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE email_queue (
  [id] int NOT NULL IDENTITY,
  [to] varchar(255) NOT NULL,
  [cc] varchar(255) DEFAULT NULL,
  [bcc] varchar(255) DEFAULT NULL,
  [message] varchar(max) NOT NULL,
  [status] VARCHAR(25) CHECK([status] in('pending','sending','sent','failed')) DEFAULT NULL,
  [date] datetime2(0) DEFAULT NULL,
  [headers] varchar(max),
  PRIMARY KEY ([id])
);
-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** _os`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE anotacoes_os (
    [idAnotacoes] INT NOT NULL IDENTITY,
    [anotacao] VARCHAR(255) NOT NULL ,
    [data_hora] DATETIME2(0) NOT NULL ,
    [os_id] INT NOT NULL ,
    PRIMARY KEY ([idAnotacoes])
);

-- SQLINES DEMO *** ------------------------------------
-- SQLINES DEMO *** oes`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE configuracoes ( [idConfig] INT NOT NULL IDENTITY , [config] VARCHAR(20) NOT NULL UNIQUE, [valor] VARCHAR(max) NULL , PRIMARY KEY ([idConfig]));

-- SQLINES DEMO *** ------------------------------------
-- Table `migrations`
-- SQLINES DEMO *** ------------------------------------
CREATE TABLE migrations (
  [version] BIGINT NOT NULL
);

INSERT INTO configuracoes ( [config], [valor]) VALUES
('app_name', 'Oficina-OS'),
('app_theme', 'default'),
('per_page', '10'),
('os_notification', 'cliente'),
('control_estoque', '1'),
('notifica_whats', 'Prezado(a), {CLIENTE_NOME} a OS de nº ({NUMERO_OS}) teve o status alterado para :({STATUS_OS}) segue a descrição "{DESCRI_PRODUTOS}" com valor total de ({VALOR_OS})! Para mais informações entre em contato conosco. Atenciosamente, {EMITENTE} {TELEFONE_EMITENTE}.'),
('control_baixa', '0'),
('control_editos', '1'),
( 'control_datatable', '1'),
( 'pix_key', ''),
( 'os_status_list', '["Aberto","Faturado","Negocia\u00e7\u00e3o","Em Andamento","Or\u00e7amento","Finalizado","Cancelado","Aguardando Pe\u00e7as"]');

INSERT INTO permissoes ([nome], [permissoes], [situacao], [data]) VALUES
('Administrador', 'a:53:{s:8:"aCliente";s:1:"1";s:8:"eCliente";s:1:"1";s:8:"dCliente";s:1:"1";s:8:"vCliente";s:1:"1";s:8:"aProduto";s:1:"1";s:8:"eProduto";s:1:"1";s:8:"dProduto";s:1:"1";s:8:"vProduto";s:1:"1";s:8:"aServico";s:1:"1";s:8:"eServico";s:1:"1";s:8:"dServico";s:1:"1";s:8:"vServico";s:1:"1";s:3:"aOs";s:1:"1";s:3:"eOs";s:1:"1";s:3:"dOs";s:1:"1";s:3:"vOs";s:1:"1";s:6:"aVenda";s:1:"1";s:6:"eVenda";s:1:"1";s:6:"dVenda";s:1:"1";s:6:"vVenda";s:1:"1";s:9:"aGarantia";s:1:"1";s:9:"eGarantia";s:1:"1";s:9:"dGarantia";s:1:"1";s:9:"vGarantia";s:1:"1";s:8:"aArquivo";s:1:"1";s:8:"eArquivo";s:1:"1";s:8:"dArquivo";s:1:"1";s:8:"vArquivo";s:1:"1";s:10:"aPagamento";N;s:10:"ePagamento";N;s:10:"dPagamento";N;s:10:"vPagamento";N;s:11:"aLancamento";s:1:"1";s:11:"eLancamento";s:1:"1";s:11:"dLancamento";s:1:"1";s:11:"vLancamento";s:1:"1";s:8:"cUsuario";s:1:"1";s:9:"cEmitente";s:1:"1";s:10:"cPermissao";s:1:"1";s:7:"cBackup";s:1:"1";s:10:"cAuditoria";s:1:"1";s:6:"cEmail";s:1:"1";s:8:"cSistema";s:1:"1";s:8:"rCliente";s:1:"1";s:8:"rProduto";s:1:"1";s:8:"rServico";s:1:"1";s:3:"rOs";s:1:"1";s:6:"rVenda";s:1:"1";s:11:"rFinanceiro";s:1:"1";s:9:"aCobranca";s:1:"1";s:9:"eCobranca";s:1:"1";s:9:"dCobranca";s:1:"1";s:9:"vCobranca";s:1:"1";}', 1, GETDATE());

INSERT INTO usuarios ([nome], [rg], [cpf], [cep], [rua], [numero], [bairro], [cidade], [estado], [email], [senha], [telefone], [celular], [situacao], [dataCadastro], [permissoes_id],[dataExpiracao]) VALUES
('admin_name', 'SP-418.150.X', '381.699.388-XX', '08577-000', 'Av. Itaquaquecetuba', '00', 'Monte Belo', 'Itaquaquecetuba', 'SP', 'admin_email', 'admin_password', '000000-0000', '', 1, GETDATE(), 1, '30000101');

INSERT INTO migrations([version]) VALUES ('20210422010244');
