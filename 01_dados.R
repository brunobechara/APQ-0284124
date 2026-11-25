# ---------------------------------------------------------------------------
# 01_dados.R — leitura, dicionário (codebook), rotulagem e variáveis derivadas
# Fonte: exportação REDCap "ProjetoTSOMetabase_DATA_<data>.csv"
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# 1. Localiza o arquivo de dados mais recente
# ---------------------------------------------------------------------------

localizar_dados <- function(caminho = NULL) {
  if (!is.null(caminho) && file.exists(caminho)) return(caminho)
  pastas <- c("dados", ".", "data", "../dados", "/mnt/project")
  candidatos <- unlist(lapply(pastas, function(p) {
    if (!dir.exists(p)) return(character(0))
    list.files(p, pattern = "^ProjetoTSO.*DATA.*\\.csv$", full.names = TRUE)
  }))
  if (!length(candidatos)) {
    stop("Arquivo de dados não encontrado. Coloque o CSV exportado do REDCap ",
         "na pasta 'dados/' do projeto.", call. = FALSE)
  }
  candidatos[order(file.mtime(candidatos), decreasing = TRUE)][1]
}

ARQUIVO_DADOS <- localizar_dados()

dados_brutos <- readr::read_csv(
  ARQUIVO_DADOS,
  locale = readr::locale(encoding = "UTF-8"),
  na = c("", "NA", "[not completed]"),
  show_col_types = FALSE,
  progress = FALSE
)

# ---------------------------------------------------------------------------
# 2. Escalas compartilhadas
# ---------------------------------------------------------------------------

ESC_FREQ    <- c("Nunca", "Raramente", "Às vezes", "Frequentemente", "Sempre", "Não sei")
ESC_AVAL_C  <- c("Muito ruim", "Ruim", "Regular", "Bom/Boa", "Muito bom/boa", "Não conheço")
ESC_AVAL_R  <- c("Muito ruim", "Ruim", "Regular", "Bom/Boa", "Muito bom/boa", "Não recebo")
ESC_AVAL_S  <- c("Muito ruim", "Ruim", "Regular", "Bom/Boa", "Muito bom/boa", "Não sei")
ESC_TRATO   <- c("Sempre com respeito", "Às vezes com pouco respeito",
                 "De forma inadequada", "De forma abusiva", "Com assédio", "Não sei")
ESC_QUAL    <- c("Ótima", "Boa", "Regular", "Ruim", "Péssima", "Não sei dizer")
ESC_CUIDADO <- c("Eu faço sozinho/a", "Eu faço a maior parte",
                 "Divido com companheiras/os ou esposas/os",
                 "Outra/s pessoa/s faz/em a maior parte", "Não realizo")
ESC_SIMNAO  <- c("Sim", "Não")

# ---------------------------------------------------------------------------
# 3. Blocos de variáveis (usados no dashboard inteiro)
# ---------------------------------------------------------------------------

