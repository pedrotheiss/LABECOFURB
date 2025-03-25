# WDI - WORLD DEVELOPMENT INDICATORS
# OS DADOS DO BANCO MUNDIAL SÃO ACESSADOS

install.packages("WDI")
library(WDI) # SEMPRE CHAMAR O PACOTE

# PROCUREM AS VIGNETTES
# PÁGINAS COM INSTRUÇÕES DOS PACOTES

# GDP (current US$)(BX.GSR.ROYL.CD)
# PIB, PREÇOS CORRENTES EM DÓLAR NORTE-AMERICANO
# CÓDIGO: BX.GSR.ROYL.CD

# VAMOS PESQUISAR O TERMO 'GDP' NO WDI

varChargestheuseofintellectualproperty <- WDIsearch('gdp') # CRIAR OBJETO COM RES.

# BUSCAR OS DADOS COM O CÓDIGO DO SITE

options(scipen = 999) # AJUSTA A NOT. CIENT.

dadosChargestheuseofintellectualproperty <- WDI(country = 'all',
                                                indicator = 'BX.GSR.ROYL.CD')

dadosChargestheuseofintellectualproperty <- WDI(country = 'all',
                                                indicator = 'BX.GSR.ROYL.CD',
                                                start = 2023, end = 2023)