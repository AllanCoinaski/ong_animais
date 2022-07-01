# Ong Animais


A xxx foi contratada por uma ONG de adoção de animais. Você como desenvolvedor do projeto, precisará desenvolver um APP para controlar quem pode acessar a aplicação, além da visualização de informações dos pets disponíveis para adoção.

Requisitos obrigatórios
- [x] O APP deverá ser escrito em dart utilizando o flutter. 
- [x] Criação de um json contendo uma listagem de e-mails que podem acessar o aplicativo, ou seja, somente pessoas que estiverem com o e-mail nesta lista, poderão logar.
- [x] Login
	- [x] Nesta tela validaremos apenas o e-mail (json) da pessoa que está tentando acessar o aplicativo.
- [x] Listagem dos pets
	- [x] Nesta listagem devemos considerar os gatos e cachorros. Podem estar listados de forma mesclada ou categorizados.
- [x] Visualização das informações do pet
	- [x] Essa tela será exibida ao clicar em um pet na listagem. Nesta tela, devemos mostrar as informações do pet.
	- [x] Pode mostrar as informações que julgar necessário.

Requisitos que serão considerados como plus
- [x] Fácil troca de fontes e cores no código.
- [x] Fácil adaptação a novos providers (APIs).
- [x] APK do APP.
- [x] Login persistido na memória, ou seja, ao fechar o APP e abri-lo novamente, o usuário já deverá estar logado.

Observações
- [x] Os dados dos pets devem ser consumidos através das APIs abaixo.
- [x] Esta ONG em particular trabalha atualmente somente com gatos e cachorros. Porém, a ONG pretende começar a trabalhar com outros tipos de animais, sendo que, cada espécie de animal, virá de uma API diferente.

API de cachorro
https://www.thedogapi.com/

API de gato
https://thecatapi.com/

## Iniciar o projeto

- git clone
- flutter pub get
- flutter run
- Login: wa@wa.com.br
- Existe uma apk gerada na pasta apk na raiz do projeto

