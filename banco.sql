CREATE TABLE [dbo].[anexos](
  [idAnexos] [int] IDENTITY(1, 1) NOT NULL,
  [anexo] [varchar](45) NULL,
  [thumb] [varchar](45) NULL,
  [url] [varchar](300) NULL,
  [path] [varchar](300) NULL,
  [os_id] [int] NOT NULL,
  PRIMARY KEY CLUSTERED ([idAnexos] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[anotacoes_os](
  [idAnotacoes] [int] IDENTITY(1, 1) NOT NULL,
  [anotacao] [varchar](255) NOT NULL,
  [data_hora] [datetime2](0) NOT NULL,
  [os_id] [int] NOT NULL,
  PRIMARY KEY CLUSTERED ([idAnotacoes] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[carros](
  [idCarros] [int] IDENTITY(1, 1) NOT NULL,
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
  PRIMARY KEY CLUSTERED ([idCarros] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY],
  CONSTRAINT [IX_carros] UNIQUE NONCLUSTERED ([placa] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[categorias](
  [idCategorias] [int] IDENTITY(1, 1) NOT NULL,
  [categoria] [varchar](80) NULL,
  [cadastro] [date] NULL,
  [status] [smallint] NULL,
  [tipo] [varchar](15) NULL,
  PRIMARY KEY CLUSTERED ([idCategorias] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[ci_sessions](
  [id] [varchar](128) NOT NULL,
  [ip_address] [varchar](45) NOT NULL,
  [timestamp] [int] NOT NULL,
  [data] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[clientes](
  [idClientes] [int] IDENTITY(1, 1) NOT NULL,
  [nomeCliente] [varchar](255) NOT NULL,
  [sexo] [varchar](20) NULL,
  [pessoa_fisica] [bit] NOT NULL,
  [documento] [varchar](20) NOT NULL,
  [telefone] [varchar](20) NOT NULL,
  [celular] [varchar](20) NULL,
  [email] [varchar](100) NOT NULL,
  [dataCadastro] [datetime] NULL,
  [rua] [varchar](70) NULL,
  [numero] [varchar](15) NULL,
  [bairro] [varchar](45) NULL,
  [cidade] [varchar](45) NULL,
  [estado] [varchar](20) NULL,
  [cep] [varchar](20) NULL,
  [contato] [varchar](45) NULL,
  [complemento] [varchar](45) NULL,
  [fornecedor] [bit] NOT NULL,
  CONSTRAINT [PK__clientes__470BDBA0CE8CEC45] PRIMARY KEY CLUSTERED ([idClientes] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[cobrancas](
  [idCobranca] [int] IDENTITY(1, 1) NOT NULL,
  [charge_id] [int] NULL,
  [conditional_discount_date] [date] NULL,
  [created_at] [datetime2](0) NULL,
  [custom_id] [int] NULL,
  [expire_at] [date] NOT NULL,
  [message] [varchar](255) NOT NULL,
  [payment_method] [varchar](11) NULL,
  [payment_url] [varchar](255) NULL,
  [request_delivery_address] [varchar](64) NULL,
  [status] [varchar](36) NOT NULL,
  [total] [varchar](15) NULL,
  [barcode] [varchar](255) NOT NULL,
  [link] [varchar](255) NOT NULL,
  [payment_gateway] [varchar](255) NULL,
  [payment] [varchar](64) NOT NULL,
  [pdf] [varchar](255) NULL,
  [vendas_id] [int] NULL,
  [os_id] [int] NULL,
  [clientes_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([idCobranca] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[configuracoes](
  [idConfig] [int] IDENTITY(1, 1) NOT NULL,
  [config] [varchar](20) NOT NULL,
  [valor] [varchar](max) NULL,
  PRIMARY KEY CLUSTERED ([idConfig] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY],
  UNIQUE NONCLUSTERED ([config] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[contas](
  [idContas] [int] IDENTITY(1, 1) NOT NULL,
  [conta] [varchar](45) NULL,
  [banco] [varchar](45) NULL,
  [numero] [varchar](45) NULL,
  [saldo] [decimal](10, 2) NULL,
  [cadastro] [date] NULL,
  [status] [smallint] NULL,
  [tipo] [varchar](80) NULL,
  PRIMARY KEY CLUSTERED ([idContas] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[documentos](
  [idDocumentos] [int] IDENTITY(1, 1) NOT NULL,
  [documento] [varchar](70) NULL,
  [descricao] [varchar](max) NULL,
  [file] [varchar](100) NULL,
  [path] [varchar](300) NULL,
  [url] [varchar](300) NULL,
  [cadastro] [datetime] NULL,
  [categoria] [varchar](80) NULL,
  [tipo] [varchar](15) NULL,
  [tamanho] [varchar](45) NULL,
  CONSTRAINT [PK__document__1BE3632E6CC08A21] PRIMARY KEY CLUSTERED ([idDocumentos] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[email_queue](
  [id] [int] IDENTITY(1, 1) NOT NULL,
  [to] [varchar](255) NOT NULL,
  [cc] [varchar](255) NULL,
  [bcc] [varchar](255) NULL,
  [message] [varchar](max) NOT NULL,
  [status] [varchar](25) NULL,
  [date] [datetime2](0) NULL,
  [headers] [varchar](max) NULL,
  PRIMARY KEY CLUSTERED ([id] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[emitente](
  [id] [int] IDENTITY(1, 1) NOT NULL,
  [nome] [varchar](255) NULL,
  [cnpj] [varchar](45) NULL,
  [ie] [varchar](50) NULL,
  [rua] [varchar](70) NULL,
  [numero] [varchar](15) NULL,
  [bairro] [varchar](45) NULL,
  [cidade] [varchar](45) NULL,
  [uf] [varchar](20) NULL,
  [telefone] [varchar](20) NULL,
  [email] [varchar](255) NULL,
  [url_logo] [varchar](225) NULL,
  [cep] [varchar](20) NULL,
  PRIMARY KEY CLUSTERED ([id] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[equipamentos](
  [idEquipamentos] [int] IDENTITY(1, 1) NOT NULL,
  [equipamento] [varchar](150) NOT NULL,
  [num_serie] [varchar](80) NULL,
  [modelo] [varchar](80) NULL,
  [cor] [varchar](45) NULL,
  [descricao] [varchar](150) NULL,
  [tensao] [varchar](45) NULL,
  [potencia] [varchar](45) NULL,
  [voltagem] [varchar](45) NULL,
  [data_fabricacao] [date] NULL,
  [marcas_id] [int] NULL,
  [clientes_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([idEquipamentos] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[equipamentos_os](
  [idEquipamentos_os] [int] IDENTITY(1, 1) NOT NULL,
  [defeito_declarado] [varchar](200) NULL,
  [defeito_encontrado] [varchar](200) NULL,
  [solucao] [varchar](45) NULL,
  [equipamentos_id] [int] NULL,
  [os_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([idEquipamentos_os] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[garantias](
  [idGarantias] [int] IDENTITY(1, 1) NOT NULL,
  [dataGarantia] [date] NULL,
  [refGarantia] [varchar](15) NULL,
  [textoGarantia] [varchar](max) NULL,
  [usuarios_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([idGarantias] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[itens_de_vendas](
  [idItens] [int] IDENTITY(1, 1) NOT NULL,
  [subTotal] [decimal](10, 2) NULL,
  [quantidade] [int] NULL,
  [preco] [decimal](10, 2) NULL,
  [vendas_id] [int] NOT NULL,
  [produtos_id] [int] NOT NULL,
  PRIMARY KEY CLUSTERED ([idItens] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[lancamentos](
  [idLancamentos] [int] IDENTITY(1, 1) NOT NULL,
  [descricao] [varchar](255) NULL,
  [valor] [decimal](10, 2) NOT NULL,
  [data_vencimento] [datetime] NOT NULL,
  [data_pagamento] [datetime] NULL,
  [baixado] [smallint] NULL,
  [cliente_fornecedor] [varchar](255) NULL,
  [forma_pgto] [varchar](100) NULL,
  [tipo] [varchar](45) NULL,
  [anexo] [varchar](250) NULL,
  [observacoes] [varchar](max) NULL,
  [clientes_id] [int] NULL,
  [categorias_id] [int] NULL,
  [contas_id] [int] NULL,
  [vendas_id] [int] NULL,
  [usuarios_id] [int] NOT NULL,
  CONSTRAINT [PK__lancamen__C13BC78621E1F52E] PRIMARY KEY CLUSTERED ([idLancamentos] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[logs](
  [idLogs] [int] IDENTITY(1, 1) NOT NULL,
  [usuario] [varchar](80) NULL,
  [tarefa] [varchar](100) NULL,
  [data] [date] NULL,
  [hora] [time](0) NULL,
  [ip] [varchar](45) NULL,
  CONSTRAINT [PK__logs__1B94750F791EBBBB] PRIMARY KEY CLUSTERED ([idLogs] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[marcas](
  [idMarcas] [int] IDENTITY(1, 1) NOT NULL,
  [marca] [varchar](100) NULL,
  [cadastro] [date] NULL,
  [situacao] [smallint] NULL,
  PRIMARY KEY CLUSTERED ([idMarcas] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[migrations]([version] [bigint] NOT NULL) ON [PRIMARY] CREATE TABLE [dbo].[os](
  [idOs] [int] IDENTITY(1, 1) NOT NULL,
  [dataInicial] [date] NULL,
  [dataFinal] [date] NULL,
  [garantia] [varchar](45) NULL,
  [descricaoProduto] [varchar](max) NULL,
  [defeito] [varchar](max) NULL,
  [status] [varchar](45) NULL,
  [observacoes] [varchar](max) NULL,
  [laudoTecnico] [varchar](max) NULL,
  [valorTotal] [decimal](10, 2) NULL,
  [clientes_id] [int] NOT NULL,
  [usuarios_id] [int] NOT NULL,
  [lancamento] [int] NULL,
  [faturado] [smallint] NOT NULL,
  [garantias_id] [int] NULL,
  CONSTRAINT [PK__os__9DB850DA6C4C0F2F] PRIMARY KEY CLUSTERED ([idOs] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[permissoes](
  [idPermissao] [int] IDENTITY(1, 1) NOT NULL,
  [nome] [varchar](80) NOT NULL,
  [permissoes] [varchar](max) NULL,
  [situacao] [smallint] NULL,
  [data] [date] NULL,
  PRIMARY KEY CLUSTERED ([idPermissao] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] CREATE TABLE [dbo].[produtos](
  [idProdutos] [int] IDENTITY(1, 1) NOT NULL,
  [codDeBarra] [varchar](70) NOT NULL,
  [descricao] [varchar](80) NOT NULL,
  [unidade] [varchar](10) NULL,
  [precoCompra] [decimal](10, 2) NULL,
  [precoVenda] [decimal](10, 2) NOT NULL,
  [estoque] [int] NOT NULL,
  [estoqueMinimo] [int] NULL,
  [saida] [smallint] NULL,
  [entrada] [smallint] NULL,
  PRIMARY KEY CLUSTERED ([idProdutos] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[produtos_os](
  [idProdutos_os] [int] IDENTITY(1, 1) NOT NULL,
  [quantidade] [int] NOT NULL,
  [descricao] [varchar](80) NULL,
  [preco] [decimal](10, 2) NULL,
  [os_id] [int] NOT NULL,
  [produtos_id] [int] NOT NULL,
  [subTotal] [decimal](10, 2) NULL,
  PRIMARY KEY CLUSTERED ([idProdutos_os] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[servicos](
  [idServicos] [int] IDENTITY(1, 1) NOT NULL,
  [nome] [varchar](45) NOT NULL,
  [descricao] [varchar](45) NULL,
  [preco] [decimal](10, 2) NOT NULL,
  PRIMARY KEY CLUSTERED ([idServicos] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[servicos_os](
  [idServicos_os] [int] IDENTITY(1, 1) NOT NULL,
  [servico] [varchar](80) NULL,
  [quantidade] [float] NULL,
  [preco] [decimal](10, 2) NULL,
  [os_id] [int] NOT NULL,
  [servicos_id] [int] NOT NULL,
  [subTotal] [decimal](10, 2) NULL,
  PRIMARY KEY CLUSTERED ([idServicos_os] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[usuarios](
  [idUsuarios] [int] IDENTITY(1, 1) NOT NULL,
  [nome] [varchar](80) NOT NULL,
  [rg] [varchar](20) NULL,
  [cpf] [varchar](20) NOT NULL,
  [cep] [varchar](9) NOT NULL,
  [rua] [varchar](70) NULL,
  [numero] [varchar](15) NULL,
  [bairro] [varchar](45) NULL,
  [cidade] [varchar](45) NULL,
  [estado] [varchar](20) NULL,
  [email] [varchar](80) NOT NULL,
  [senha] [varchar](200) NOT NULL,
  [telefone] [varchar](20) NOT NULL,
  [celular] [varchar](20) NULL,
  [situacao] [smallint] NOT NULL,
  [dataCadastro] [datetime] NOT NULL,
  [permissoes_id] [int] NOT NULL,
  [dataExpiracao] [date] NULL,
  CONSTRAINT [PK__usuarios__3940559A3E0101F8] PRIMARY KEY CLUSTERED ([idUsuarios] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] CREATE TABLE [dbo].[vendas](
  [idVendas] [int] IDENTITY(1, 1) NOT NULL,
  [dataVenda] [date] NULL,
  [valorTotal] [decimal](10, 2) NULL,
  [desconto] [varchar](45) NULL,
  [faturado] [smallint] NULL,
  [observacoes] [varchar](max) NULL,
  [observacoes_cliente] [varchar](max) NULL,
  [clientes_id] [int] NOT NULL,
  [usuarios_id] [int] NULL,
  [lancamentos_id] [int] NULL,
  PRIMARY KEY CLUSTERED ([idVendas] ASC) WITH (
    PAD_INDEX = OFF,
    STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF,
    ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON,
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
  ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE
  [dbo].[ci_sessions]
ADD
  DEFAULT ((0)) FOR [timestamp]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__pessoa__276EDEB3] DEFAULT ((1)) FOR [pessoa_fisica]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__celula__286302EC] DEFAULT (NULL) FOR [celular]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__dataCa__29572725] DEFAULT (NULL) FOR [dataCadastro]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__rua__2A4B4B5E] DEFAULT (NULL) FOR [rua]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__numero__2B3F6F97] DEFAULT (NULL) FOR [numero]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__bairro__2C3393D0] DEFAULT (NULL) FOR [bairro]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__cidade__2D27B809] DEFAULT (NULL) FOR [cidade]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__estado__2E1BDC42] DEFAULT (NULL) FOR [estado]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__cep__2F10007B] DEFAULT (NULL) FOR [cep]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__contat__300424B4] DEFAULT (NULL) FOR [contato]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__comple__30F848ED] DEFAULT (NULL) FOR [complemento]
ALTER TABLE
  [dbo].[clientes]
ADD
  CONSTRAINT [DF__clientes__fornec__31EC6D26] DEFAULT ((0)) FOR [fornecedor]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [charge_id]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [conditional_discount_date]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [created_at]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [custom_id]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [payment_method]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [payment_url]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [request_delivery_address]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [total]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [payment_gateway]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [pdf]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [vendas_id]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [os_id]
ALTER TABLE
  [dbo].[cobrancas]
ADD
  DEFAULT (NULL) FOR [clientes_id]
ALTER TABLE
  [dbo].[email_queue]
ADD
  DEFAULT (NULL) FOR [cc]
ALTER TABLE
  [dbo].[email_queue]
ADD
  DEFAULT (NULL) FOR [bcc]
ALTER TABLE
  [dbo].[email_queue]
ADD
  DEFAULT (NULL) FOR [status]
ALTER TABLE
  [dbo].[email_queue]
ADD
  DEFAULT (NULL) FOR [date]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancament__descr__44FF419A] DEFAULT (NULL) FOR [descricao]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancament__data___45F365D3] DEFAULT (NULL) FOR [data_pagamento]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancament__baixa__46E78A0C] DEFAULT ((0)) FOR [baixado]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancament__clien__47DBAE45] DEFAULT (NULL) FOR [cliente_fornecedor]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancament__forma__48CFD27E] DEFAULT (NULL) FOR [forma_pgto]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancamento__tipo__49C3F6B7] DEFAULT (NULL) FOR [tipo]
ALTER TABLE
  [dbo].[lancamentos]
ADD
  CONSTRAINT [DF__lancament__clien__4AB81AF0] DEFAULT (NULL) FOR [clientes_id]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__dataInicial__5441852A] DEFAULT (NULL) FOR [dataInicial]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__dataFinal__5535A963] DEFAULT (NULL) FOR [dataFinal]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__garantia__5629CD9C] DEFAULT (NULL) FOR [garantia]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__descricaoPro__571DF1D5] DEFAULT (NULL) FOR [descricaoProduto]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__defeito__5812160E] DEFAULT (NULL) FOR [defeito]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__status__59063A47] DEFAULT (NULL) FOR [status]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__observacoes__59FA5E80] DEFAULT (NULL) FOR [observacoes]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__laudoTecnico__5AEE82B9] DEFAULT (NULL) FOR [laudoTecnico]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__valorTotal__5BE2A6F2] DEFAULT (NULL) FOR [valorTotal]
ALTER TABLE
  [dbo].[os]
ADD
  CONSTRAINT [DF__os__lancamento__5CD6CB2B] DEFAULT (NULL) FOR [lancamento]
ALTER TABLE
  [dbo].[produtos]
ADD
  DEFAULT (NULL) FOR [unidade]
ALTER TABLE
  [dbo].[produtos]
ADD
  DEFAULT (NULL) FOR [precoCompra]
ALTER TABLE
  [dbo].[produtos]
ADD
  DEFAULT (NULL) FOR [estoqueMinimo]
ALTER TABLE
  [dbo].[produtos]
ADD
  DEFAULT (NULL) FOR [saida]
ALTER TABLE
  [dbo].[produtos]
ADD
  DEFAULT (NULL) FOR [entrada]
ALTER TABLE
  [dbo].[produtos_os]
ADD
  DEFAULT (NULL) FOR [subTotal]
ALTER TABLE
  [dbo].[servicos]
ADD
  DEFAULT (NULL) FOR [descricao]
ALTER TABLE
  [dbo].[servicos_os]
ADD
  DEFAULT (NULL) FOR [subTotal]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__rg__3A81B327] DEFAULT (NULL) FOR [rg]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__rua__3B75D760] DEFAULT (NULL) FOR [rua]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__numero__3C69FB99] DEFAULT (NULL) FOR [numero]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__bairro__3D5E1FD2] DEFAULT (NULL) FOR [bairro]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__cidade__3E52440B] DEFAULT (NULL) FOR [cidade]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__estado__3F466844] DEFAULT (NULL) FOR [estado]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__celula__403A8C7D] DEFAULT (NULL) FOR [celular]
ALTER TABLE
  [dbo].[usuarios]
ADD
  CONSTRAINT [DF__usuarios__dataEx__412EB0B6] DEFAULT (NULL) FOR [dataExpiracao]
ALTER TABLE
  [dbo].[anexos] WITH CHECK
ADD
  CONSTRAINT [fk_anexos_os1] FOREIGN KEY([os_id]) REFERENCES [dbo].[os] ([idOs])
ALTER TABLE
  [dbo].[anexos] CHECK CONSTRAINT [fk_anexos_os1]
ALTER TABLE
  [dbo].[carros] WITH CHECK
ADD
  CONSTRAINT [FK_carros_clientes] FOREIGN KEY([idClientes]) REFERENCES [dbo].[clientes] ([idClientes])
ALTER TABLE
  [dbo].[carros] CHECK CONSTRAINT [FK_carros_clientes]
ALTER TABLE
  [dbo].[cobrancas] WITH CHECK
ADD
  CONSTRAINT [fk_cobrancas_clientes1] FOREIGN KEY([clientes_id]) REFERENCES [dbo].[clientes] ([idClientes])
ALTER TABLE
  [dbo].[cobrancas] CHECK CONSTRAINT [fk_cobrancas_clientes1]
ALTER TABLE
  [dbo].[cobrancas] WITH CHECK
ADD
  CONSTRAINT [fk_cobrancas_os1] FOREIGN KEY([os_id]) REFERENCES [dbo].[os] ([idOs])
ALTER TABLE
  [dbo].[cobrancas] CHECK CONSTRAINT [fk_cobrancas_os1]
ALTER TABLE
  [dbo].[cobrancas] WITH CHECK
ADD
  CONSTRAINT [fk_cobrancas_vendas1] FOREIGN KEY([vendas_id]) REFERENCES [dbo].[vendas] ([idVendas])
ALTER TABLE
  [dbo].[cobrancas] CHECK CONSTRAINT [fk_cobrancas_vendas1]
ALTER TABLE
  [dbo].[equipamentos] WITH CHECK
ADD
  CONSTRAINT [fk_equipanentos_clientes1] FOREIGN KEY([clientes_id]) REFERENCES [dbo].[clientes] ([idClientes])
ALTER TABLE
  [dbo].[equipamentos] CHECK CONSTRAINT [fk_equipanentos_clientes1]
ALTER TABLE
  [dbo].[equipamentos] WITH CHECK
ADD
  CONSTRAINT [fk_equipanentos_marcas1] FOREIGN KEY([marcas_id]) REFERENCES [dbo].[marcas] ([idMarcas])
ALTER TABLE
  [dbo].[equipamentos] CHECK CONSTRAINT [fk_equipanentos_marcas1]
ALTER TABLE
  [dbo].[equipamentos_os] WITH CHECK
ADD
  CONSTRAINT [fk_equipamentos_os_equipanentos1] FOREIGN KEY([equipamentos_id]) REFERENCES [dbo].[equipamentos] ([idEquipamentos])
ALTER TABLE
  [dbo].[equipamentos_os] CHECK CONSTRAINT [fk_equipamentos_os_equipanentos1]
ALTER TABLE
  [dbo].[equipamentos_os] WITH CHECK
ADD
  CONSTRAINT [fk_equipamentos_os_os1] FOREIGN KEY([os_id]) REFERENCES [dbo].[os] ([idOs])
ALTER TABLE
  [dbo].[equipamentos_os] CHECK CONSTRAINT [fk_equipamentos_os_os1]
ALTER TABLE
  [dbo].[garantias] WITH CHECK
ADD
  CONSTRAINT [fk_garantias_usuarios1] FOREIGN KEY([usuarios_id]) REFERENCES [dbo].[usuarios] ([idUsuarios])
ALTER TABLE
  [dbo].[garantias] CHECK CONSTRAINT [fk_garantias_usuarios1]
ALTER TABLE
  [dbo].[itens_de_vendas] WITH CHECK
ADD
  CONSTRAINT [fk_itens_de_vendas_produtos1] FOREIGN KEY([produtos_id]) REFERENCES [dbo].[produtos] ([idProdutos])
ALTER TABLE
  [dbo].[itens_de_vendas] CHECK CONSTRAINT [fk_itens_de_vendas_produtos1]
ALTER TABLE
  [dbo].[itens_de_vendas] WITH CHECK
ADD
  CONSTRAINT [fk_itens_de_vendas_vendas1] FOREIGN KEY([vendas_id]) REFERENCES [dbo].[vendas] ([idVendas])
ALTER TABLE
  [dbo].[itens_de_vendas] CHECK CONSTRAINT [fk_itens_de_vendas_vendas1]
ALTER TABLE
  [dbo].[lancamentos] WITH CHECK
ADD
  CONSTRAINT [fk_lancamentos_categorias1] FOREIGN KEY([categorias_id]) REFERENCES [dbo].[categorias] ([idCategorias])
ALTER TABLE
  [dbo].[lancamentos] CHECK CONSTRAINT [fk_lancamentos_categorias1]
ALTER TABLE
  [dbo].[lancamentos] WITH CHECK
ADD
  CONSTRAINT [fk_lancamentos_clientes1] FOREIGN KEY([clientes_id]) REFERENCES [dbo].[clientes] ([idClientes])
ALTER TABLE
  [dbo].[lancamentos] CHECK CONSTRAINT [fk_lancamentos_clientes1]
ALTER TABLE
  [dbo].[lancamentos] WITH CHECK
ADD
  CONSTRAINT [fk_lancamentos_contas1] FOREIGN KEY([contas_id]) REFERENCES [dbo].[contas] ([idContas])
ALTER TABLE
  [dbo].[lancamentos] CHECK CONSTRAINT [fk_lancamentos_contas1]
ALTER TABLE
  [dbo].[lancamentos] WITH CHECK
ADD
  CONSTRAINT [fk_lancamentos_usuarios1] FOREIGN KEY([usuarios_id]) REFERENCES [dbo].[usuarios] ([idUsuarios])
ALTER TABLE
  [dbo].[lancamentos] CHECK CONSTRAINT [fk_lancamentos_usuarios1]
ALTER TABLE
  [dbo].[os] WITH CHECK
ADD
  CONSTRAINT [fk_os_clientes1] FOREIGN KEY([clientes_id]) REFERENCES [dbo].[clientes] ([idClientes])
ALTER TABLE
  [dbo].[os] CHECK CONSTRAINT [fk_os_clientes1]
ALTER TABLE
  [dbo].[os] WITH CHECK
ADD
  CONSTRAINT [fk_os_lancamentos1] FOREIGN KEY([lancamento]) REFERENCES [dbo].[lancamentos] ([idLancamentos])
ALTER TABLE
  [dbo].[os] CHECK CONSTRAINT [fk_os_lancamentos1]
ALTER TABLE
  [dbo].[os] WITH CHECK
ADD
  CONSTRAINT [fk_os_usuarios1] FOREIGN KEY([usuarios_id]) REFERENCES [dbo].[usuarios] ([idUsuarios])
ALTER TABLE
  [dbo].[os] CHECK CONSTRAINT [fk_os_usuarios1]
ALTER TABLE
  [dbo].[produtos_os] WITH CHECK
ADD
  CONSTRAINT [fk_produtos_os_os1] FOREIGN KEY([os_id]) REFERENCES [dbo].[os] ([idOs])
ALTER TABLE
  [dbo].[produtos_os] CHECK CONSTRAINT [fk_produtos_os_os1]
ALTER TABLE
  [dbo].[produtos_os] WITH CHECK
ADD
  CONSTRAINT [fk_produtos_os_produtos1] FOREIGN KEY([produtos_id]) REFERENCES [dbo].[produtos] ([idProdutos])
ALTER TABLE
  [dbo].[produtos_os] CHECK CONSTRAINT [fk_produtos_os_produtos1]
ALTER TABLE
  [dbo].[servicos_os] WITH CHECK
ADD
  CONSTRAINT [fk_servicos_os_os1] FOREIGN KEY([os_id]) REFERENCES [dbo].[os] ([idOs])
ALTER TABLE
  [dbo].[servicos_os] CHECK CONSTRAINT [fk_servicos_os_os1]
ALTER TABLE
  [dbo].[servicos_os] WITH CHECK
ADD
  CONSTRAINT [fk_servicos_os_servicos1] FOREIGN KEY([servicos_id]) REFERENCES [dbo].[servicos] ([idServicos])
ALTER TABLE
  [dbo].[servicos_os] CHECK CONSTRAINT [fk_servicos_os_servicos1]
ALTER TABLE
  [dbo].[usuarios] WITH CHECK
ADD
  CONSTRAINT [fk_usuarios_permissoes1] FOREIGN KEY([permissoes_id]) REFERENCES [dbo].[permissoes] ([idPermissao])
ALTER TABLE
  [dbo].[usuarios] CHECK CONSTRAINT [fk_usuarios_permissoes1]
ALTER TABLE
  [dbo].[vendas] WITH CHECK
ADD
  CONSTRAINT [fk_vendas_clientes1] FOREIGN KEY([clientes_id]) REFERENCES [dbo].[clientes] ([idClientes])
ALTER TABLE
  [dbo].[vendas] CHECK CONSTRAINT [fk_vendas_clientes1]
ALTER TABLE
  [dbo].[vendas] WITH CHECK
ADD
  CONSTRAINT [fk_vendas_lancamentos1] FOREIGN KEY([lancamentos_id]) REFERENCES [dbo].[lancamentos] ([idLancamentos])
ALTER TABLE
  [dbo].[vendas] CHECK CONSTRAINT [fk_vendas_lancamentos1]
ALTER TABLE
  [dbo].[vendas] WITH CHECK
ADD
  CONSTRAINT [fk_vendas_usuarios1] FOREIGN KEY([usuarios_id]) REFERENCES [dbo].[usuarios] ([idUsuarios])
ALTER TABLE
  [dbo].[vendas] CHECK CONSTRAINT [fk_vendas_usuarios1]
ALTER TABLE
  [dbo].[ci_sessions] WITH CHECK
ADD
  CHECK (([timestamp] >(0)))
ALTER TABLE
  [dbo].[email_queue] WITH CHECK
ADD
  CHECK (
    (
      [status] = 'failed'
      OR [status] = 'sent'
      OR [status] = 'sending'
      OR [status] = 'pending'
    )
  )

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

INSERT INTO  permissoes ([nome], [permissoes], [situacao], [data])
VALUES ('Administrador', 'a:57:{s:8:"aCliente";s:1:"1";s:8:"eCliente";s:1:"1";s:8:"dCliente";s:1:"1";s:8:"vCliente";s:1:"1";s:6:"aCarro";s:1:"1";s:6:"eCarro";s:1:"1";s:6:"dCarro";s:1:"1";s:6:"vCarro";s:1:"1";s:8:"aProduto";s:1:"1";s:8:"eProduto";s:1:"1";s:8:"dProduto";s:1:"1";s:8:"vProduto";s:1:"1";s:8:"aServico";s:1:"1";s:8:"eServico";s:1:"1";s:8:"dServico";s:1:"1";s:8:"vServico";s:1:"1";s:3:"aOs";s:1:"1";s:3:"eOs";s:1:"1";s:3:"dOs";s:1:"1";s:3:"vOs";s:1:"1";s:6:"aVenda";s:1:"1";s:6:"eVenda";s:1:"1";s:6:"dVenda";s:1:"1";s:6:"vVenda";s:1:"1";s:9:"aGarantia";s:1:"1";s:9:"eGarantia";s:1:"1";s:9:"dGarantia";s:1:"1";s:9:"vGarantia";s:1:"1";s:8:"aArquivo";s:1:"1";s:8:"eArquivo";s:1:"1";s:8:"dArquivo";s:1:"1";s:8:"vArquivo";s:1:"1";s:10:"aPagamento";N;s:10:"ePagamento";N;s:10:"dPagamento";N;s:10:"vPagamento";N;s:11:"aLancamento";s:1:"1";s:11:"eLancamento";s:1:"1";s:11:"dLancamento";s:1:"1";s:11:"vLancamento";s:1:"1";s:8:"cUsuario";s:1:"1";s:9:"cEmitente";s:1:"1";s:10:"cPermissao";s:1:"1";s:7:"cBackup";s:1:"1";s:10:"cAuditoria";s:1:"1";s:6:"cEmail";s:1:"1";s:8:"cSistema";s:1:"1";s:8:"rCliente";s:1:"1";s:8:"rProduto";s:1:"1";s:8:"rServico";s:1:"1";s:3:"rOs";s:1:"1";s:6:"rVenda";s:1:"1";s:11:"rFinanceiro";s:1:"1";s:9:"aCobranca";s:1:"1";s:9:"eCobranca";s:1:"1";s:9:"dCobranca";s:1:"1";s:9:"vCobranca";s:1:"1";}', 1, 'admin_created_at');

INSERT INTO usuarios ([nome], [rg], [cpf], [cep], [rua], [numero], [bairro], [cidade], [estado], [email], [senha], [telefone], [celular], [situacao], [dataCadastro], [permissoes_id],[dataExpiracao]) 
VALUES ('admin_name', 'SP-418.150.X', '381.699.388-XX', '08577-000', 'Av. Itaquaquecetuba', '00', 'Monte Belo', 'Itaquaquecetuba', 'SP', 'admin_email', 'admin_password', '000000-0000', '', 1, GETDATE(), 1, '30000101');

INSERT INTO migrations([version])
VALUES ('20210507010244');
