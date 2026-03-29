# Helix Editor

```md
.
###x.        .|
d#####x,   ,v||
 '+#####v||||||
    ,v|||||+'.      _     _           _
 ,v|||||^'>####    | |   | |   ___   | | (_) __  __
|||||^'  .v####    | |___| |  /   \  | |  _  \ \/ /
||||=..v#####P'    |  ___  | /  ^  | | | | |  \  /
''v'>#####P'       | |   | | |  ---  | | | |  /  \
,######/P||x.      |_|   |_|  \___/  |_| |_| /_/\_\
####P' "x|||||,
|/'       'x|||    A post-modern modal text editor.
 '           '|
```

## Capítulo 1 — Básico

`modos`

```md
esc     = modo normal
i       = modo inserção
:       = modo comando
```

`movimento`

```md
    ↑
    k
← h   l →
    j
    ↓
```

`sair`

```md
:q   = sair
:q!  = sair sem salvar (força)
```

`salvar`

```md
:w   = salvar
:wq  = salvar e sair
```

---

## Capítulo 2 — Inserção avançada

`inserção`

```md
i - antes da seleção
a - após a seleção
I - início da linha
A - fim da linha
o - linha abaixo
O - linha acima
```

---

## Capítulo 3 — Movimentos e Seleções

`movimentos`

```md
w - avança até o início da próxima palavra
e - avança até o fim da palavra atual
b - volta ao início da palavra atual

W, E, B - igual acima, mas por PALAVRA (separada só por espaço)
```

`contadores`

```md
2w  - avança 2 palavras
3e  - vai ao fim da 3ª palavra
2b  - volta 2 palavras
```

`seleção`

```md
v       - modo seleção (todo movimento estende a seleção)
x       - seleciona a linha inteira
2x      - seleciona 2 linhas
;       - colapsa a seleção para um cursor
Alt-;   - inverte direção da seleção
```

`editar seleção`

```md
d - deleta a seleção
c - deleta a seleção e entra em inserção
```

---

## Capítulo 4 — Desfazer, Copiar, Colar e Buscar

`histórico`

```md
u     = desfazer
U     = refazer
```

`clipboard`

```md
y         = copiar (yank) a seleção
p         = colar após o cursor
P         = colar antes do cursor
Space+y   = copiar para o clipboard do sistema
Space+p   = colar do clipboard do sistema
```

`busca`

```md
/padrão  = buscar no arquivo
n        = próxima ocorrência
N        = ocorrência anterior
```

---

## Capítulo 5 — Multi-cursor e Seleções

`multi-cursor`

```md
C       - duplica cursor para a próxima linha compatível
Alt-C   - duplica para a linha anterior
,       - remove um cursor extra
```

`selecionar em seleção`

```md
s       - seleciona todas as ocorrências de um padrão (regex) dentro da seleção
%       - seleciona o arquivo inteiro
&       - alinha as seleções
Alt-s   - divide a seleção por linhas (newlines)
S       - divide a seleção por padrão regex
```

---

## Capítulo 6 — f/t, Replace e Repetição

`ir até caractere`

```md
f<ch>   - seleciona até e incluindo o caractere
t<ch>   - seleciona até (não incluindo) o caractere
F<ch>   - igual f, mas para trás
T<ch>   - igual t, mas para trás
```

`substituir`

```md
r<ch>   - substitui todos os caracteres selecionados por <ch>
```

`repetir`

```md
.       - repete o último comando de inserção
Alt-.   - repete o último f/t
```

---

## Capítulo 7 — Operações de Linha

`operações`

```md
R       - substitui a seleção pelo texto copiado (yank)
J       - junta as linhas da seleção em uma só
>       - indenta a linha
<       - desindenta a linha
Ctrl-a  - incrementa o número sob a seleção
Ctrl-x  - decrementa o número sob a seleção
```

---

## Capítulo 8 — Registradores e Macros

`registradores`

```md
"<ch>   - seleciona o registrador <ch> para a próxima operação
```

`macros`

```md
Q       - inicia / para a gravação de macro (registrador padrão: @)
q       - executa a macro do registrador @
"<ch>q  - executa a macro do registrador <ch>
```

---

## Capítulo 9 — Busca e Jumplist

`busca por seleção`

```md
*       - copia a seleção para o registrador de busca (/)
n / N   - próximo / anterior resultado
v + n   - adiciona seleção em cada ocorrência (Select mode)
```

`jumplist`

```md
Ctrl-s  - salva a posição atual na jumplist
Ctrl-o  - volta na jumplist
Ctrl-i  - avança na jumplist
gw      - ativa labels de 2 caracteres para pular rapidamente
```

---

## Capítulo 10 — Seleções Múltiplas e Case

`ciclar seleções`

```md
)       - avança a seleção primária
(       - volta a seleção primária
Alt-,   - remove a seleção primária
Alt-)   - cicla o conteúdo das seleções para frente
Alt-(   - cicla o conteúdo das seleções para trás
```

`case`

```md
~       - alterna maiúscula/minúscula dos caracteres selecionados
`       - converte seleção para minúscula
Alt-`   - converte seleção para maiúscula
```

---

## Capítulo 11 — Comentários

`comentar`

```md
Ctrl-c  - comenta / descomenta a linha (ou seleção)
```

---

## Capítulo 12 — Match Mode (m)

`match mode`

```md
m       - entra no match mode (mostra popup de ações)
mm      - pula para o par de delimitador correspondente
mi(     - seleciona o conteúdo dentro de ()
ma(     - seleciona o conteúdo e os delimitadores ()
ms(     - adiciona () ao redor da seleção
md(     - deleta os delimitadores () ao redor
mr([    - substitui os delimitadores () por []
```

> Funciona com `( ) [ ] { } " '` e combinações aninhadas.

---

## Capítulo 13 — Splits (Janelas)

`criar splits`

```md
Ctrl-w nv   - novo buffer em split vertical
Ctrl-w ns   - novo buffer em split horizontal
Ctrl-w v    - split vertical do buffer atual
Ctrl-w s    - split horizontal do buffer atual
:vs arquivo - abre arquivo em split vertical
:hs arquivo - abre arquivo em split horizontal
```

`navegar entre splits`

```md
Ctrl-w h/j/k/l  - move entre splits (esquerda/baixo/cima/direita)
Ctrl-w w        - próximo split
Ctrl-w q        - fecha o split atual
Ctrl-w o        - fecha todos exceto o atual
```

`reorganizar splits`

```md
Ctrl-w H/J/K/L  - troca o split com o vizinho na direção
Ctrl-w t        - transpõe os splits
```

`splits pelo file picker`

```md
Space+f  - abre o file picker
Ctrl-v   - abre o arquivo selecionado em split vertical
Ctrl-s   - abre o arquivo selecionado em split horizontal
```
