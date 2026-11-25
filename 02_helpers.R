# ---------------------------------------------------------------------------
# 02_helpers.R — funções de tabulação e visualização reutilizáveis
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Tabulações
# ---------------------------------------------------------------------------

#' Distribuição percentual de uma ou várias variáveis categóricas.
#' Retorna: item, variavel, categoria, n, pct, n_validos
tab_categorias <- function(d, vars, rotulos = NULL) {
  vars <- intersect(vars, names(d))
  if (!length(vars)) return(tibble::tibble())
  if (is.null(rotulos)) rotulos <- rotular(vars)
  res <- lapply(seq_along(vars), function(i) {
    x <- d[[vars[i]]]
    if (!is.factor(x)) x <- factor(x)
    tt <- table(x, useNA = "no")
    if (sum(tt) == 0) return(NULL)
    tibble::tibble(
      item      = rotulos[i],
      variavel  = vars[i],
      categoria = factor(names(tt), levels = levels(x)),
      n         = as.integer(tt),
      pct       = as.numeric(tt) / sum(tt),
      n_validos = as.integer(sum(tt))
    )
  })
  dplyr::bind_rows(res)
}

#' Percentual de respostas que caem em um conjunto de categorias-alvo.
pct_em <- function(d, var, categorias) {
  x <- d[[var]]
  x <- x[!is.na(x)]
  if (!length(x)) return(NA_real_)
  mean(as.character(x) %in% categorias)
}

#' Percentual que marcou ao menos uma das opções de um bloco de caixas de seleção.
#' Denominador: quem respondeu ao bloco (marcou qualquer opção).
#' Ex.: pct_marcou(base, "sinais", c(13, 14)) = % com esgotamento físico e/ou mental.
pct_marcou <- function(d, prefixo, indices) {
  todos <- grep(paste0("^", prefixo, "___[0-9]+$"), names(d), value = TRUE)
  cols  <- intersect(paste0(prefixo, "___", indices), names(d))
  if (!length(cols) || !nrow(d)) return(NA_real_)
  respondeu <- rowSums(d[todos], na.rm = TRUE) > 0
  if (!sum(respondeu)) return(NA_real_)
  mean(rowSums(d[respondeu, cols, drop = FALSE], na.rm = TRUE) > 0)
}

#' Tabulação de blocos de múltipla escolha (checkbox REDCap).
#' Denominador padrão: quem marcou ao menos uma opção do bloco.
tab_multi <- function(d, prefixo, rotulos = ROTULOS_MULTI[[prefixo]],
                      apenas_respondentes = TRUE, excluir = integer(0)) {
  cols <- grep(paste0("^", prefixo, "___[0-9]+$"), names(d), value = TRUE)
  if (!length(cols)) return(tibble::tibble())
  idx  <- as.integer(sub(paste0("^", prefixo, "___"), "", cols))
  ordem <- order(idx); cols <- cols[ordem]; idx <- idx[ordem]
  
  marcou_algo <- rowSums(d[cols], na.rm = TRUE) > 0
  denom <- if (apenas_respondentes) sum(marcou_algo) else nrow(d)
  manter <- !idx %in% excluir
  
  tibble::tibble(
    item = if (is.null(rotulos)) cols[manter] else rotulos[idx[manter]],
    variavel = cols[manter],
    n = vapply(cols[manter], function(cc) sum(d[[cc]], na.rm = TRUE), numeric(1)),
    denominador = denom
  ) |>
    dplyr::mutate(pct = n / denominador)
}

#' Resumo numérico compacto
resumo_num <- function(x) {
  x <- x[!is.na(x)]
  if (!length(x)) return(tibble::tibble())
  tibble::tibble(
    n = length(x), media = mean(x), dp = stats::sd(x),
    minimo = min(x), p25 = stats::quantile(x, .25),
    mediana = stats::median(x), p75 = stats::quantile(x, .75), maximo = max(x)
  )
}

