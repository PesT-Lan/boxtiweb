# Configuração do Domínio boxtisa.com.br

 Informações do Repositório

- **Repositório**: https://github.com/PesT-Lan/boxtiweb
- **Domínio**: boxtisa.com.br
- **Tipo**: GitHub Pages

##  Configuração do DNS


```
A Record 1:
Host: @
Points to: 185.199.108.153

A Record 2:
Host: @
Points to: 185.199.109.153

A Record 3:
Host: @
Points to: 185.199.110.153

A Record 4:
Host: @
Points to: 185.199.111.153
```

4. Registro CNAME (opcional, para www):**

```
CNAME Record:
Host: www
Points to: PesT-Lan.github.io
```



```bash
# Via terminal
nslookup boxtisa.com.br
# ou
dig boxtisa.com.br

# Deve retornar um dos IPs acima
```

Ou use ferramentas online:
- https://www.whatsmydns.net/
- https://dnschecker.org/



**Versão**: 1.0  
**Última atualização**: Maio 2026