BLOCOS <- list(
  identificacao = c("record_id", "enquete_timestamp", "aceite", "operario"),
  
  perfil = c("dtnasc", "genero", "raca", "osexual", "municipio", "deslocamento",
             "vizinhobarragens"),
  
  vinculo = c("empresa", "vinculo", "diretoclt", "preferencia", "natureza",
              "perder", "setor", "temposetor", "tempomineracao",
              "deficiencia", "deficienciatrab"),
  
  gestao = c("contrato", "particular", "afastsaude", "plano"),
  
  remuneracao = c("salario", "horae", "valealiment", "adnot", "insalubridade",
                  "periculosidade", "descontos", "coparticipacao",
                  "existbh", "cbancoh", "bancoh", "plr"),
  
  financas = c("renda", "situacaofi", "emprestimo", "incentivo"),
  
  jornada = c("jornada", "jornadaa", "modalidade"),
  
  condicoes = c("jornada3", "intervalo", "descanso", "equipamentos",
                "ambiente", "ambiente_riscos", "autonomia", "riscos"),
  
  tecnologia = c("implementacao", "intensificacao", "complexidade", "metas",
                 "emprego", "seguranca", "controle", "insercao", "cominterna",
                 "aprendizado", "autonomiar", "sentimento", "estresse",
                 "treinamento", "impactosal", "produtivitec"),
  
  trato = c("superioresh", "superioresm", "subordinados", "subordinadas",
            "operarios", "operarias", "terceiros", "socupacional", "demais"),
  
  clima = c("valorizacao", "respeito", "colaboracao", "comunicacao",
            "pertencimento", "gestaoparticipativa", "inovacao",
            "igualdadeoportunidades", "apoio"),
  
  violencias = c("desviof", "assediomoral", "assediosexual", "lgbtfobia",
                 "capacitismo", "xenofobia", "racismo", "misoginia",
                 "violenciafisica", "etarismo"),
  
  cargas = c("trabhextras", "desvio", "sobrecarga", "pausas", "opiniao",
             "pressao", "riscosambiente", "presenciar", "esgotamento",
             "acidtraba", "epi"),
  
  riscos_amb = c("altura", "tensao", "desniveis", "temperatura", "eletricidade",
                 "ergonomia", "biol_gicos", "explosivos", "pausa", "iluminacao",
                 "fogo", "barragens", "maquinas", "manutencao", "mudancas",
                 "peso", "poeiraexplosiva", "poeiramienral", "quimicos",
                 "projecao", "queda", "raios", "repetitividade", "ruidos",
                 "acelerado", "noturno", "solitario", "acesso", "vibracao"),
  
  acidentes = c("comunicacid", "cat"),
  
  saude_geral = c("saude_antes", "saude", "sono", "alimentacao", "moradia",
                  "saudetrab", "afastamentos", "irdoente"),
  
  substancias = c("medicamentos", "motivo_uso", "drogasoperarios", "usoalcool",
                  "usodrogas", "usodrogastrabalho"),
  
  cuidado_saude = c("tempocuidado", "previnstitucional", "periodicos"),
  
  cuidado_vida = c("cuidadocasa", "filhos", "cuidadopessoas", "orgcasa",
                   "lazer", "estudos", "arte", "politica", "jornadacuidado"),
  
  sindicato = c("sindical", "diretoria", "contribuicao", "entrevista", "avaliacao")
)

# ---------------------------------------------------------------------------
# 4. Codebook: código numérico -> rótulo
# ---------------------------------------------------------------------------

cb  <- function(codigos, rotulos) stats::setNames(rotulos, as.character(codigos))
esc <- function(rotulos) cb(seq_along(rotulos), rotulos)