# ---------------------------------------------------------------------------
# Gráficos
# ---------------------------------------------------------------------------

#' Barras 100% empilhadas para baterias de itens (escalas tipo Likert).
graf_100 <- function(tab, cores_base = CORES_RUIM_BOM, ordenar_por = NULL,
                     titulo = NULL, subtitulo = NULL, mostrar_n = TRUE,
                     decrescente = TRUE) {
  if (!nrow(tab)) return(plotly::plotly_empty())
  
  niveis_cat <- levels(tab$categoria)
  paleta <- paleta_escala(niveis_cat, cores_base)
  
  rotulo_item <- if (mostrar_n) {
    tab |>
      dplyr::distinct(item, n_validos) |>
      dplyr::mutate(lab = paste0(item, "  (n=", n_validos, ")"))
  } else {
    tab |> dplyr::distinct(item) |> dplyr::mutate(lab = item)
  }
  tab <- dplyr::left_join(tab, rotulo_item, by = intersect(names(tab), names(rotulo_item)))
  
  if (!is.null(ordenar_por)) {
    ord <- tab |>
      dplyr::group_by(lab) |>
      dplyr::summarise(score = sum(pct[as.character(categoria) %in% ordenar_por])) |>
      dplyr::arrange(if (decrescente) score else dplyr::desc(score))
    tab$lab <- factor(tab$lab, levels = ord$lab)
  } else {
    tab$lab <- factor(tab$lab, levels = rev(unique(tab$lab)))
  }
  
  p <- ggplot2::ggplot(
    tab,
    ggplot2::aes(
      x = pct, y = lab, fill = categoria,
      text = paste0("<b>", item, "</b><br>", categoria, ": ",
                    n, " (", pct_br(pct), ")<br>Respostas válidas: ", n_validos)
    )
  ) +
    ggplot2::geom_col(width = 0.74, position = ggplot2::position_stack(reverse = TRUE)) +
    ggplot2::scale_x_continuous(labels = function(x) pct_br(x, 1),
                                expand = c(0, 0), limits = c(0, 1)) +
    ggplot2::scale_fill_manual(values = paleta, drop = FALSE) +
    ggplot2::labs(x = NULL, y = NULL, title = titulo, subtitle = subtitulo) +
    tema_tso()
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::layout(
      legend = list(orientation = "h", x = 0, y = -0.12, font = list(size = 10)),
      margin = list(l = 10, r = 10, b = 40, t = if (is.null(titulo)) 10 else 40),
      hoverlabel = list(align = "left")
    ) |>
    plotly::config(displayModeBar = FALSE)
}

#' Ranking (lollipop) do percentual em categorias-alvo.
graf_ranking <- function(tab, categorias_alvo, cor = CORES$alerta,
                         titulo = NULL, subtitulo = NULL, top = NULL) {
  if (!nrow(tab)) return(plotly::plotly_empty())
  res <- tab |>
    dplyr::group_by(item, n_validos) |>
    dplyr::summarise(pct = sum(pct[as.character(categoria) %in% categorias_alvo]),
                     n = sum(n[as.character(categoria) %in% categorias_alvo])) |>
    dplyr::ungroup() |>
    dplyr::arrange(dplyr::desc(pct))
  if (!is.null(top)) res <- utils::head(res, top)
  res$item <- factor(res$item, levels = rev(res$item))
  
  p <- ggplot2::ggplot(
    res,
    ggplot2::aes(x = pct, y = item,
                 text = paste0("<b>", item, "</b><br>", pct_br(pct),
                               " (", n, " de ", n_validos, ")"))
  ) +
    ggplot2::geom_segment(ggplot2::aes(x = 0, xend = pct, y = item, yend = item),
                          colour = CORES$grade, linewidth = 1.6) +
    ggplot2::geom_point(size = 3, colour = cor) +
    ggplot2::scale_x_continuous(labels = function(x) pct_br(x, 1),
                                limits = c(0, max(res$pct) * 1.12 + 0.02),
                                expand = c(0, 0)) +
    ggplot2::labs(x = NULL, y = NULL, title = titulo, subtitle = subtitulo) +
    tema_tso()
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::layout(margin = list(l = 10, r = 20, b = 30,
                                 t = if (is.null(titulo)) 10 else 40)) |>
    plotly::config(displayModeBar = FALSE)
}

