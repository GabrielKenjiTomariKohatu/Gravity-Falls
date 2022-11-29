var pontuacaoModel = require("../models/pontuacaoModel");


function pontotempo(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nick = req.body.nickServer;
    var ponto = req.body.pontoServer;
    var timer = req.body.timerServer;
    var jogo = req.body.jogoServer;
    

    // Faça as validações dos valores
  
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        pontuacaoModel.pontotempo(ponto,timer,jogo,nick)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    
}

module.exports = {
    pontotempo
}