codebook <- list(
  
  aceite   = esc(ESC_SIMNAO),
  operario = esc(ESC_SIMNAO),
  
  genero = esc(c("Homem cisgênero", "Mulher cisgênero", "Homem transgênero",
                 "Mulher transgênero", "Não binário/a", "Outro", "Não sei dizer")),
  raca   = esc(c("Amarela", "Branca", "Indígena", "Parda", "Preta", "Não sei dizer")),
  osexual = esc(c("Assexual", "Bissexual", "Heterossexual", "Homossexual",
                  "Outro", "Não sei dizer")),
  municipio = esc(c("Belo Horizonte", "Belo Vale", "Carandaí", "Congonhas",
                    "Conselheiro Lafaiete", "Cristiano Otoni",
                    "Desterro de Entre Rios", "Entre Rios", "Itabirito",
                    "Jeceaba", "Lagoa Dourada", "Mariana", "Ouro Branco",
                    "Ouro Preto", "Santa Bárbara", "São Brás do Suaçuí", "Outro")),
  deslocamento = esc(c("5 min", "10 min", "15 min", "30 min", "45 min",
                       "60 min (1h)", "90 min (1h30)", "120 min (2h)",
                       "mais de 2h")),
  empresa = esc(c("CSN: Pires", "CSN: Casa de Pedra", "Ferro Puro e CDA",
                  "Ferro+ Mineração", "Gerdau: Miguel Bournier", "Gerdau: VL",
                  "JMN", "LGA Mineração", "Minerinvest", "Nogueira Duarte",
                  "Polaris/Terra Seca", "Vale: Timbopeba", "Vale: Fábrica",
                  "Vale: Viga", "WG Sinterização", "Terceirizada", "Outra")),
  vinculo = esc(c("Direto CLT", "Temporário/prazo determinado", "PJ",
                  "Trainee/capacitação", "Estagiário/a", "Outro", "Não sei dizer")),
  diretoclt   = esc(ESC_SIMNAO),
  preferencia = esc(ESC_SIMNAO),
  natureza = esc(c("Produção (atividade-fim)", "Infra-manutenção (atividade-meio)",
                   "Obras-projetos (eventual)", "Outra", "Não sei dizer")),
  perder = esc(c("Sim", "Não", "Não sei")),
  setor = esc(c("Operação: mina", "Operação: usina", "Operação: infraestrutura",
                "Manutenção: mina", "Manutenção: elétrica", "Manutenção: industrial",
                "Adm.: apoio operacional", "Adm.: engenharia", "Adm.: planejamento",
                "Adm.: saúde ocupacional", "Administrativo", "Outro",
                "Prefiro não responder")),
  deficiencia     = esc(c("Sim", "Não", "Não sei dizer")),
  deficienciatrab = esc(c("Sim", "Não", "Não sei dizer")),
  
  incentivo = esc(ESC_SIMNAO),
  
  renda = cb(c(1, 2, 3, 5),
             c("Única fonte de renda da família",
               "Complementada por trabalho de familiares",
               "Complementada por outra atividade minha",
               "Não é renda familiar (despesas pessoais)")),
  situacaofi = esc(c("Muito boa", "Boa", "Regular", "Ruim", "Muito ruim")),
  emprestimo = esc(c("Sim, compromete boa parte da renda",
                     "Sim, afeta pouco a renda", "Não")),
  
  jornada = esc(c("Revezamento 6h", "Revezamento 8h", "Administrativo",
                  "8h fixo dia", "8h fixo noite", "12h fixo dia",
                  "12h fixo noite", "12x36", "Outra")),
  jornadaa = esc(c("Sim", "Não", "Não sei dizer")),
  modalidade = cb(c(1, 2, 3, 5),
                  c("Presencial", "Teletrabalho integral",
                    "Híbrido", "Não sei dizer")),
  
  tecnologias = esc(c("Sim", "Não", "Não sei dizer")),
  
  comunicacid = esc(c("Nunca me acidentei no trabalho",
                      "Comuniquei imediatamente à chefia",
                      "Colega comunicou à chefia",
                      "A chefia presenciou o acidente",
                      "Registrado por câmera/sistema",
                      "Comuniquei depois, em outro momento",
                      "Não comuniquei", "Outra")),
  cat = esc(c("Sim", "Não", "Não sei")),
  
  afastamentos = esc(c("Sim", "Não", "Não, pois não solicitei",
                       "Não, pois não concederam")),
  irdoente = esc(c("Sim, porque tenho que ir trabalhar",
                   "Sim, porque fui convocado/a", "Não")),
  
  medicamentos = esc(ESC_SIMNAO),
  motivo_uso = esc(c("Já usava antes de trabalhar na mina/usina",
                     "Passei a usar depois de entrar na mina/usina",
                     "Passei a usar depois, mas sem relação com o trabalho",
                     "Outra opção")),
  usodrogas = esc(c("Não", "Já experimentei, não uso atualmente",
                    "Uso ocasionalmente", "Uso regularmente")),
  usodrogastrabalho = esc(c("Não há relação",
                            "Sim, contribuiu para o início do uso",
                            "Sim, contribui para a continuidade/aumento",
                            "Sim, dificulta a interrupção")),
  
  saude_antes = esc(c("Ficou melhor", "Continuou igual", "Ficou pior",
                      "Não sei dizer")),
  saudetrab   = esc(c("Sim", "Não", "Não sei")),
  
  previnstitucional = esc(c("Ótimo", "Bom", "Regular", "Insuficiente",
                            "Inexistente", "Não sei dizer")),
  # rótulos harmonizados com previnstitucional para permitir a leitura conjunta
  periodicos = esc(c("Ótimo", "Bom", "Regular", "Insuficiente",
                     "Inexistente", "Não sei dizer")),
  
  jornadacuidado = esc(c("A jornada atual, com flexibilização",
                         "Revezamento 6h", "Revezamento 6h com flexibilização",
                         "Revezamento 8h", "Revezamento 8h com flexibilização",
                         "Administrativo", "Administrativo com flexibilização",
                         "8h fixo dia", "8h fixo dia com flexibilização",
                         "8h fixo noite", "8h fixo noite com flexibilização",
                         "12h fixo dia", "12h fixo dia com flexibilização",
                         "12h fixo noite", "12h fixo noite com flexibilização",
                         "12x36", "12x36 com flexibilização", "Outra")),
  
  vizinhobarragens = esc(ESC_SIMNAO),
  sindical  = cb(c(1, 2, 4), c("Sim", "Não", "Não sei o que é um sindicato")),
  diretoria = esc(ESC_SIMNAO),
  contribuicao = esc(c("Sim", "Não", "Não sei dizer")),
  entrevista   = esc(ESC_SIMNAO),
  avaliacao = esc(c("Muito bom", "Bom", "Regular", "Ruim", "Muito ruim")),
  enquete_complete = cb(c(0, 1, 2), c("Incompleta", "Não verificada", "Completa"))
)