#' Barras horizontais para uma única variável categórica.
graf_barras <- function(d, var, cor = CORES$frio, ordenar = TRUE,
                        titulo = NULL, subtitulo = NULL, top = NULL,
                        mostrar_pct = TRUE) {
  tab <- tab_categorias(d, var)
  if (!nrow(tab)) return(plotly::plotly_empty())
  if (ordenar) tab <- dplyr::arrange(tab, pct)
  if (!is.null(top)) tab <- utils::tail(dplyr::arrange(tab, pct), top)
  tab$categoria <- factor(as.character(tab$categoria),
                          levels = if (ordenar) as.character(tab$categoria)
                          else rev(as.character(tab$categoria)))
  
  p <- ggplot2::ggplot(
    tab,
    ggplot2::aes(x = pct, y = categoria,
                 text = paste0("<b>", categoria, "</b><br>", n, " respostas (",
                               pct_br(pct), ")"))
  ) +
    ggplot2::geom_col(fill = cor, width = 0.72) +
    ggplot2::scale_x_continuous(labels = function(x) pct_br(x, 1),
                                expand = ggplot2::expansion(mult = c(0, 0.14))) +
    ggplot2::labs(x = NULL, y = NULL, title = titulo,
                  subtitle = subtitulo %||% paste0("n = ", tab$n_validos[1],
                                                   " respostas válidas")) +
    tema_tso()
  if (mostrar_pct) {
    p <- p + ggplot2::geom_text(ggplot2::aes(label = paste0(n, " · ", pct_br(pct, 1))),
                                hjust = -0.12, size = 3, colour = CORES$suave)
  }
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::layout(margin = list(l = 10, r = 10, b = 30, t = 45)) |>
    plotly::config(displayModeBar = FALSE)
}

#' Barras para blocos de múltipla escolha.
graf_multi <- function(tab, cor = CORES$roxo, titulo = NULL, subtitulo = NULL,
                       top = NULL) {
  if (!nrow(tab)) return(plotly::plotly_empty())
  tab <- dplyr::arrange(tab, pct)
  if (!is.null(top)) tab <- utils::tail(tab, top)
  tab$item <- factor(tab$item, levels = tab$item)
  
  p <- ggplot2::ggplot(
    tab,
    ggplot2::aes(x = pct, y = item,
                 text = paste0("<b>", item, "</b><br>", n, " de ", denominador,
                               " (", pct_br(pct), ")"))
  ) +
    ggplot2::geom_col(fill = cor, width = 0.72) +
    ggplot2::geom_text(ggplot2::aes(label = paste0(n, " · ", pct_br(pct, 1))),
                       hjust = -0.12, size = 3, colour = CORES$suave) +
    ggplot2::scale_x_continuous(labels = function(x) pct_br(x, 1),
                                expand = ggplot2::expansion(mult = c(0, 0.16))) +
    ggplot2::labs(x = NULL, y = NULL, title = titulo,
                  subtitle = subtitulo %||%
                    paste0("Base: ", tab$denominador[1],
                           " respondentes que marcaram ao menos uma opção")) +
    tema_tso()
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::layout(margin = list(l = 10, r = 10, b = 30, t = 45)) |>
    plotly::config(displayModeBar = FALSE)
}

