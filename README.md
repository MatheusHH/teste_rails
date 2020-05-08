# README

Instruções para rodar o projeto

* Necessário ter o docker/docker compose instalado

1- git clone do repositório
2- docker-compose build
3- Adicione um User.create(email, password, confirm_password)
4- docker-compose run --rm app bundle install
5- docker-compose run --rm app bundle exec rails db:create db:migrate db:seed


Descrição do Sistema

Sistema administrativo com parte administrativa onde possui as seguintes funções:
Manter categorias
Manter empresas
Manter usuários das empresas(adicionando quando acessa uma empresa especifica)

A parte da empresa possui um dashboard onde futuramente poderá manter seus recursos:

Endpoints para listagem de categorias e empresas, este último com possibilidade de filtro por nome da empresa ou categoria.