# Escalas repetidas
for (v in c(BLOCOS$tecnologia, BLOCOS$clima, BLOCOS$violencias,
            BLOCOS$cargas, BLOCOS$riscos_amb, "drogasoperarios", "usoalcool")) {
  codebook[[v]] <- esc(ESC_FREQ)
}
for (v in BLOCOS$gestao)      codebook[[v]] <- esc(ESC_AVAL_C)
for (v in BLOCOS$remuneracao) codebook[[v]] <- esc(ESC_AVAL_R)
for (v in BLOCOS$condicoes)   codebook[[v]] <- esc(ESC_AVAL_S)
for (v in BLOCOS$trato)       codebook[[v]] <- esc(ESC_TRATO)
for (v in c("saude", "sono", "alimentacao", "moradia")) codebook[[v]] <- esc(ESC_QUAL)
for (v in setdiff(BLOCOS$cuidado_vida, "jornadacuidado")) codebook[[v]] <- esc(ESC_CUIDADO)

# ---------------------------------------------------------------------------
# 5. Rótulos curtos para gráficos
# ---------------------------------------------------------------------------

ROTULOS <- c(
  # gestão / remuneração
  contrato = "Contrato de trabalho", particular = "Folgas para assuntos particulares",
  afastsaude = "Regras de afastamento por saúde", plano = "Plano de cargos e salários",
  salario = "Salário", horae = "Horas extras", valealiment = "Vale-alimentação",
  adnot = "Adicional noturno", insalubridade = "Adicional de insalubridade",
  periculosidade = "Adicional de periculosidade",
  descontos = "Descontos de previdência privada",
  coparticipacao = "Coparticipação no plano de saúde",
  existbh = "Banco de horas", cbancoh = "Controle sobre o banco de horas",
  bancoh = "Recebimento do banco de horas", plr = "Participação nos lucros (PLR)",
  
  # condições
  jornada3 = "Duração da jornada", intervalo = "Intervalos intrajornada",
  descanso = "Intervalos entre jornadas (folga)",
  equipamentos = "Meios e equipamentos de trabalho",
  ambiente = "Ambiente: apoio e colaboração",
  ambiente_riscos = "Ambiente: segurança e proteção à saúde",
  autonomia = "Autonomia nas tarefas", riscos = "Apoio dos colegas frente aos riscos",
  
  # tecnologia
  implementacao = "Empresa coloca cada vez mais tecnologia",
  intensificacao = "Trabalho ficou mais puxado", complexidade = "Trabalho ficou mais difícil",
  metas = "Mais cobrança por metas", emprego = "Máquinas substituem trabalhadores",
  seguranca = "Trabalho ficou mais seguro", controle = "Mais vigilância e controle",
  insercao = "Mais mulheres no setor", cominterna = "Melhora a comunicação interna",
  aprendizado = "Preciso aprender coisas novas o tempo todo",
  autonomiar = "Perdi autonomia", sentimento = "Sinto-me menos valorizado/a",
  estresse = "Aumenta meu estresse", treinamento = "Recebi treinamento suficiente",
  impactosal = "Melhora meu salário", produtivitec = "Aumentou a produtividade",
  
  # trato
  superioresh = "Chefias homens", superioresm = "Chefias mulheres",
  subordinados = "Subordinados homens", subordinadas = "Subordinadas mulheres",
  operarios = "Trabalhadores homens", operarias = "Trabalhadoras mulheres",
  terceiros = "Terceirizados/as", socupacional = "Saúde ocupacional da empresa",
  demais = "Demais profissionais",
  
  # clima
  valorizacao = "Reconhecimento e valorização", respeito = "Respeito profissional",
  colaboracao = "Colaboração e trabalho em equipe",
  comunicacao = "Liberdade de expressão", pertencimento = "Senso de pertencimento",
  gestaoparticipativa = "Gestão participativa", inovacao = "Inovação e criatividade",
  igualdadeoportunidades = "Igualdade de oportunidades", apoio = "Apoio coletivo",
  
  # violências
  desviof = "Desvio de função", assediomoral = "Assédio moral",
  assediosexual = "Assédio sexual", lgbtfobia = "LGBTfobia",
  capacitismo = "Capacitismo", xenofobia = "Xenofobia", racismo = "Racismo",
  misoginia = "Misoginia", violenciafisica = "Violência física",
  etarismo = "Etarismo",
  
  # cargas
  trabhextras = "Trabalhar horas extras", desvio = "Trabalhos fora da minha função",
  sobrecarga = "Sobrecarga de tarefas", pausas = "Conseguir fazer pausas",
  opiniao = "Ser consultado/a sobre o trabalho", pressao = "Pressão para bater metas",
  riscosambiente = "Identificar riscos de acidente",
  presenciar = "Presenciar acidente de trabalho",
  esgotamento = "Esgotamento físico e/ou mental",
  acidtraba = "Acidente de trabalho", epi = "EPI confiáveis e novos",
  
  # riscos ambientais
  altura = "Altura / escadas", tensao = "Ambiente de tensão ou conflito",
  desniveis = "Desníveis", temperatura = "Calor / variação de temperatura",
  eletricidade = "Eletricidade", ergonomia = "Equipamentos não ergonômicos",
  biol_gicos = "Materiais biológicos", explosivos = "Materiais explosivos",
  pausa = "Falta de pausas", iluminacao = "Iluminação inadequada",
  fogo = "Incêndios / explosões", barragens = "Instabilidade de taludes/barragens",
  maquinas = "Máquinas sem proteção", manutencao = "Manutenção corretiva",
  mudancas = "Mudança frequente de tarefas", peso = "Levantamento de peso",
  poeiraexplosiva = "Poeira explosiva", poeiramienral = "Poeira mineral",
  quimicos = "Produtos químicos/radioativos", projecao = "Projeção de particulados",
  queda = "Queda de objetos / desabamento", raios = "Raios",
  repetitividade = "Repetitividade", ruidos = "Ruídos",
  acelerado = "Ritmo acelerado", noturno = "Trabalho noturno",
  solitario = "Trabalho solitário", acesso = "Vias de acesso irregulares",
  vibracao = "Vibração de corpo inteiro",
  
  # saúde e vida
  saude = "Condição geral de saúde", sono = "Qualidade do sono",
  alimentacao = "Qualidade da alimentação", moradia = "Qualidade da moradia",
  drogasoperarios = "Uso de álcool/drogas ligado às condições de trabalho",
  usoalcool = "Frequência de consumo de álcool",
  previnstitucional = "Ações da empresa de prevenção e promoção da saúde",
  periodicos = "Exames periódicos da empresa",
  cuidadocasa = "Tarefas domésticas", filhos = "Cuidado de filhos/dependentes",
  cuidadopessoas = "Cuidado de familiares adoecidos",
  orgcasa = "Organização da casa", lazer = "Esporte e lazer",
  estudos = "Educação e estudos", arte = "Arte e cultura",
  politica = "Participação política e comunitária"
)

