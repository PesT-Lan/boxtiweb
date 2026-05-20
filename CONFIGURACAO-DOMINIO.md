# Configuração do Domínio boxtisa.com.br

## 📋 Informações do Repositório

- **Repositório**: https://github.com/PesT-Lan/boxtiweb
- **Domínio**: boxtisa.com.br
- **Tipo**: GitHub Pages

## 🔧 Configuração do DNS

Para apontar seu domínio `boxtisa.com.br` para o site no GitHub Pages, siga os passos abaixo:

### Opção 1: Usando Registrador de Domínio (Recomendado)

1. **Acesse o painel de controle do seu registrador** (ex: HostGator, GoDaddy, Namecheap, etc)
2. **Localize as configurações de DNS**
3. **Adicione os seguintes registros A:**

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

4. **Adicione um registro CNAME (opcional, para www):**

```
CNAME Record:
Host: www
Points to: PesT-Lan.github.io
```

5. **Salve as alterações**

### Opção 2: Usando Cloudflare (Alternativa)

Se preferir usar Cloudflare como DNS:

1. Crie uma conta em https://www.cloudflare.com
2. Adicione seu domínio
3. Atualize os nameservers no seu registrador para os da Cloudflare
4. Configure os registros A conforme acima
5. Ative o proxy da Cloudflare se desejar

## ✅ Verificação

Após configurar o DNS, pode levar de **5 minutos a 48 horas** para a propagação completa.

Para verificar se está funcionando:

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

## 🚀 Configurações do GitHub Pages

O repositório já possui:
- ✅ Arquivo `CNAME` configurado
- ✅ `index.html` como página principal
- ✅ Todos os arquivos necessários

### Ativar GitHub Pages (se necessário)

1. Acesse: https://github.com/PesT-Lan/boxtiweb/settings
2. Vá para "Pages" no menu lateral
3. Em "Source", selecione "Deploy from a branch"
4. Selecione "master" branch
5. Clique em "Save"

## 📊 Status do Site

Após a configuração:
- Site estará disponível em: **https://boxtisa.com.br**
- Redirecionamento automático de www: **https://www.boxtisa.com.br**
- SSL/HTTPS: Automático via GitHub Pages

## 🔐 SSL/HTTPS

GitHub Pages fornece certificado SSL gratuito automaticamente. Pode levar alguns minutos para ser emitido após a configuração do domínio.

## 📞 Suporte

Se tiver dúvidas:
1. Verifique a documentação do GitHub Pages: https://docs.github.com/en/pages
2. Consulte seu registrador de domínio
3. Use as ferramentas de verificação de DNS mencionadas acima

## 📝 Checklist

- [ ] Domínio registrado em registrador
- [ ] Acesso ao painel de controle DNS
- [ ] Registros A adicionados (4 registros)
- [ ] CNAME para www adicionado (opcional)
- [ ] GitHub Pages ativado no repositório
- [ ] Arquivo CNAME presente no repositório
- [ ] DNS propagado (verificar com nslookup/dig)
- [ ] Site acessível em boxtisa.com.br
- [ ] HTTPS funcionando

---

**Versão**: 1.0  
**Última atualização**: Maio 2026
