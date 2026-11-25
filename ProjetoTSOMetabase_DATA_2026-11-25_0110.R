#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('ProjetoTSOMetabase_DATA_2026-11-25_0110.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$redcap_survey_identifier)="Survey Identifier"
label(data$enquete_timestamp)="Survey Timestamp"
label(data$aceite)="Você aceita participar desta pesquisa?"
label(data$operario)="Você é trabalhador/a da mineração?"
label(data$dtnasc)="Qual é o ano do seu nascimento?"
label(data$genero)="Qual é o seu gênero?"
label(data$raca)="Como você autodeclara a sua raça?"
label(data$osexual)="Qual das seguintes opções melhor representa a sua orientação sexual?"
label(data$municipio)="Você mora em qual município?"
label(data$deslocamento)="Quanto tempo você leva da sua casa para chegar ao trabalho?Em minutos"
label(data$empresa)="Você trabalha em qual empresa?"
label(data$vinculo)="Sob qual vínculo de trabalho?"
label(data$diretoclt)="Você já trabalhou em alguma empresa primária na mineração?"
label(data$preferencia)="Você gosta de trabalhar como terceirizado/a?"
label(data$natureza)="Qual é a natureza do seu trabalho terceirizado?"
label(data$perder)="Você tem medo de perder seu emprego em decorrência da terceirização?"
label(data$setor)="Em qual setor/área?"
label(data$temposetor)="Há quanto tempo você trabalha neste setor/área? Em anos"
label(data$tempomineracao)="Há quanto tempo você trabalha na mineração? Em anos"
label(data$deficiencia)="Você possui alguma deficiência?"
label(data$deficienciatrab)="Você entende que a sua deficiência foi causada pelo trabalho na mineração?"
label(data$contrato)="O seu contrato de trabalho"
label(data$particular)="Regras da empresa para folgas para resolver problemas particulares"
label(data$afastsaude)="Regras da empresa para afastamentos por motivo de saúde"
label(data$plano)="O plano de cargos e salários da empresa"
label(data$incentivo)="Você ja recebeu algum incentivo da empresa para a sua formação ou qualificação profissional?"
label(data$salario)="O valor do seu salário"
label(data$horae)="O valor das suas horas extras"
label(data$valealiment)="O valor do auxílio/vale alimentação"
label(data$adnot)="O valor do adicional noturnos"
label(data$insalubridade)="O valor do adicional de insalubridade"
label(data$periculosidade)="O valor do adicional de periculosidade"
label(data$descontos)="O valor dos descontos da previdência privada"
label(data$coparticipacao)="O valor dos descontos de coparticipação em plano de saúde"
label(data$existbh)="O banco de horas"
label(data$cbancoh)="O seu controle sobre o banco de horas"
label(data$bancoh)="O recebimento do banco de horas"
label(data$plr)="O valor da participação nos lucros da empresa"
label(data$renda)="O salário que você recebe na mineração é ..."
label(data$situacaofi)="Como você avalia a situação financeira atual da sua família?"
label(data$emprestimo)="Nos últimos 12 meses, você ou alguém da sua família precisou contrair empréstimo ou financiamento para pagar contas do dia a dia?"
label(data$jornada)="Qual é a sua jornada de trabalho?"
label(data$jornadaa)="No último ano, você tem trabalhado além das horas contratadas para a sua jornada de trabalho?"
label(data$jornadasim___1)="Como? Marque mais de uma opção, caso seja necessário (choice=Por meio de hora extra no local de trabalho)"
label(data$jornadasim___2)="Como? Marque mais de uma opção, caso seja necessário (choice=Levando trabalho para casa)"
label(data$jornadasim___3)="Como? Marque mais de uma opção, caso seja necessário (choice=Realizando complementação de renda por meio de outra atividade de trabalho)"
label(data$jornadasim___4)="Como? Marque mais de uma opção, caso seja necessário (choice=Outro)"
label(data$modalidade)="Qual é a modalidade do seu trabalho? Marque mais de uma opção, caso seja necessário"
label(data$jornada3)="A duração da sua Jornada de trabalho"
label(data$intervalo)="Os intervalos intrajornada (descanso, lanche, refeições)"
label(data$descanso)="Os intervalos entre jornada (folga)"
label(data$equipamentos)="Os meios e os equipamentos que a empresa oferece para a realização do seu trabalho"
label(data$ambiente)="O ambiente de trabalho em termos de apoio e colaboração para a realização do seu trabalho"
label(data$ambiente_riscos)="O ambiente de trabalho em termos de segurança e proteção à sua saúde frente a ruídos, iluminação, ventilação, aspectos ergonômicos, entre outros"
label(data$autonomia)="A sua autonomia na realização das tarefas de trabalho"
label(data$riscos)="O apoio dos demais trabalhadores para que você possa lidar com os riscos e cargas do seu trabalho"
label(data$tecnologias)="A automação e as tecnologias da mineração interferem no seu ambiente e/ou atividades de trabalho?"
label(data$implementacao)="As empresas estão colocando cada vez mais tecnologias no meu setor de trabalho"
label(data$intensificacao)="Com as novas tecnologias, o meu trabalho ficou mais puxado"
label(data$complexidade)="As tecnologias deixam o meu trabalho mais difícil"
label(data$metas)="Com as tecnologias no setor, eu sou mais cobrado a bater metas"
label(data$emprego)="As máquinas e tecnologias novas estão tomando o lugar de trabalhadores no setor"
label(data$seguranca)="As tecnologias deixam o meu trabalho mais seguro"
label(data$controle)="As tecnologias aumentam a vigilância e o controle da empresa sobre os trabalhadores"
label(data$insercao)="As tecnologias permitem que mais mulheres entrem e trabalhem no setor"
label(data$cominterna)="As tecnologias melhoram a comunicação dentro da empresa"
label(data$aprendizado)="Com as tecnologias no setor, preciso aprender coisas novas o tempo todo"
label(data$autonomiar)="Com as tecnologias, eu perdi parte da minha autonomia no trabalho"
label(data$sentimento)="Com essas tecnologias, eu me sinto menos valorizado no que eu faço"
label(data$estresse)="As tecnologias aumentam o meu estresse no trabalho"
label(data$treinamento)="Recebi treinamento suficiente para usar as novas tecnologias no trabalho"
label(data$impactosal)="As tecnologias ajudam a melhorar o meu salário ou rendimentos recebidos da empresa"
label(data$produtivitec)="A tecnologia permitiu aumentar a produtividade do setor"
label(data$superioresh)="Chefias homens e superiores"
label(data$superioresm)="Chefias mulheres e superiores"
label(data$subordinados)="Trabalhadores homens subordinados"
label(data$subordinadas)="Trabalhadoras mulheres subordinadas"
label(data$operarios)="Trabalhadores homens"
label(data$operarias)="Trabalhadoras mulheres"
label(data$terceiros)="Terceirizados/as"
label(data$socupacional)="Profissionais do setor de Saúde Ocupacional da Empresa"
label(data$demais)="Demais profissionais"
label(data$valorizacao)="Reconhecimento e valorização"
label(data$respeito)="Respeito profissional"
label(data$colaboracao)="Colaboração e trabalho em equipe"
label(data$comunicacao)="Liberdade de expressão"
label(data$pertencimento)="Senso de pertencimento"
label(data$gestaoparticipativa)="Gestão participativa"
label(data$inovacao)="Inovação e criatividade"
label(data$igualdadeoportunidades)="Igualdade de oportunidades"
label(data$apoio)="Apoio coletivo"
label(data$desviof)="Desvio de função"
label(data$assediomoral)="Assédio moral ou quando alguém é humilhado ou constrangido repetidamente no trabalho"
label(data$assediosexual)="Assédio sexual ou quando alguém sofre investidas, piadas ou toques com conotação sexual sem consentimento"
label(data$lgbtfobia)="LGBTfobia ou preconceito contra pessoas LGBTQIA+"
label(data$capacitismo)="Capacitismo ou preconceito contra pessoas com deficiência"
label(data$xenofobia)="Xenofobia ou preconceito contra quem veio de outro lugar ou país"
label(data$racismo)="Racismo ou preconceito contra pessoas negras, indígenas ou de outras raças/etnias"
label(data$misoginia)="Misoginia ou falta de respeito ou ódio contra mulheres"
label(data$violenciafisica)="Violência física"
label(data$etarismo)="Etarismo ou preconceito por causa da idade (por ser mais velho ou mais novo)"
label(data$trabhextras)="Trabalhar horas extras"
label(data$desvio)="Fazer trabalhos fora da minha função"
label(data$sobrecarga)="Sobrecarga das tarefas de trabalho"
label(data$pausas)="Conseguir ou poder fazer mais pausas para descanso, hidratação ou uso de banheiro durante o turno de trabalho"
label(data$opiniao)="Ser chamado por superiores para opinar sobre o trabalho que realizo"
label(data$pressao)="Pressão para bater metas"
label(data$riscosambiente)="Identificação de riscos de acidentes no meu ambiente de trabalho"
label(data$presenciar)="Presenciar alguém sofrer um acidente de trabalho"
label(data$esgotamento)="Esgotamento físico e/ou mental pelas tarefas do meu trabalho"
label(data$acidtraba)="Acidente de trabalho"
label(data$epi)="Uso de EPI confiáveis e novos"
label(data$comunicacid)="Na situação de acidente que você pode ter tido no trabalho, como a empresa tomou conhecimento da situação?"
label(data$cat)="Houve registro de CAT?"
label(data$altura)="Altura e/ou trabalho em escadas"
label(data$tensao)="Ambiente de tensão ou conflito constante"
label(data$desniveis)="Desníveis"
label(data$temperatura)="Exposição ao calor ou variações de temperatura"
label(data$eletricidade)="Eletricidade"
label(data$ergonomia)="Equipamentos ergonomicamente inadequados"
label(data$biol_gicos)="Exposição/manuseio de materiais biológicos"
label(data$explosivos)="Exposição/manuseio de materiais explosivos"
label(data$pausa)="Falta de pausas"
label(data$iluminacao)="Ilumiinação excessiva ou ausente"
label(data$fogo)="Incêndios de materiais/equipamentos e/ou explosões"
label(data$barragens)="Instabilidade ou desmoronamentos de taludes ou da estrutura das barragens"
label(data$maquinas)="Máquinas ou equipamentos com partes móveis sem proteção adequada"
label(data$manutencao)="Manutenção corretiva de equipamentos"
label(data$mudancas)="Mudança frequente nas tarefas ou funções"
label(data$peso)="Pesos"
label(data$poeiraexplosiva)="Poeira explosiva"
label(data$poeiramienral)="Poeira mineral"
label(data$quimicos)="Produtos químicos e/ou radioativos"
label(data$projecao)="Projeção de materiais partiiculados"
label(data$queda)="Queda de objetos, blocos ou desabamentos"
label(data$raios)="Raios"
label(data$repetitividade)="Repetitividade de trabalho"
label(data$ruidos)="Ruídos"
label(data$acelerado)="Trabalho em ritmo acelerado"
label(data$noturno)="Trabalho noturno"
label(data$solitario)="Trabalho solitário (sem colegas por perto)"
label(data$acesso)="Vias de acesso irregular"
label(data$vibracao)="Vibração de corpo inteiro"
label(data$sinais___1)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Agitação psicomotora)"
label(data$sinais___2)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Alterações do ritmo cardíaco)"
label(data$sinais___3)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Choro intenso)"
label(data$sinais___4)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Coceiras no corpo)"
label(data$sinais___5)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Consumo de álcool ou outras drogas)"
label(data$sinais___6)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Consumo intenso de medicações)"
label(data$sinais___7)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Dificuldades para respirar)"
label(data$sinais___8)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Dores em membros ou articulações do corpo)"
label(data$sinais___9)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Dores no estomago)"
label(data$sinais___10)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Enjoos)"
label(data$sinais___11)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Episódios de ansiedade)"
label(data$sinais___12)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Episódios depressivos)"
label(data$sinais___13)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Esgotamento físico)"
label(data$sinais___14)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Esgotamento mental)"
label(data$sinais___15)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Estado de estresse)"
label(data$sinais___16)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Fadiga depressiva)"
label(data$sinais___17)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Intoxicações)"
label(data$sinais___18)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Lesões autoprovocadas intencionalmente)"
label(data$sinais___19)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Sono intenso)"
label(data$sinais___20)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Tonturas)"
label(data$sinais___21)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Tremores no corpo)"
label(data$sinais___22)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Uso intenso de tabaco)"
label(data$sinais___23)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Outras)"
label(data$sinais___24)="No seu ambiente de trabalho, você já passou por alguma das situações ao lado? Marque mais de uma opção, caso necessário. (choice=Nunca passei por estas ou outras situações parecidas)"
label(data$afastamentos)="Nos últimos 5 (cinco) anos, você se afastou por motivo de doença ou acidente causados pelo trabalho?"
label(data$irdoente)="Já aconteceu de você ter que ir trabalhar mesmo não se sentindo bem ou estando doente?"
label(data$morbidades___1)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Doenças infecciosas ou parasitas (como dengue, vermes, tuberculose))"
label(data$morbidades___2)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Tumores (câncer))"
label(data$morbidades___3)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas no sangue ou na defesa do corpo (imunidade))"
label(data$morbidades___4)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas hormonais, de alimentação ou metabolismo (como diabetes, tireoide, colesterol alto))"
label(data$morbidades___5)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Transtornos mentais ou emocionais (como depressão, ansiedade, estresse))"
label(data$morbidades___6)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas no sistema nervoso (como AVC, epilepsia, Parkinson))"
label(data$morbidades___7)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas nos olhos ou na visão)"
label(data$morbidades___8)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas no ouvido (como perda de audição, zumbido))"
label(data$morbidades___9)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas no coração ou na circulação (como pressão alta, infarto))"
label(data$morbidades___10)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas no pulmão ou respiração (como asma, bronquite, silicose))"
label(data$morbidades___11)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas no estômago ou intestino (como gastrite, refluxo, prisão de ventre))"
label(data$morbidades___12)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas de pele (como alergias, feridas, manchas))"
label(data$morbidades___13)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas nos ossos, músculos ou juntas (como dores nas costas, tendinite, artrose))"
label(data$morbidades___14)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas nos rins, bexiga ou órgãos sexuais)"
label(data$morbidades___15)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Problemas que já nascem com a pessoa (de nascença))"
label(data$morbidades___16)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Causas externas de doenças (cortes, intoxicações, agressões ou violências),)"
label(data$morbidades___17)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Outros sintomas e sinais que ainda não têm diagnóstico certo)"
label(data$morbidades___18)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Outras)"
label(data$morbidades___19)="Você sente, identifica ou já foi informado/a por um profissional de saúde que tem ou pode ter alguma das doenças ou problemas listados abaixo? Marque mais de uma opção, caso seja necessário. (choice=Não sinto identifico ou fui informado sobre adoecimentos)"
label(data$medicamentos)="Você faz uso contínuo de medicamentos controlados e/ou de uso contínuo?"
label(data$motivo_uso)="Qual das seguintes opções melhor descreve seu uso destes medicamentos:"
label(data$drogasoperarios)="Na sua percepção, o uso de álcool ou drogas entre trabalhadores/as da mineração está relacionado às condições de trabalho (ritmo, turnos, segurança, pressão da produção etc.)?"
label(data$usoalcool)="Com que frequência você consome bebidas alcoólicas?"
label(data$usodrogas)="Você faz uso de outras drogas (maconha, cocaína, crack, anfetaminas, remédios sem prescrição, etc.)?"
label(data$usodrogastrabalho)="Você considera que o seu trabalho na mineração tem alguma relação com o uso dessas substâncias?  "
label(data$saude_antes)="Você avalia que a condição da sua saúde no último ano ..."
label(data$saude)="A sua condição geral de saúde"
label(data$sono)="A qualidade do seu sono"
label(data$alimentacao)="A qualidade da sua alimentação"
label(data$moradia)="A qualidade da sua moradia/habitação"
label(data$saudetrab)="Você entende que a sua atual situação geral de saúde e qualidade de vida possui relação com o seu trabalho na mineração?"
label(data$estrategias___1)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Acompanhamento terapêutico)"
label(data$estrategias___2)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Automedicação (uso de remédios por conta própria))"
label(data$estrategias___3)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Alimentação saudável)"
label(data$estrategias___4)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Atividades artísticas (como música, pintura, escrita, etc.))"
label(data$estrategias___5)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Atividades de lazer ou cultura (cinema, passeios, festas, etc.))"
label(data$estrategias___6)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Consulta com profissionais de saúde / assistência social)"
label(data$estrategias___7)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Descanso e sono adequado)"
label(data$estrategias___8)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Encontros com amigos, familiares ou relações afetivas)"
label(data$estrategias___9)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Exercícios físicos (caminhada, academia, esporte, etc.))"
label(data$estrategias___10)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Participação em atividades políticas ou sindicais)"
label(data$estrategias___11)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Práticas religiosas ou de espiritualidade)"
label(data$estrategias___12)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Outras)"
label(data$estrategias___13)="Quais estratégias você costuma adotar para cuidar da sua saúde? Marque mais de uma opção, caso necessário. (choice=Não adoto nenhuma estratégia)"
label(data$tempocuidado)="Em média, quantas horas por semana você dedica às atividades de saúde mencionadas anteriormente? Em horas"
label(data$previnstitucional)="Como você avalia o que a empresa faz pra lidar com a saúde de quem trabalha lá, tipo prevenção e promoção de saúde?"
label(data$periodicos)="Como você avalia os exames de saúde que a empresa faz de tempos em tempos (exames periódicos)?"
label(data$cuidadocasa)="Realização de atividades em sua casa (limpar, lavar roupa, cozinhar, etc)"
label(data$filhos)="Cuidado de filhos ou dependentes (crianças, idosos, pessoas com necessidades especiais, etc)"
label(data$cuidadopessoas)="Cuidado de pessoas de sua família com problemas de saúde ou que exigem cuidados/atenção permanente"
label(data$orgcasa)="Organização da casa (planejar compras, pagar contas, marcar consultas, organizar agenda, etc)"
label(data$lazer)="Realização de atividades de esporte e lazer (jogos, passeios, encontros, teatro, cinema, exposições, etc)"
label(data$estudos)="Realização de atividades de educação e estudos (cursos, aulas, leituras, etc)"
label(data$arte)="Realização de atividades de arte e cultura (música, dança, hobbies, etc)"
label(data$politica)="Participação política e comunitária (representação, sindicatos, associações, conselhos, trabalho voluntário, etc)"
label(data$jornadacuidado)="Como você respondeu cuidar de pessoas de sua família com problemas de saúde ou que exigem cuidados/atenção permanente, qual seria a jornada de trabalho ideal para conciliar as suas atividades profissionais na mineração com as responsabilidades de cuidado?"
label(data$vizinhobarragens)="Você mora em bairro vizinho da mineração?"
label(data$sindical)="Você é sindicalizado/a?"
label(data$diretoria)="Você conhece a Secretaria de Saúde e Segurança do Sindicato?"
label(data$contribuicao)="Você acredita que o Sindicato pode constribuir para melhorias nas suas condições de trabalho e situação de saúde?"
label(data$entrevista)="Caso os/as pesquisadores/as queiram aprofundar as informações oferecidas sobre a relação do trabalho com a sua saúde, você estaria disposta/o a dialogar de forma sigilosa sobre este assunto?"
label(data$email)="Gentileza, informe um e-mail ou número de whatsapp para contato:"
label(data$avaliacao)="De modo geral, como você avalia esta enquete?"
label(data$enquete_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$aceite.factor = factor(data$aceite,levels=c("1","2"))
data$operario.factor = factor(data$operario,levels=c("1","2"))
data$dtnasc.factor = factor(data$dtnasc,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48"))
data$genero.factor = factor(data$genero,levels=c("1","2","3","4","5","6","7"))
data$raca.factor = factor(data$raca,levels=c("1","2","3","4","5","6"))
data$osexual.factor = factor(data$osexual,levels=c("1","2","3","4","5","6"))
data$municipio.factor = factor(data$municipio,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"))
data$deslocamento.factor = factor(data$deslocamento,levels=c("1","2","3","4","5","6","7","8","9"))
data$empresa.factor = factor(data$empresa,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"))
data$vinculo.factor = factor(data$vinculo,levels=c("1","2","3","4","5","6","7"))
data$diretoclt.factor = factor(data$diretoclt,levels=c("1","2"))
data$preferencia.factor = factor(data$preferencia,levels=c("1","2"))
data$natureza.factor = factor(data$natureza,levels=c("1","2","3","4","5"))
data$perder.factor = factor(data$perder,levels=c("1","2","3"))
data$setor.factor = factor(data$setor,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13"))
data$temposetor.factor = factor(data$temposetor,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42"))
data$tempomineracao.factor = factor(data$tempomineracao,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42"))
data$deficiencia.factor = factor(data$deficiencia,levels=c("1","2","3"))
data$deficienciatrab.factor = factor(data$deficienciatrab,levels=c("1","2","3"))
data$contrato.factor = factor(data$contrato,levels=c("1","2","3","4","5","6"))
data$particular.factor = factor(data$particular,levels=c("1","2","3","4","5","6"))
data$afastsaude.factor = factor(data$afastsaude,levels=c("1","2","3","4","5","6"))
data$plano.factor = factor(data$plano,levels=c("1","2","3","4","5","6"))
data$incentivo.factor = factor(data$incentivo,levels=c("1","2"))
data$salario.factor = factor(data$salario,levels=c("1","2","3","4","5","6"))
data$horae.factor = factor(data$horae,levels=c("1","2","3","4","5","6"))
data$valealiment.factor = factor(data$valealiment,levels=c("1","2","3","4","5","6"))
data$adnot.factor = factor(data$adnot,levels=c("1","2","3","4","5","6"))
data$insalubridade.factor = factor(data$insalubridade,levels=c("1","2","3","4","5","6"))
data$periculosidade.factor = factor(data$periculosidade,levels=c("1","2","3","4","5","6"))
data$descontos.factor = factor(data$descontos,levels=c("1","2","3","4","5","6"))
data$coparticipacao.factor = factor(data$coparticipacao,levels=c("1","2","3","4","5","6"))
data$existbh.factor = factor(data$existbh,levels=c("1","2","3","4","5","6"))
data$cbancoh.factor = factor(data$cbancoh,levels=c("1","2","3","4","5","6"))
data$bancoh.factor = factor(data$bancoh,levels=c("1","2","3","4","5","6"))
data$plr.factor = factor(data$plr,levels=c("1","2","3","4","5","6"))
data$renda.factor = factor(data$renda,levels=c("1","2","3","5"))
data$situacaofi.factor = factor(data$situacaofi,levels=c("1","2","3","4","5"))
data$emprestimo.factor = factor(data$emprestimo,levels=c("1","2","3"))
data$jornada.factor = factor(data$jornada,levels=c("1","2","3","4","5","6","7","8","9"))
data$jornadaa.factor = factor(data$jornadaa,levels=c("1","2","3"))
data$jornadasim___1.factor = factor(data$jornadasim___1,levels=c("0","1"))
data$jornadasim___2.factor = factor(data$jornadasim___2,levels=c("0","1"))
data$jornadasim___3.factor = factor(data$jornadasim___3,levels=c("0","1"))
data$jornadasim___4.factor = factor(data$jornadasim___4,levels=c("0","1"))
data$modalidade.factor = factor(data$modalidade,levels=c("1","2","3","5"))
data$jornada3.factor = factor(data$jornada3,levels=c("1","2","3","4","5","6"))
data$intervalo.factor = factor(data$intervalo,levels=c("1","2","3","4","5","6"))
data$descanso.factor = factor(data$descanso,levels=c("1","2","3","4","5","6"))
data$equipamentos.factor = factor(data$equipamentos,levels=c("1","2","3","4","5","6"))
data$ambiente.factor = factor(data$ambiente,levels=c("1","2","3","4","5","6"))
data$ambiente_riscos.factor = factor(data$ambiente_riscos,levels=c("1","2","3","4","5","6"))
data$autonomia.factor = factor(data$autonomia,levels=c("1","2","3","4","5","6"))
data$riscos.factor = factor(data$riscos,levels=c("1","2","3","4","5","6"))
data$tecnologias.factor = factor(data$tecnologias,levels=c("1","2","3"))
data$implementacao.factor = factor(data$implementacao,levels=c("1","2","3","4","5","6"))
data$intensificacao.factor = factor(data$intensificacao,levels=c("1","2","3","4","5","6"))
data$complexidade.factor = factor(data$complexidade,levels=c("1","2","3","4","5","6"))
data$metas.factor = factor(data$metas,levels=c("1","2","3","4","5","6"))
data$emprego.factor = factor(data$emprego,levels=c("1","2","3","4","5","6"))
data$seguranca.factor = factor(data$seguranca,levels=c("1","2","3","4","5","6"))
data$controle.factor = factor(data$controle,levels=c("1","2","3","4","5","6"))
data$insercao.factor = factor(data$insercao,levels=c("1","2","3","4","5","6"))
data$cominterna.factor = factor(data$cominterna,levels=c("1","2","3","4","5","6"))
data$aprendizado.factor = factor(data$aprendizado,levels=c("1","2","3","4","5","6"))
data$autonomiar.factor = factor(data$autonomiar,levels=c("1","2","3","4","5","6"))
data$sentimento.factor = factor(data$sentimento,levels=c("1","2","3","4","5","6"))
data$estresse.factor = factor(data$estresse,levels=c("1","2","3","4","5","6"))
data$treinamento.factor = factor(data$treinamento,levels=c("1","2","3","4","5","6"))
data$impactosal.factor = factor(data$impactosal,levels=c("1","2","3","4","5","6"))
data$produtivitec.factor = factor(data$produtivitec,levels=c("1","2","3","4","5","6"))
data$superioresh.factor = factor(data$superioresh,levels=c("1","2","3","4","5","6"))
data$superioresm.factor = factor(data$superioresm,levels=c("1","2","3","4","5","6"))
data$subordinados.factor = factor(data$subordinados,levels=c("1","2","3","4","5","6"))
data$subordinadas.factor = factor(data$subordinadas,levels=c("1","2","3","4","5","6"))
data$operarios.factor = factor(data$operarios,levels=c("1","2","3","4","5","6"))
data$operarias.factor = factor(data$operarias,levels=c("1","2","3","4","5","6"))
data$terceiros.factor = factor(data$terceiros,levels=c("1","2","3","4","5","6"))
data$socupacional.factor = factor(data$socupacional,levels=c("1","2","3","4","5","6"))
data$demais.factor = factor(data$demais,levels=c("1","2","3","4","5","6"))
data$valorizacao.factor = factor(data$valorizacao,levels=c("1","2","3","4","5","6"))
data$respeito.factor = factor(data$respeito,levels=c("1","2","3","4","5","6"))
data$colaboracao.factor = factor(data$colaboracao,levels=c("1","2","3","4","5","6"))
data$comunicacao.factor = factor(data$comunicacao,levels=c("1","2","3","4","5","6"))
data$pertencimento.factor = factor(data$pertencimento,levels=c("1","2","3","4","5","6"))
data$gestaoparticipativa.factor = factor(data$gestaoparticipativa,levels=c("1","2","3","4","5","6"))
data$inovacao.factor = factor(data$inovacao,levels=c("1","2","3","4","5","6"))
data$igualdadeoportunidades.factor = factor(data$igualdadeoportunidades,levels=c("1","2","3","4","5","6"))
data$apoio.factor = factor(data$apoio,levels=c("1","2","3","4","5","6"))
data$desviof.factor = factor(data$desviof,levels=c("1","2","3","4","5","6"))
data$assediomoral.factor = factor(data$assediomoral,levels=c("1","2","3","4","5","6"))
data$assediosexual.factor = factor(data$assediosexual,levels=c("1","2","3","4","5","6"))
data$lgbtfobia.factor = factor(data$lgbtfobia,levels=c("1","2","3","4","5","6"))
data$capacitismo.factor = factor(data$capacitismo,levels=c("1","2","3","4","5","6"))
data$xenofobia.factor = factor(data$xenofobia,levels=c("1","2","3","4","5","6"))
data$racismo.factor = factor(data$racismo,levels=c("1","2","3","4","5","6"))
data$misoginia.factor = factor(data$misoginia,levels=c("1","2","3","4","5","6"))
data$violenciafisica.factor = factor(data$violenciafisica,levels=c("1","2","3","4","5","6"))
data$etarismo.factor = factor(data$etarismo,levels=c("1","2","3","4","5","6"))
data$trabhextras.factor = factor(data$trabhextras,levels=c("1","2","3","4","5","6"))
data$desvio.factor = factor(data$desvio,levels=c("1","2","3","4","5","6"))
data$sobrecarga.factor = factor(data$sobrecarga,levels=c("1","2","3","4","5","6"))
data$pausas.factor = factor(data$pausas,levels=c("1","2","3","4","5","6"))
data$opiniao.factor = factor(data$opiniao,levels=c("1","2","3","4","5","6"))
data$pressao.factor = factor(data$pressao,levels=c("1","2","3","4","5","6"))
data$riscosambiente.factor = factor(data$riscosambiente,levels=c("1","2","3","4","5","6"))
data$presenciar.factor = factor(data$presenciar,levels=c("1","2","3","4","5","6"))
data$esgotamento.factor = factor(data$esgotamento,levels=c("1","2","3","4","5","6"))
data$acidtraba.factor = factor(data$acidtraba,levels=c("1","2","3","4","5","6"))
data$epi.factor = factor(data$epi,levels=c("1","2","3","4","5","6"))
data$comunicacid.factor = factor(data$comunicacid,levels=c("1","2","3","4","5","6","7","8"))
data$cat.factor = factor(data$cat,levels=c("1","2","3"))
data$altura.factor = factor(data$altura,levels=c("1","2","3","4","5","6"))
data$tensao.factor = factor(data$tensao,levels=c("1","2","3","4","5","6"))
data$desniveis.factor = factor(data$desniveis,levels=c("1","2","3","4","5","6"))
data$temperatura.factor = factor(data$temperatura,levels=c("1","2","3","4","5","6"))
data$eletricidade.factor = factor(data$eletricidade,levels=c("1","2","3","4","5","6"))
data$ergonomia.factor = factor(data$ergonomia,levels=c("1","2","3","4","5","6"))
data$biol_gicos.factor = factor(data$biol_gicos,levels=c("1","2","3","4","5","6"))
data$explosivos.factor = factor(data$explosivos,levels=c("1","2","3","4","5","6"))
data$pausa.factor = factor(data$pausa,levels=c("1","2","3","4","5","6"))
data$iluminacao.factor = factor(data$iluminacao,levels=c("1","2","3","4","5","6"))
data$fogo.factor = factor(data$fogo,levels=c("1","2","3","4","5","6"))
data$barragens.factor = factor(data$barragens,levels=c("1","2","3","4","5","6"))
data$maquinas.factor = factor(data$maquinas,levels=c("1","2","3","4","5","6"))
data$manutencao.factor = factor(data$manutencao,levels=c("1","2","3","4","5","6"))
data$mudancas.factor = factor(data$mudancas,levels=c("1","2","3","4","5","6"))
data$peso.factor = factor(data$peso,levels=c("1","2","3","4","5","6"))
data$poeiraexplosiva.factor = factor(data$poeiraexplosiva,levels=c("1","2","3","4","5","6"))
data$poeiramienral.factor = factor(data$poeiramienral,levels=c("1","2","3","4","5","6"))
data$quimicos.factor = factor(data$quimicos,levels=c("1","2","3","4","5","6"))
data$projecao.factor = factor(data$projecao,levels=c("1","2","3","4","5","6"))
data$queda.factor = factor(data$queda,levels=c("1","2","3","4","5","6"))
data$raios.factor = factor(data$raios,levels=c("1","2","3","4","5","6"))
data$repetitividade.factor = factor(data$repetitividade,levels=c("1","2","3","4","5","6"))
data$ruidos.factor = factor(data$ruidos,levels=c("1","2","3","4","5","6"))
data$acelerado.factor = factor(data$acelerado,levels=c("1","2","3","4","5","6"))
data$noturno.factor = factor(data$noturno,levels=c("1","2","3","4","5","6"))
data$solitario.factor = factor(data$solitario,levels=c("1","2","3","4","5","6"))
data$acesso.factor = factor(data$acesso,levels=c("1","2","3","4","5","6"))
data$vibracao.factor = factor(data$vibracao,levels=c("1","2","3","4","5","6"))
data$sinais___1.factor = factor(data$sinais___1,levels=c("0","1"))
data$sinais___2.factor = factor(data$sinais___2,levels=c("0","1"))
data$sinais___3.factor = factor(data$sinais___3,levels=c("0","1"))
data$sinais___4.factor = factor(data$sinais___4,levels=c("0","1"))
data$sinais___5.factor = factor(data$sinais___5,levels=c("0","1"))
data$sinais___6.factor = factor(data$sinais___6,levels=c("0","1"))
data$sinais___7.factor = factor(data$sinais___7,levels=c("0","1"))
data$sinais___8.factor = factor(data$sinais___8,levels=c("0","1"))
data$sinais___9.factor = factor(data$sinais___9,levels=c("0","1"))
data$sinais___10.factor = factor(data$sinais___10,levels=c("0","1"))
data$sinais___11.factor = factor(data$sinais___11,levels=c("0","1"))
data$sinais___12.factor = factor(data$sinais___12,levels=c("0","1"))
data$sinais___13.factor = factor(data$sinais___13,levels=c("0","1"))
data$sinais___14.factor = factor(data$sinais___14,levels=c("0","1"))
data$sinais___15.factor = factor(data$sinais___15,levels=c("0","1"))
data$sinais___16.factor = factor(data$sinais___16,levels=c("0","1"))
data$sinais___17.factor = factor(data$sinais___17,levels=c("0","1"))
data$sinais___18.factor = factor(data$sinais___18,levels=c("0","1"))
data$sinais___19.factor = factor(data$sinais___19,levels=c("0","1"))
data$sinais___20.factor = factor(data$sinais___20,levels=c("0","1"))
data$sinais___21.factor = factor(data$sinais___21,levels=c("0","1"))
data$sinais___22.factor = factor(data$sinais___22,levels=c("0","1"))
data$sinais___23.factor = factor(data$sinais___23,levels=c("0","1"))
data$sinais___24.factor = factor(data$sinais___24,levels=c("0","1"))
data$afastamentos.factor = factor(data$afastamentos,levels=c("1","2","3","4"))
data$irdoente.factor = factor(data$irdoente,levels=c("1","2","3"))
data$morbidades___1.factor = factor(data$morbidades___1,levels=c("0","1"))
data$morbidades___2.factor = factor(data$morbidades___2,levels=c("0","1"))
data$morbidades___3.factor = factor(data$morbidades___3,levels=c("0","1"))
data$morbidades___4.factor = factor(data$morbidades___4,levels=c("0","1"))
data$morbidades___5.factor = factor(data$morbidades___5,levels=c("0","1"))
data$morbidades___6.factor = factor(data$morbidades___6,levels=c("0","1"))
data$morbidades___7.factor = factor(data$morbidades___7,levels=c("0","1"))
data$morbidades___8.factor = factor(data$morbidades___8,levels=c("0","1"))
data$morbidades___9.factor = factor(data$morbidades___9,levels=c("0","1"))
data$morbidades___10.factor = factor(data$morbidades___10,levels=c("0","1"))
data$morbidades___11.factor = factor(data$morbidades___11,levels=c("0","1"))
data$morbidades___12.factor = factor(data$morbidades___12,levels=c("0","1"))
data$morbidades___13.factor = factor(data$morbidades___13,levels=c("0","1"))
data$morbidades___14.factor = factor(data$morbidades___14,levels=c("0","1"))
data$morbidades___15.factor = factor(data$morbidades___15,levels=c("0","1"))
data$morbidades___16.factor = factor(data$morbidades___16,levels=c("0","1"))
data$morbidades___17.factor = factor(data$morbidades___17,levels=c("0","1"))
data$morbidades___18.factor = factor(data$morbidades___18,levels=c("0","1"))
data$morbidades___19.factor = factor(data$morbidades___19,levels=c("0","1"))
data$medicamentos.factor = factor(data$medicamentos,levels=c("1","2"))
data$motivo_uso.factor = factor(data$motivo_uso,levels=c("1","2","3","4"))
data$drogasoperarios.factor = factor(data$drogasoperarios,levels=c("1","2","3","4","5","6"))
data$usoalcool.factor = factor(data$usoalcool,levels=c("1","2","3","4","5","6"))
data$usodrogas.factor = factor(data$usodrogas,levels=c("1","2","3","4"))
data$usodrogastrabalho.factor = factor(data$usodrogastrabalho,levels=c("1","2","3","4"))
data$saude_antes.factor = factor(data$saude_antes,levels=c("1","2","3","4"))
data$saude.factor = factor(data$saude,levels=c("1","2","3","4","5","6"))
data$sono.factor = factor(data$sono,levels=c("1","2","3","4","5","6"))
data$alimentacao.factor = factor(data$alimentacao,levels=c("1","2","3","4","5","6"))
data$moradia.factor = factor(data$moradia,levels=c("1","2","3","4","5","6"))
data$saudetrab.factor = factor(data$saudetrab,levels=c("1","2","3"))
data$estrategias___1.factor = factor(data$estrategias___1,levels=c("0","1"))
data$estrategias___2.factor = factor(data$estrategias___2,levels=c("0","1"))
data$estrategias___3.factor = factor(data$estrategias___3,levels=c("0","1"))
data$estrategias___4.factor = factor(data$estrategias___4,levels=c("0","1"))
data$estrategias___5.factor = factor(data$estrategias___5,levels=c("0","1"))
data$estrategias___6.factor = factor(data$estrategias___6,levels=c("0","1"))
data$estrategias___7.factor = factor(data$estrategias___7,levels=c("0","1"))
data$estrategias___8.factor = factor(data$estrategias___8,levels=c("0","1"))
data$estrategias___9.factor = factor(data$estrategias___9,levels=c("0","1"))
data$estrategias___10.factor = factor(data$estrategias___10,levels=c("0","1"))
data$estrategias___11.factor = factor(data$estrategias___11,levels=c("0","1"))
data$estrategias___12.factor = factor(data$estrategias___12,levels=c("0","1"))
data$estrategias___13.factor = factor(data$estrategias___13,levels=c("0","1"))
data$tempocuidado.factor = factor(data$tempocuidado,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37"))
data$previnstitucional.factor = factor(data$previnstitucional,levels=c("1","2","3","4","5","6"))
data$periodicos.factor = factor(data$periodicos,levels=c("1","2","3","4","5","6"))
data$cuidadocasa.factor = factor(data$cuidadocasa,levels=c("1","2","3","4","5"))
data$filhos.factor = factor(data$filhos,levels=c("1","2","3","4","5"))
data$cuidadopessoas.factor = factor(data$cuidadopessoas,levels=c("1","2","3","4","5"))
data$orgcasa.factor = factor(data$orgcasa,levels=c("1","2","3","4","5"))
data$lazer.factor = factor(data$lazer,levels=c("1","2","3","4","5"))
data$estudos.factor = factor(data$estudos,levels=c("1","2","3","4","5"))
data$arte.factor = factor(data$arte,levels=c("1","2","3","4","5"))
data$politica.factor = factor(data$politica,levels=c("1","2","3","4","5"))
data$jornadacuidado.factor = factor(data$jornadacuidado,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"))
data$vizinhobarragens.factor = factor(data$vizinhobarragens,levels=c("1","2"))
data$sindical.factor = factor(data$sindical,levels=c("1","2","4"))
data$diretoria.factor = factor(data$diretoria,levels=c("1","2"))
data$contribuicao.factor = factor(data$contribuicao,levels=c("1","2","3"))
data$entrevista.factor = factor(data$entrevista,levels=c("1","2"))
data$avaliacao.factor = factor(data$avaliacao,levels=c("1","2","3","4","5"))
data$enquete_complete.factor = factor(data$enquete_complete,levels=c("0","1","2"))

levels(data$aceite.factor)=c("Sim","Não")
levels(data$operario.factor)=c("Sim","Não")
levels(data$dtnasc.factor)=c("2006","2005","2004","2003","2002","2001","2000","1999","1998","1997","1996","1995","1994","1993","1992","1991","1990","1989","1988","1987","1986","1985","1984","1983","1982","1981","1980","1979","1978","1977","1976","1975","1974","1973","1972","1971","1970","1969","1968","1967","1966","1965","1964","1963","1962","1961","1960","antes de 1960")
levels(data$genero.factor)=c("Homem cisgênero (pessoa que lhe foi atribuído o gênero masculino ao nascer e se identifica como homem)","Mulher cisgênero (pessoa que lhe foi atribuído o gênero feminino ao nascer e se identifica como mulher)","Homem transgênero (pessoa que lhe foi atribuído o gênero feminino ao nascer e se identifica como homem)","Mulher transgênero (pessoa que lhe foi atribuído o gênero masculino ao nascer e se identifica como mulher)","Não binário/a (podem não se reconhecer com a identidade de gênero de homem ou mulher - ausência de gênero - ou podem se caracterizar como uma mistura entre os dois)","Outro","Não sei dizer")
levels(data$raca.factor)=c("Amarelo (pessoa que se declara de origem oriental: japonesa, chinesa, coreana)","Branco","Indígena","Pardo","Preto","Não sei dizer")
levels(data$osexual.factor)=c("Assexual (falta total, parcial ou condicional de atração sexual e/ou afetiva independente do sexo biológico ou gênero da pessoa)","Bissexual (se relacionam e se atraem sexualmente e/ou afetivamente com pessoasdo mesmo gênero que o seu e também de gêneros diferentes)","Heterossexual (se relacionam e se atraem sexualmente e/ou afetivamente com pessoasdo gênero oposto ao seu)","Homossexual (se relacionam e se atraem sexualmente e/ou afetivamente com pessoasdo mesmo gênero)","Outro","Não sei dizer")
levels(data$municipio.factor)=c("Belo Horizonte","Belo Vale","Carandaí","Congonhas","Conselheiro Lafeiete","Cristiano Otoni","Desterro de Entre Rios","Entre Rios","Itabirito","Jeceaba","Lagoa Dourada","Mariana","Ouro Branco","Ouro Preto","Santa Bárbara","São Brás do Suaçuí","Outro")
levels(data$deslocamento.factor)=c("5 min","10 min","15 min","30 min","45 min","60 min ou 1h","90 min ou 1h30","120 min ou 2h","mais de 2h")
levels(data$empresa.factor)=c("CSN: Pires","CSN: Casa de Pedra","Ferro Puro e CDA","Ferro+ Mineração","Gerdau Mineração: Miguel Bournier","Gerdau Mineração: VL","JMN","LGA Mineração","Minerinvest","Nogueira Duarte","Polaris/Terra Seca","Vale: Timbopeba","Vale: Fábrica","Vale: Viga","WG Sinterização","Terceirizada","Outra")
levels(data$vinculo.factor)=c("Direto na empresa CLT","Temporário/prazo determinado","PJ","Treinee ou programa de capacitação","Estagiário/a","Outro","Não sei dizer")
levels(data$diretoclt.factor)=c("Sim","Não")
levels(data$preferencia.factor)=c("Sim","Não")
levels(data$natureza.factor)=c("Produção: atividade-fim ou atividade principal da empresa","Infra-manutenção: atividade-meio ou atividades secundárias ou de apoio da empresa.","Obras-projetos: atividade eventual ou atividades temporárias ou esporádicas, que não ocorrem com regularidade na empresa","Outra","Não sei dizer")
levels(data$perder.factor)=c("Sim","Não","Não sei")
levels(data$setor.factor)=c("Operação: mina","Operação: usina","Operação: infra-estrutura","Manutenção: mina (equipamentos de mina)","Manutenção: elétrica","Manutenção: industrial","Administrativo: apoio operacional","Administrativo: engenharia","Administrativo: planejamento","Administrativo: saúde ocupacional","Administrativo","Outro","Prefiro não responder")
levels(data$temposetor.factor)=c("menos de 1 ano","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","40+")
levels(data$tempomineracao.factor)=c("menos de 1 ano","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","40+")
levels(data$deficiencia.factor)=c("Sim","Não","Não sei dizer")
levels(data$deficienciatrab.factor)=c("Sim","Não","Não sei dizer")
levels(data$contrato.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não conheço")
levels(data$particular.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não conheço")
levels(data$afastsaude.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não conheço")
levels(data$plano.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não conheço")
levels(data$incentivo.factor)=c("Sim","Não")
levels(data$salario.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$horae.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$valealiment.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$adnot.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$insalubridade.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$periculosidade.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$descontos.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$coparticipacao.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$existbh.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$cbancoh.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$bancoh.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$plr.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não recebo")
levels(data$renda.factor)=c("a única fonte de renda da família","complementado por trabalho de familiares","complementado por outra atividade de trabalho","não é fonte de renda familiar, mas para despesas pessoais")
levels(data$situacaofi.factor)=c("Muito boa - consigo pagar despesas, guardar dinheiro e/ou emprestar para pessoas","Boa - consigo pagar despesas e guardar dinheiro","Regular - consigo pagar despesas, mas não sobra","Ruim - às vezes não consigo pagar todas as despesas e precisar de dinheiro","Muito ruim - frequentemente não consigo pagar despesas básicas")
levels(data$emprestimo.factor)=c("Sim, com valor que compromete boa parte renda familiar","Sim, com valor que afeta pouco a renda familiar","Não")
levels(data$jornada.factor)=c("Turno de revezamento 6h","Turno de revezamento 8h","Administrativo","8h Fixo Dia","8h Fixo Noite","12h Fixo Dia","12h Fixo Noite","12x36","Outra")
levels(data$jornadaa.factor)=c("Sim","Não","Não sei dizer")
levels(data$jornadasim___1.factor)=c("Unchecked","Checked")
levels(data$jornadasim___2.factor)=c("Unchecked","Checked")
levels(data$jornadasim___3.factor)=c("Unchecked","Checked")
levels(data$jornadasim___4.factor)=c("Unchecked","Checked")
levels(data$modalidade.factor)=c("Trabalho presencial","Teletrabalho integral","Teletrabalho parcial (híbrido)","Não sei dizer")
levels(data$jornada3.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$intervalo.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$descanso.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$equipamentos.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$ambiente.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$ambiente_riscos.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$autonomia.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$riscos.factor)=c("Muito ruim","Ruim","Regular","Bom/Boa","Muito bom/boa","Não sei")
levels(data$tecnologias.factor)=c("Sim","Não","Não sei dizer")
levels(data$implementacao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$intensificacao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$complexidade.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$metas.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$emprego.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$seguranca.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$controle.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$insercao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$cominterna.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$aprendizado.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$autonomiar.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$sentimento.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$estresse.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$treinamento.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$impactosal.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$produtivitec.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$superioresh.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$superioresm.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$subordinados.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$subordinadas.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$operarios.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$operarias.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$terceiros.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$socupacional.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$demais.factor)=c("Sempre com respeito","Às vezes com pouco respeito","De forma inadequada","De forma abusiva","Com assédio","Não sei")
levels(data$valorizacao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$respeito.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$colaboracao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$comunicacao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$pertencimento.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$gestaoparticipativa.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$inovacao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$igualdadeoportunidades.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$apoio.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$desviof.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$assediomoral.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$assediosexual.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$lgbtfobia.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$capacitismo.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$xenofobia.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$racismo.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$misoginia.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$violenciafisica.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$etarismo.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$trabhextras.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$desvio.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$sobrecarga.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$pausas.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$opiniao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$pressao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$riscosambiente.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$presenciar.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$esgotamento.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$acidtraba.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$epi.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$comunicacid.factor)=c("Não, eu nunca me acidentei no trabalho","Sim, eu comuniquei imediatamente ao meu supervisor ou chefe","Sim, um colega de trabalho comunicou à chefia","Sim, a chefia presenciou o acidente","Sim, foi registrado na hora por câmera ou sistema da empresa","Sim, comuniquei depois, em outro momento","Sim, mas não comuniquei","Outra")
levels(data$cat.factor)=c("Sim","Não","Não sei")
levels(data$altura.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$tensao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$desniveis.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$temperatura.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$eletricidade.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$ergonomia.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$biol_gicos.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$explosivos.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$pausa.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$iluminacao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$fogo.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$barragens.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$maquinas.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$manutencao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$mudancas.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$peso.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$poeiraexplosiva.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$poeiramienral.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$quimicos.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$projecao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$queda.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$raios.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$repetitividade.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$ruidos.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$acelerado.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$noturno.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$solitario.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$acesso.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$vibracao.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$sinais___1.factor)=c("Unchecked","Checked")
levels(data$sinais___2.factor)=c("Unchecked","Checked")
levels(data$sinais___3.factor)=c("Unchecked","Checked")
levels(data$sinais___4.factor)=c("Unchecked","Checked")
levels(data$sinais___5.factor)=c("Unchecked","Checked")
levels(data$sinais___6.factor)=c("Unchecked","Checked")
levels(data$sinais___7.factor)=c("Unchecked","Checked")
levels(data$sinais___8.factor)=c("Unchecked","Checked")
levels(data$sinais___9.factor)=c("Unchecked","Checked")
levels(data$sinais___10.factor)=c("Unchecked","Checked")
levels(data$sinais___11.factor)=c("Unchecked","Checked")
levels(data$sinais___12.factor)=c("Unchecked","Checked")
levels(data$sinais___13.factor)=c("Unchecked","Checked")
levels(data$sinais___14.factor)=c("Unchecked","Checked")
levels(data$sinais___15.factor)=c("Unchecked","Checked")
levels(data$sinais___16.factor)=c("Unchecked","Checked")
levels(data$sinais___17.factor)=c("Unchecked","Checked")
levels(data$sinais___18.factor)=c("Unchecked","Checked")
levels(data$sinais___19.factor)=c("Unchecked","Checked")
levels(data$sinais___20.factor)=c("Unchecked","Checked")
levels(data$sinais___21.factor)=c("Unchecked","Checked")
levels(data$sinais___22.factor)=c("Unchecked","Checked")
levels(data$sinais___23.factor)=c("Unchecked","Checked")
levels(data$sinais___24.factor)=c("Unchecked","Checked")
levels(data$afastamentos.factor)=c("Sim","Não","Não, pois eu não solicitei o afastamento","Não, pois não me concederam o afastamento")
levels(data$irdoente.factor)=c("Sim, porque eu tenho que ir trabalhar","Sim, porque fui convocado para trabalhar","Não")
levels(data$morbidades___1.factor)=c("Unchecked","Checked")
levels(data$morbidades___2.factor)=c("Unchecked","Checked")
levels(data$morbidades___3.factor)=c("Unchecked","Checked")
levels(data$morbidades___4.factor)=c("Unchecked","Checked")
levels(data$morbidades___5.factor)=c("Unchecked","Checked")
levels(data$morbidades___6.factor)=c("Unchecked","Checked")
levels(data$morbidades___7.factor)=c("Unchecked","Checked")
levels(data$morbidades___8.factor)=c("Unchecked","Checked")
levels(data$morbidades___9.factor)=c("Unchecked","Checked")
levels(data$morbidades___10.factor)=c("Unchecked","Checked")
levels(data$morbidades___11.factor)=c("Unchecked","Checked")
levels(data$morbidades___12.factor)=c("Unchecked","Checked")
levels(data$morbidades___13.factor)=c("Unchecked","Checked")
levels(data$morbidades___14.factor)=c("Unchecked","Checked")
levels(data$morbidades___15.factor)=c("Unchecked","Checked")
levels(data$morbidades___16.factor)=c("Unchecked","Checked")
levels(data$morbidades___17.factor)=c("Unchecked","Checked")
levels(data$morbidades___18.factor)=c("Unchecked","Checked")
levels(data$morbidades___19.factor)=c("Unchecked","Checked")
levels(data$medicamentos.factor)=c("Sim","Não")
levels(data$motivo_uso.factor)=c("Eu já utilizava medicamentos controlados antes de começar a trabalhar na mina/usina","Passei a utilizar medicamentos controlados depois de começar a trabalhar na mina/usina","Passei a utilizar medicamentos controlados depois de começar a trabalhar na mina/usina, mas não por motivo relacionado ao meu trabalho","Outra opção")
levels(data$drogasoperarios.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$usoalcool.factor)=c("Nunca","Raramente","Às vezes","Frequentemente","Sempre","Não sei")
levels(data$usodrogas.factor)=c("Não","Já experimentei, mas não uso atualmente","Uso ocasionalmente","Uso regularmente")
levels(data$usodrogastrabalho.factor)=c("Não há relação","Sim, o trabalho contribui para o início do meu uso","Sim, o trabalho contribui para a continuidade ou aumento do meu uso","Sim, o trabalho dificulta a interrupção do meu uso")
levels(data$saude_antes.factor)=c("Ficou melhor","Continuou igual","Ficou pior","Não sei dizer")
levels(data$saude.factor)=c("Ótima","Boa","Regular","Ruim","Péssima","Não sei dizer")
levels(data$sono.factor)=c("Ótima","Boa","Regular","Ruim","Péssima","Não sei dizer")
levels(data$alimentacao.factor)=c("Ótima","Boa","Regular","Ruim","Péssima","Não sei dizer")
levels(data$moradia.factor)=c("Ótima","Boa","Regular","Ruim","Péssima","Não sei dizer")
levels(data$saudetrab.factor)=c("Sim","Não","Não sei")
levels(data$estrategias___1.factor)=c("Unchecked","Checked")
levels(data$estrategias___2.factor)=c("Unchecked","Checked")
levels(data$estrategias___3.factor)=c("Unchecked","Checked")
levels(data$estrategias___4.factor)=c("Unchecked","Checked")
levels(data$estrategias___5.factor)=c("Unchecked","Checked")
levels(data$estrategias___6.factor)=c("Unchecked","Checked")
levels(data$estrategias___7.factor)=c("Unchecked","Checked")
levels(data$estrategias___8.factor)=c("Unchecked","Checked")
levels(data$estrategias___9.factor)=c("Unchecked","Checked")
levels(data$estrategias___10.factor)=c("Unchecked","Checked")
levels(data$estrategias___11.factor)=c("Unchecked","Checked")
levels(data$estrategias___12.factor)=c("Unchecked","Checked")
levels(data$estrategias___13.factor)=c("Unchecked","Checked")
levels(data$tempocuidado.factor)=c("0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36+")
levels(data$previnstitucional.factor)=c("Ótimo","Bom","Regular","Insuficiente","Inexistente","Não sei dizer")
levels(data$periodicos.factor)=c("Ótimos","Bons","Regulares","Insuficientes","Inexistentes","Não sei dizer")
levels(data$cuidadocasa.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$filhos.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$cuidadopessoas.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$orgcasa.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$lazer.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$estudos.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$arte.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$politica.factor)=c("Eu faço sozinho/a","Eu faço a maior parte","Divido com companheiras/os ou esposas/os","Outra/s pessoa/s faz/em a maior parte","Não realizo")
levels(data$jornadacuidado.factor)=c("A jornada que eu tenho atualmente, mas com certa flexibilização para o cumprimento da carga horária","Turno de revezamento 6h","Turno de revezamento 6h, mas com certa flexibilização para o cumprimento da carga horária","Turno de revezamento 8h","Turno de revezamento 8h, mas com certa flexibilização para o cumprimento da carga horária","Administrativo","Administrativo, mas com certa flexibilização para o cumprimento da carga horária","8h Fixo Dia","8h Fixo Dia, mas com certa flexibilização para o cumprimento da carga horária","8h Fixo Noite","8h Fixo Noite, mas com certa flexibilização para o cumprimento da carga horária","12h Fixo Dia","12h Fixo Dia, mas com certa flexibilização para o cumprimento da carga horária","12h Fixo Noite","12h Fixo Noite, mas com certa flexibilização para o cumprimento da carga horária","12x36","12x36, mas com certa flexibilização para o cumprimento da carga horária","Outra")
levels(data$vizinhobarragens.factor)=c("Sim","Não")
levels(data$sindical.factor)=c("Sim","Não","Não sei o que é um sindicato")
levels(data$diretoria.factor)=c("Sim","Não")
levels(data$contribuicao.factor)=c("Sim","Não","Não sei dizer")
levels(data$entrevista.factor)=c("Sim","Não")
levels(data$avaliacao.factor)=c("Muito bom","Bom","Regular","Ruim","Muito ruim")
levels(data$enquete_complete.factor)=c("Incomplete","Unverified","Complete")