ROT_SINAIS <- c(
  "Agitação psicomotora", "Alterações do ritmo cardíaco", "Choro intenso",
  "Coceiras no corpo", "Consumo de álcool ou outras drogas",
  "Consumo intenso de medicações", "Dificuldades para respirar",
  "Dores em membros ou articulações", "Dores no estômago", "Enjoos",
  "Episódios de ansiedade", "Episódios depressivos", "Esgotamento físico",
  "Esgotamento mental", "Estado de estresse", "Fadiga depressiva",
  "Intoxicações", "Lesões autoprovocadas intencionalmente", "Sono intenso",
  "Tonturas", "Tremores no corpo", "Uso intenso de tabaco", "Outras",
  "Nunca passei por estas situações"
)

ROT_MORBIDADES <- c(
  "Infecciosas ou parasitárias", "Tumores (câncer)",
  "Sangue / imunidade", "Hormonais, alimentação ou metabolismo",
  "Transtornos mentais ou emocionais", "Sistema nervoso",
  "Olhos ou visão", "Ouvido / audição", "Coração ou circulação",
  "Pulmão ou respiração", "Estômago ou intestino", "Pele",
  "Ossos, músculos ou juntas", "Rins, bexiga ou órgãos sexuais",
  "Congênitas (de nascença)", "Causas externas",
  "Sintomas ainda sem diagnóstico", "Outras",
  "Não identifico adoecimentos"
)

