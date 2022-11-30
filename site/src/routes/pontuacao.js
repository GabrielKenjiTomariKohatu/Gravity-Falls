var express = require("express");
var router = express.Router();

var pontuacaoController = require("../controllers/pontuacaoController")

router.post("/pontotempo", function (req, res) {
    pontuacaoController.pontotempo(req, res);
});

router.get("/ponto", function (req, res) {
    pontuacaoController.ponto(req, res);
});

router.get("/tempo", function (req, res) {
    pontuacaoController.tempo(req, res);
});

router.get("/ultimas/:idAquario", function (req, res) {
    pontuacaoController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    pontuacaoController.buscarMedidasEmTempoReal(req, res);
})


module.exports = router;
