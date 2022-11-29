var express = require("express");
var router = express.Router();

var jogoController = require("../controllers/jogoController");

router.post("/cadastrarNick", function (req, res) {
    jogoController.cadastrarNick(req, res);
});

router.get("/listar", function (req, res) {
    jogoController.listar(req, res);
});

router.post("/autenticar", function (req, res) {
    jogoController.entrar(req, res);
});

module.exports = router;