#' Histograma / distribuição de variável numérica.
graf_numerico <- function(d, var, binwidth = NULL, cor = CORES$destaque,
                          titulo = NULL, eixo_x = NULL) {
  x <- d[[var]]
  x <- x[!is.na(x)]
  if (!length(x)) return(plotly::plotly_empty())
  p <- ggplot2::ggplot(tibble::tibble(x = x), ggplot2::aes(x = x)) +
    ggplot2::geom_histogram(binwidth = binwidth, fill = cor, colour = "white",
                            linewidth = 0.3) +
    ggplot2::geom_vline(xintercept = stats::median(x), linetype = "dashed",
                        colour = CORES$alerta) +
    ggplot2::labs(x = eixo_x %||% var, y = "Respondentes", title = titulo,
                  subtitle = paste0("n = ", length(x),
                                    " · mediana = ", num_br(stats::median(x), 0.1),
                                    " · média = ", num_br(mean(x), 0.1))) +
    tema_tso()
  plotly::ggplotly(p) |>
    plotly::layout(margin = list(t = 45)) |>
    plotly::config(displayModeBar = FALSE)
}

#' Comparação de um índice 0–100 entre grupos (média + intervalo).
graf_indice_grupo <- function(d, indice, grupo, min_n = 5, cor = CORES$frio,
                              titulo = NULL, rotulo_indice = NULL) {
  df <- d |>
    dplyr::filter(!is.na(.data[[indice]]), !is.na(.data[[grupo]])) |>
    dplyr::group_by(grupo = .data[[grupo]]) |>
    dplyr::summarise(n = dplyr::n(), media = mean(.data[[indice]]),
                     ep = stats::sd(.data[[indice]]) / sqrt(dplyr::n())) |>
    dplyr::filter(n >= min_n) |>
    dplyr::arrange(media)
  if (!nrow(df)) return(plotly::plotly_empty())
  df$grupo <- factor(as.character(df$grupo), levels = as.character(df$grupo))
  df$ep[is.na(df$ep)] <- 0
  
  p <- ggplot2::ggplot(
    df,
    ggplot2::aes(x = media, y = grupo,
                 text = paste0("<b>", grupo, "</b><br>Média: ", num_br(media),
                               "<br>n = ", n))
  ) +
    ggplot2::geom_segment(ggplot2::aes(x = pmax(0, media - 1.96 * ep),
                                       xend = pmin(100, media + 1.96 * ep),
                                       y = grupo, yend = grupo),
                          colour = CORES$grade, linewidth = 1.4) +
    ggplot2::geom_point(size = 3.2, colour = cor) +
    ggplot2::geom_vline(xintercept = mean(d[[indice]], na.rm = TRUE),
                        linetype = "dashed", colour = CORES$suave) +
    ggplot2::scale_x_continuous(limits = c(0, 100)) +
    ggplot2::labs(x = rotulo_indice %||% "Índice (0–100)", y = NULL, title = titulo,
                  subtitle = paste0("Linha tracejada = média geral (",
                                    num_br(mean(d[[indice]], na.rm = TRUE)),
                                    "). Grupos com n \u2265 ", min_n, ".")) +
    tema_tso()
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::layout(margin = list(t = 45)) |>
    plotly::config(displayModeBar = FALSE)
}

#' Matriz de correlação (Spearman) entre índices.
graf_correlacao <- function(d, vars, rotulos = NULL, titulo = NULL) {
  vars <- intersect(vars, names(d))
  m <- as.matrix(d[vars])
  cm <- suppressWarnings(stats::cor(m, use = "pairwise.complete.obs",
                                    method = "spearman"))
  if (is.null(rotulos)) rotulos <- vars
  dimnames(cm) <- list(rotulos, rotulos)
  tab <- as.data.frame(as.table(cm))
  names(tab) <- c("v1", "v2", "r")
  tab$v1 <- factor(tab$v1, levels = rotulos)
  tab$v2 <- factor(tab$v2, levels = rev(rotulos))
  
  p <- ggplot2::ggplot(
    tab,
    ggplot2::aes(x = v1, y = v2, fill = r,
                 text = paste0(v1, " × ", v2, "<br>rho = ", num_br(r, 0.01)))
  ) +
    ggplot2::geom_tile(colour = "white", linewidth = 0.6) +
    ggplot2::geom_text(ggplot2::aes(label = ifelse(is.na(r), "",
                                                   num_br(r, 0.01))),
                       size = 2.9, colour = CORES$escuro) +
    ggplot2::scale_fill_gradient2(low = CORES$frio, mid = "white",
                                  high = CORES$alerta, midpoint = 0,
                                  limits = c(-1, 1), na.value = "white") +
    ggplot2::labs(x = NULL, y = NULL, title = titulo, fill = "rho") +
    tema_tso() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 35, hjust = 1),
                   panel.grid = ggplot2::element_blank(),
                   legend.position = "right")
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::config(displayModeBar = FALSE)
}

