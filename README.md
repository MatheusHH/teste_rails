# README

**Instruções para rodar o projeto**

**Necessário ter o docker/docker compose instalado**

1- git clone do repositório <br/>
2- docker-compose build <br/>
3- Adicione um User.create(email, password, confirm_password) <br/>
4- docker-compose run --rm app bundle install <br/>
5- docker-compose run --rm app bundle exec rails db:create db:migrate <br/>


**Descrição do Sistema** <br/>

<p>Sistema administrativo com parte administrativa onde possui as seguintes funções:<p/>
<p>Manter categorias <p/>
<p>Manter empresas <p/>
<p>Manter usuários das empresas(adicionando quando acessa uma empresa especifica) <p/>

<p>A parte da empresa possui um dashboard onde futuramente poderá manter seus recursos: <ṕ/>

<p>Endpoints para listagem de categorias e empresas, este último com possibilidade de filtro por nome da empresa ou categoria. <p/>

<p>OBS: Caso não for utilizar o Docker, após clonar o projeto rode rails db:create db:migrate. <p/>

**Tecnologias utilizadas** 

* Ruby 2.6 
* Rails 6.0 
* Bootstrap 4
* Select2 js 
* Ajax 
* Notify js 