ROT_ESTRATEGIAS <- c(
  "Acompanhamento terapêutico", "Automedicação", "Alimentação saudável",
  "Atividades artísticas", "Lazer ou cultura",
  "Consulta com profissionais de saúde/assistência social",
  "Descanso e sono adequado", "Encontros com amigos/família",
  "Exercícios físicos", "Atividades políticas ou sindicais",
  "Práticas religiosas ou de espiritualidade", "Outras",
  "Não adoto nenhuma estratégia"
)

ROT_JORNADASIM <- c(
  "Hora extra no local de trabalho", "Levando trabalho para casa",
  "Outra atividade de trabalho (complementação de renda)", "Outro"
)

ROTULOS_MULTI <- list(
  sinais = ROT_SINAIS, morbidades = ROT_MORBIDADES,
  estrategias = ROT_ESTRATEGIAS, jornadasim = ROT_JORNADASIM
)

#' Rótulo curto de uma variável (com fallback para o próprio nome)
rotular <- function(vars) {
  out <- unname(ROTULOS[vars])
  out[is.na(out)] <- vars[is.na(out)]
  out
}

# ---------------------------------------------------------------------------
# 6. Aplicação do codebook + variáveis derivadas
# ---------------------------------------------------------------------------

aplicar_codebook <- function(d, cbook = codebook) {
  for (v in names(cbook)) {
    if (!v %in% names(d)) next
    mapa <- cbook[[v]]
    d[[v]] <- factor(unname(mapa[as.character(d[[v]])]), levels = unname(mapa))
  }
  d
}

# Converte escala ordinal de 5 pontos em número (o 6º nível vira NA)
num5 <- function(x) {
  z <- as.integer(x)
  z[!is.na(z) & z > 5] <- NA_integer_
  z
}

#' Índice sintético 0–100 a partir de itens de 5 pontos.
#' @param inverter TRUE quando o nível 1 é o "melhor" e queremos que
#'   valores altos indiquem intensidade do fenômeno.
indice_0100 <- function(d, vars, inverter = FALSE, min_prop = 0.5) {
  vars <- intersect(vars, names(d))
  m <- vapply(vars, function(v) as.numeric(num5(d[[v]])),
              numeric(nrow(d)))
  if (is.null(dim(m))) m <- matrix(m, nrow = nrow(d))
  if (inverter) m <- 6 - m
  prop_ok <- rowMeans(!is.na(m))
  medias  <- rowMeans(m, na.rm = TRUE)
  out <- (medias - 1) / 4 * 100
  out[prop_ok < min_prop] <- NA_real_
  as.numeric(out)
}

soma_multi <- function(d, prefixo, excluir = integer(0)) {
  cols <- grep(paste0("^", prefixo, "___[0-9]+$"), names(d), value = TRUE)
  idx  <- as.integer(sub(paste0("^", prefixo, "___"), "", cols))
  cols <- cols[!idx %in% excluir]
  if (!length(cols)) return(rep(NA_integer_, nrow(d)))
  as.integer(rowSums(d[cols], na.rm = TRUE))
}

respondeu_multi <- function(d, prefixo) {
  cols <- grep(paste0("^", prefixo, "___[0-9]+$"), names(d), value = TRUE)
  rowSums(d[cols], na.rm = TRUE) > 0
}

d0 <- dados_brutos |>
  # anonimização: contatos não entram no dashboard
  dplyr::select(-dplyr::any_of(c("email", "redcap_survey_identifier"))) |>
  aplicar_codebook()