#' Série temporal de respostas por mês.
graf_serie <- function(d, titulo = NULL) {
  df <- d |>
    dplyr::filter(!is.na(mes_resposta)) |>
    dplyr::count(mes_resposta, name = "n") |>
    dplyr::arrange(mes_resposta) |>
    dplyr::mutate(acumulado = cumsum(n))
  if (!nrow(df)) return(plotly::plotly_empty())
  
  p <- ggplot2::ggplot(
    df,
    ggplot2::aes(x = mes_resposta, y = n,
                 text = paste0(format(mes_resposta, "%m/%Y"), ": ", n,
                               " respostas<br>Acumulado: ", acumulado))
  ) +
    ggplot2::geom_col(fill = CORES$destaque, width = 22) +
    ggplot2::scale_x_date(date_labels = "%b/%y", date_breaks = "1 month") +
    ggplot2::labs(x = NULL, y = "Respostas", title = titulo) +
    tema_tso() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
  
  plotly::ggplotly(p, tooltip = "text") |>
    plotly::config(displayModeBar = FALSE)
}

#' Tabela cruzada percentual (linha) entre duas variáveis categóricas.
graf_cruzamento <- function(d, var_linha, var_coluna, cores_base = CORES_RUIM_BOM,
                            min_n = 5, titulo = NULL, subtitulo = NULL) {
  df <- d |>
    dplyr::filter(!is.na(.data[[var_linha]]), !is.na(.data[[var_coluna]]))
  if (!nrow(df)) return(plotly::plotly_empty())
  tab <- df |>
    dplyr::count(grupo = .data[[var_linha]], categoria = .data[[var_coluna]],
                 .drop = FALSE) |>
    dplyr::group_by(grupo) |>
    dplyr::mutate(n_validos = sum(n), pct = n / n_validos) |>
    dplyr::ungroup() |>
    dplyr::filter(n_validos >= min_n) |>
    dplyr::rename(item = grupo)
  if (!nrow(tab)) return(plotly::plotly_empty())
  tab$categoria <- factor(as.character(tab$categoria),
                          levels = levels(df[[var_coluna]]))
  graf_100(tab, cores_base = cores_base, titulo = titulo, subtitulo = subtitulo)
}

# ---------------------------------------------------------------------------
# Tabelas
# ---------------------------------------------------------------------------

tabela_dt <- function(df, pagina = 12, ...) {
  DT::datatable(
    df,
    rownames = FALSE,
    options = list(
      pageLength = pagina,
      dom = "ftip",
      scrollX = TRUE,
      deferRender = TRUE,
      language = list(
        search = "Buscar:",
        lengthMenu = "Mostrar _MENU_ registros",
        info = "_START_ a _END_ de _TOTAL_",
        infoEmpty = "Nenhum registro",
        zeroRecords = "Nenhum resultado encontrado",
        paginate = list(previous = "Anterior", "next" = "Próxima")
      )
    ),
    class = "compact stripe hover row-border",
    ...
  )
}


#' Formata um valor para value box (com tratamento de NA)
vb <- function(x, fmt = c("pct", "num", "int"), acc = 0.1) {
  fmt <- match.arg(fmt)
  if (is.na(x)) return("—")
  switch(fmt,
         pct = pct_br(x, acc),
         num = num_br(x, acc),
         int = format(round(x), big.mark = "."))
}