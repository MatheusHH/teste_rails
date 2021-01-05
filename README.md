# README

**Instruções para rodar o projeto**

**Necessário ter o docker/docker compose instalado**

1- git clone do repositório <br/>
2- docker-compose build <br/>
3- Adicione um User.create(email, password, confirm_password) <br/>
4- docker-compose run --rm app bundle install <br/>
5- docker-compose run --rm app bundle exec rails db:create db:migrate db:seed <br/>


**Descrição do Sistema** <br/>

<p>Sistema administrativo com parte administrativa onde possui as seguintes funções:<p/>
<p>Manter categorias <br/>
<p>Manter empresas <br/>
<p>Manter usuários das empresas(adicionando quando acessa uma empresa especifica) <p/>

<p>A parte da empresa possui um dashboard onde futuramente poderá manter seus recursos: <ṕ/>

<p>Endpoints para listagem de categorias e empresas, este último com possibilidade de filtro por nome da empresa ou categoria. <p />

**Tecnologias utilizadas** 

* Ruby 2.6 <br/ >
* Rails 6.0 <br/ >
* Bootstrap <br/ >
* Select2 js <br/ >
* Ajax <br/ >
* Notify js <br/ >