dados <- d0 |>
  dplyr::mutate(
    data_resposta = suppressWarnings(as.POSIXct(enquete_timestamp,
                                                tz = "America/Sao_Paulo")),
    mes_resposta  = as.Date(format(data_resposta, "%Y-%m-01")),
    
    # ano de nascimento: código 1 = 2006 ... código 47 = 1960; 48 = antes de 1960
    ano_nascimento = dplyr::if_else(dados_brutos$dtnasc <= 47,
                                    2007 - dados_brutos$dtnasc, NA_real_),
    ano_referencia = dplyr::coalesce(
      as.numeric(format(data_resposta, "%Y")),
      suppressWarnings(max(as.numeric(format(data_resposta, "%Y")), na.rm = TRUE))
    ),
    idade = ano_referencia - ano_nascimento,
    faixa_etaria = cut(idade, breaks = c(-Inf, 29, 39, 49, Inf),
                       labels = c("Até 29 anos", "30–39 anos",
                                  "40–49 anos", "50 anos ou mais")),
    
    # tempos: código 1 = "menos de 1 ano"; 2..41 = 1..40 anos; 42 = "40+"
    anos_setor = dplyr::case_when(
      dados_brutos$temposetor == 1  ~ 0.5,
      dados_brutos$temposetor == 42 ~ 41,
      TRUE ~ dados_brutos$temposetor - 1
    ),
    anos_mineracao = dplyr::case_when(
      dados_brutos$tempomineracao == 1  ~ 0.5,
      dados_brutos$tempomineracao == 42 ~ 41,
      TRUE ~ dados_brutos$tempomineracao - 1
    ),
    faixa_tempo = cut(anos_mineracao, breaks = c(-Inf, 2, 5, 10, 20, Inf),
                      labels = c("Até 2 anos", "3–5 anos", "6–10 anos",
                                 "11–20 anos", "Mais de 20 anos")),
    horas_cuidado_saude = dplyr::if_else(dados_brutos$tempocuidado == 37, 36,
                                         dados_brutos$tempocuidado - 1),
    
    # minutos de deslocamento (uma via)
    min_deslocamento = c(5, 10, 15, 30, 45, 60, 90, 120, 150)[dados_brutos$deslocamento],
    
    # --- índices sintéticos (0–100) -----------------------------------------
    idx_riscos        = indice_0100(d0, BLOCOS$riscos_amb),
    idx_violencias    = indice_0100(d0, BLOCOS$violencias),
    idx_cargas        = indice_0100(d0, c("trabhextras", "desvio", "sobrecarga",
                                          "pressao", "esgotamento")),
    idx_clima         = indice_0100(d0, BLOCOS$clima),
    idx_condicoes     = indice_0100(d0, BLOCOS$condicoes),
    idx_remuneracao   = indice_0100(d0, setdiff(BLOCOS$remuneracao,
                                                c("descontos", "coparticipacao"))),
    idx_tec_negativa  = indice_0100(d0, c("intensificacao", "complexidade",
                                          "metas", "controle", "autonomiar",
                                          "sentimento", "estresse")),
    idx_tec_positiva  = indice_0100(d0, c("seguranca", "cominterna", "insercao",
                                          "treinamento", "impactosal",
                                          "produtivitec")),
    idx_saude         = indice_0100(d0, c("saude", "sono", "alimentacao",
                                          "moradia"), inverter = TRUE),
    
    # --- contagens de blocos de múltipla escolha ----------------------------
    n_sinais       = soma_multi(dados_brutos, "sinais", excluir = 24),
    n_morbidades   = soma_multi(dados_brutos, "morbidades", excluir = 19),
    n_estrategias  = soma_multi(dados_brutos, "estrategias", excluir = 13),
    respondeu_sinais      = respondeu_multi(dados_brutos, "sinais"),
    respondeu_morbidades  = respondeu_multi(dados_brutos, "morbidades"),
    respondeu_estrategias = respondeu_multi(dados_brutos, "estrategias"),
    
    # --- marcadores analíticos ----------------------------------------------
    sofreu_acidente = dplyr::case_when(
      is.na(comunicacid) ~ NA,
      comunicacid == "Nunca me acidentei no trabalho" ~ FALSE,
      TRUE ~ TRUE
    ),
    presenteismo = dplyr::case_when(
      is.na(irdoente) ~ NA,
      irdoente == "Não" ~ FALSE,
      TRUE ~ TRUE
    )
  )

# ---------------------------------------------------------------------------
# 7. Bases analíticas
# ---------------------------------------------------------------------------

base <- dplyr::filter(dados, aceite == "Sim")

meta <- list(
  arquivo      = basename(ARQUIVO_DADOS),
  extraido_em  = format(file.mtime(ARQUIVO_DADOS), "%d/%m/%Y"),
  n_registros  = nrow(dados),
  n_base       = nrow(base),
  n_completas  = sum(base$enquete_complete == "Completa", na.rm = TRUE),
  periodo      = {
    dts <- range(dados$data_resposta, na.rm = TRUE)
    paste(format(dts[1], "%d/%m/%Y"), "a", format(dts[2], "%d/%m/%Y"))
  }
)