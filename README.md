# flutter_marvel_infinity


#### Apresentação geral:
<img src="https://github.com/prswins/flutter_marvel_infinity/blob/quadrinhos_video_01.gif?raw=true" width="500"/>
<img src="https://github.com/prswins/flutter_marvel_infinity/blob/quadrinhos_video_02.gif?raw=true" width="500"/>

<img src="https://github.com/prswins/flutter_marvel_infinity/blob/quadrinhos_video_03.gif?raw=true" width="500"/>




Telas  |   |   |   |
| ------------ | ------------ | ------------ | ------------ |
| Login  | Listagem  | Busca  | Detalhes  |
|  |  |  |  |
| <img src="https://github.com/prswins/flutter_marvel_infinity/blob/master/flutter_01.png?raw=true" width="250"/>  |  <img src="https://github.com/prswins/flutter_marvel_infinity/blob/master/flutter_02.png?raw=true" width="250"/> | <img src="https://github.com/prswins/flutter_marvel_infinity/blob/master/flutter_03.png?raw=true" width="250"/>  |  <img src="https://github.com/prswins/flutter_marvel_infinity/blob/master/flutter_04.png?raw=true" width="250"/> |



Loja de quadrinhos

Bibliotecas utilizadas :

API (fonte de dados : Api Marvel)
- https://developer.marvel.com/documentation/apiresults

infinite_scroll_pagination: ^2.3.0
- Forneceu a base em bloc, pra recuperar e tratar a API da Marvel

http e rxdart
- realizar requicisoes da api e tratar retornos

cached_network_image
- recuperar uma imagem a partir de uma URL

crypto
- gerar codigo md5 utilizado como chave e a partida das chaves(publica e privada) para recuperar os dados da Api Marvel

fluttertoast
- exibir mensagens (erros e ações do usuario)

mobX
- gerenciamento de estados

flutter_mobx
-Fornece o widget Observer que escuta os observáveis e reconstrói automaticamente nas mudanças

get_it
- implementacao dos singletons







